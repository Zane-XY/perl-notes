#smartmatch
##Cheat Sheet
<pre>
$a      $b              Meaning
======= =======         ======================
Scalar  Regexp          Scalar matches Regexp
Scalar  Array           Scalar is an element of Array
Scalar  Hash            Scalar is a key of Hash
Scalar  Scalar          The string values are the same
Array   Regexp          At least on element of Array matches Regex
Array   Array           Arrays are the same. Reference elements point to the same data.
Array   Hash            Every element of Array is a key in Hash
Hash   Regexp           At least on key of Hash matches Regex
Hash   Hash             Hashes are the same. Reference elements point to the same data.
                        everything else is an error, as soon as Perl reduces it
</pre>