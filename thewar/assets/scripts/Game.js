var players = require('PlayerData').players;

var Game = cc.Class({
    extends: cc.Component,

    properties: {
        tankPrefeb: cc.Prefab,
        inGameUI: cc.Node,
        tankLayer: cc.Node,
        tankLayer1: cc.Node
    },
    
    statics: {
        instance: null
    },

    // use this for initialization
    onLoad: function () {
        Game.instance = this;
        this.createPlayers();
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    createPlayers: function () {
        var tankNode = cc.instantiate(this.tankPrefeb);
        tankNode.position = cc.p(0, 0);
        this.tankLayer.addChild(tankNode);
    }
});
