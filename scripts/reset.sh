#!/usr/bin/env bash
set -e
while read f ; do
    cd modules/$f
    git reset --hard HEAD~1
    cd ../..

    # passing it on to next stage
    echo $f
done
