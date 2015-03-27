package models::db;
use DBI;

my $self;
my $dbh;

sub instance
{
    $class = ref($_[0])||$_[0];
    $self||=bless({}, $class);
    return $self;
}

sub connection
{
    my $conn = "dbi:mysql:user4:localhost";
    $dbh = DBI->connect($conn, 'user4', 'tuser4');
    if ($dbh)
    {
        return $dbh;
    }
}

sub exec
{
    my $query;
    my $rezult;
    $query = $dbh->prepare($_[1]);
    $rezult = $query->execute();
    my @arr = ();
    while(my $row = $query->fetchrow_hashref)
    {
        push @arr, $row;
    }
    return @arr;
}
1;
