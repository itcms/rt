use strict;
use warnings;

use RT::Test tests => undef;

my ( $url, $m ) = RT::Test->started_ok;

my $lifecycleObj = RT::Lifecycle->new();
my $lifecycles   = RT->Config->Get('Lifecycles');

my $new_lifecycle = {
    %{$lifecycles},
    foo => {
        type     => 'ticket',
        initial  => ['initial'],
        active   => ['active', 'case-Variant-Status'],
        inactive => ['inactive'],
    }
};

my ($ret, $msg) = $lifecycleObj->_SaveLifecycles(
    $new_lifecycle,
    RT->SystemUser,
);
ok $ret, "Updated lifecycle successfully";
RT::Lifecycle->FillCache();

diag "Test updating mappings";
{
    ok( $m->login( 'root', 'password' ), 'logged in' );

    $m->get_ok( $url . '/Admin/Lifecycles/Mappings.html?Type=ticket&Name=default' );

    my $form = $m->form_name('ModifyMappings');
    $m->submit_form(
        fields => {
            "map-default-new--foo"      => "initial",
            "map-default-open--foo"     => "active",
            "map-default-resolved--foo" => "inactive",
            "map-foo-initial--default"  => "new",
            "map-foo-active--default"   => "open",
            "map-foo-inactive--default" => "resolved",
            "map-default-deleted--foo"  => "inactive",
            "map-default-rejected--foo" => "inactive",
            "map-default-stalled--foo"  => "case-Variant-Status",
            "Name"                      => "default",
            "Type"                      => "ticket",
        },
        button => 'Update'
    );
    $m->content_contains( 'Lifecycle mappings updated' );

    RT::Test->stop_server;
    RT->Config->LoadConfigFromDatabase();
    ( $url, $m ) = RT::Test->started_ok;
    ok( $m->login( 'root', 'password' ), 'logged in' );

    RT::Lifecycle->FillCache();

    my $foo = RT::Lifecycle->new();
    ($ret, $msg) = $foo->Load( Name => 'foo', Type => 'ticket' );
    ok $ret, "Loaded lifecycle foo successfully";

    my $default = RT::Lifecycle->new();
    ($ret, $msg) = $default->Load( Name => 'default', Type => 'ticket' );
    ok $ret, "Loaded lifecycle default successfully";

    my $from = {
        deleted    => "inactive",
        new        => "initial",
        open       => "active",
        rejected   => "inactive",
        resolved   => "inactive",
        stalled    => "case-variant-status"
    };

    my $to = {
        active     => "open",
        inactive   => "resolved",
        initial    => "new",
    };

    is_deeply( $from, $default->MoveMap( $foo ), "Move map from default -> foo set correctly" );
    is_deeply( $to, $foo->MoveMap( $default ), "Move map from foo -> default set correctly" );

    $from->{'new'} = 'active';

    $m->get_ok( $url . '/Admin/Lifecycles/Mappings.html?Type=ticket&Name=default' );
    $form = $m->form_name('ModifyMappings');
    $m->submit_form(
        fields => {
            "map-default-new--foo"      => "active",
            "map-default-open--foo"     => "active",
            "map-default-resolved--foo" => "inactive",
            "map-foo-initial--default"  => "new",
            "map-foo-active--default"   => "open",
            "map-foo-inactive--default" => "resolved",
            "map-default-deleted--foo"  => "inactive",
            "map-default-rejected--foo" => "inactive",
            "map-default-stalled--foo"  => "case-variant-status",
            "Name"                      => "default",
            "Type"                      => "ticket",
        },
        button => 'Update'
    );
    $m->content_contains( 'Lifecycle mappings updated' );

    RT::Test->stop_server;
    RT->Config->LoadConfigFromDatabase();
    ( $url, $m ) = RT::Test->started_ok;
    RT::Lifecycle->FillCache();

    is_deeply( $from, $default->MoveMap( $foo ), "Move map from default -> foo updated correctly" );
}

diag "Confirm the web UI correctly displays mappings";
{
    ok( $m->login( 'root', 'password' ), 'logged in' );

    $m->get_ok( $url . '/Admin/Lifecycles/Mappings.html?Type=ticket&Name=default' );
    my $form = $m->form_name('ModifyMappings');

    my $from = {
        deleted    => "inactive",
        new        => "active",
        open       => "active",
        rejected   => "inactive",
        resolved   => "inactive",
        stalled    => "case-variant-status"
    };

    my $to = {
        active     => "open",
        inactive   => "resolved",
        initial    => "new",
    };

    my @inputs = $form->inputs;
    foreach my $input ( @inputs ) {
        my ($default_from, $default_status, $default_to) = $input->name =~ /^map-(default)-(.*)--(foo)$/;
        my ($foo_from, $foo_status, $foo_to) = $input->name =~ /^map-(default)-(.*)--(foo)$/;

        if ( $default_from ) {
            is ($input->value, $from->{$default_status}, "Mapping set correctly for default -> foo for status: $default_status" );
        }
        elsif ( $foo_from ) {
            is ( $input->value, $to->{$foo_status}, "Mapping set correctly for foo -> default for status: $foo_status" );
        }
    }
}

diag "Test RT::Lifecycle::ParseMappingsInput method";
{
    my %args = (
        "map-default-new--foo"         => "initial",
        "map-default-open--foo"        => "active",
        "map-default-stalled--foo"     => "active",
        "map-default-rejected--foo"    => "inactive",
        "map-default-resolved--foo"    => "inactive",
        "map-default-deleted--foo"     => "inactive",

        "map-foo-initial--default"     => "new",
        "map-foo-active--default"      => "open",
        "map-foo-inactive--default"    => "resolved",
    );
    my %maps = RT::Lifecycle::ParseMappingsInput( \%args );

    my %expected = (
      'default -> foo' => {
          "new"        => "initial",
          "open"       => "active",
          "rejected"   => "inactive",
          "resolved"   => "inactive",
          "stalled"    => "active",
          "deleted"    => "inactive",
      },
      'foo -> default' => {
          "initial"    => "new",
          "active"     => "open",
          "inactive"   => "resolved",
      }
    );

    is_deeply( \%expected, \%maps, "RT::Lifecycle::ParseMappingsInput method successfully parsed input." );

    RT::Test->stop_server;
    RT->Config->LoadConfigFromDatabase();
    ( $url, $m ) = RT::Test->started_ok;
    ok( $m->login( 'root', 'password' ), 'logged in' );
    $lifecycles = RT->Config->Get('Lifecycles');

    my %updated_maps = (%{$lifecycles->{'__maps__'}}, %maps);
    $lifecycles->{'__maps__'} = \%updated_maps;

    ($ret, $msg) = $lifecycleObj->_SaveLifecycles(
        $lifecycles,
        RT->SystemUser,
    );
    ok $ret, "Updated lifecycle successfully";

    RT::Test->stop_server;
    RT->Config->LoadConfigFromDatabase();
    ( $url, $m ) = RT::Test->started_ok;
    ok( $m->login( 'root', 'password' ), 'logged in' );
    $lifecycles = RT->Config->Get('Lifecycles');

    $m->get_ok( $url . '/Admin/Lifecycles/Mappings.html?Type=ticket&Name=foo' );
    my $form = $m->form_name('ModifyMappings');

    my $to   = $expected{"default -> sales-engineering"};
    my $from = $maps{"sales-engineering -> default"};

    my @inputs = $form->inputs;
    foreach my $input ( @inputs ) {
        my ($default_from, $default_status, $default_to) = $input->name =~ /^map-(sales-engineering)-(.*)--(default)$/;
        my ($sales_engineering_from, $sales_engineering_status, $sales_engineering_to) = $input->name =~ /^map-(default)-(.*)--(sales-engineering)$/;

        if ( $default_from ) {
            is ($input->value, $from->{$default_status}, "Mapping set correctly for default -> sales_engineering for status: $default_status" );
        }
        elsif ( $sales_engineering_from ) {
            is ( $input->value, $to->{$sales_engineering_status}, "Mapping set correctly for sales_engineering -> default for status: $sales_engineering_to" );
        }
    }
}

done_testing;
