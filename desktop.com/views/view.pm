package views::view;

use CGI qw/:cgi-lib :escapeHTML :unescapeHTML/;
use CGI::Carp qw/fatalsToBrowser/;
use models::datacont;
use models::postmodel;
use Data::Dumper;

my $datacont;
my @conteiner = ();
my $arr;

sub new
{
    my $proto = shift;
    my $class = ref($proto)||$proto;
    my $self = {};
    bless($self, $class);
    $datacont = models::datacont->instance();
    return $self;
}

sub run
{
    $| = 1;
    ReadParse();
    # print Dumper  $datacont->returnArray();
    push(@container, $datacont->returnArray());
    push(@arr, $container[0]->{'content'});
    #print Dumper $arr;
    #for (@$arr)
    #{
    #    print ($_->{'title'});
    #}
    
    
    my $page = $container[0]->{'page'}; 
    my $template = 'resources/templates/'.$page;
    my $html = loadhtml($template);
    print "Content-type:text/html; encoding=utf-8\n\n";
    print substitutor($html);
}

sub loadhtml
{
    my ($filename) = @_;
    local $/ = undef;
    open my $fh, " < $filename";
    my $html = <$fh>;
    close $fh;
    return $html;

}

sub listcat
{
    my $str = '<option>Real Estate</option>';
    return $str;
}

sub data
{
    my $str = 'Array data';
    return $str;
}


sub substitutor
{    
    $_[0] =~s/{(\w+)}/eval($1)/ge;
    return $_[0];
}


1;
