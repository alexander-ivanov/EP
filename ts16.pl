#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $num = 2 << (1000-1);
print $num, "\n";
my @digits = split(//, $num);
print join (", ", @digits), "\n";
my $sum = 0;
foreach my $d (@digits) {
	$sum += $d;
}

print $sum;