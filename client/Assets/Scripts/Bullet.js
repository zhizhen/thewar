cc.Class({
    extends: cc.Component,

    properties: {
        bullet: cc.Prefab,
        speed: 5
    },

    // use this for initialization
    init (waveMgr, angle) {
        cc.log("bullet init!" + angle);
        this.waveMgr = waveMgr;
        this.angle = angle;
        this.node.rotation = angle * 180 / Math.PI ;
    },

    // called every frame, uncomment this function to activate update callback
    update: function (dt) {
        var dx = Math.sin(this.angle) * this.speed;
        var dy = Math.cos(this.angle) * this.speed;
        this.node.x += dx;
        this.node.y += dy;
    },
});
