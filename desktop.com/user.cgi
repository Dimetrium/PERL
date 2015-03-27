#!/usr/bin/perl

#Author:user6;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use Data::Dumper;
use controllers::usercontroller;
use models::datacont;
use views::view;

my $controller;
my $view;
my $test = 0;
my $datacont;


$controll = controllers::usercontroller->new();
$controll->returnUserPost(1);

$view = views::view->new();
$view->run();


