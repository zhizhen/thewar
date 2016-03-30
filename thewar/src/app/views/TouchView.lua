
local TouchView = class("TouchView", function() return display.newLayer() end)

function TouchView:ctor()
    printf("create touch view!")
    self.streak = cc.MotionStreak:create(0.3, 3, 30, cc.c3b(50, 220, 255), "blade.png")
    self.streak:addTo(self)
    -- self:setTouchEnabled(true)
    -- self:setSwallowsTouches(false)

    local listenner = cc.EventListenerTouchOneByOne:create()

    -- ture 吞并触摸事件,不向下级传递事件;  
    -- fasle 不会吞并触摸事件,会向下级传递事件;  
    -- 设置是否吞没事件，在 onTouchBegan 方法返回 true 时吞没  
    listenner:setSwallowTouches(true)
    -- 实现 onTouchBegan 事件回调函数  
    listenner:registerScriptHandler(function(touch, event)  
        local location = touch:getLocation()  
  
        print("EVENT_TOUCH_BEGAN")  
        self.m_down = true
        self.tempx, self.tempy = location.x, location.y
        return true  
    end, cc.Handler.EVENT_TOUCH_BEGAN )

    -- 实现 onTouchMoved 事件回调函数  
    listenner:registerScriptHandler(function(touch, event) 
        local location = touch:getLocation()
        local locationInNodeX = self:convertToNodeSpace(touch:getLocation()).x       
  
        print("EVENT_TOUCH_MOVED:")  
        if(self.m_down == true) then
            print("set position:", location.x, location.y, self.streak:getPositionX(), self.streak:getPositionY())
            self.streak:setPosition(location.x, location.y)
            -- local line = SLine.new(self.tempx, self.tempy, event.x, event.y)

        end
    end, cc.Handler.EVENT_TOUCH_MOVED )  
      
    -- 实现 onTouchEnded 事件回调函数  
    listenner:registerScriptHandler(function(touch, event)  
        local locationInNodeX = self:convertToNodeSpace(touch:getLocation()).x  
  
        print("EVENT_TOUCH_ENDED")
        self.m_down = false
    end, cc.Handler.EVENT_TOUCH_ENDED )

    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listenner, self)
    -- self:setTouchMode(cc.TOUCH_MODE_ONE_BY_ONE)
    -- self:addNodeEventListener(cc.NODE_TOUCH_EVENT, handler(self, self._onTouchFunc))
end

function TouchView:_onTouchFunc(event)
    -- body
    if(event.name == "begin") then
        print("touch begin:", event.x, event.y)
        self.m_down = true
        self.tempx, self.tempy = event.x, event.y
        return true
    elseif(event.name == "ended") then
        self.m_down = false
    elseif(event.name == "moved") then
        if(self.m_down == true) then
            self.streak:setPosition(event.x, event.y)
            local line = SLine.new(self.tempx, self.tempy, event.x, event.y)

        end
    end
end

return TouchView
