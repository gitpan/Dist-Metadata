
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'Module::Build' => '0.3601',
    'Test::Fatal' => '0',
    'Test::MockObject' => '1.09',
    'Test::More' => '0.96'
  },
  'configure_requires' => {
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'Information about a perl module distribution',
  'dist_author' => [
    'Randy Stauner <rwstauner@cpan.org>'
  ],
  'dist_name' => 'Dist-Metadata',
  'dist_version' => '0.901',
  'license' => 'perl',
  'module_name' => 'Dist::Metadata',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Archive::Tar' => '0',
    'CPAN::Meta' => '2.1',
    'Carp' => '0',
    'File::Basename' => '0',
    'File::Find' => '0',
    'File::Path' => '0',
    'File::Spec' => '0',
    'File::Spec::Unix' => '0',
    'File::Temp' => '0.19',
    'List::Util' => '0',
    'Module::Metadata' => '0',
    'Try::Tiny' => '0.09',
    'constant' => '0',
    'parent' => '0',
    'perl' => '5.006'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
