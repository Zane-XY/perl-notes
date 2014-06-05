#Array

## CheatSheet

| common usage  | example|
| ------------- | ------------- |
| array literal  | `()` `(1..9)` `("a", "b")`  |
|Parentheses do not create lists, it changes their precedence. The comma operator creates lists.|`say name(), ' => ', age();`|
| print | `print join("\n", @arr);` |
|size|force the array into a scalar context <br> `print scalar @arr;` `my $arrSize = @arr;`|
|last index| `$#arr` `my last_elm = $arr[$#arr];`|
|filter| `grep {$_ eq "a"} @arr` [ref](http://perldoc.perl.org/functions/grep.html)|
|force array reference|	`my $arr_ref = [ grep {/[[:alpha:]]/} keys(%h) ];`|
|slicing, accessing multiple indexes| `my @array_elements = @array[ @indexes ];`|
|split a literal string on whitespace to produce a list of strings|`my @stooges = qw( Larry Curly);`|
|circumfix dereference|my $array_ref = [1, 2, 3]; <br> push @{$array_ref}, 4;|
|postfix dereference|my $array_ref = [1, 2, 3]; <br> push $array_ref->@*, 4;|
|shift| Shifts the first value of the array off and returns it, shortening the array by 1|
|access array element by reference| `$a_ref->[0]`|
|slice on array reference|`my @high_cards = @{ $cards_ref }[0 .. 2, -1];`|

#### existence

```perl
my @arr = ("a", "b","c");
my %arr = map {$_ => undef} @arr;
print (exists $arr{"b"});
```

#### subtract

```perl
my @arr = ("a", "b\n","c\n", "d");
my @params = ("a\n", "b\n","c\n", "d\n");

my %t = map {$_ => 1} @arr;
my @r = grep {not $t{$_}} @params;
print @r;

my %t = map {$_ => undef} @arr;
my @r = grep {not exists $t{$_}} @params;
print @r;
```

## usage

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


## difference with list
####Lists and arrays are not interchangeable in Perl
You may store a list in an array and you may coerce an array to a list, but listsand arrays are separate concepts. Lists are values. Arrays are containers.
