#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my @primes = (2);

my $i = 3;
while ($#primes != 10000) {
	if (!dividable($i, @primes)) {
		push(@primes, $i);
	}
	$i += 2;
}

print join (", ", @primes);

sub dividable {
	my $num = shift;
	my @primes = @_;
	foreach my $prime (@primes) {
		if ($num % $prime == 0) {
			return 1;
		}
	}
	return 0;
}