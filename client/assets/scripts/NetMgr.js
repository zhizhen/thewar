var NetMgr = cc.Class({
    ctor: function () {
        cc.log("netmgr constructor!");    // true
        this.prepareWebSocket();
    },
    
    prepareWebSocket: function() {
        this._ws = new WebSocket("ws://echo.websocket.org");
        this._ws.binaryType = "arraybuffer";
        this._ws.onopen = function(evt) {
            console.log("Websocket Send Binary WS was opened.");
        };
        this._ws.onmessage = function(evt) {
            var binary = new Uint16Array(evt.data);
            var binaryStr = 'response bin msg: ';
            
            var str = '';
            for (var i = 0; i < binary.length; i ++) {
                if (binary[i] === 0){
                    str += "\'\\0\'";
                }
                else{
                    var hexChar = '0x' + binary[i].toString('16').toUpperCase();
                    str += String.fromCharCode(hexChar);
                }
            }
            
            binaryStr += str;
            console.log("WebSocket Response get:" + binaryStr);
        };
        this._ws.onerror = function(evt) {
            console.log("WebSocket sendBinary Error was fired. ");
        };
        this._ws.onclose = function(evt) {
            console.log("WebSocket websocket instance closed. ");
            self._ws = null;
        };
        
        // this.sendWebSocketBinary();
    },
    
    sendWebSocketBinary: function(sender) {
        if (this._ws.readyState === WebSocket.OPEN){
            console.log('WebSocket\nSend Binary WS is waiting...');
            var buf = "Hello WebSocket中文,\0 I'm\0 a\0 binary\0 message\0.";
            
            var arrData = new Uint16Array(buf.length);
            for (var i = 0; i < buf.length; i++) {
                arrData[i] = buf.charCodeAt(i);
            }
            
            this._ws.send(arrData.buffer);
        }
        else {
            console.log("send binary websocket instance wasn't ready...");
            // this.scheduleOnce(function () {
            //     this.sendWebSocketBinary();
            // }, 1);
        }
    }
});

module.exports = new NetMgr();
