package Models::regular;

use Models::singleton;


sub new
{
    my $proto = shift;
    my $class = ref($proto)||$proto;
    my $self = {};
    bless($self, $class);
    return $self;
}


sub getVal
{
    my $singleton = Models::singleton->instance();

    my($self, $val) = @_;    
    return $singleton->getVal();
}

1;
