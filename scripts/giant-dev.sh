#!/usr/bin/env bash
set -e

if [ $# -lt 2 ]; then
    echo "Usage:"
    echo "  giant-dev (<module-name>|all) <command>"
else
    GREEN='\x1b[32m'
    NC='\x1b[0m' # No Color

    if [[ $1 == all ]]; then
        cd modules
        for f in * ; do
            if [[ -d $f ]]; then
                echo -e "${GREEN}>> $f${NC}"
                (cd $f && eval $2)
            fi
        done
        cd ..
    else
        (cd modules/$1 && eval $2)
    fi
fi
