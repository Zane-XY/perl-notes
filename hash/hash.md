#Hash
## cheat sheet

| common usage  | example|
| ------------- | ------------- |
|named hash| `my %colors = ( a => "b")`  |
|anonymous hash| `my $food_ref = { a => "b"}`|
| dereference hash ref | `%$colors_ref;`|
|key access| `$colors_ref->{$color};` or <br> `$$colors_ref{$color};`|
| slice on hash ref| `my @colores = @{ $colors_ref }{@colors};` |
