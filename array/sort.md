#sort
- sort SUBNAME LIST
- sort BLOCK LIST
- sort LIST
- `cmp` lexically compare, `<=>` for numeric compare


####Schwartzian transform 
sort the word list ("aaaa","a","aa") according to word length. 

```perl
@sorted = map  { $_->[0] }
          sort { $a->[1] <=> $b->[1] } # use numeric comparison
          map  { [$_, length($_)] }    # calculate the length of the string
          @unsorted;
```

#### write a compare function

```perl
# sort using explicit subroutine name
sub byage {
	$age{$a} <=> $age{$b}; # presuming numeric
}
@sortedclass = sort byage @class;
```
#### sort array of hash by key

```perl
my $users = [
  {name => 'John',   score => 10},
  {name => 'Bob',    score => 1},
  {name => 'Carlos', score => 5},
  {name => 'Alice',  score => 5},
  {name => 'Donald', score => 7}
];

say Dumper $_ for sort {$a->{score} <=> $b->{score}} @$users;
```
#### sort by multiple keys

```perl
#sort by brand, supplier and PO
$arr_ref = [
  {'brand' => 'A', 'supplier' => 'X', 'PO' => '2'},
  {'brand' => 'B', 'supplier' => 'Y', 'PO' => '1'},
  {'brand' => 'B', 'supplier' => 'X', 'PO' => '2'},
  {'brand' => 'A', 'supplier' => 'X', 'PO' => '1'},
  {'brand' => 'B', 'supplier' => 'X', 'PO' => '1'}
];

@$arr_ref = sort { $a->{brand}    cmp $b->{brand}    or 
                   $a->{supplier} cmp $b->{supplier} or 
                   $a->{PO}       <=> $b->{PO} 
                 } @$arr_ref;

```

#### sort hash by value (Schwartzian transform)
need to transform hash to list of pairs

```perl
my %extensions = (
  '000' => 'Damian',
  '002' => 'Wesley',
  '012' => 'LaMarcus',
  '042' => 'Robin',
  '088' => 'Nic',
);

say Dumper for sort {$a->[1] cmp $b->[1]} map {[$_, $extensions{$_}]} keys %extensions;
```
