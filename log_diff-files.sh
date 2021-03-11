#!/bin/sh
today=`date +"%y%m%d_%H%M%S"`
log_dir='./__diff_archive/__log/'
if [ "$2" = "" ]; then
    echo 'Select any two commit to generate diff.'
else
    git diff -M100% --name-only --diff-filter=AMCRD $2..$1 >> ${log_dir}list_tag.txt
    open $log_dir
fi