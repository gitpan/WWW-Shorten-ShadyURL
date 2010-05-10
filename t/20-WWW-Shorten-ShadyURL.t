#!perl
#
#   Test WWW::Shorten::ShadyURL
#
#   $Id: 20-WWW-Shorten-ShadyURL.t 134 2010-05-10 12:30:47Z infidel $
#

use Test::More tests => 4;

###
### VARS
###

my $testurl = 'http://www.youtube.com/watch?v=2pfwY2TNehw'; # Pale Blue Dot
my( $shorturl, $longurl );

###
### TESTS
###

# Test: Can we use the module?  Will pull in WWW::Shorten automagically.
BEGIN {
	use_ok( 'WWW::Shorten::ShadyURL' );
}

# Test: shortening
ok( $shorturl = makeashorterlink( $testurl ), 'makeashorterlink() works' );

# Test: resolving
ok( $longurl = makealongerlink( $shorturl ), 'makealongerlink() works' );

# Test: two are equal
is( $longurl, $testurl, 'short and resolved URL equivalence' );

__END__
