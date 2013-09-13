#!/usr/bin/perl

use strict;
use warnings;
use POSIX;
use bigint;

my $file;
open($file, "<", "names.txt");

my $super_string = "";
while (my $line = <$file>) {
	$line =~ s/\"//g;
	$line =~ s/[\r\n]+//g;
	$line =~ s/\s+//g;
	$super_string .= $line;
}
close($file);

$super_string = lc $super_string;
my @names = split(",", $super_string);
@names = sort @names;

my %predefined_char_num;
my $count = 1;
foreach my $char ('a'..'z') {
	$predefined_char_num{$char} = $count;
	$count += 1;
}

my $res = 0;
for (my $i = 1; $i <= $#names + 1; $i += 1) {
#for (my $i = 1; $i <= 1; $i += 1) {
	print $i, " ", getAlphabeticalValue($names[$i - 1]), "\n";
	$res += $i * getAlphabeticalValue($names[$i - 1]);
}
print $res;

sub getAlphabeticalValue {
	my $value = shift;
	my @chars = split(//, $value);
	my $res = 0;
	foreach my $char (@chars) {
		$res += $predefined_char_num{$char};
	}
	return $res;
}