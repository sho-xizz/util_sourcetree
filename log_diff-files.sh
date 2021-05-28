#!/bin/sh
# ########
# CustomAction for Sourcetree to export the diff-files.
# ########
# 
SHA1="${1:0:7}"
SHA2="${2:0:7}"
LOG_DIR='./__diff_archive/__log/'
if [ "$2" = "" ]; then
    echo 'Select any two commit to generate diff.'
else
    git diff -M100% --name-only --diff-filter=AMCRD $2..$1 >> "${LOG_DIR}diff-list__${SHA1}-${SHA2}.txt"
    open $LOG_DIR
fi
