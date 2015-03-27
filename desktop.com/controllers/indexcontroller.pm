package controllers::indexcontroller;
use models::postmodel;
use models::datacont;
use Data::Dumper;
my $mod;
my $datacont;

sub new
{
    my $proto = shift;
    my $class = ref($proto)||$proto;
    my $self = {};
    bless($self, $class);
    $mod = models::postmodel->new();
    $datacont = models::datacont->instance();
    return $self;
}

sub returnLast
{
    my @arr = ();
    # $arr = $mod->returnLast();
    push(@arr, $mod->returnLast());
    #print Dumper @arr;
    $datacont->setArray('index.html',@arr);
}

sub returnSearch
{
    my %arr = ();
    my ($self, $str) = @_;
    $arr = $mod->returnSearch($str);
    $datacont->setArray('index.html',$arr);
}

1;
