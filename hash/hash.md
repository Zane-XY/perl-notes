#Hash
## cheat sheet

| common usage  | example|
| ------------- | ------------- |
|named hash| `my %colors = ( a => "b")`  |
|anonymous hash| `my $food_ref = { a => "b"}`|
|dereference hash ref | `%$colors_ref;`|
|key access| `$colors_ref->{$color};` or <br> `$$colors_ref{$color};`|
|slice on hash ref| `my @colores = @{ $colors_ref }{@colors};` |
|filter hash|`map {$_ => $$h_ref{$_}} grep {expr} (keys %$h_ref)`|
|Hashes are unordered|`keys` `values` returns random order everytime|
|You cannot "sort a hash"|you can only sort keys or values|
|map values| `my %hash_new = map {$_ => trans($hash{$_})} keys %hash;`|
|merge hashes|`my %third = (%first, %second)`|

#### Combine hashes with list assignment
`my %new_hash = (%hash1, %hash2);` 
If any keys in %hash2 duplicate keys in %hash1, the %hash2 key/value pair take priority because they're assigned later.
##### The difference between defined and exists
defined is used check if a value is `undef`
exists is used to check if a key exists
