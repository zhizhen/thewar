
local TankView = class("TankView", function() return display.newSprite("vehicle.png") end)
local Utils = require "app.utils.Utils"

function TankView:ctor(x, y, face)
    printf("create tank view!", x, y, face)
    -- 车身角度
    self.vehicle_angle = math.rad(face)
    -- 炮管相对车身朝向角度
    self.gun_angle = 0

    self.gun = display.newSprite("gun.png")
    self.gun:addTo(self)
    self.gun:setAnchorPoint(cc.p(0.5, 0.18))
    self.gun:setPosition(self:getContentSize().width/2, self:getContentSize().height/2)

    self:setRotation(face)
    self:setPosition(x, y)
    self.x = x
    self.y = y

end


function TankView:fire()
    local now_angle = math.deg(self.vehicle_angle + self.gun_angle)
    local delx = math.sin(now_angle * math.pi / 180) * self.gun:getContentSize().height * 0.82
    local dely = math.cos(now_angle * math.pi / 180) * self.gun:getContentSize().height * 0.82

    local s_pos_x = self.x + delx
    local s_pos_y = self.y + dely



    GameManager:getInstance().mainView:CreateBullet(s_pos_x, s_pos_y, now_angle)

    local gun_x, gun_y = self.gun:getPosition()
    local gun_bx = gun_x - delx / 40
    local gun_by = gun_y - dely / 40

    -- 炮塔后座力
    local backward = cc.MoveTo:create(0.05, cc.p(gun_bx, gun_by))
    local recover = cc.MoveTo:create(0.5, cc.p(gun_x, gun_y))
    local sequence = cc.Sequence:create(backward, recover)
    self.gun:runAction(sequence)
end


function TankView:faceAndfire(x, y)
    local this = self
    local now_angle = self.vehicle_angle + self.gun_angle
    local degree = math.atan2(x - self.x, y - self.y)
    local turn_angle = math.fmod(math.deg(degree - now_angle), 360)

    if math.abs(turn_angle) <= 180 then
        turn_angle = turn_angle
    else
        turn_angle = 360 - math.abs(turn_angle)
    end

    if tonumber(degree - now_angle) ~= 0 then

        print("change gun face:", now_angle, math.deg(now_angle), 
            degree, math.deg(degree), turn_angle)

        local rotate = cc.RotateBy:create(1, turn_angle)
        local sequence = cc.Sequence:create(
            rotate, 
            cc.CallFunc:create(function()
                self:fire()
            end))
        self.gun_angle = self.gun_angle + math.rad(turn_angle)
        self.gun:runAction(sequence)
    else
        self:fire()
    end
end


return TankView
