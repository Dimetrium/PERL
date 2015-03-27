#!/usr/bin/perl
use CGI qw/:cgi-lib :escapeHTML :unescapeHTML/;
use CGI::Carp qw/fatalsToBrowser/;
use strict;
use warnings;
$| = 1;
ReadParse();
my $templatefile = 'resources/templates/newaccount.html';
my $htmlstr = loadtemplate($templatefile);
print "Content-type: text/html; encoding=utf-8\n\n";
#print "ok";
print substitutor($htmlstr);

sub loadtemplate
{
    my ($filename) = @_;
    local $/ = undef;
    open my $fh, " < $filename";
    my $html = <$fh>;
    close $fh;
    return $html;
}

sub substitutor
{
    my %hash = ('title'=>'New Account',
    'paneltitle'=>'Sign Un', 
    'email'=>'Email',
    'emailplaceholder'=>'Email Address',
    'name'=>'Name',
    'phone'=>'Phone',
    'password'=>'Password',
    'signup'=>'Sign Up');
    $_[0] =~s/{(\w+)}/$hash{$1}/ge;
    return $_[0];
}

