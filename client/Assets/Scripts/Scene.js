var NetMgr = require("NetMgr");

cc.Class({
    extends: cc.Component,

    properties: {
        tankLayer: cc.Node,
        tanks: {
            default: [],
            type: require("Tank")
        }
    },

    // use this for initialization
    onLoad: function () {
        console.log("scene view onload!")
        
        // this.scheduleOnce(function () {
        //         console.log("test scheduleonce!");
        //         NetMgr.sendWebSocketBinary();
        //     }, 1);
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
