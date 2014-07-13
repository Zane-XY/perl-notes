Config
======

####read INI file

```perl
use Config::Tiny;
my $config = Config::Tiny->read('App.ini');
my $data_dir = $$config{_}{data_dir};
```
