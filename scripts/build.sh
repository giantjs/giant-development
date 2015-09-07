#!/usr/bin/env bash
set -e
while read f ; do
    cd modules/$f
    if [[ -n $(find ./src -name jsTestDriver.conf) ]]; then
        java -jar ./node_modules/grunt-jstestdriver/lib/jstestdriver.jar --server http://localhost:9876 --reset
        sleep 2
        grunt build
    fi
    cd ../..

    # passing it on to next stage
    echo $f
done
