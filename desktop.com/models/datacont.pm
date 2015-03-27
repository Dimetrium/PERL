package models::datacont;
use Data::Dumper;

my %datacont = ('page'=>'', 'content'=>'', 'flag'=>1);

sub instance
{
    $class = ref($_[0])||$_[0];
    $self||=bless({}, $class);
    return $self;
}

sub returnArray
{
    return $datacont;
}

sub setArray
{
   my ($self, $page, @content) = @_;
  $datacont->{'page'} = $page; 
  $datacont->{'content'} = @content;
  #print Dumper $content[0]->{'title'};

  # $datacont->{'flag'} = $flag; 
}



1;
