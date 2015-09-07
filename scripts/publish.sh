#!/usr/bin/env bash
set -e
while read f ; do
    cd modules/$f
    npm publish
    cd ../..

    # passing it on to next stage
    echo $f
done
