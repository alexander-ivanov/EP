#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $matrix_size = 1001;

my $sum = 1;
for (my $i = 3; $i <= $matrix_size; $i += 2) {
	my $curr = $i**2;
	for (my $j = 0; $j < 4; $j++) {
		$sum += $curr - $j * ($i - 1);
	}
}
print $sum;

