use Test::More;
use Test::Exception;
use File::Spec;
use Try::Tiny;
use IPC::Run qw/run/;
use JSON;
use lib '../lib';
use strict;
use warnings;

my ($in, $out, $err);
my $dir = (-d 't' ? '.' : '..');
my @testoutf;
my $have_docker;
my $DOCKER = $ENV{DOCKER_CMD} // 'docker';

my $tool = File::Spec->catfile($dir, 'bin', 'model-tool-d');
ok( (-x $tool), "Found model-tool-d");
ok run['perl', '-c', $tool], "script compiles";

try {
  $have_docker = run [$DOCKER,'info'], \$in, \$out, \$err;
} catch {
  $have_docker = 0;
};

SKIP : {
  skip 1, "Docker system not running" unless $have_docker;
  $ENV{MODEL_TOOL_KEEP_CONTAINER} = 0;
  $ENV{MODEL_TOOL_KEEP_TMP} = 0;
  @testoutf = qw/try.svg try.json/;
  my $sampdir = File::Spec->catdir($dir, qw/t samples/);

  my @cmd = ($tool);
  my @descfiles = map { File::Spec->catfile($sampdir,$_) } qw/icdc-model.yml icdc-model-props.yml/;
  my ($in, $out, $err);

  lives_ok { run(\@cmd, \$in, \$out, \$err) } "It runs";
  like ($out, qr/FATAL: Nothing to do!/, "Emit 'Nothing to do'");
  like ($out, qr/Usage:.*model-tool.*--dry-run/s, "Emit usage hints");
#  diag $err;

  try {
    unlink map {File::Spec->catfile($dir, $_)} @testoutf;
  } catch {
    1;
  };

  $in = $out = $err = '';
  lives_ok { run( [$tool, '-g', File::Spec->catfile($dir,'try.svg'), @descfiles],
		  \$in, \$out, \$err ) } "-g";
  diag $err if $err;
  ok(( -e File::Spec->catfile($dir,'try.svg')), "svg created");

  $in = $out = $err = '';
  lives_ok { run( [$tool, '-j', File::Spec->catfile($dir,'try.json'), @descfiles, '-d',
		   File::Spec->catdir($dir,'schema')],
		  \$in, \$out, \$err ) } "-j";
  diag $err if $err;
  ok(( -e File::Spec->catfile($dir,'try.json')), "json created");
  diag $err if $err;
  open my $j, File::Spec->catfile($dir,'try.json') or die "Can't open try.json: $!";
  {
    local $/;
    my $str = <$j>;
    lives_ok { $j = decode_json $str } "smells like json";
    ok grep( /^_definitions.yaml$/, keys %$j), "_definitions.yaml present";
  }
}

done_testing;

END {
  try {
    unlink map {File::Spec->catfile($dir, $_)} @testoutf;
  } catch {
    1;
  };
}
