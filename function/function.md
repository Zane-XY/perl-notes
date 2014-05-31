#sub 

## cheat sheet
| common usage  | example|
| ------------- | ------------- |
|import subroutines | `use MODULE qw(NAME1 NAME2 NAME3);`|
|args can only be scalars| |
|last expression is return value| empty sub returns empty list, if last is control structure, return is unspecified [ref](http://perldoc.perl.org/perlsub.html)|
| | | 

#### perl always pass by reference, @_ just aliases scalar references array

`f(@a)`
is the same** as `f($a[0], $a[1], $a[2])`

Perl passes by reference. Specifically, Perl aliases each of the argument to the elements of `@_.` Modifying the elements `@_ `will change the scalars returned by `$a[0]`, etc and thus will modify the elements of `@a`.

array and hash keys aren't modifyable. 
As such, whenever you get the keys of an array or hash, you get a copy of the keys. Fresh scalars, so to speak.

`f(%h)`

is the same** as

```perl
f(
   my $k1 = "a", $h{a},
   my $k2 = "b", $h{b}, 
   my $k2 = "c", $h{c}, 
)
```

`@_` is still aliased to the values returned by `%h`, but some of those are just temporary scalars used to hold a key. Changing those will have no lasting effect.

#### Perl copies values on assignment
`my` inside sub create temp copy of value.


#### differences between use and require

As it says in the use perldoc's page:

>   It [use] is exactly equivalent to: <br>
    BEGIN { require Module; Module->import( LIST ); }

Basically, you should be using use over require 99% of the time.