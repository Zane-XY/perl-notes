#IO

####read file into array

```perl
# preserve line endings
use File::Slurp;
my @lines = read_file($file_name);
# chomp line endings
my @lines = read_file($file_name, chomp => 1);
```

####remove line ending

Without an explicit variable, `chomp` removes the trailing newlinesequence from `$_`.
You usually see `chomp;` in a context that has `$_`.