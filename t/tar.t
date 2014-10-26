use strict;
use warnings;
use Test::More 0.96;
use Test::Fatal;

my $mod = 'Dist::Metadata::Tar';
eval "require $mod" or die $@;

# required_attribute
# file doesn't exist
{
  my $att = 'file';
  is( $mod->required_attribute, $att, "'$att' attribute required" );
  my $ex = exception { $mod->new() };
  like($ex, qr/'$att' parameter required/, "new dies without '$att'");

  my $dist = new_ok( $mod, [ file => 'does-not._exist_' ] );
  $ex = exception { $dist->tar };
  like($ex, qr/does not exist/, 'file does not exist');
}

# default_file_spec
  is( $mod->default_file_spec, 'Unix', 'tar files use unix paths' );

my $file = 'corpus/Dist-Metadata-Test-NoMetaFile-0.1.tar.gz';
my $tar = new_ok($mod => [file => $file]);

# file
is($tar->file, $file, 'dumb accessor works');

# determine_name_and_version
$tar->determine_name_and_version();
is($tar->name, 'Dist-Metadata-Test-NoMetaFile', 'name from file');
is($tar->version, '0.1', 'version from file');

# file_content
is(
  $tar->file_content('README'),
  qq[This "dist" is for testing the Tar implementation of Dist::Metadata.\n],
  'got file content without specifying root dir'
);

# perllocale says, "By default Perl ignores the current locale."

# find_files
is_deeply(
  [sort $tar->find_files],
  [qw(
    Dist-Metadata-Test-NoMetaFile-0.1/README
    Dist-Metadata-Test-NoMetaFile-0.1/lib/Dist/Metadata/Test/NoMetaFile.pm
    Dist-Metadata-Test-NoMetaFile-0.1/lib/Dist/Metadata/Test/NoMetaFile/PM.pm
  )],
  'find_files'
);

# list_files (no root)
is_deeply(
  [sort $tar->list_files],
  [qw(
    README
    lib/Dist/Metadata/Test/NoMetaFile.pm
    lib/Dist/Metadata/Test/NoMetaFile/PM.pm
  )],
  'files listed without root directory'
);

# root
is($tar->root, 'Dist-Metadata-Test-NoMetaFile-0.1', 'root dir');

# tar
isa_ok($tar->tar, 'Archive::Tar');

done_testing;
