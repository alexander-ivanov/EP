#!/usr/bin/perl

use strict;
use warnings;
use POSIX;


my $res = 0;
foreach my $i (10..999999) {
	my @digits = split(//, $i);
	my $sum = 0;
	foreach my $digit (@digits) {
		$sum += $digit**5;
	}
	if ($i == $sum) {
		$res += $i;
		print $i, "\n";
	}
}
print $res;

