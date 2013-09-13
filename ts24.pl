#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my $max_elem = 3;
my @arr = (0..$max_elem);

my $count = 0;
my $bound = 0;
print join(", ", @arr), "\n";
while ($count < 23) {
	my $stable = 1;
	my @unused;
	my @used;
	if ($arr[$bound] == $max_elem) {
		$bound += 1;
		$max_elem -= 1;
	}
	for (my $i = $bound; $i <= $#arr; $i += 1) {
		#print "Unused 1: ", join(", ", @unused), "\n";
		if ($stable) {
			if ($arr[$i+1] == $max_elem) {
				$stable = 0;
				for (my $j = $arr[$i] + 1; $j <= $max_elem; $j += 1) {
					if (!grep {$_ eq $j} @used) {
						$arr[$i] = $j;
						last;
					}
				}
				push (@used, $arr[$i]);
				@used = sort {$a <=> $b} @used;
				my $used_elem = shift(@used);
				for (my $j = 0; $j <= $max_elem; $j += 1) {
					if (defined($used_elem) && ($j == $used_elem)) {
						$used_elem = shift(@used);
					} else {
						push(@unused, $j);
					}
				}
			} else {
				push (@used, $arr[$i]);
			}
		} else {
			$arr[$i] = shift(@unused);
		}
	}
	print "[", $count, "] ", join(", ", @arr), "\n";
	$count += 1;
}
