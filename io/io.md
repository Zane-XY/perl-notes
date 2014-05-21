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

####read file line by line
```perl
my $f = 'path';
open(my $fh, $f) or die "Could not open file '$f' $!"; 
while (my $line = <$fh>) {
	chomp $line;
	print "$line\n";
}
```

####[list dir](http://perlmeme.org/faqs/file_io/directory_listing.html)

[glob](http://perldoc.perl.org/functions/glob.html)
```perl
use strict;
    use warnings;
    my @files = glob("*.pl *.pm");
    foreach my $file (@files) {
        print "$file\n";
    }
```

#### write to file
```perl
my $f = "path";
open (my $fh, '>', $f) or die "couldn't open file $f $!";
foreach $e (@arr) {
	print $fh "$e\n";
}
close $fh;
```

