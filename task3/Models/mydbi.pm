package Models::mydbi;
use DBI;


my $user;
my $pass;
my $dbh;
my $database;
my $query;
my $rezult;
my $msg = "";
my $cnt;

sub new
{
    my $proto = shift;
    my $class = ref($proto)||$proto;
    my $self = {};
    bless($self, $class);
    my ($db, $u, $p) = @_;
    $database = $db;
    $user = $u;
    $pass = $p;
    return $self;
}

sub connect
{
     my $dsn = "dbi:mysql:$database:localhost";
     $dbh = DBI->connect($dsn, $user, $pass);
     if ($dbh)
     {
         return 1;
     }
     $msg = "Error connection \n";
     return undef;
}

sub setQuery
{
    if($rezult = $dbh->prepare($_[1]))
    {
        return 1;
    }
    $msg = "Error setQuery \n";
    return undef;
}

sub execute
{
    if($cnt = $rezult->execute())
    {
        return 1;
    }
    $msg = "Error execute \n";
    return undef;
}

sub getRowsCnt
{
    return $cnt;
}

sub getResult
{
    my @arr = ();
    while(my $row = $rezult->fetchrow_hashref)
    {
        push @arr, $row;
    }
    return @arr;
}

sub getError
{
    print $msg;
}

sub DESTROY
{
    $dbh->disconnect();
}

1;
