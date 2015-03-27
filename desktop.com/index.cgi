#!/usr/bin/perl -w
use CGI qw/:cgi-lib :escapeHTML :unescapeHTML/;
use CGI::Carp qw/fatalsToBrowser/;
use Data::Dumper;
use controllers::indexcontroller;
use models::datacont;
use views::view;

my $cntr;
my $view;
my $test = 1;
my $datacont;

$cntr = controllers::indexcontroller->new();
$datacont = models::datacont->instance();
if ($test)
{
    $cntr->returnLast();
    #print Dumper $datacont->returnArray();
}
else
{
    $cntr->returnSearch('Less');
}
$view = views::view->new();
$view->run();

