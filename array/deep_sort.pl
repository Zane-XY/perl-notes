use Data::Dumper;

my $input = [1, 3, [4, 5, [7, 8, [9, 10, 11, [12, 13, 14]]]]];

# print Dumper $input;

sub deep_sort_array {
  my $arr = shift;
  for (@{$arr}) {
    if (ref($_)) {
      deep_sort_array($_);
    }
  }
  @$arr = sort comp @$arr;
}

sub comp {
  return 0 if ref $a && ref $b;
  return -1 if ref $b;
  return 1  if ref $a;
  return $b <=> $a;
}

my @output = deep_sort_array($input);

# print Dumper \@output;
