#IO
## Cheat Sheet
usage         | example
------------- | -------------
open dir handle | `opendir my $dirh, '/home/monkeytamer/tasks/';` 
read dir contents returns dir names, not full path | `my @files = readdir $otherdirh;`
close file | `close $fh` 
read `STDIN` into string | `my $str = do { local $/; <STDIN> };`
read `STDIN` into array | `my @lines = <STDIN>;`

#### read line by line
```perl
open my $fh, '<', $filename;
while (my $line = <$fh>) {
    chomp $line;
    ...
}
close $fh;
```

#### File Handle [ref](http://perldoc.perl.org/perlop.html#I/O-Operators)
- `<>` is circumfix readline operator, `<$fh>` is `readline($fh)` 
- when `<>` takes null filehandle, it is a synonym for `<ARGV>`, which is magical, it takes input either from STDIN, or from each file listed on the command line. 
- if `<FILEHANDLE>` is used in LIST context, e.g. `for (...)`, a list comprising all input lines is returned.
```perl
while (<>) {
    chomp;
    say scalar reverse;
}

cat file.txt | perl -e 'while (<>) {chomp;}' # read from stdin
perl -e 'while(<>) {chomp;}' file.txt # read from file.txt
```

#### Why use while and not for?
for imposes list context on its operand. In the case of readline, Perl will read the entire file before processing
any of it. while performs iteration and reads a line at a time. When memory use is a concern, use while.

####read file into array

```perl
# preserve line endings
use File::Slurp;
my @lines = read_file($file_name);
# chomp line endings
my @lines = read_file($file_name, chomp => 1);
```
####read file into string

```perl
use File::Slurp;
my $text = read_file( 'filename' ) ;
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
close $fh;
```
#### list dir
As of Perl 5.12 you can use a bare readdir in a while loop, which will set $_ on every iteration.
```perl
opendir(my $dh, $some_dir) || die;
while(readdir $dh) {
    print "$some_dir/$_\n";
}
closedir $dh;
```

####[dir glob](http://perlmeme.org/faqs/file_io/directory_listing.html)

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

#### Parentheses missing around "my" list
nearly all the docs and tutorials using `open my $fh, $file;` but this is ambiguous for `my`. What you acutally want is
`open my ($fh), $file;` but this reads as `open my ($fh, $file);` so if you don't provide the second param, make sure use `my ($fh)` or use `open(...)`.

