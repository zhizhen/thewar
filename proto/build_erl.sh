#!/bin/bash
PYTHONPATH=python
ROOTDIR=`cd $(dirname $0); pwd`

cd $ROOTDIR
$PYTHONPATH ./script/build_erlang.py ./proto/game.proto ./outfile/game_pb.hrl ./outfile/game_pb.erl

mv ./outfile/game_pb.erl ../server/src/
mv ./outfile/game_pb.hrl ../server/include/
#chmod a-w $ROOTDIR/../server/src/game_pb.erl
#chmod a-w $ROOTDIR/../server/include/game_pb.hrl
echo "ok"
