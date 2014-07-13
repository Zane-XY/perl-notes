#### [LWP::Simple](http://search.cpan.org/dist/libwww-perl/lib/LWP/Simple.pm) 
provides simple methods like `get` `getprint($url)` which suits for one-liners

#### LWP::UserAgent 
send JSON request
```perl
my $req = HTTP::Request->new(POST => $url);
$req->content_type('application/json');
$req->content($json);

my $ua = LWP::UserAgent->new; # You might want some options here
my $res = $ua->request($req);
# $res is an HTTP::Response, see the usual LWP docs.
```



#### [Mojo::UserAgent](http://mojolicio.us/perldoc/Mojo/UserAgent)

##### build query from hash

```perl
use Mojo::URL;
my $params = {...};
Mojo::URL->new($url)->query($params)->to_string;
```
##### get response body

```perl
use Mojo::UserAgent;
my $ua = Mojo::UserAgent->new;
my $res = $ua->get($url => json)->res->body;
```


