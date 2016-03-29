
cc.exports.GameManager = class("GameManager")

local instance = nil
function GameManager:getInstance()
    if instance == nil then
        instance = GameManager.new()
    end
    return instance
end

local SceneController = require("app.controllers.SceneController")
local TouchController = require("app.controllers.TouchController")


function GameManager:ctor( ... )
	if CC_SHOW_FPS then
        cc.Director:getInstance():setDisplayStats(true)
    end
    math.randomseed(os.time())
    self.scene = SceneController:create()
end

function GameManager:enterGame()
	-- body
	print("app run:")
	self.mainView = self.scene.sceneview:showWithScene()
    self.touch = TouchController:create()
    -- 
    self.scene:createTank()
    self.scene:createEnermy()

    -- -- enermy
    -- for i = 1, 1 do
    --     local enermy = TankController:create(i * 400, 600, 180)
    -- end
end

return GameManager
