cc.Class({
    extends: cc.Component,

    properties: {
        speed: 20,
        // position: null,
        tankPrefeb: cc.Prefab,
    },

    // use this for initialization
    onLoad: function () {
        console.log("tank view onload!");
        this.create(200, 300);
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    create: function (x, y) {
        this.tankNode = cc.instantiate(this.tankPrefeb);
        // this.position = cc.p(x, y);
        this.tankNode.position = cc.p(x, y);
        console.log("tank view create!");
        this.node.addChild(this.tankNode);
        console.log("tank view create!");
    },
    
    move: function (x, y) {
        var old_pos = this.tankNode.position;
        var angle = 180 * Math.atan((y - old_pos.y)/(x - old_pos.x)) / Math.PI;
        var turn = cc.rotateBy(0.4, angle);
        var move = cc.moveTo(2, x, y);
        var spawn = cc.spawn(turn, move);
        console.log("move to:" + x + "|" + y + "|" + angle);
        this.tankNode.runAction(move);
    }
});
