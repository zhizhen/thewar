
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"
require "app.GameManager"

local function main()
	GameManager:getInstance():enterGame()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end
