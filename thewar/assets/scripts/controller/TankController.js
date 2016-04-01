cc.Class({
    
    view: require('TankView'),
    
    createTank: function() {
        console.log("tank view create!");
        this.view.create();
    },
    
    createEnemy: function() {
        this.view.create();
    }
});
