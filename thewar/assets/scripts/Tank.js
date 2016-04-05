cc.Class({
    extends: cc.Component,

    properties: {
        tankPrefeb: cc.Prefab,
        bullet: cc.Prefab
    },

    // use this for initialization
    onLoad: function () {
        console.log("tank view onload!");
        this.create();
        this.faceAndfire(400, 600)
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
    
    create: function () {
        this.tankNode = cc.instantiate(this.tankPrefeb);
        this.tankNode.position = cc.p(-150, -400);
        console.log("tank view create!");
        this.node.addChild(this.tankNode);
        console.log("tank view create!");
    },
    
    faceAndfire: function(x, y) {
        var gun = cc.find("tankInfo/vehicle/gun", this.tankNode);
        var rotate = cc.rotateBy(1, 90, 0);

        var tmp = this
        gun.runAction(cc.sequence(rotate, cc.callFunc(function() {
            console.log("on create bullet!");
            var bullet = cc.instantiate(tmp.bullet);
            bullet.position = cc.p(-150, -400);
            tmp.node.addChild(bullet);
        })));
        
    }
});
