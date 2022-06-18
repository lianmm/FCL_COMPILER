#!/usr/bin/env bash
# set -uxo pipefail

if [ ! $# -eq 2 ]
then
	echo "usage: ./diff.sh [dir0] [dir1]"
	exit 0
fi

for file in `ls $1`
do
	echo "compare $file"
    if [ -f $1/$file ]
	then
		diff $1/$file $2/$file
	fi
done
