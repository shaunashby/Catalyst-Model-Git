#____________________________________________________________________ 
# File: Git.pm
#____________________________________________________________________ 
#  
# Author: Shaun ASHBY <Shaun.Ashby@unige.ch>
# Update: Sep 30, 2009 5:15:49 PM
# Revision: $Id:$
#
# Copyright: 2009 (C) Shaun ASHBY, ISDC
#
#--------------------------------------------------------------------
package Catalyst::Model::Git;

=head1 NAME

Catalyst::Model::Git - A model to allow access to a Git repository.

=head1 SYNOPSIS

	my $obj = Catalyst::Model::Git->new();

=head1 DESCRIPTION

A model to allow access to a Git repository.

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

__PACKAGE__->mk_ro_accessors('repository');
__PACKAGE__->config( revision => 'HEAD' );

sub new() {
    my ($self, $c, $config) = @_;
    $self = $self->maybe::next::method(@_);
    
    die __PACKAGE__.": No repository location defined!" unless ($self->repository);
    
    # Create the interface using Git::PurePerl:
    $self->{git} = Git::PurePerl->new( directory => $self->repository );
    $self->{master} = $self->{git}->master;
    $self->{tree} = $self->{master}->tree;
    $self->{sha1} = $self->{master}->sha1;
    
    return $self;
}

sub branch() { shift->{git}->branch; }

sub sha1() { shift->{git}->sha1; }

sub list() {
	my ($self,@args) = @_;
    my @objects=();
    
    return wantarray ? @objects : \@objects;
}

1;

__END__

=back

=head1 AUTHOR/MAINTAINER

Shaun ASHBY, ISDC

=cut