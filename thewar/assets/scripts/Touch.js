cc.Class({
    extends: cc.Component,

    properties: {
        // foo: {
        //    default: null,
        //    url: cc.Texture2D,  // optional, default is typeof default
        //    serializable: true, // optional, default is true
        //    visible: true,      // optional, default is true
        //    displayName: 'Foo', // optional
        //    readonly: false,    // optional, default is false
        // },
        // ...
        refToTank: require('Tank')
    },

    // use this for initialization
    onLoad: function () {
        var begin = function (event){
            console.log("touchend begin:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
        }
        var move = function (event){
            console.log("touchend move:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
        }
        var end = function (event){
            console.log("touchend end:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
            var tank = require("Tank");
            this.refToTank.move(event.touch.getLocation().x, event.touch.getLocation().y);
        }
        this.node.on(cc.Node.EventType.TOUCH_START, begin, this);
        this.node.on(cc.Node.EventType.TOUCH_MOVE, move, this);
        this.node.on(cc.Node.EventType.TOUCH_END, end, this);
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
