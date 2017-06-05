#!/usr/bin/env bash

ROOTDIR=`cd $(dirname $0); pwd`
cd $ROOTDIR

rm -rf $ROOTDIR/erlang/*
rm -rf $ROOTDIR/../server/src/cfg/*
$ROOTDIR/script/build_erlang.py $ROOTDIR/excel $ROOTDIR/erlang
mv $ROOTDIR/erlang/*.erl $ROOTDIR/../server/src/cfg/
mv $ROOTDIR/erlang/errcode.hrl $ROOTDIR/../server/include/