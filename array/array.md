#Array

## Cheat Sheet

|usage|example|
| ------------- | ------------- |
|list literal  | `()` `(1..9)` `("a", "b")`  |
|pretty print | `print join("\n", @arr);` <br> `print Dumper \@arr;` |
|get size| `print scalar @arr;` <br> `my $arrSize = @arr;` <br> `return if @array == 1;` <br> `my $midpoint = int((@array / 2) - 0.5);`|
|last index| `$#arr` `my last_elm = $arr[$#arr];`|
|filter| `grep {$_ eq "a"} @arr` [ref](http://perldoc.perl.org/functions/grep.html)|
|force array reference|	`my $a_ref = [ grep {...} keys(%h) ];`|
|slicing, access multiple indexes| `my @arr_elems = @array[ @indexes ];`|
|construct list from string|`my @stooges = qw( Larry Curly);`|
|circumfix dereference|`push @{$a_ref}, 4;`|
|postfix dereference|`push $a_ref->@*, 4;`|
|shift|returns the first elem, shortening the array by 1|
|access array element by reference| `$a_ref->[0];`|
|slice on array reference|`my @high_cards = @{ $a_ref }[0 .. 2, -1];`|
|deep copy [ref](http://perldoc.perl.org/perlfaq4.html#How-do-I-print-out-or-copy-a-recursive-data-structure%3f)|`use Storable qw(dclone);` <br> `@data_new = @{ dclone(\@data) }`|
|empty or not empty| not empty: `if (@arr)` <br> empty: `if (!@arr)`|

#### contexts
##### scalar context
Numeric, String, and Boolean Context are all scalar context
- scalar assignment
- string concatenation: `say "Number of elements: " . @words;`
- numeric operations:  `@arr + 1`
- boolean context: `if(@arr)`

##### list context
list context is created by assignment `@x =` or `($x) =`
- assign to a list : `my ($x) = @arr;`
- assign to an array `my @a = @arr;`

```perl
use v5.10.1;
use Data::Dumper;
my @arr = (1,3,5);
my ($x, @y) = @arr;
say Dumper $x;
say Dumper \@y;
#prints
#$VAR1 = 1;
#$VAR1 = [ 3, 5 ];
```

#### existence

```perl
my @arr = ("a", "b","c");
my %arr = map {$_ => undef} @arr;
print (exists $arr{"b"});
```

##### smart match
disable 5.18 warning: `use experimental 'smartmatch';`
```perl
use 5.010;

if( $item ~~ @array ) {
	say "The array contains $item"
}

if( $item ~~ %hash ) {
       say "The hash contains $item"
}
```

#### subtract

```perl
# takes two arr refs A, B, remove elements from A which is in B
sub subtract {
  my ($a, $b) = @_;
  my %seen = map {$_ => 1} @$b;
  grep {not $seen{$_}} @$a;
}
```

#### remove dups
don't preserve order

```perl
#!/usr/bin/perl
use v5.10;
use Data::Dumper;

my @arr = (2,3,4,5,2,3);

sub remove_dups {
  my %t = map {$_ => 1} @_;
  keys %t;
}

say Dumper([remove_dups(@arr)]);
```

preserve order

```perl
sub remove_dups_order {
  my %seen, @r;
  for (@_) {
    push @r, $_ if not $seen{$_}++;
  }
  @r;
}
  ```

#### map always returns a list
Map always returns a list, which can be assigned to a hash such
that the elements become key/value pairs. 
`%hash = map { get_a_key_for($_) => $_ } @array;`

to produce a list of hash use `{}` to create hash reference:
`my @r = map { { ... => ... } } @arr;`

#### return array or array reference?
- return large array is slower then returning array ref
- return array ref would force other callee to handle array ref explictly 
- pass array to function would flatten the array to multi-arguments, so you need pass array as reference.

#### empty array is false
Lists, arrays, and hashes are evaluated as true if non-empty

#### array params will be flattened
If you pass multiple arrays to a normal function, they will flatten into a single list.
After the assignment, @cats will contain every argument passed to the function.@dogs will be empty.

```perl
take_pets_to_vet( @cats, @dogs );sub take_pets_to_vet{# BUGGY: do not use!my (@cats, @dogs) = @_;...}
```

####Lists and arrays are not interchangeable in Perl
- A list is immutable, whereas an array is mutable. 
- In order to change a list, you need to store the it in an array variable.
