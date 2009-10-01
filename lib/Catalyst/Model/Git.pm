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
use Git;
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
    
    
    
    return $self;
}

sub list() {
	my ($self,@args) = @_;
    my @items=();
    return wantarray ? @items : \@items;
}

1;

__END__

=back

=head1 AUTHOR/MAINTAINER

Shaun ASHBY, ISDC

=cut