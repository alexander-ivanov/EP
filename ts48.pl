#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $sum = 0;
foreach my $i (1..1000) {
	my $p = power ($i, $i);
	$sum += $p;
	$sum = substr ($sum, -10);
	print $i, " ", $p, " ", $sum, "\n";
}
print "\n", $sum, "\n";

sub power {
	my $n = shift;
	my $power = shift;
	my $accum = 1;
	my $base = $n;
	while ($power != 1) {
		if ($power % 2 == 0) {
			$power = $power / 2;
			$base = $base ** 2;
			#to fix overflow
			#$base = substr ($base, -10);
			$base = $base % 10**10;
		} else {
			$power = $power - 1;
			$accum = $accum * $base;
			#to fix overflow
			#$accum = substr ($accum, -10);
			$accum = $accum % 10**10;
		}
	}
	my $res = $accum * $base;
	$res = $res % 10**10;
	return $res;
	#return substr($accum * $base, -10);
}