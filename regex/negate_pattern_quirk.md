## !// may behave wierd

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

what about `{!/^$e$/}` ?

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