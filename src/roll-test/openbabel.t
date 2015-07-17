#!/usr/bin/perl -w
# openbabel roll installation test.  Usage:
# openbabel.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/openbabel';
my $output;

my $TESTFILE = 'tmpopenbabel';

if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'openbabel installed');
} else {
  ok(! $isInstalled, 'openbabel not installed');
}
SKIP: {

  `mkdir $TESTFILE.dir`;
  skip 'openbabel not installed', 4 if ! $isInstalled;
  $output = `module load openbabel;cd $TESTFILE.dir; babel -igamout \$OPENBABELHOME//test/exam01.out -ogau test.out 2>&1 ;cat test.out`;
  like($output, qr/H           0.85694         0.00000         0.56957/, 'openbabel runs');
  `/bin/ls /opt/modulefiles/applications/openbabel/[0-9]* 2>&1`;
  ok($? == 0, 'openbabel module installed');
  `/bin/ls /opt/modulefiles/applications/openbabel/.version.[0-9]* 2>&1`;
  ok($? == 0, 'openbabel version module installed');
  ok(-l '/opt/modulefiles/applications/openbabel/.version',
     'openbabel version module link created');

}

`rm -fr $TESTFILE*`;
