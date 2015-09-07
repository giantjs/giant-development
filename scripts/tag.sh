#!/usr/bin/env bash
set -e
while read f ; do
    cd modules/$f
    git checkout master
    git tag $1
    cd ../..

    # passing it on to next stage
    echo $f
done
