#### [Mojo::JSON](http://mojolicio.us/perldoc/Mojo/JSON)

```perl
use File::Slurp;
use Mojo::JSON qw(decode_json);

my $text = read_file('a.json');
my $a_json = decode_json($text);

```

#### [Mojo::JSON::Pointer](http://mojolicio.us/perldoc/Mojo/JSON/Pointer)

```perl
use Mojo::JSON::Pointer;
use Data::Dumper;

my $pointer = Mojo::JSON::Pointer->new($a_json);

my %faqs = map {$_->{'title'} => $_->{'facets'}->{'topicCategory'}} @{$pointer->get('/entries')};

print Dumper(\%faqs);
```