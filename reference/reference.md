# reference
##CheatSheet [ref](http://www.perlmonks.org/?node_id=69927)
reference and deference types:

```perl
    $scalar        ${$sRef}
    @array         @{$aRef}
    $array[0]      ${$aRef}[0]
    $#array        $#{$aRef}
    %hash          %{$hRef}
    $hash{KEY}     ${$hRef}{KEY}
    @hash{@list}   @{$hRef}{@list}
```
dereference expressions:

```perl
    ${$sRefs[0]}   ${$sRefs{key}}   ${getScalarRef()}
    @{$aRefs[0]}   @{$aRefs{key}}   @{getArrayRef()}
    %{$hRefs[0]}   %{$hRefs{key}}   %{getHashRef()}
    @{ $bool ? \%hash1 : \%hash2 }{qw(some keys)}
```

If the reference is held in a simple scalar variable, then the braces, { and }, can be dropped:

```perl
    $scalar        $$sRef
    @array         @$aRef
    $array[0]      $$aRef[0]
    $#array        $#$aRef
    %hash          %$hRef
    $hash{KEY}     $$hRef{KEY}
    @hash{@list}   @$hRef{@list}
```

If you are getting a scalar from a hash or an array, then you can replace ${$ref} with $ref->:

```perl
    $array[0]     ${$aRef}[0]     $aRef->[0]
    $hash{KEY}    ${$hRef}{KEY}   $hRef->{KEY}
```

If the reference is in a hash or an array (and you are getting back a scalar), then you can drop the -> between the adjacent [0] and/or {KEY} parts:

```perl
    ${$aRef->[0]}[1]    $aRef->[0]->[1]    $aRef->[0][1]
    ${$aRef->[0]}{KEY}  $aRef->[0]->{KEY}  $aRef->[0]{KEY}
    ${$hRef->{KEY}}[1]  $hRef->{KEY}->[1]  $hRef->{KEY}[1]
    ${$hRef->{A}}{B}    $hRef->{A}->{B}    $hRef->{A}{B}
```

