package Catalyst::Model::Git;

=head1 NAME

Catalyst::Model::Git - A model to allow access to a Git repository.

=head1 SYNOPSIS

        sub method() {
            my ($self, $c) = @_;
            my $data = $c->model('Git')->list();
	    # render etc.
        }

=head1 DESCRIPTION

A model to allow access to a Git repository.

=head1 CONFIG

The following configuration options are available:

=head2 directory

Returns the path to the Git repository. At the moment, only local access (to
a repository on a local filesystem) is supported.
    
This value comes from the config key 'directory'.

=head2 branch

This is the default branch to use when no branch is specified. By default,
this will be C<master>.
    
=head1 METHODS

=over

=cut

use strict;
use warnings;
use Git::PurePerl;
use Scalar::Util qw/blessed/;
use Carp qw(confess croak);
use base 'Catalyst::Model';

our $VERSION = '0.01';

__PACKAGE__->mk_ro_accessors('directory','branch');
__PACKAGE__->config( branch => 'master' );

=head1 METHODS

=over 8 

=item * new()

Constructor for the model. The directory where the repository is located must be defined via
the configuration for the package.
    
=cut
sub new() {
    my ($self, $c, $config) = @_;
    $self = $self->maybe::next::method(@_);
    
    die __PACKAGE__.": No repository location defined!" unless ($self->directory);
    
    # Create the interface using Git::PurePerl:
    $self->{git} = Git::PurePerl->new( directory => $self->directory );
    $self->{master} = $self->{git}->master;
    $self->{tree} = $self->{master}->tree;
    $self->{sha1} = $self->{master}->sha1;
    
    return $self;
}

# Private method:
sub _git {
    my $self = shift;
    confess('Need a Git::PurePerl instance') unless blessed($self);
    return $self->{git};
}

=item * branch_sha1()

Return the SHA1 of the current branch. Default branch is master.
    
=cut
sub branch_sha1() { shift->{master}->sha1(); }

=item * list($path)

List the objects under VC at $path or at the tree-level if no path specified.
Returns an arrayref containing Catalyst::Model::Git::Object objects, representing
the contents for the required revision.
    
=cut
sub list() {
    my ($self,@args) = @_;
    my @objects=();

    push(@objects,$self->_git->get_objects($self->{sha1}));
    
    return wantarray ? @objects : \@objects;
}

1;

__END__

=back

=head1 AUTHOR

Shaun ASHBY <shaun.ashby@gmail.com>

=cut
