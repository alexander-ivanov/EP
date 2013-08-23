#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my @num_for_check = reverse(100..997);
foreach my $i (@num_for_check) {
	my $n = makePoly($i);
	print $n, " ";
	if (isDevided($n)) {
		print $n;
		last;
	}
	print "\n";
}


sub makePoly {
	my $n = shift;
	my $poly = "";
	while ($n > 0) {
		my $div = $n % 10;
		$n = floor($n / 10);
		$poly = $div.$poly.$div;
	}
	return $poly;
}

sub isDevided {
	my $n = shift;
	foreach my $i (100..999) {
		if (($n % $i == 0) && ($n / $i >= 100) && ($n / $i < 1000)) {
			print $i, " ", $n / $i, " ";
			return 1;
		}
		if ($n / $i < 100) {
			return 0;
		}
	}
	return 0;
}