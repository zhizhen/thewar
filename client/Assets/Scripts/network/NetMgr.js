var ProtoBuf = require("protobuf");
var Message = ProtoBuf.loadProtoFile("res/raw-assets/resources/example.proto").build("Message");

var NetMgr = cc.Class({
    ctor: function () {
        cc.log("netmgr constructor!");    // true
    },
    
    connect: function(address
    ) {
        cc.log("on connect");
        // Connect to our server: node server.js
        this.socket = new WebSocket("ws://localhost:8080/ws");
        this.socket.binaryType = "arraybuffer"; // We are talking binary
    },
    
    send: function() {
        cc.log("on sent message");
        if (this.socket.readyState == WebSocket.OPEN) {
            var msg = new Message("hello cocos creator!");
            cc.log("msg:", msg);
            var arrayBuffer = msg.toArrayBuffer();
            this.socket.send(arrayBuffer);
            cc.log("sent:", msg.text);
        } else {
            cc.log("not connected");
        }
    }
});

module.exports = new NetMgr();
