#!perl
#
#   Test WWW::Shorten::ShadyURL
#
#   $Id: 20-WWW-Shorten-ShadyURL.t 135 2010-05-12 13:41:54Z infidel $
#

use Test::More tests => 4;

###
### VARS
###

my $testurl = 'http://www.youtube.com/watch?v=2pfwY2TNehw'; # Pale Blue Dot
my( $shorturl, $longurl, $FAILCOUNT );

###
### TESTS
###

# Test: Can we use the module?  Will pull in WWW::Shorten automagically.
BEGIN {
	use_ok( 'WWW::Shorten::ShadyURL' );
}

# Knowingly abusing a TO-DO block for online tests.
TODO: {
    local $TODO = "Online tests may fail intermittently.";

    # Test: shortening
    ok( $shorturl = makeashorterlink( $testurl ),
        'ONLINE: makeashorterlink() works' )
      or $FAILCOUNT++;

    # Test: resolving
    ok( $longurl = makealongerlink( $shorturl ),
        'ONLINE: makealongerlink() works' )
      or $FAILCOUNT++;

    # Test: two are equal
    is( $longurl, $testurl, 'ONLINE: short and resolved URL equivalence' )
      or $FAILCOUNT++;

} # TO-DO

if( $FAILCOUNT )
{
    diag( "\n\nNOTE: $FAILCOUNT of the ONLINE tests have failed. This is " .
          "likely not a problem with\n" .
          "the module, but rather an intermittent issue with the shortener " .
          "service.\n\n" );
}

__END__
