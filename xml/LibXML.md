#LibXML

####install
cpan install XML::LibXML

####parse file to doc
```perl
use XML::LibXML;
my $parser = XML::LibXML->new();
my $doc= $parser->parse_file($path);
```

####extract attribute values using XPath
```perl
$doc->findvalue('/PIPELINE/PROP_MAPPER/PROP_MAPPING_DIM/@PROP_NAME')
```
> findvalue is used to return a single text or numeric value, i.e. not an XML node. If you pass an XPath expression that evaluates to a node list then it converts that list to text by concatenating all the text nodes within any of the nodes in the list.

####extract nodes
```perl
$doc->findnodes('/PIPELINE/PROP_MAPPER/PROP_MAPPING_DIM/@PROP_NAME')
```

#### create doc
```perl
my $doc = XML::LibXML::Document->new('1.0', 'utf-8');
my $root = $doc->createElement("PIPELINE");

$root->setAttribute('NAME'=> 'unset');

foreach my $e (@missing_facets) {
    my $node = $doc->createElement('PROP_MAPPING_DIM');
    $node->setAttribute('MATCH_MODE' => 'AUTO_GEN');
    $node->setAttribute(MAX_LENGTH => '0');
    $node->setAttribute('PROP_NAME' => $e);
    $root->appendChild($node);
}

$doc->setDocumentElement($root);
print $doc->toString();
```