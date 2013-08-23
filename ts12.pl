#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my $triangle_num = 1;
my $i = 2;

while (getFactorsNum($triangle_num) < 500) {
	print $triangle_num, " ", getFactorsNum($triangle_num), "\n";
	$triangle_num += $i;
	$i++;
}
print $triangle_num, " ", getFactorsNum($triangle_num), "\n";

sub getFactorsNum {
	my $n = shift;
	my $factors_num = 0;
	my $sqrt_n = floor(sqrt($n));
	my $i;
	for ($i = 1; $i <= $sqrt_n; $i++) {
		if ($n % $i == 0) {
			$factors_num += 1;
		}
	}
	$i--;
	$factors_num *= 2;
	if ($n / $i == $i) {
		$factors_num -= 1;
	}
	return $factors_num;
}