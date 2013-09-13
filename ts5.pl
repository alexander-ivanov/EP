#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use Data::Dumper;

my %used_primes;
for my $i (2..20) {
	my %deviders = getDeviders($i);
	print $i, " ", Dumper(%deviders), "\n";
	%used_primes = merge(\%used_primes, \%deviders);
}

my $res = 1;
foreach my $k (keys(%used_primes)) {
	$res *= $k ** $used_primes{$k};
}
print $res;
#print Dumper(%used_primes);


sub getDeviders {
	my $n = shift;
	my %res;
	while ($n % 2 == 0) {
		$res{2}++;
		$n /= 2;
	}
	my $max_div = ceil(sqrt($n));
	my $divided = 0;
	for(my $i = 3; $i <= $max_div; $i = $i + 2) {
		while (($n % $i == 0) && ($n != 1)) {
			$divided = 1;
			$res{$i}++;
			$n /= $i;		
		}
		last if ($n == 1);
	}
	if (!$divided && $n != 1) {
		$res{$n}++;
	};
	return %res
}

sub merge {
	my $orig_ref = shift;
	my $div_ref = shift;
	my %orig = %{$orig_ref};
	my %divs = %{$div_ref};
	foreach my $k (keys(%divs)) {
		if (!defined($orig{$k}) || ($divs{$k} > $orig{$k}) ) {
			$orig{$k} = $divs{$k};
		}
	}
	return %orig;
}