# BEGIN LICENSE BLOCK
# 
# Copyright (c) 1996-2002 Jesse Vincent <jesse@bestpractical.com>
# 
# (Except where explictly superceded by other copyright notices)
# 
# This work is made available to you under the terms of Version 2 of
# the GNU General Public License. A copy of that license should have
# been provided with this software, but in any event can be snarfed
# from www.gnu.org
# 
# This work is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# 
# Unless otherwise specified, all modifications, corrections or
# extensions to this work which alter its source code become the
# property of Best Practical Solutions, LLC when submitted for
# inclusion in the work.
# 
# 
# END LICENSE BLOCK
# Autogenerated by DBIx::SearchBuilder factory (by <jesse@bestpractical.com>)
# WARNING: THIS FILE IS AUTOGENERATED. ALL CHANGES TO THIS FILE WILL BE LOST.  
# 
# !! DO NOT EDIT THIS FILE !!
#

use strict;


=head1 NAME

RT::Template


=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=cut

package RT::Template;
use RT::Record; 
use RT::Queue;


use vars qw( @ISA );
@ISA= qw( RT::Record );

sub _Init {
  my $self = shift; 

  $self->Table('Templates');
  $self->SUPER::_Init(@_);
}





=item Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  int(11) 'Queue'.
  varchar(40) 'Name'.
  varchar(120) 'Description'.
  varchar(16) 'Type'.
  varchar(16) 'Language'.
  int(11) 'TranslationOf'.
  blob 'Content'.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                Queue => '0',
                Name => '',
                Description => '',
                Type => '',
                Language => '',
                TranslationOf => '',
                Content => '',

		  @_);
    $self->SUPER::Create(
                         Queue => $args{'Queue'},
                         Name => $args{'Name'},
                         Description => $args{'Description'},
                         Type => $args{'Type'},
                         Language => $args{'Language'},
                         TranslationOf => $args{'TranslationOf'},
                         Content => $args{'Content'},
);

}



=item id

Returns the current value of id. 
(In the database, id is stored as int(11).)


=cut


=item Queue

Returns the current value of Queue. 
(In the database, Queue is stored as int(11).)



=item SetQueue VALUE


Set Queue to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Queue will be stored as a int(11).)


=cut


=item QueueObj

Returns the Queue Object which has the id returned by Queue


=cut

sub QueueObj {
	my $self = shift;
	my $Queue =  RT::Queue->new($self->CurrentUser);
	$Queue->Load($self->__Value('Queue'));
	return($Queue);
}

=item Name

Returns the current value of Name. 
(In the database, Name is stored as varchar(40).)



=item SetName VALUE


Set Name to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Name will be stored as a varchar(40).)


=cut


=item Description

Returns the current value of Description. 
(In the database, Description is stored as varchar(120).)



=item SetDescription VALUE


Set Description to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Description will be stored as a varchar(120).)


=cut


=item Type

Returns the current value of Type. 
(In the database, Type is stored as varchar(16).)



=item SetType VALUE


Set Type to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Type will be stored as a varchar(16).)


=cut


=item Language

Returns the current value of Language. 
(In the database, Language is stored as varchar(16).)



=item SetLanguage VALUE


Set Language to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Language will be stored as a varchar(16).)


=cut


=item TranslationOf

Returns the current value of TranslationOf. 
(In the database, TranslationOf is stored as int(11).)



=item SetTranslationOf VALUE


Set TranslationOf to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, TranslationOf will be stored as a int(11).)


=cut


=item Content

Returns the current value of Content. 
(In the database, Content is stored as blob.)



=item SetContent VALUE


Set Content to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Content will be stored as a blob.)


=cut


=item LastUpdated

Returns the current value of LastUpdated. 
(In the database, LastUpdated is stored as datetime.)


=cut


=item LastUpdatedBy

Returns the current value of LastUpdatedBy. 
(In the database, LastUpdatedBy is stored as int(11).)


=cut


=item Creator

Returns the current value of Creator. 
(In the database, Creator is stored as int(11).)


=cut


=item Created

Returns the current value of Created. 
(In the database, Created is stored as datetime.)


=cut



sub _ClassAccessible {
    {
     
        id =>
		{read => 1, type => 'int(11)', default => ''},
        Queue => 
		{read => 1, write => 1, type => 'int(11)', default => '0'},
        Name => 
		{read => 1, write => 1, type => 'varchar(40)', default => ''},
        Description => 
		{read => 1, write => 1, type => 'varchar(120)', default => ''},
        Type => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        Language => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        TranslationOf => 
		{read => 1, write => 1, type => 'int(11)', default => ''},
        Content => 
		{read => 1, write => 1, type => 'blob', default => ''},
        LastUpdated => 
		{read => 1, auto => 1, type => 'datetime', default => ''},
        LastUpdatedBy => 
		{read => 1, auto => 1, type => 'int(11)', default => ''},
        Creator => 
		{read => 1, auto => 1, type => 'int(11)', default => ''},
        Created => 
		{read => 1, auto => 1, type => 'datetime', default => ''},

 }
};


        eval "require RT::Template_Overlay";
        if ($@ && $@ !~ /^Can't locate/) {
            die $@;
        };

        eval "require RT::Template_Local";
        if ($@ && $@ !~ /^Can't locate/) {
            die $@;
        };




=head1 SEE ALSO

This class allows "overlay" methods to be placed
into the following files _Overlay is for a System overlay by the original author,
while _Local is for site-local customizations.  

These overlay files can contain new subs or subs to replace existing subs in this module.

If you'll be working with perl 5.6.0 or greater, each of these files should begin with the line 

   no warnings qw(redefine);

so that perl does not kick and scream when you redefine a subroutine or variable in your overlay.

RT::Template_Overlay, RT::Template_Local

=cut


1;
