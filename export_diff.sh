#!/bin/sh
today=`date +"%y%m%d_%H%M%S"`
diff_dir='./__diff_archive/'
if [ "$2" = "" ]; then
    echo 'Select any two commit to generate diff.'
else
    git checkout-index -f --prefix=$diff_dir$today/ $1 `git diff -M100% --name-only $2..$1`
    open $diff_dir
fi