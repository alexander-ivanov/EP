#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my $days_passed = 1;
my $sum = 0;
for (my $i = 0; $i <= 100; $i++) {
	for (my $j = 0; $j < 12; $j++) {
		my $year = 1900 + $i;		
		if ($days_passed % 7 == 0) {
			print $year, " ", $j + 1, "\n";
			if ($i > 0) {
				$sum += 1;
			}
		}
		$days_passed += getMonthLength($year, $j);
	}
}

print $sum, "\n";

sub isLeapYear {
	my $year = shift;
	if ($year % 400 == 0) {
		return 1;
	} elsif ($year % 100 == 0) {
		return 0;
	} elsif ($year % 4 == 0) {
		return 1;
	} else {
		return 0;
	}
}

sub getMonthLength {
	my $year = shift;
	my $month = shift;
	if (($month == 0) || 
		($month == 2) || 
		($month == 4) || 
		($month == 6) || 
		($month == 7) || 
		($month == 9) || 
		($month == 11)
		) {
		return 31;
	}
	if ($month == 1) {
		if (isLeapYear($year)) {
			return 29;
		} else {
			return 28;
		}
	}
	return 30;
}