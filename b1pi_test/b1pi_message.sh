#!/bin/sh
simple_dir=/home/gluex/simple_email_list/lists/b1pi
cd $simple_dir
rm -f message.txt
touch message.txt
date_token=`cat /volatile/halld/$USER/b1pi_date.txt`
echo https://halldweb.jlab.org/b1pi/$date_token/ >> message.txt
ls /group/halld/www/halldweb/html/b1pi/$date_token/b1pi_*.log | awk ' split($0, t, "b1pi_|.log") { system("echo " $0 ";" "grep \"#count\" " $0)} ' >> message.txt
../../scripts/simple_email_list.pl
