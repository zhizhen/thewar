cc.Class({
    extends: cc.Component,

    properties: {
        refToTank: require('Tank')
    },

    // use this for initialization
    onLoad: function () {
        // this.streak = cc.MotionStreak.create(0.3, 3, 30, cc.c3b(50, 220, 255), "blade.png");
        // this.node.addChild(this.streak);
        var begin = function (event){
            console.log("touchend begin:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y);
            var location = event.touch.getLocation();
            this.refToTank.faceAndfire(location.x, location.y);
        }
        var move = function (event){
            console.log("touchend move:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y);
            var location = event.touch.getLocation();
            // this.streak.setPosition(event.touch.getLocation().x, event.touch.getLocation().y)
            this.refToTank.faceAndfire(location.x, location.y);
        }
        var end = function (event){
            var location = event.touch.getLocation();
            console.log("touchend end:"+event.touch.getLocation().x +"|"+event.touch.getLocation().y)
            var tank = require("Tank");
            this.refToTank.faceAndfire(location.x, location.y);
            // this.refToTank.move(event.touch.getLocation().x, event.touch.getLocation().y);
        }
        this.node.on(cc.Node.EventType.TOUCH_START, begin, this);
        this.node.on(cc.Node.EventType.TOUCH_MOVE, move, this);
        this.node.on(cc.Node.EventType.TOUCH_END, end, this);
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
