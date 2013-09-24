#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use Data::Dumper;

my @primes_candidates = (2..4000000);
my @primes;
my %primes;

while ($#primes_candidates >= 0) {
	my $prime = shift(@primes_candidates);
	push (@primes, $prime);
	$primes{$prime} = 1;
	@primes_candidates = map { $_ % $prime != 0 ? $_ : ()} @primes_candidates;
	if ($prime > ceil(sqrt($primes_candidates[-1]))) {
		last;
	}
}
foreach my $prime (@primes_candidates) {
	push (@primes, $prime);
}
# b must be prime, beacuse n^2 + an + b must be prime when n = 0
my @b_candidates = map {$_ < 1000 ? $_ : ()} @primes;
foreach my $b (@b_candidates) {
	my @a = (-1000..1000);
	my $n = 1;
	while (($#a >= 0) && ($n < 90)) {
		print "$n " . join(", ", @a), " $b \n" if ($n > 70);
		@a = map { defined($primes{$n*$n + $_*$n + $b}) ? $_ : ()} @a;
		$n += 1;
	}
}
