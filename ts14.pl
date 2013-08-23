#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use Data::Dumper;

my %known_hops;
my $max_i = 0;
my $max_hops = 0;
for my $i (2..1000000) {
	my $hops = getHopsNum($i);	
	if ($hops > $max_hops) {
		$max_i = $i;
		$max_hops = $hops;
	}
}

#foreach my $k (keys(%known_hops)) {
#	print $k, " ", $known_hops{$k}, "\n";
#}

print "\n", $max_i, " ", $max_hops, "\n";

sub getHopsNum {
	my $n = shift;
	my $counter = 0;
	my @path = ();
	while ($n != 1) {
		if (defined($known_hops{$n})) {
			$counter += $known_hops{$n};
			last;
		} else {
			push (@path, $n);
		}
		if ($n % 2 == 0) {
			$n /= 2;
		} else {
			$n = 3*$n + 1;
		}
		$counter += 1;
	}
	my $i = $counter;
	while ($#path >= 0) {
		my $last_elem = shift(@path);
		$known_hops{$last_elem} = $i;
		$i--;
	}
	return $counter;
}