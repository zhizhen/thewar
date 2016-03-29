
local TankController = class("TankController")
local TankView = require("app.views.TankView")

function TankController:ctor(x, y, face)
    -- body
    print("TankController create !")
    self.tankview = TankView:create(x, y, face)
    self.tankview:addTo(GameManager:getInstance().mainView)
    self.x = x
    self.y = y
    self.hp = 0 -- 血量
    
	-- self:faceAndfire(400, 600)
 --    local scheduler = cc.Director:getInstance():getScheduler()
 --    self.my_scheduler = scheduler:scheduleScriptFunc(function(dt)
 --        self:update(dt)
 --    end, 120.0 / 60.0, false)
end

-- function TankController:update(dt)
-- 	self:faceAndfire(400, 600)
-- end

function TankController:faceAndfire(x, y)
	-- body
	self.tankview:faceAndfire(x, y)
end

-- function TankController:move(x, y)
-- 	-- body
-- end

return TankController
