use strict;

use File::Spec::Functions;
use FindBin ();
#use Test::More tests => 70;
use Test::More tests => 20;

use Audio::Scan;

my $HAS_ENCODE;
eval {
    require Encode;
    $HAS_ENCODE = 1;
};

# Basics
{
    my $s = Audio::Scan->scan( _f('test-1-mono.opus'), { md5_size => 4096 } );

    my $info = $s->{info};
    my $tags = $s->{tags};
    
#    SKIP:
#    {
##        skip 'Encode is not available', 1 unless $HAS_ENCODE;
	    #      my $utf8 = Encode::decode_utf8('シチヅヲ');
	    #  is($tags->{PERFORMER}, $utf8, 'PERFORMER (UTF8) Tag ok');
#    }

#    is($tags->{ARTIST}, 'Test Artist', 'ASCII Tag ok');
#    is($tags->{YEAR}, 2009, 'Year Tag ok');
#    ok($tags->{VENDOR} =~ /Xiph/, 'Vendor ok');

    is($info->{bitrate_average}, 30183, 'Bitrate ok');
    is($info->{channels}, 1, 'Channels ok');
    is($info->{file_size}, 4086, 'File size ok' );
    is($info->{stereo}, 0, 'Stereo ok');
    is($info->{samplerate}, 48000, 'Sample Rate ok');
    is($info->{input_samplerate}, 44100, 'Input Sample Rate ok');
    is($info->{song_length_ms}, 1044, 'Song length ok');
    is($info->{audio_offset}, 147, 'Audio offset ok');
    is($info->{audio_size}, 3939, 'Audio size ok');
    is($info->{audio_md5}, '688ac880cdc01ae5709a6fb104eddc2e', 'Audio MD5 ok' );
}

{
    my $s = Audio::Scan->scan( _f('test-2-stereo.opus'), { md5_size => 4096 } );

    my $info = $s->{info};
    my $tags = $s->{tags};
    
#    SKIP:
#    {
##        skip 'Encode is not available', 1 unless $HAS_ENCODE;
	    #      my $utf8 = Encode::decode_utf8('シチヅヲ');
	    #  is($tags->{PERFORMER}, $utf8, 'PERFORMER (UTF8) Tag ok');
#    }

#    is($tags->{ARTIST}, 'Test Artist', 'ASCII Tag ok');
#    is($tags->{YEAR}, 2009, 'Year Tag ok');
#    ok($tags->{VENDOR} =~ /Xiph/, 'Vendor ok');

    is($info->{bitrate_average}, 67900, 'Bitrate ok');
    is($info->{channels}, 2, 'Channels ok');
    is($info->{file_size}, 24973, 'File size ok' );
    is($info->{stereo}, 1, 'Stereo ok');
    is($info->{samplerate}, 48000, 'Sample Rate ok');
    is($info->{input_samplerate}, 44100, 'Input Sample Rate ok');
    is($info->{song_length_ms}, 2925, 'Song length ok');
    is($info->{audio_offset}, 147, 'Audio offset ok');
    is($info->{audio_size}, 24826, 'Audio size ok');
    is($info->{audio_md5}, 'bebb6f0f0a90ce4e4e90635a3c7408d0', 'Audio MD5 ok' );
}

#{
#    my $s = Audio::Scan->scan( _f('failure-end_gp_before_last_packet1.opus'), { md5_size => 4096 } );

#   my $info = $s->{info};
#   my $tags = $s->{tags};
    
#    SKIP:
#    {
##        skip 'Encode is not available', 1 unless $HAS_ENCODE;
	    #      my $utf8 = Encode::decode_utf8('シチヅヲ');
	    #  is($tags->{PERFORMER}, $utf8, 'PERFORMER (UTF8) Tag ok');
#    }

#    is($tags->{ARTIST}, 'Test Artist', 'ASCII Tag ok');
#    is($tags->{YEAR}, 2009, 'Year Tag ok');
#    ok($tags->{VENDOR} =~ /Xiph/, 'Vendor ok');

#    is($info->{bitrate_average}, 67714, 'Bitrate ok');
#    is($info->{channels}, 2, 'Channels ok');
	    #   is($info->{file_size}, 24973, 'File size ok' );
#    is($info->{stereo}, 1, 'Stereo ok');
#    is($info->{samplerate}, 48000, 'Sample Rate ok');
#    is($info->{input_samplerate}, 44100, 'Input Sample Rate ok');
#    is($info->{song_length_ms}, 2933, 'Song length ok');
#    is($info->{audio_offset}, 147, 'Audio offset ok');
#    is($info->{audio_size}, 24826, 'Audio size ok');
#    is($info->{audio_md5}, 'bebb6f0f0a90ce4e4e90635a3c7408d0', 'Audio MD5 ok' );
#}

sub _f {
    return catfile( $FindBin::Bin, 'opus', shift );
}
