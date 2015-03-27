package models::postmodel;
use models::db;

my $mconn;
my $query;
my $conn;
sub new
{
    my $proto = shift;
    my $class = ref($proto)||$proto;
    my $self = {};
    bless($self, $class);
    $conn = models::db->instance();
    $mconn = $conn->connection();
    return $self;
}

sub returnLast
{
    $query = "SELECT * FROM p_post ORDER BY date DESC LIMIT 10";
    my @arr = ();
    @arr = $conn->exec($query);
    return @arr;
}

sub returnSearch
{
    my ($self, $str) = @_;
    $query = 'SELECT * FROM p_post WHERE title LIKE "%'.$str.'"';
    my @arr = ();
    @arr = $conn->exec($query);
    return @arr;
}

sub returnUserPost
{
    my ($self, $id) = @_;
    $query = 'SELECT * FROM p_post WHERE user_id ='.$id;
    my @arr = ();
    @arr = $conn->exec($query);
    return @arr;
}

1;
