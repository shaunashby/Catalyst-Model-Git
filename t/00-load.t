#/opt/local/bin/perl

use Test::More tests => 1;

BEGIN {
	use_ok( 'Catalyst::Model::Git' );
}

diag( "Testing Catalyst::Model::Git $Catalyst::Model::Git::VERSION, Perl $], $^X" );
