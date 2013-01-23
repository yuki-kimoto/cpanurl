#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'App::cpanurl' ) || print "Bail out!\n";
}

diag( "Testing App::cpanurl $App::cpanurl::VERSION, Perl $], $^X" );
