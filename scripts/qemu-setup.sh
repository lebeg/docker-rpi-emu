#!/bin/bash
#
# Bootsrap qemu into the provided directory

# Check inputs
if [ "$#" -ne 1 ]; then 
    echo "Usage: $0 MOUNT"
    echo "MOUNT - mount location in the file system"
    exit
fi

echo "Bootstrapping Qemu"

set -ex

# Remove original preload file
mv $1/etc/ld.so.preload $1/etc/ld.so.preload.old
touch $1/etc/ld.so.preload

# Copy binary interpreter
cp /usr/bin/qemu-arm-static $1/usr/bin

# Copy MxNet wheel
cp /usr/rpi/mxnet-1.0.0-py2.py3-none-any.whl $1/