package Models::singleton;

my $str;
my $self;

sub instance
{
    $class = ref($_[0])||$_[0];
    $self||=bless({}, $class);
    return $self;
}

sub setVal
{
    my($self, $val) = @_;
    $str = $val;
}

sub getVal
{
    return $str;
}

1;
