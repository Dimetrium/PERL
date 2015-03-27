#!/usr/bin/perl
use CGI qw/:standard/;
use strict;
use warnings;

$| = 1;

    if (param('Action'))
    {
        do_work();
    } 
    else 
    {
        print_form();
    }

sub print_form {
    print header(-content=>"text/html", -encoding=>"utf-8");
    print start_html(-style=>{-src=>'https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'});
    print "<h1 align='center'> Example Form</h1>\n";
    print start_form;
    print "<p align='center'>";
    print "<em>What's your name?</em><br>";
    print textfield('name');
    print "<p align='center'>";
    print checkbox('Not my real name');

    print "<p align='center'><em>Where can you find English Sparrows?</em><br>";
    print checkbox_group(
        -name=>'Sparrow locations',
        -values=>['England','France','Spain','Asia','Hoboken'],
        -linebreak=>'yes',
        -defaults=>['England','Asia']);

    print "<p align='center'><em>How far can they fly?</em><br>",
    radio_group(
        -name=>'how far',
        -values=>['10 ft','1 mile','10 miles','real far'],
        -default=>'1 mile');

    print "<p align='center'><em>What's your favorite color?</em>  ";
    print popup_menu(-name=>'Color',
        -values=>['black','brown','red','yellow'],
        -default=>'red');

    print hidden('Reference','Monty Python and the Holy Grail');

    print "<p align='center'><em>What have you got there?</em><br>";
    print scrolling_list(
        -name=>'possessions',
        -values=>['A Coconut','A Grail','An Icon',
            'A Sword','A Ticket'],
        -size=>5,
        -multiple=>'true');

    print "<p align='center'><em>Any parting comments?</em><br>";
    print textarea(-name=>'Comments',
        -rows=>5,
        -columns=>50);

    print "<p align='center'>",reset;
    print submit('Action','Exec');
    print end_form;
    # print "</p></p>";
    print "<hr>\n";
    print end_html;
}

sub do_work {
    print header(-content=>"text/html", -encoding=>"utf-8");
    print start_html("Result Form");
    print "<h2>Here are the current settings in this form</h2>";

    for my $key (param) {
        print "<strong>$key</strong> -> ";
        my @values = param($key);
        print join(", ",@values),"<br>\n";
    }
    print end_html;
}


