cc.Class({
    extends: cc.Component,

    properties: {
        
    },

    // use this for initialization
    onLoad: function () {
        this.playGame();
    },
    
    playGame: function() {
        cc.director.loadScene("TestScene");
    }

    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
