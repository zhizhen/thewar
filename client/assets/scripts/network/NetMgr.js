var boot = require('boot')
var NetMgr = cc.Class({
    ctor: function () {
        cc.log("netmgr constructor!");    // true
        this.connect();
    },
    
    connect: function() {
        alert("on start");
        var host = '127.0.0.1';
        var port = '3010';
        pomelo.init({
            host: host,
            port: port,
            user: {},
            log: true,
            handshakeCallback : function(){}
        }, function() {
            console.log('success');
            // pomelo.request("connector.entryHandler.entry", "hello pomelo", function(data) {
                // alert(data.msg);
                // cc.director.loadScene('main');
            // });
           // cc.director.loadScene('main');
        });
    },
    
    send: function(Msg) {
        pomelo.notify("connector.entryHandler.entry", Msg);
    }
});

module.exports = new NetMgr();
