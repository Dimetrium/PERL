#!/usr/bin/perl

use Data::Dumper;

@arr = (1, 3, 6, -2);
print Dumper(@arr);
%hash = ('name'=>'alex', 'email'=>'alex@nail.ru');
print Dumper(%hash);
$refarr = \@arr;
print Dumper($refarr);
$refhash = \%hash;
print Dumper($refhash);
$refarr->[2] = -10;
print Dumper($refarr);
$refhash->{'name'}= {};
$refhash->{'name'}->{'firstname'} = 'Alex';
$refhash->{'name'}->{'lastname'} = 'Avatar';
print Dumper($refhash);
$refhash->{'array'} = [1, 3, 5, 0];
print Dumper($refhash);
print Dumper($refhash->{'array'}->[2]);
