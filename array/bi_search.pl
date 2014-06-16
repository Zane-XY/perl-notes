#!/usr/bin/perl
use v5.10;
use Data::Dumper;

sub bi_search {
    my ($elem, @arr) = @_;
    @arr = sort @arr;
    #print Dumper \@arr;
    return unless @arr;
    my $mid = int((@arr /2) - 0.5);
    return 1 if @arr[$mid] == $elem;
    return if @arr == 1;
    return bi_search($elem, @arr[0 .. $mid]) if $arr[$mid] > $elem;
    return bi_search($elem, @arr[$mid + 1 .. $#arr]);
}

print bi_search(7, (9,2,3,4,5));