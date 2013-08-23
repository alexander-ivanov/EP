#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $factorial = 1;
foreach my $i (2..100) {
	$factorial *= $i;
}

my @digits = split(//, $factorial);
my $sum = 0;
foreach my $d (@digits) {
	$sum += $d;
}

print $sum, "\n";