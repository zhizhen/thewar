#!/bin/bash
ROOTDIR=`cd $(dirname $0); pwd`
cd $ROOTDIR
sh ../../config/build_server.sh
