#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $a = 1;
my $b = 1;
my $i = 2;

while (length($b) < 1000) {
	$b += $a;
	$a = $b - $a;
	$i++;
}
print $i, "\n";