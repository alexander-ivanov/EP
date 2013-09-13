#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my %counted_nums;

my $sum = 0;
foreach my $i (1..1000) {
	my $num_str = getNumWord($i);
	my $char_num = countCharInStr($num_str);
	$sum += $char_num;
	print $i, " ", $num_str, " ", $char_num, "\n";
}
print "Sum: ", $sum, "\n";

sub countCharInStr {
	my $s = shift;
	my @words = split(m!\s!, $s);
	my $sum = 0;
	foreach my $w (@words) {
		$sum += countCharInWord($w);
	}
	return $sum;
}

sub countCharInWord {
	my $n = shift;
	my $pre_counted = $counted_nums{$n};
	if (defined($pre_counted)) {
		return $pre_counted;
	} else {
		my $length = length($n);
		$counted_nums{$n} = $length;
		return $length;
	}
}

sub getNumWord {
	my $n = shift;
	if ($n == 1) {
		return "one";
	} elsif ($n == 2) {
		return "two";
	} elsif ($n == 3) {
		return "three";
	} elsif ($n == 4) {
		return "four";
	} elsif ($n == 5) {
		return "five";
	} elsif ($n == 6) {
		return "six";
	} elsif ($n == 7) {
		return "seven";
	} elsif ($n == 8) {
		return "eight";
	} elsif ($n == 9) {
		return "nine";
	} elsif ($n == 10) {
		return "ten";
	} elsif ($n == 11) {
		return "eleven";
	} elsif ($n == 12) {
		return "twelve";
	} elsif ($n == 13) {
		return "thirteen";
	} elsif ($n == 14) {
		return "fourteen";
	} elsif ($n == 15) {
		return "fifteen";
	} elsif ($n == 16) {
		return "sixteen";
	} elsif ($n == 17) {
		return "seventeen";
	} elsif ($n == 18) {
		return "eighteen";
	} elsif ($n == 19) {
		return "nineteen";
	} elsif ($n == 20) {
		return "twenty";
	} elsif ($n == 30) {
		return "thirty";
	} elsif ($n == 40) {
		return "forty";
	} elsif ($n == 50) {
		return "fifty";
	} elsif ($n == 60) {
		return "sixty";
	} elsif ($n == 70) {
		return "seventy";
	} elsif ($n == 80) {
		return "eighty";
	} elsif ($n == 90) {
		return "ninety";
	} 
	if ($n < 100) {
		my ($h, $l) = split(//, $n);
		$h *= 10;
		return getNumWord($h) . " " . getNumWord($l);
	}
	if ($n < 1000) {
		my ($h, $m, $l) = split(//, $n);
		if (($m == 0) && ($l == 0)) {
			return getNumWord($h) . " hundred";
		} else {
			return getNumWord($h) . " hundred and " . getNumWord($m*10 + $l); 
		}
	}
	if ($n == 1000) {
		return "one thousand";
	}
}