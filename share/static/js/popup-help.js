// a list of entries to process for the page
var pagePopupHelpItems = [
	{ selector: "[data-help]", action: helpify }  // by default, anything with data-help attributes gets processed
]

// add one or more items to the list of help entries to process for the page
function addPopupHelpItems() {
	const args = [].slice.call(arguments)
	pagePopupHelpItems = pagePopupHelpItems || []
	pagePopupHelpItems = pagePopupHelpItems.concat(args)
}

function applySelectorQueryOrFunc( sel ) {
	if ( sel ) {
		if ( typeof(sel) === "string" ) {
			return jQuery(sel)
		} else if ( typeof(sel) === "function" ) {
			return sel(jQuery)
		}
	}
}

function getPopupHelpAction( entry={} ) {
	entry.action = entry.action || "append"
	if ( typeof(entry.action) === "string" ) {
		const funcMap = {
			"append": appendPopupHelp,
			"prepend": prependPopupHelp,
			"offset": offsetPopupHelp,
			"replace": replacePopupHelp
		}
		return funcMap[entry.action]
	} else if ( typeof(entry.action) === "function" ) {
		return entry.action
	}
}

function getPopupHelpActionArgs( entry={}, $els ) {
	return entry.actionArgs ? [ $els, entry, entry.actionArgs ] : [ $els, entry ]
}

function appendPopupHelp( $els, item={}, options={} ) {
	item.action = options.action = "append"
	return helpify( $els, item, options )
}

function prependPopupHelp( $els, item={}, options={} ) {
	item.action = options.action = "prepend"
	return helpify( $els, item, options )
}

function offsetPopupHelp( $els, item={}, options={} ) {
	item.action = options.action = "offset"
	return helpify( $els, item, options )
}

function replacePopupHelp( $els, item={}, options={} ) {
	item.action = options.action = "replace"
	return helpify( $els, item, options )
}

function helpify($els, item={}, options={}) {
	$els.each(function(index) {
		const $el = jQuery($els.get(index))
		const action = $el.data("action") || item.action || options.action
		const title = $el.data("help") || $el.data("title") || item.title
		const content = $el.data("content") || item.content
		switch(action) {
			case "prepend":
				$el.parent().prepend( buildPopupHelpHtml( title, content ) )
				break
			case "offset":
				$el.append( buildPopupHelpHtml( title, content ) ).offset( options )
				break
			case "replace":
				$el.replaceWith( buildPopupHelpHtml( title, content ) )
				break
			case "append":  // intentionally fallthrough, as 'append' is the default
			default:
				$el.parent().append( buildPopupHelpHtml( title, content ) )
		}
	})
}

function buildPopupHelpHtml(title, content) {
	// TODO configurable glyph
	var icon = '/static/images/question'
	icon += (RT.Config.WebDefaultStylesheet.match(/-dark$/)) ? '-white.svg' : '.svg'
	const contentAttr = content ? ' data-content="' + content + '" ' : ''
	return '<a class="popup-help" tabindex="0" role="button" data-toggle="popover" title="' + title + '" data-trigger="focus" ' + contentAttr + '><img src="' + icon + '" /></a>'
}

function applyPopupHelpAction( entry, $els ) {
	if ( entry ) {
		const fn = getPopupHelpAction( entry )
		const args = getPopupHelpActionArgs( entry, $els )
		fn.apply(this, args)
	}
}

// render all the help icons and popover-ify them
function renderPopupHelpItems( list ) {
	const isDefined = function(x) { return typeof x !== "undefined" }
	const buildUrl = function(key) { return RT.Config.WebHomePath + "/Helpers/HelpTopic?key=" + encodeURIComponent(key) }
	const boolVal = function(str) {
		try {
			return !!JSON.parse(str)
		}
		catch {
			return false
		}
	}

	list = list || pagePopupHelpItems
	if (list && Array.isArray(list) && list.length) {
		list.forEach(function(entry) {
			const $els = applySelectorQueryOrFunc(entry.selector)
			if ( $els ) {
				applyPopupHelpAction( entry, $els )
			}
		})
        jQuery('[data-toggle="popover"]').popover({
			trigger: 'focus',
			html: true,
			content: function() {
				const $el = jQuery(this)
				const title = $el.data("help") || $el.data("title") || $el.data("originalTitle")
				var content = $el.data("content")
				if (content) {
					return content
				} else {
					const isAsync = isDefined($el.data("async")) ? boolVal($el.data("async")) : true
					if (isAsync) {
						const tmpId = "tmp-id-" + jQuery.now()
						jQuery.ajax({
							url: buildUrl(title), dataType: "html",
							dataType: "html",
							success: function(response, statusText, xhr) {
								jQuery("#" + tmpId).html(xhr.responseText)
							},
							error: function(e) {
								jQuery("#" + tmpId).html("<div class='text-danger'>Error loading help for '" + title + "': " + e)
							}
						})
						return "<div id='" + tmpId + "'>Loading...</div>"
					} else {
						return "<div class='text-danger'>No help content available for '" + title + "'.</div>"
					}
				}
			}
		})
	}
}
