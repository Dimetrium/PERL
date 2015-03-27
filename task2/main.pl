#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Models::regular;
use Models::singleton;


my $single = Models::singleton->instance();
$single->setVal('mystring');
print Dumper $single->getVal()."\n";

my $obj = Models::regular->new();
print Dumper $obj->getVal()."\n";

