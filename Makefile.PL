
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Information about a perl module distribution",
  "AUTHOR" => "Randy Stauner <rwstauner\@cpan.org>",
  "BUILD_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "File::Spec::Functions" => 0,
    "Test::Fatal" => 0,
    "Test::MockObject" => "1.09",
    "Test::More" => "0.96"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dist-Metadata",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dist::Metadata",
  "PREREQ_PM" => {
    "Archive::Tar" => 1,
    "Archive::Zip" => "1.30",
    "CPAN::DistnameInfo" => "0.12",
    "CPAN::Meta" => "2.1",
    "Carp" => 0,
    "Digest" => "1.03",
    "Digest::MD5" => 2,
    "Digest::SHA" => 5,
    "File::Basename" => 0,
    "File::Find" => 0,
    "File::Spec::Native" => "1.002",
    "File::Temp" => "0.19",
    "List::Util" => 0,
    "Module::Metadata" => 0,
    "Path::Class" => "0.24",
    "Try::Tiny" => "0.09",
    "constant" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.925",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



