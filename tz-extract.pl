#!/usr/bin/perl -w
use strict;
use warnings;
use File::Find;

find({ wanted => \&process_file, no_chdir => 1 }, @ARGV);

sub process_file {
    if (-f $_) {
        my $tz = substr $_, 20;
        #print "$tz\n";
        print "{";
        print "\"tz\":\"$tz\"";
        my $posix = `tail -1 $_`;
        my $posix_fixed = substr $posix, 0, length($posix) - 1;
        print ",\"posix\":\"$posix_fixed\"";
        print "}\n"
    } else {
        # print "This is not file: $_\n";
    }
}
