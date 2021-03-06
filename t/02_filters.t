use v6;
use Test;
use Gumbo;

my $html = slurp "t/data/fancy.html";


plan 5;

my $xmldoc = parse-html($html, :TAG<div>, :class<content_div>);

ok $xmldoc.root.elements().elems == 1;

$xmldoc = parse-html($html, :TAG<div>, :class<content>);

ok $xmldoc.root.elements().elems == 3;

$xmldoc = parse-html($html, :TAG<div>, :class<content>, :SINGLE);

ok $xmldoc.root.elements().elems == 1;

$xmldoc = parse-html($html, :TAG<div>, :class(/tent/), :SINGLE);

ok $xmldoc.root.elements().elems == 1;

$xmldoc = parse-html($html, :TAG<div>, :class(/dsjdksl/), :SINGLE);

ok $xmldoc.root.elements().elems == 0;
