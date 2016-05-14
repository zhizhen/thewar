cc.Class({
    extends: cc.Component,

    properties: {
        bullet: cc.Prefab,
    },

    // use this for initialization
    init (waveMgr, angle) {
        cc.log("bullet init!" + angle);
        this.waveMgr = waveMgr;
        this.angle = angle;
        this.node.rotation = angle * 180 / Math.PI ;
    }

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
