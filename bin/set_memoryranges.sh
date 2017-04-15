#!/bin/bash

read -p "Enter path to core dump file relative to /src : " COREDUMP_NAME

# Only try to generate a memory range file if one hasn't been previously generated

if [ ! -f "/src/${COREDUMP_NAME}.ranges" ] ; then

    echo " ----- Creating Memory ranges file -----"

    /tmp/llnode/scripts/readelf2segments.py $COREDUMP_NAME >  $COREDUMP_NAME.ranges

fi

echo " ----- setting memory range file to LLNODE_RANGESFILE environment variable -----"

# export memory ranges to bashrc so we can update environment variable

echo "export LLNODE_RANGESFILE=\"${COREDUMP_NAME}.ranges\"" >> ~/.bashrc

echo -e " --- run \033[0;31m \"source ~/.bashrc\" \033[0m after this process exits "