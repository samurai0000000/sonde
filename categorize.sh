#!/usr/bin/env bash

cd "$(dirname "$0")"

for f in data/*.csv; do
    EPOCH=`head -n 1 $f | awk -F ',' '{ print $13;}'`
    DATE=`date -d @$EPOCH +%Y%m%d`
    FILE=`basename $f`
    mkdir -p data/$DATE
    if [ ! -f data/$DATE/$FILE ]; then
	echo $DATE/$FILE
	ln -s ../$FILE data/$DATE/$FILE
    fi
done
