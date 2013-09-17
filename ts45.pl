#!/usr/bin/perl -l

use strict;
use warnings;
use POSIX;

my $i = 286;
my $j = 166;
my $n = 144;

my $triangle = $i*($i+1)/2;
my $pentagonal = $j*(3*$j-1)/2;
my $hexagonal = $n*(2*$n-1);

while (!(($triangle == $pentagonal) && ($pentagonal == $hexagonal))) {
	if ($triangle < $pentagonal) {
		if ($triangle < $hexagonal) {
			$i++;
			$triangle = $i*($i+1)/2;
		} else {
			$n++;
			$hexagonal = $n*(2*$n-1);			
		}
	} else {
		if ($pentagonal < $hexagonal) {
			$j++;
			$pentagonal = $j*(3*$j-1)/2;
		} else {
			$n++;
			$hexagonal = $n*(2*$n-1);
		}
	}
}

print "$i $triangle";
print "$j $pentagonal";
print "$n $hexagonal";