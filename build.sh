#!/bin/sh

##############################################################################
#
# This file can only be used to run Asset Build Environment.
#
##############################################################################

BUILD_HOME_DIR=/opt/api102/common/AssetBuildEnvironment

. $BUILD_HOME_DIR/../../install/bin/./setenv.sh
BASEDIR=$PWD
ANT_HOME=$BUILD_HOME_DIR/../lib/ant

if [ "x$ANT_HOME" = "x" ]; then
    echo ANT_HOME is not defined.
    exit 1
fi

export JAVA_HOME
export BUILD_HOME_DIR
export ANT_HOME

if [ ! -f "$BASEDIR/build.properties" ]; then
    $ANT_HOME/bin/ant -f $BUILD_HOME_DIR/is_build/build.xml $*
else
     $ANT_HOME/bin/ant -f $BUILD_HOME_DIR/is_build/build.xml -DpathCWD=$BASEDIR
fi
