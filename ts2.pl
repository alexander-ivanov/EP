#!/usr/bin/perl

use strict;
use warnings;

my $low_fib_iter = 1;
my $high_fib_iter = 2;

my $sum = 0;

while ($high_fib_iter < 4000000) {
	$sum += $high_fib_iter if ($high_fib_iter % 2 == 0);
	$high_fib_iter += $low_fib_iter;
	$low_fib_iter = $high_fib_iter - $low_fib_iter;
}

print $sum;