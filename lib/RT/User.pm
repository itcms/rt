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

RT::User


=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=cut

package RT::User;
use RT::Record; 


use vars qw( @ISA );
@ISA= qw( RT::Record );

sub _Init {
  my $self = shift; 

  $self->Table('Users');
  $self->SUPER::_Init(@_);
}





=item Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  varchar(120) 'Name'.
  varchar(40) 'Password'.
  blob 'Comments'.
  blob 'Signature'.
  varchar(120) 'EmailAddress'.
  blob 'FreeformContactInfo'.
  varchar(200) 'Organization'.
  varchar(120) 'RealName'.
  varchar(16) 'NickName'.
  varchar(16) 'Lang'.
  varchar(16) 'EmailEncoding'.
  varchar(16) 'WebEncoding'.
  varchar(100) 'ExternalContactInfoId'.
  varchar(30) 'ContactInfoSystem'.
  varchar(100) 'ExternalAuthId'.
  varchar(30) 'AuthSystem'.
  varchar(16) 'Gecos'.
  varchar(30) 'HomePhone'.
  varchar(30) 'WorkPhone'.
  varchar(30) 'MobilePhone'.
  varchar(30) 'PagerPhone'.
  varchar(200) 'Address1'.
  varchar(200) 'Address2'.
  varchar(100) 'City'.
  varchar(100) 'State'.
  varchar(16) 'Zip'.
  varchar(50) 'Country'.
  text 'PGPKey'.
  smallint(6) 'Disabled'.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                Name => '',
                Password => '',
                Comments => '',
                Signature => '',
                EmailAddress => '',
                FreeformContactInfo => '',
                Organization => '',
                RealName => '',
                NickName => '',
                Lang => '',
                EmailEncoding => '',
                WebEncoding => '',
                ExternalContactInfoId => '',
                ContactInfoSystem => '',
                ExternalAuthId => '',
                AuthSystem => '',
                Gecos => '',
                HomePhone => '',
                WorkPhone => '',
                MobilePhone => '',
                PagerPhone => '',
                Address1 => '',
                Address2 => '',
                City => '',
                State => '',
                Zip => '',
                Country => '',
                PGPKey => '',
                Disabled => '0',

		  @_);
    $self->SUPER::Create(
                         Name => $args{'Name'},
                         Password => $args{'Password'},
                         Comments => $args{'Comments'},
                         Signature => $args{'Signature'},
                         EmailAddress => $args{'EmailAddress'},
                         FreeformContactInfo => $args{'FreeformContactInfo'},
                         Organization => $args{'Organization'},
                         RealName => $args{'RealName'},
                         NickName => $args{'NickName'},
                         Lang => $args{'Lang'},
                         EmailEncoding => $args{'EmailEncoding'},
                         WebEncoding => $args{'WebEncoding'},
                         ExternalContactInfoId => $args{'ExternalContactInfoId'},
                         ContactInfoSystem => $args{'ContactInfoSystem'},
                         ExternalAuthId => $args{'ExternalAuthId'},
                         AuthSystem => $args{'AuthSystem'},
                         Gecos => $args{'Gecos'},
                         HomePhone => $args{'HomePhone'},
                         WorkPhone => $args{'WorkPhone'},
                         MobilePhone => $args{'MobilePhone'},
                         PagerPhone => $args{'PagerPhone'},
                         Address1 => $args{'Address1'},
                         Address2 => $args{'Address2'},
                         City => $args{'City'},
                         State => $args{'State'},
                         Zip => $args{'Zip'},
                         Country => $args{'Country'},
                         PGPKey => $args{'PGPKey'},
                         Disabled => $args{'Disabled'},
);

}



=item id

Returns the current value of id. 
(In the database, id is stored as int(11).)


=cut


=item Name

Returns the current value of Name. 
(In the database, Name is stored as varchar(120).)



=item SetName VALUE


Set Name to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Name will be stored as a varchar(120).)


=cut


=item Password

Returns the current value of Password. 
(In the database, Password is stored as varchar(40).)



=item SetPassword VALUE


Set Password to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Password will be stored as a varchar(40).)


=cut


=item Comments

Returns the current value of Comments. 
(In the database, Comments is stored as blob.)



=item SetComments VALUE


Set Comments to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Comments will be stored as a blob.)


=cut


=item Signature

Returns the current value of Signature. 
(In the database, Signature is stored as blob.)



=item SetSignature VALUE


Set Signature to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Signature will be stored as a blob.)


=cut


=item EmailAddress

Returns the current value of EmailAddress. 
(In the database, EmailAddress is stored as varchar(120).)



=item SetEmailAddress VALUE


Set EmailAddress to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, EmailAddress will be stored as a varchar(120).)


=cut


=item FreeformContactInfo

Returns the current value of FreeformContactInfo. 
(In the database, FreeformContactInfo is stored as blob.)



=item SetFreeformContactInfo VALUE


Set FreeformContactInfo to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, FreeformContactInfo will be stored as a blob.)


=cut


=item Organization

Returns the current value of Organization. 
(In the database, Organization is stored as varchar(200).)



=item SetOrganization VALUE


Set Organization to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Organization will be stored as a varchar(200).)


=cut


=item RealName

Returns the current value of RealName. 
(In the database, RealName is stored as varchar(120).)



=item SetRealName VALUE


Set RealName to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, RealName will be stored as a varchar(120).)


=cut


=item NickName

Returns the current value of NickName. 
(In the database, NickName is stored as varchar(16).)



=item SetNickName VALUE


Set NickName to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, NickName will be stored as a varchar(16).)


=cut


=item Lang

Returns the current value of Lang. 
(In the database, Lang is stored as varchar(16).)



=item SetLang VALUE


Set Lang to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Lang will be stored as a varchar(16).)


=cut


=item EmailEncoding

Returns the current value of EmailEncoding. 
(In the database, EmailEncoding is stored as varchar(16).)



=item SetEmailEncoding VALUE


Set EmailEncoding to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, EmailEncoding will be stored as a varchar(16).)


=cut


=item WebEncoding

Returns the current value of WebEncoding. 
(In the database, WebEncoding is stored as varchar(16).)



=item SetWebEncoding VALUE


Set WebEncoding to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, WebEncoding will be stored as a varchar(16).)


=cut


=item ExternalContactInfoId

Returns the current value of ExternalContactInfoId. 
(In the database, ExternalContactInfoId is stored as varchar(100).)



=item SetExternalContactInfoId VALUE


Set ExternalContactInfoId to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ExternalContactInfoId will be stored as a varchar(100).)


=cut


=item ContactInfoSystem

Returns the current value of ContactInfoSystem. 
(In the database, ContactInfoSystem is stored as varchar(30).)



=item SetContactInfoSystem VALUE


Set ContactInfoSystem to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ContactInfoSystem will be stored as a varchar(30).)


=cut


=item ExternalAuthId

Returns the current value of ExternalAuthId. 
(In the database, ExternalAuthId is stored as varchar(100).)



=item SetExternalAuthId VALUE


Set ExternalAuthId to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ExternalAuthId will be stored as a varchar(100).)


=cut


=item AuthSystem

Returns the current value of AuthSystem. 
(In the database, AuthSystem is stored as varchar(30).)



=item SetAuthSystem VALUE


Set AuthSystem to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, AuthSystem will be stored as a varchar(30).)


=cut


=item Gecos

Returns the current value of Gecos. 
(In the database, Gecos is stored as varchar(16).)



=item SetGecos VALUE


Set Gecos to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Gecos will be stored as a varchar(16).)


=cut


=item HomePhone

Returns the current value of HomePhone. 
(In the database, HomePhone is stored as varchar(30).)



=item SetHomePhone VALUE


Set HomePhone to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, HomePhone will be stored as a varchar(30).)


=cut


=item WorkPhone

Returns the current value of WorkPhone. 
(In the database, WorkPhone is stored as varchar(30).)



=item SetWorkPhone VALUE


Set WorkPhone to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, WorkPhone will be stored as a varchar(30).)


=cut


=item MobilePhone

Returns the current value of MobilePhone. 
(In the database, MobilePhone is stored as varchar(30).)



=item SetMobilePhone VALUE


Set MobilePhone to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, MobilePhone will be stored as a varchar(30).)


=cut


=item PagerPhone

Returns the current value of PagerPhone. 
(In the database, PagerPhone is stored as varchar(30).)



=item SetPagerPhone VALUE


Set PagerPhone to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, PagerPhone will be stored as a varchar(30).)


=cut


=item Address1

Returns the current value of Address1. 
(In the database, Address1 is stored as varchar(200).)



=item SetAddress1 VALUE


Set Address1 to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Address1 will be stored as a varchar(200).)


=cut


=item Address2

Returns the current value of Address2. 
(In the database, Address2 is stored as varchar(200).)



=item SetAddress2 VALUE


Set Address2 to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Address2 will be stored as a varchar(200).)


=cut


=item City

Returns the current value of City. 
(In the database, City is stored as varchar(100).)



=item SetCity VALUE


Set City to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, City will be stored as a varchar(100).)


=cut


=item State

Returns the current value of State. 
(In the database, State is stored as varchar(100).)



=item SetState VALUE


Set State to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, State will be stored as a varchar(100).)


=cut


=item Zip

Returns the current value of Zip. 
(In the database, Zip is stored as varchar(16).)



=item SetZip VALUE


Set Zip to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Zip will be stored as a varchar(16).)


=cut


=item Country

Returns the current value of Country. 
(In the database, Country is stored as varchar(50).)



=item SetCountry VALUE


Set Country to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Country will be stored as a varchar(50).)


=cut


=item PGPKey

Returns the current value of PGPKey. 
(In the database, PGPKey is stored as text.)



=item SetPGPKey VALUE


Set PGPKey to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, PGPKey will be stored as a text.)


=cut


=item Creator

Returns the current value of Creator. 
(In the database, Creator is stored as int(11).)


=cut


=item Created

Returns the current value of Created. 
(In the database, Created is stored as datetime.)


=cut


=item LastUpdatedBy

Returns the current value of LastUpdatedBy. 
(In the database, LastUpdatedBy is stored as int(11).)


=cut


=item LastUpdated

Returns the current value of LastUpdated. 
(In the database, LastUpdated is stored as datetime.)


=cut


=item Disabled

Returns the current value of Disabled. 
(In the database, Disabled is stored as smallint(6).)



=item SetDisabled VALUE


Set Disabled to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Disabled will be stored as a smallint(6).)


=cut



sub _ClassAccessible {
    {
     
        id =>
		{read => 1, type => 'int(11)', default => ''},
        Name => 
		{read => 1, write => 1, type => 'varchar(120)', default => ''},
        Password => 
		{read => 1, write => 1, type => 'varchar(40)', default => ''},
        Comments => 
		{read => 1, write => 1, type => 'blob', default => ''},
        Signature => 
		{read => 1, write => 1, type => 'blob', default => ''},
        EmailAddress => 
		{read => 1, write => 1, type => 'varchar(120)', default => ''},
        FreeformContactInfo => 
		{read => 1, write => 1, type => 'blob', default => ''},
        Organization => 
		{read => 1, write => 1, type => 'varchar(200)', default => ''},
        RealName => 
		{read => 1, write => 1, type => 'varchar(120)', default => ''},
        NickName => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        Lang => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        EmailEncoding => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        WebEncoding => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        ExternalContactInfoId => 
		{read => 1, write => 1, type => 'varchar(100)', default => ''},
        ContactInfoSystem => 
		{read => 1, write => 1, type => 'varchar(30)', default => ''},
        ExternalAuthId => 
		{read => 1, write => 1, type => 'varchar(100)', default => ''},
        AuthSystem => 
		{read => 1, write => 1, type => 'varchar(30)', default => ''},
        Gecos => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        HomePhone => 
		{read => 1, write => 1, type => 'varchar(30)', default => ''},
        WorkPhone => 
		{read => 1, write => 1, type => 'varchar(30)', default => ''},
        MobilePhone => 
		{read => 1, write => 1, type => 'varchar(30)', default => ''},
        PagerPhone => 
		{read => 1, write => 1, type => 'varchar(30)', default => ''},
        Address1 => 
		{read => 1, write => 1, type => 'varchar(200)', default => ''},
        Address2 => 
		{read => 1, write => 1, type => 'varchar(200)', default => ''},
        City => 
		{read => 1, write => 1, type => 'varchar(100)', default => ''},
        State => 
		{read => 1, write => 1, type => 'varchar(100)', default => ''},
        Zip => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        Country => 
		{read => 1, write => 1, type => 'varchar(50)', default => ''},
        PGPKey => 
		{read => 1, write => 1, type => 'text', default => ''},
        Creator => 
		{read => 1, auto => 1, type => 'int(11)', default => ''},
        Created => 
		{read => 1, auto => 1, type => 'datetime', default => ''},
        LastUpdatedBy => 
		{read => 1, auto => 1, type => 'int(11)', default => ''},
        LastUpdated => 
		{read => 1, auto => 1, type => 'datetime', default => ''},
        Disabled => 
		{read => 1, write => 1, type => 'smallint(6)', default => '0'},

 }
};


        eval "require RT::User_Overlay";
        if ($@ && $@ !~ /^Can't locate/) {
            die $@;
        };

        eval "require RT::User_Local";
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

RT::User_Overlay, RT::User_Local

=cut


1;
