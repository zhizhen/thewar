// 场景控制器

function SceneController() {
  this._view = require('SceneView');
}

SceneController.prototype = {
  constructor: SceneController,
  changeScene: function (sceneName) {
      cc.director.loadScene(sceneName);
  }
};

module.exports = SceneController;