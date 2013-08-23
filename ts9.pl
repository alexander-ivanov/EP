#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

for (my $a = 1; $a < 333; $a += 1) {
	my $div1 = 500000 - 1000*$a;
	my $div2 = 1000 - $a;
	if ($div1 % $div2 == 0) {
		my $b = $div1 / $div2;
		my $c = 1000 - $a - $b;
		print $a, " ", $b, " ", $c, " ", $a*$a + $b*$b, " = ", $c*$c, "\n";
		print $a * $b * $c;
	}
}