#!/usr/bin/env bash
set -e
while read f ; do
    cd modules/$f
    npm prune
    cd ../..

    # passing it on to next stage
    echo $f
done
