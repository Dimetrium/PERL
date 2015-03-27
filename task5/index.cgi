#!/usr/bin/perl -w
use CGI qw/:cgi-lib :escapeHTML :unescapeHTML/;
use CGI::Carp qw/fatalsToBrowser/;

$| = 1;
ReadParse();
my $templatefile = 'resource/html/index.html';
my $htmlstr = loadtemplate($templatefile);
print "Content-type:text/html; encoding=utf-8\n\n";
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
    my %hash = ('title'=>'My title page', 'h'=>'Header', 'p'=>'Paragraph');
    $_[0] =~s/{(\w+)}/$hash{$1}/ge;
    return $_[0];
}


