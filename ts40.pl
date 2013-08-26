#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $string = "0.";
my $counter = 1;
while (length ($string) < 1000010) {
	$string .= $counter;
	$counter += 1;
}
my $initial_offset = 1;

my $offset = 1;
my $result = 1;
for (my $i = 1; $i <= 7; $i += 1) {
	$result *= substr ($string, $initial_offset + $offset, 1), "\n";
	$offset *= 10;	
}
print $result;