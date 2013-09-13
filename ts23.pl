#!/usr/bin/perl -l

use strict;
use warnings;
use POSIX;

sub getDividers {
	my $n = shift;
	my @res = (1);
	for (my $i = 2; $i <= floor(sqrt($n)); $i++) {
		if ($n % $i == 0) {
			if ($n / $i != $i) {
				push(@res, $i);
				push(@res, $n / $i);
			} else {
				push(@res, $i);
			}
		}
	}
	return @res;
}

sub sum {
	my $sum = 0;
	foreach (@_) {
		$sum += $_;
	}
	return $sum;
}

my @abundantNums;
my %sums;
for (my $i = 2; $i <= 28123; $i += 1) {
	if ($i < sum(getDividers($i))) {
		push(@abundantNums, $i);
		foreach my $abNum (@abundantNums) {
			$sums{$abNum + $i} = 1 if ($abNum + $i <= 28123);
		}
	}
}
my @sorted_sums = sort {$a <=> $b} (keys %sums);
my $res = 0;
my $i = 1;
foreach my $s (@sorted_sums) {
	while ($i < $s) {
		print $i;
		$res += $i;
		$i += 1;
	}
	$i += 1;
}

print $res;

#print join (", ", @sorted_sums);

