#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use Models::mydbi;


my $database = "user4";
my $user = "user4";
my $pass = "tuser4";
my $query = "SELECT name, text FROM test WHERE id > 10 AND id < 15";
my $dbobj;
my $cnt;
my @rez = ();
( ($dbobj = Models::mydbi->new($database,  $user, $pass))&&
    $dbobj->connect()&&
    $dbobj->setQuery($query)&&
    $dbobj->execute()&&
    ($cnt =  $dbobj->getRowsCnt())&&
    (@rez = $dbobj->getResult())&&
    $dbobj->DESTROY() )||($dbobj->getError()&& $dbobj->DESTROY());

print Dumper $cnt if ($cnt);
print Dumper (@rez) if (@rez);




