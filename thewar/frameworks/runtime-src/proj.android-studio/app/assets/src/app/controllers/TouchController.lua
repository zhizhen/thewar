
local TouchController = class("TouchController")
local TouchView = require("app.views.TouchView")

function TouchController:ctor()
    -- body
    print("TouchController create !")
    self.touchview = TouchView:create()
    self.touchview:addTo(GameManager:getInstance().mainView)
end

return TouchController
