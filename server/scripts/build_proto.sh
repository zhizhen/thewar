#!/bin/bash
ROOTDIR=`cd $(dirname $0); pwd`
cd $ROOTDIR
sh ../../proto/build_server.sh
