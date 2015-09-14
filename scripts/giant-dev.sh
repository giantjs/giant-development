#!/usr/bin/env bash
set -e

CYAN='\x1b[1;36m'
GREEN='\x1b[32m'
NC='\x1b[0m' # No Color

if [[ $1 == batch ]]; then
    if [ $# -lt 2 ]; then
        echo "Usage:"
        echo "  giant-dev batch <command>"
    else
        echo -e "${CYAN}Running batch command${NC} \"$2\""
        cd modules
        for f in * ; do
            if [[ -d $f ]]; then
                echo -e "${GREEN}>> $f${NC}"
                (cd $f && eval $2)
            fi
        done
        cd ..
    fi
elif [[ $1 == clear ]]; then
    echo -e "${CYAN}Clearing module packages${NC}"
    ./scripts/giant-dev.sh batch "rm -f *.tgz"
elif [[ $1 == build ]]; then
    echo -e "${CYAN}Building modules${NC}"
    (cat ./scripts/modules.dat | xargs -n 1 ./scripts/build-distribute.sh)
elif [[ $1 == run ]]; then
    if [ $# -lt 3 ]; then
        echo "Usage:"
        echo "  giant-dev run <module-name> <command>"
    else
        echo -e "${CYAN}Running command${NC} \"$3\" ${CYAN}for module${NC} \"$2\""
        (cd modules/$2 && eval $3)
    fi
else
    echo "Usage:"
    echo "  giant-dev (run|batch|clear|build) [module-name] [command]"
fi
