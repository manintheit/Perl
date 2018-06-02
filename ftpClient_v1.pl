#!/usr/bin/env perl
use strict;
use warnings;	
use Net::FTP;
############################Variables#####################################
my @dirs=();
my @args=();
my %dmargs;
my $files="";
my $fileFlag=0;
my $filename="";
my $dirname="";
my $ftpuser="";
my $ftppass="";
my $hostname="";
my $ftpact="";
##########################################################################
#ftp.pl hostname=<hostname> [port=<port>] username=<username> [password=<password>] cmd={get,put,mput,mget} file=dir/filename 
sub usage(){
	print "ftp.pl -usage\n";
	print "ftp.pl -help\n";
	print "ftp.pl hostname ftpuser ftppassword action file\n";
	#print "ftp.pl hostname=<hostname> [port=<port>] username=<username> [password=<password>] cmd={get,put,mput,mget} file=dir/filename \n";
#ftp.pl
}


if ($ARGV[0] eq "-usage" || $ARGV[0] eq "-help" || $#ARGV == -1 ){
	usage();
	exit;
}

$hostname=$ARGV[0];
$ftpuser=$ARGV[1];
$ftppass=$ARGV[2];
$ftpact=$ARGV[3];
$dirname=$ARGV[4];
$filename=$ARGV[5];

my $ftp = Net::FTP->new ("$hostname",Debug=>0);

$ftp->login("$ftpuser","$ftppass") or die "Login Failed: $@", $ftp->message;
#$ftp->cwd('48_hour');
print "Login Successfull\n";
#my @file=();
#$ftp->cwd("/48_hour") or die "Error", $ftp->message;
if ($ftpact eq "get"){
	  $ftp->cwd("$dirname") or die "Error", $ftp->message;
	  $ftp->get("$filename") or die "Error while getting the file", $ftp->message;
	  my $msg=$ftp->message;
	  print "$msg";
	  $ftp->quit;
	}else{
	  $ftp->cwd("$dirname") or die "Error", $ftp->message;
	  $ftp->put("$filename") or die "Error while getting the file", $ftp->message;
	  my $msg=$ftp->message;
	  print "$msg";
	  $ftp->quit;


}
