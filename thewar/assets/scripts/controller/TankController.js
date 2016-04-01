// 坦克控制器
var TankView = require('TankView');

function TankController() {
  this._view = new TankView();
}

TankController.prototype = {
  constructor: TankController,
  createTank: function() {
        // console.log("tank view create!");
        this.view.create();
    },
    
    createEnemy: function() {
        // this.view.create();
    }
};

module.exports = TankController;