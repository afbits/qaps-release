#!/bin/sh

if [ -z "$1" ]; then
    echo "Usage:"
    echo "  qaps <SOURCE_ANDROID_PROJECT_DIRECTORY>"
    exit 1
fi

BIN_DIR=$(dirname "$0")
ROOT_DIR="${BIN_DIR}/.."

# ensure user downloaded the whole project
if [ ! -d "${ROOT_DIR}/data/template" ] ; then
    echo "Error! The directory structure incomplete."
    exit 1
fi

# check Java -- TODO : to improve it by using "type -d" and "JAVA_HOME" to check
which java > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error! Please ensure Java command is configured in PATH."
    exit 2
fi

# run it. And the code in the JAR will figure out the ROOT directory by itself
if [ "$1" == "--gui" ] ; then
    java -jar "${BIN_DIR}/qaps.jar" "$@" &
else
    java -jar "${BIN_DIR}/qaps.jar" "$@"
fi
