
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
    self.armor_face = 200 -- 正脸装甲厚度
    self.armor_side = 100 -- 侧面装甲厚度
    self.armor_back = 50 -- 背后装甲厚度
    self.hit_face_angle = self:calc_face_angle()
    self.hit_back_angle = self:calc_back_angle()
end

function TankController:calc_face_angle( ... )
    local size = self.tankview:getContentSize()
    local inner_angle = math.atan2(size.width, size.height)
    return cc.p(self.tankview.vehicle_angle - inner_angle, self.tankview.vehicle_angle + inner_angle)

end

function TankController:calc_back_angle( ... )

    return cc.p(math.fmod(self.hit_face_angle.x + math.pi, math.pi * 2), 
        math.fmod(self.hit_face_angle.y + math.pi, math.pi * 2))
end

function TankController:faceAndfire(x, y)
	-- body
	self.tankview:faceAndfire(x, y)
end

function TankController:calc_damage(deep, angle, hit_pos)
    local hit_angle = math.atan2(hit_pos.x - self.x, hit_pos.y - self.y)
    print("bullet angle:", math.fmod(angle, 360))
    angle = math.rad(math.fmod(angle, 360))
    local ishit
    local isturn = false
    if hit_angle >= self.hit_face_angle.x and hit_angle <= self.hit_face_angle.y then
        print("Hit face !!!!!!!!!")
        local angle_damage = math.fmod(math.deg(angle + self.tankview.vehicle_angle), 90)
        local deepen_final = math.abs(deep * math.cos(angle_damage))
        if deepen_final >= self.armor_face then
            print("击穿装甲!", angle_damage, deepen_final, self.armor_face)
            ishit = true
            isturn = false
        else
            print("没击穿!", angle_damage, deepen_final, self.armor_face)
            ishit = true
            isturn = math.deg(self.tankview.vehicle_angle) - 180
        end
    elseif hit_angle >= self.hit_back_angle.x and hit_angle <= self.hit_back_angle.y then
        print("Hit back!!!!!!!!!!")
        ishit = true
        isturn = math.deg(self.tankview.vehicle_angle) - 180
    else
        print("Hit side!!!!!!!!!!", 
            math.deg(hit_angle), 
            math.deg(self.hit_face_angle.x), 
            math.deg(self.hit_face_angle.y), 
            math.deg(self.hit_back_angle.x), 
            math.deg(self.hit_back_angle.y))

        ishit = true
        isturn = math.deg(self.tankview.vehicle_angle) - 180
    end
    return ishit, isturn
end

-- function TankController:move(x, y)
-- 	-- body
-- end

return TankController
