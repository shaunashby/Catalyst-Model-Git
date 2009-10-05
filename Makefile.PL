use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Catalyst::Model::Git',
    AUTHOR              => '"Shaun ASHBY" <"Shaun.Ashby@unige.ch">',
    VERSION_FROM        => 'lib/Catalyst/Model/Git.pm',
    ABSTRACT_FROM       => 'lib/Catalyst/Model/Git.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Catalyst::Model' => 0,
        'Git::PurePerl' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Catalyst-Model-Git-*' },
);
