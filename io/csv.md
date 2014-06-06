#CSV

##cheatsheet

#### write array of array into csv[ref](http://search.cpan.org/~hmbrand/Text-CSV_XS-1.08/)

```perl
use Text::CSV_XS qw( csv );
csv (in => $aoa, out => "file.csv", sep_char=> ";");
```
