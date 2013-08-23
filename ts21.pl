#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my $sum = 0;
foreach my $a (1..10000) {
	my $b = divisors_sum($a);
	if (($a == divisors_sum($b)) && ($a != $b)) {
		print $a, " ", $b, "\n";
		$sum += $a + $b;
	}
}
print $sum / 2;

my %pre_counted;
sub divisors_sum {
	my $n = shift;
	my $counted = $pre_counted{$n};
	if (defined($counted)) {
		return $counted;
	}
	my $sum = 0;
	for (my $i = 1; $i < ceil(sqrt($n)); $i++) {
		if ($n % $i == 0) {
			$sum += $i;
			if ($n / $i < $n) {
				$sum += $n / $i;
			}
		}
	}
	$pre_counted{$n} = $sum;
	return $sum;
}