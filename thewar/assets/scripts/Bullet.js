cc.Class({
    extends: cc.Component,

    properties: {
        // foo: {
        //    default: null,
        //    url: cc.Texture2D,  // optional, default is typeof default
        //    serializable: true, // optional, default is true
        //    visible: true,      // optional, default is true
        //    displayName: 'Foo', // optional
        //    readonly: false,    // optional, default is false
        // },
        // ...
        bullet: cc.Prefab,
    },

    // use this for initialization
    onLoad: function () {
        console.log("on create bullet!");
        var bullet = cc.instantiate(this.bullet);
        bullet.position = cc.p(-150, -400);
        this.node.addChild(bullet);
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
