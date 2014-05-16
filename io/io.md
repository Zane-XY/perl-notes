#IO

####read file into array
```perl
# preserve line endings
use File::Slurp;
my @lines = read_file($file_name);
# chomp line endings
my @lines = read_file($file_name, chomp => 1);
```