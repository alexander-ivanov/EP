#!/usr/bin/perl

use strict;
use warnings;
use POSIX;

my @triangle;
my $triangle_file;
open($triangle_file, "<", "./triangle.txt") or die "Can't open file";
while (my $line = <$triangle_file>) {
	$line =~ s/[\r\n]+//g;
	my @arr = split(m!\s!, $line);
	push (@triangle, [@arr]);
};
close ($triangle_file);

#for (my $i = 0; $i <= $#triangle; $i++) {
#	my @row = @{$triangle[$i]};
#	for (my $j = 0; $j <= $#row ; $j++) {
#		print $triangle[$i][$j], " ";
#	}
#	print "\n";
#}

for (my $i = 1; $i <= $#triangle; $i++) {
	my @row = @{$triangle[$i]};
	for (my $j = 0; $j <= $#row ; $j++) {
		if ($j == 0) {
			$triangle[$i][$j] += $triangle[$i-1][$j];
		} elsif ($j == $#row) {
			$triangle[$i][$j] += $triangle[$i-1][$j-1];
		} else {
			if ($triangle[$i-1][$j] > $triangle[$i-1][$j-1]) {
				$triangle[$i][$j] += $triangle[$i-1][$j];
			} else {
				$triangle[$i][$j] += $triangle[$i-1][$j-1];
			}
		}
	}
}

my $max = 0;
foreach my $e (@{$triangle[$#triangle]}) {
	if ($e > $max) {
		$max = $e;
	}
}
print $max, "\n";

#for (my $i = 0; $i <= $#triangle; $i++) {
#	my @row = @{$triangle[$i]};
#	for (my $j = 0; $j <= $#row ; $j++) {
#		print $triangle[$i][$j], " ";
#	}
#	print "\n";
#}