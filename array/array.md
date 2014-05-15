#Array


## CheatSheet

| First Header  | example|
| ------------- | ------------- |
| array literal  | `()` `(1..9)` `("a", "b")`  |
| print | `print join("\n", @arr);` |
|size|force the array into a scalar context <br> `print scalar @arr;` `my $arrSize = @arr;`|
|last index| `$#arr` `my last_elm = $arr[$#arr];`|
|filter| `grep {$_ eq "a"} @arr` [ref](http://perldoc.perl.org/functions/grep.html)|
|test existence|my @arr = ("a", "b","c",); <br> my %arr = map {$_ => undef} @arr; <br> print (exists $arr{"b"});|


## Quirks


```perl

my @arr = ("a", "b\n","c\n", "d");

my @params = ("a\n", "b\n","c\n", "d\n");

foreach my $e (@params) {
    if(grep {/^$e$/} @arr) {
        print $e;
    }
}

b 
c

```

what about {!/^$e$/} ?


```perl
my @arr = ("a", "b\n","c\n", "d");

my @params = ("a\n", "b\n","c\n", "d\n");

foreach my $e (@params) {
    if(grep {!/^$e$/} @arr) {
        print $e;
    }
}

```
you can see the reasons using:

```perl
my @arr = ("a", "b\n","c\n", "d");

my @params = ("a\n", "b\n","c\n", "d\n");

foreach my $e (@params) {
    my @r = grep {!/^$e$/} @arr;
    print @r;
    if(@r) {
        # print $e;
    }
}

ab
c
dac
dab
dab
c
d

```