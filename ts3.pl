#!/usr/bin/perl

use strict;
use warnings;
use bigint;
use POSIX;

my $divident = 600851475143;
my $max_divider = 1;

foreach my $i (3..ceil(sqrt($divident))) {
	while (($divident % $i == 0) && ($divident != 1)) {
		$divident /= $i;
		$max_divider = $i;
		print $divident, " ", $i, "\n";
	}
	last if ($divident == 1);
}

print $max_divider;
