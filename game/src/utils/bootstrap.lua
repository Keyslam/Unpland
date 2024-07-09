_G.import = require("lib.import").import
import("./globals")

local GameWindow = import("src/utils/gameWindow")

local Systems = {}

Concord.utils.loadNamespace("src/components")
Concord.utils.loadNamespace("src/systems", Systems)
Concord.utils.loadNamespace("src/assemblages", Assemblages)

local World = Concord.world()

function love.load()
	GameWindow:setup()
end

function love.update(dt)
	World:emit("update", dt)
end

function love.draw()
	GameWindow:draw(function()
		World:emit("draw")
	end)
end
