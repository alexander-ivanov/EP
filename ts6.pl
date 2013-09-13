#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my @nums = (1..10);

my $bracket_sum = 0;
foreach my $num (@nums) {
	$bracket_sum += $num;
}

my $accum = 0;

while ($#nums > 0) {
	my $curr_num = shift(@nums);
	$bracket_sum -= $curr_num;
	$accum += $curr_num * $bracket_sum;
}

$accum *= 2;

print $accum;
