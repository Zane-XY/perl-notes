#Array

## CheatSheet

| common usage  | example|
| ------------- | ------------- |
| array literal  | `()` `(1..9)` `("a", "b")`  |
| print | `print join("\n", @arr);` |
|size|force the array into a scalar context <br> `print scalar @arr;` `my $arrSize = @arr;`|
|last index| `$#arr` `my last_elm = $arr[$#arr];`|
|filter| `grep {$_ eq "a"} @arr` [ref](http://perldoc.perl.org/functions/grep.html)|


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


