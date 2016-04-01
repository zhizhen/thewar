
var Scene = require('SceneController');
var Tank = require('TankController');

var Game = cc.Class({
    extends: cc.Component,
    
    properties: {
        mainUI: cc.Node,
    },
    
    // 单例
    statics: {
        instance: null
    },

    // use this for initialization
    onLoad: function () {
        Game.instance = this;
        console.log("游戏启动！");
        
        this.scene = new Scene();
        this.scene.changeScene('TestScene');
        this.tank = new Tank();
        this.tank.createTank();
        this.tank.createEnemy();
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
