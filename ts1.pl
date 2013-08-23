#!/usr/bin/perl

use strict;
use warnings;

my $sum;
foreach my $i (1..999) {
	if ($i % 3 == 0) {
		$sum += $i;
	} elsif ($i % 5 == 0) {
		$sum += $i;
	}
}
print $sum;