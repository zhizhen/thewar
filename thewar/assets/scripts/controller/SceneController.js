// 场景控制器

cc.Class({
    
    view: require('SceneView'),
    
    changeScene: function (sceneName) {
        cc.director.loadScene(sceneName);
    }
    
});
