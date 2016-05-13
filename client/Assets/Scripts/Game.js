var NetMgr = require("NetMgr");

var Game = cc.Class({
    extends: cc.Component,
    
    properties: {
        tank: cc.Node,
        inGameUI: cc.Node,
        waveMgr: cc.Node,
        poolMgr: cc.Node,
        foeGroup: cc.Node
    },
    
    // 单例
    statics: {
        instance: null
    },

    // use this for initialization
    onLoad: function () {
        Game.instance = this;
        console.log("游戏启动！");
        this.tank = this.tank.getComponent('Tank');
        this.tank.init(this, 200, 300, 0);
        this.tank.node.active = true;
        this.poolMgr = this.poolMgr.getComponent('PoolMgr');
        this.poolMgr.init(this);
        this.waveMgr = this.waveMgr.getComponent('WaveMgr');
        this.waveMgr.init(this);
    },
    
    start: function() {
        this.inGameUI = this.inGameUI.getComponent('InGameUI');
        this.inGameUI.init(this);
        this.waveMgr.startWave();
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    
});
