#!/bin/sh
# ########
# CustomAction for Sourcetree to export the diff-files.
# ########
# 
TODAY=`date +"%y%m%d_%H%M%S"`
SHA1="${1:0:7}"
SHA2="${2:0:7}"
DIFF_DIR='./__diff_archive/'

if [ "$2" = "" ]; then
    echo 'Select any two commit to generate diff.'
else
    git checkout-index -f --prefix="${DIFF_DIR}${TODAY}__${SHA1}-${SHA2}/" $1 `git diff -M100% --name-only $2..$1`
    open $DIFF_DIR
fi
