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
    <td>.</td>
  </tr>
  <tr>
    <td>heredoc</td>
    <td>my $blurb =<<'END_BLURB'; <br> content <br>END_BLURB <br> The quotes determine whetherthe heredoc follows single- or double-quoted behavior. (The default behavior is double-quoted.) END_BLURB is an arbitraryidentifier which the Perl parser uses as the ending delimiter. <br> Regardless of the indentation of the heredoc declaration itself, the ending delimiter must start at the beginning of the line</td>
  </tr>
    <tr>
    <td>escape</td>
    <td>\</td>
  </tr>
    <tr>
    <td>quoting operator</td>
    <td>`qq{}` `q^^` `q{}`The character immediately following the operator determines the characters used to delimit the strings.</td>
  </tr>
</table>