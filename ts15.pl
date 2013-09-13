#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $t = 1;
for my $n (22..41) {
	$t *= $n;
}

my $b = 1;
for my $n (1..20) {
	$b *= $n;
}

print $t/$b;