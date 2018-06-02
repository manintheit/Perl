# Perl
Perl FTP Client get and push version 1.0
usage:
./ftp_v1.pl  hostname  username password action  ftpdir  ftpfile

Example:
#Put the file ftp_v1.pl from local disk to 48_hour directory of remote ftpserver ftp.uconn.edu.
./ftp_v1.pl  ftp.uconn.edu  anonymous anonymous put  48_hour  ftp_v1.pl

Get the file ftp_v1.pl from 48_hour directory of the  remote ftpserver ftp.uconn.edu to local disk.
./ftp_v1.pl  ftp.uconn.edu  anonymous anonymous get  48_hour  ftp_v1.pl
