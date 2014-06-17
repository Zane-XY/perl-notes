use strict;
use warnings;
use autodie;
use 5.012;
use Path::Class;

# takes path
sub walk_dir {
  my ($root, $indent) = @_;
  opendir my ($dh), $root;
  while (readdir($dh)) {
    next if /^\./;    #skip hidden
    say $indent . $_;
    my $dir = dir($root, $_);
    walk_dir($dir, $indent . '-') if -d $dir;

  }
  closedir($dh);
}

walk_dir('D:\workspace', '-');
