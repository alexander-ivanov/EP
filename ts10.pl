#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my @primes_candidates = (2..2000000);
my @primes;
my $i = 0;

my $sum = 0;
while ($#primes_candidates >= 0) {
	my $prime = shift(@primes_candidates);
	$sum += $prime;
	push (@primes, $prime);
	@primes_candidates = map { $_ % $prime != 0 ? $_ : ()} @primes_candidates;
	if ($prime > ceil(sqrt($primes_candidates[-1]))) {
		last;
	}
	print $prime, " ", $#primes, " ", $#primes_candidates, "\n" if ($i % 1000 == 0);
	$i++;

}

foreach my $p (@primes_candidates) {
	$sum += $p;
}
print $sum;