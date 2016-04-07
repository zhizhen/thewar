cc.Class({
    extends: cc.Component,

    properties: {
        tankLayer: cc.Node,
        tanks: {
            default: [],
            type: require("Tank")
        }
    },

    // use this for initialization
    onLoad: function () {
        console.log("scene view onload!")
    },

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
