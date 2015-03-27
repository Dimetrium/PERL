package controllers::usercontroller;

#author: user6;
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



sub returnUserPost
{
   my ($self,$id) = @_;     
    my @arr = ();
    push(@arr, $mod->returnUserPost($id));
    $datacont->setArray('user.html',@arr);
}





1;
