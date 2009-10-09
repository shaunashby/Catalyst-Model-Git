package Catalyst::Model::Git::Object;

=head1 NAME

Catalyst::Model::Git::Object - A class to represent a file or directory in a Git repository.

=head1 SYNOPSIS

	my $obj = Catalyst::Model::Git::Object->new();

=head1 DESCRIPTION

A class to represent a file or directory in a Git repository.

=head1 METHODS

=over

=cut

use strict;
use warnings;
use Carp;

require 5.008;

use vars qw($VERSION $AUTOLOAD);

# Constants:
use constant XX => 1234;


=item C<new()>

Constructor for .

=cut

sub new() {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self = {};
    bless($self,$class);
    return $self;
}



sub AUTOLOAD {
    my $self = shift;
    my $method = $AUTOLOAD;
    $method =~ s/.*:://;
}

1;

__END__

=back

=head1 AUTHOR/MAINTAINER

Shaun ASHBY, ISDC

=cut