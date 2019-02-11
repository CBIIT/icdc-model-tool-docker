use Module::Build;
my $build = Module::Build->new(
  dist_name => "icdc-model-tool-d",
  dist_abstract => "Build data models etc. using model-tool docker container",
  dist_version_from => "bin/model-tool-d",
  dist_author => "Mark A. Jensen",
  perl => "5.018",
  configure_requires => {
    'Module::Build' => 0,
  },
  build_requires => {
    'Module::Build' => 0,
    'Test::More' => 0,
    'Test::Exception' => 0,
    'Try::Tiny' => 0,
    'IPC::Run' => 0,
    'JSON' => 0,
  },
  requires => {
    'IPC::Run' => 0,
    'Scalar::Util' => 0,
    'File::Copy::Recursive' => 0,
  },
  meta_merge => {
    resources => {
      bugtracker => "https://github.com/CBIIT//issues",
      repository => "https://github.com/CBIIT//",
    }
   },
 );

$build->create_build_script;
