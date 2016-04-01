cc.Class({
    extends: cc.Component,

    properties: {
        tankPrefeb: cc.Prefab,
    },

    // use this for initialization
    onLoad: function () {
        console.log("tank view onload!");
        this.create();
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    create: function () {
        var tankNode = cc.instantiate(this.tankPrefeb);
        tankNode.position = cc.p(-150, -400);
        console.log("tank view create!");
        this.node.addChild(tankNode);
        console.log("tank view create!");
    }
});