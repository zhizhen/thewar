
local TankView = class("TankView", function() return display.newSprite("vehicle.png") end)

function TankView:ctor(x, y, face)
    printf("create tank view!", x, y, face)
    -- 车身角度
    self.vehicle_angle = 0
    -- 炮管相对车身朝向角度
    self.gun_angle = 0

    self.gun = display.newSprite("gun.png")
    self.gun:addTo(self)
    self.gun:setAnchorPoint(cc.p(0.5, 0.18))
    self.gun:setPosition(self:getContentSize().width/2, self:getContentSize().height/2 - 17)

    self:setRotation(face)
    self:setPosition(x, y)
    self.x = x
    self.y = y

end


function TankView:fire()
    local now_angle = (self.vehicle_angle + self.gun_angle) % 360
    local delx = math.sin(now_angle * math.pi / 180) * self.gun:getContentSize().height * 0.82
    local dely = math.cos(now_angle * math.pi / 180) * self.gun:getContentSize().height * 0.82

    local s_pos_x = self.x + delx
    local s_pos_y = self.y - 17 + dely



    GameManager:getInstance().mainView:CreateBullet(s_pos_x, s_pos_y, now_angle)

    local gun_x, gun_y = self.gun:getPosition()
    local gun_bx = gun_x - delx / 40
    local gun_by = gun_y - dely / 40

    -- print("gun backward param:", gun_x, gun_y, gun_bx, gun_by)

    -- 炮塔后座力
    local backward = cc.MoveTo:create(0.05, cc.p(gun_bx, gun_by))
    local recover = cc.MoveTo:create(0.5, cc.p(gun_x, gun_y))
    local sequence = cc.Sequence:create(backward, recover)
    self.gun:runAction(sequence)
end


function TankView:faceAndfire(x, y)
    local this = self
    local now_angle = (self.vehicle_angle + self.gun_angle) % 360
    local degree = math.deg(math.atan2(x - self.x, y - self.y))

    print("face and fire !")
    if tonumber(degree - now_angle) ~= 0 then
        print("change gun face:", now_angle, degree, tonumber(degree - now_angle))
        local rotate = cc.RotateBy:create(1, tonumber(degree - now_angle))
        local sequence = cc.Sequence:create(
            rotate, 
            cc.CallFunc:create(function()
                self:fire()
            end))
        self.gun_angle = degree
        self.gun:runAction(sequence)
    else
        self:fire()
    end
end


return TankView
