#!/bin/bash

# options:
# --rebuild-apollo - rebuild Apollo before continuing
# <executable name> - the name of the executable to run instead of XSERA_BUILD_DIR

XSERA_BUILD_DIR_DEF="/Users/atg/Desktop/Projects/Xcode Projects/Debug/Xsera.app/Contents/MacOS/Xsera"
REBUILD_FLAG="--rebuild-apollo"

if [ ! -n "$XSERA_BUILD_DIR" ]; then
    XSERA_BUILD_DIR=$XSERA_BUILD_DIR_DEF # set to default
fi

DATETIME_EXT=`date "+%Y-%m-%d-%H%M"`

if [ -n "$1" ]; then
    if [ $1 = $REBUILD_FLAG ]; then
        mkdir -p /tmp/ApolloBuild
        xcodebuild -project ../Xcode/Xsera.xcodeproj/ -configuration Debug > "/tmp/ApolloBuild/Apollo Build $DATETIME_EXT"
        if [ ! -n "$2" ]; then
            XSERA_BUILD_DIR=$2
        fi
    else
        XSERA_BUILD_DIR=$1
    fi
fi

mkdir -p ../output

"$XSERA_BUILD_DIR_DEF" 2>&1 | tee "../output/Xsera Output $DATETIME_EXT"
