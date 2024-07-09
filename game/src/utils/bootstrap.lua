love.graphics.setDefaultFilter("nearest", "nearest")

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

	World:addSystems(
		Systems.shadowRendering,
		Systems.spriteRendering
	)

	Concord.entity(World):assemble(Assemblages.player, {
		x = 100,
		y = 100,
	})
end

function love.update(dt)
	World:emit("update", dt)
end

function love.draw()
	GameWindow:draw(function()
		love.graphics.clear(love.math.colorFromBytes(13/2, 32/2, 48/2))
		World:emit("draw")
	end)
end
