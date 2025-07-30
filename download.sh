#!/usr/bin/env bash

cd "$(dirname "$0")"

HOST=rdzsonde.fredatech.com

wget http://$HOST/sd/files.json -O files.json

FILES=`grep name files.json | grep -v mypos | awk '{ print $1;}' | awk -F'"' '{print $4;}'`

mkdir -p data/

for f in $FILES; do
    if [ ! -f data/$f ]; then
	wget http://$HOST/sd/$f -O data/$f
    fi
done
