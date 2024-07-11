love.graphics.setDefaultFilter("nearest", "nearest")

_G.import = require("lib.import").import
import("./globals")

local GameWindow = import("src/utils/gameWindow")

local Systems = {}

Concord.utils.loadNamespace("src/components")
Concord.utils.loadNamespace("src/systems", Systems)
Concord.utils.loadNamespace("src/assemblages", Assemblages)

local World = Concord.world()


local ResourceRegistry = import("/src/resources/resourceRegistry")
local ResourceImporter = import("/src/resources/resourceImporter")

function love.load()
	GameWindow:setup()

	ResourceImporter:importSpritesheet("assets/tiles")
	ResourceImporter:importSpritesheet("assets/dungeon_tilesheet")
	ResourceImporter:importAnimation("assets/player")

	World:addSystems(
		Systems.controlling,
		Systems.moving,
		Systems.animationGraphResolving,

		Systems.shadowRendering,
		Systems.spriteRendering
	)

	Concord.entity(World):assemble(Assemblages.player, {
		x = 128,
		y = 16,
	})

	for i = 0, 10 do
		Concord.entity(World):assemble(Assemblages.brazier, {
			x = 128 + 32,
			y = 16 + (i * 48),
		})

		Concord.entity(World):assemble(Assemblages.brazier, {
			x = 128 - 32,
			y = 16 + (i * 48),
		})
	end
end

function love.update(dt)
	World:emit("update", dt)
end

function love.draw()
	GameWindow:draw(function()
		love.graphics.clear(love.math.colorFromBytes(13 / 2, 32 / 2, 48 / 2))
		World:emit("draw")
	end)
end

function love.keypressed(key)
	World:emit("keypressed", key)
end
