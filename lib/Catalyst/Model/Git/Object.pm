package Catalyst::Model::Git::Object;

=head1 NAME

Catalyst::Model::Git::Object - A class to represent a file or directory in a Git repository.

=head1 SYNOPSIS

	my $obj = Catalyst::Model::Git::Object->new();

=head1 DESCRIPTION

A class to represent a file or directory in a Git repository.

=head1 METHODS

=over 8

=cut
use strict;
use warnings;

=item C<new()>

Constructor. Takes a hash of parameters.
    
=cut
sub new() {
    my $proto = shift;
    my $class = ref($proto) || $proto;
    my $self = shift;
    confess("Must have a hash of parameters!") unless (ref($self) eq 'HASH');
    bless($self,$class);
    return $self;
}

1;

__END__

=back

=head1 AUTHOR

Shaun ASHBY <shaun.ashby@gmail.com>

=cut
