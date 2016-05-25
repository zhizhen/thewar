// var boot = require('boot')
var NetMgr = cc.Class({
    ctor: function () {
        cc.log("netmgr constructor!");    // true
        // Connect to our server: node server.js
        this.socket = new WebSocket("ws://localhost:8080/ws");
        this.socket.binaryType = "arraybuffer"; // We are talking binary
        this.connect();
    },
    
    connect: function(address
    ) {
        cc.log("on start");
       
    },
    
    send: function(Msg) {
        pomelo.notify("connector.entryHandler.entry", Msg);
    }
});

module.exports = new NetMgr();
