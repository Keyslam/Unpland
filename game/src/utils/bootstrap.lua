love.graphics.setDefaultFilter("nearest", "nearest")

_G.import = require("lib.import").import
import("./globals")

local GameWindow = import("src/utils/gameWindow")

local Systems = {}

Concord.utils.loadNamespace("src/components")
Concord.utils.loadNamespace("src/systems", Systems)
Concord.utils.loadNamespace("src/assemblages", Assemblages)

local World = Concord.world()

local FrameProvider = import("./frameProvider")
local Input = import("../inputs/input")

local ResourceRegistry = import("/src/resources/resourceRegistry")
local ResourceImporter = import("/src/resources/resourceImporter")

local frameProvider = FrameProvider()
local input = Input(frameProvider)

function love.load()
	GameWindow:setup()

	ResourceImporter:importSpritesheet("tiles")
	ResourceImporter:importSpritesheet("dungeon_tilesheet")
	ResourceImporter:importAnimation("player")

	-- World:addResource("input", input)

	World:addSystems(
		Systems.controlling,
		Systems.moving,
		Systems.animationGraphResolving,

		Systems.shadowRendering,
		Systems.spriteRendering
	)

	Concord.entity(World):assemble(Assemblages.player, {
		x = 0,
		y = 0,
	})

	for i = 0, 10 do
		Concord.entity(World):assemble(Assemblages.brazier, {
			x = 10,
			y = i * 3,
		})

		Concord.entity(World):assemble(Assemblages.brazier, {
			x = 6,
			y = i * 3,
		})
	end
end

function love.update(dt)
	World:emit("frameUpdated", dt)
	World:emit("update", dt)

	frameProvider:step()
end

function love.draw()
	GameWindow:draw(function()
		love.graphics.clear(love.math.colorFromBytes(13 / 2, 32 / 2, 48 / 2))
		World:emit("draw")
		World:emit("frameRendered")
	end)
end

function love.keypressed(key)
	input:keypressed(key)
	World:emit("keypressed", key)
end

function love.keyreleased(key)
	input:keyreleased(key)
	World:emit("keyreleased", key)
end

function love.mousepressed(x, y, button)
	x, y = GameWindow:toGame(x, y)

	World:emit("mousepressed", x, y, button)
end

function love.mousereleased(x, y, button)
	World:emit("mousereleased", x, y, button)
end
