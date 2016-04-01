
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
        var scene = require('SceneController');
        var tank = require('TankController');
        console.log("游戏启动！");
        scene.changeScene('TestScene');
        console.log("tank view create!");
        tank.createTank();
        tank.createEnemy();
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
