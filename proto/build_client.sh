#!/bin/bash
PYTHONPATH=python
ROOTDIR=`cd $(dirname $0); pwd`

cd $ROOTDIR
$PYTHONPATH ./script/build_csharp.py ./proto/game.proto csharp

mv ./csharp/* ../client/Assets/Scripts/net/proto/
#mv ./outfile/game_pb.hrl ../server/gate/include/
echo "ok"
