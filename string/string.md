#String

##CheatSheet
<table>
  <tr>
    <th>common usage</th>
    <th>example</th>
  </tr>
  <tr>
    <td>upper case the first letter</td>
    <td>`ucfirst`  [ref](http://perldoc.perl.org/functions/ucfirst.html) </td>
  </tr>
    <tr>
    <td>to upper case</td>
    <td>`uc` </td>
  </tr>
  <tr>
    <td>to lower case</td>
    <td>`lc` </td>
  </tr>

  <tr>
    <td>contains</td>
    <td>`"Hello World" =~ /World/`, `index($str, $substr) != -1`</td>
  </tr>
    <tr>
    <td>not contains</td>
    <td>`"Hello World" !~ /World/`, `index($str, $substr) == -1`</td>
  </tr>
    <tr>
    <td>interpolation</td>
    <td>double quotes</td>
  </tr>
   <tr>
    <td>concatination</td>
    <td>`.` <br> `print "arr size is " . (@arr)` <br> `$1 . $2`</td>
  </tr>
     <tr>
    <td>concatination and assign, append</td>
    <td>`.=`</td>
  </tr>
   <tr>
    <td>repeat</td>
    <td>`'*' x 5`</td>
  </tr> 
      <tr>
    <td>escape</td>
    <td>`\`</td>
  </tr>
    <tr>
    <td>quoting operator</td>
    <td>`qq{}` `q^^` `q{}`The character immediately following the operator determines the characters used to delimit the strings.</td>
  </tr>
  <tr>
    <td>split to char array</td>
    <td>`my $str = "ab cd ef gh ij";` <br> `my @words = split / /, $str;`</td>
  </tr>

</table>

#### heredoc

```perl
my $blurb =<<'END_BLURB';
content
END_BLURB
```

The quotes determine whetherthe heredoc follows single- or double-quoted behavior. (The default behavior is double-quoted.) END_BLURB is an arbitraryidentifier which the Perl parser uses as the ending delimiter. <br> Regardless of the indentation of the heredoc declaration itself, the ending delimiter must start at the beginning of the line.