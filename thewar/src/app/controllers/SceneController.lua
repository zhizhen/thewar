
local SceneController = class("SceneController")

local TankController = require("app.controllers.TankController")

function SceneController:ctor( ... )
    -- body
    print("SceneController create !")
    self.sceneview = require("app.views.MainScene"):create()
    self.time = 0
    self.tanks = {}
    self.enermies = {}

    -- 场景定时器
    -- self:scheduleUpdateWithPriorityLua(function(dt) self:update(dt) end, 0);
    local scheduler = cc.Director:getInstance():getScheduler()
    self.my_scheduler = scheduler:scheduleScriptFunc(function(dt)
        self:update(dt)
    end, 1 / 60.0, false)
end

function SceneController:update(dt)
	self.sceneview:update(dt)
	self.time = self.time + dt
	if self.time >= 2 then
		for k, v in pairs(self.tanks) do
			if #self.enermies ~= 0 then
				local randomx = self.enermies[1].x + math.random(-50, 50)
				local randomy = self.enermies[1].y + math.random(-50, 50)
				print("random position:", randomx, randomy)
				v:faceAndfire(randomx, randomy)
			end
		end

		for k, v in pairs(self.enermies) do
			if #self.tanks ~= 0 then
				local randomx = self.tanks[1].x + math.random(-200, 200)
				local randomy = self.tanks[1].y + math.random(-200, 200)
				print("random position:", randomx, randomy)
				v:faceAndfire(randomx, randomy)
			end
		end
		self.time = 0
	end
end

function SceneController:createTank()
    for i = 1, 1 do
        local tank = TankController:create(i * 300, 200, 0)
        table.insert(self.tanks, tank)
    end
end

function SceneController:createEnermy()
	-- body
	local tank = TankController:create(400, 600, 180)
    table.insert(self.enermies, tank)
end

return SceneController
