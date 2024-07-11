local Frames = import("./util/animations").frames

local function loadSprite()
	local image = love.graphics.newImage("assets/player.png")
	local quad = love.graphics.newQuad(
		0, 48 * 10,
		48, 48,
		image:getWidth(), image:getHeight()
	)

	return image, quad
end

local graph = {
	{
		condition = "isMoving",
		{
			{
				condition = "facingUp",
				frames = Frames("assets/player/WalkUp", 4)
			},
			{
				condition = "facingDown",
				frames = Frames("assets/player/WalkDown", 4)
			},
			{
				condition = "facingRight",
				frames = Frames("assets/player/WalkRight", 4)
			},
			{
				condition = "facingLeft",
				frames = Frames("assets/player/WalkRight", 4,
					{ flipped = true },
					{ flipped = true },
					{ flipped = true },
					{ flipped = true }
				)
			}
		}
	},
	{
		condition = nil,
		{
			{
				condition = "facingUp",
				frames = Frames("assets/player/IdleUp", 4)
			},
			{
				condition = "facingDown",
				frames = Frames("assets/player/IdleDown", 4),
			},
			{
				condition = "facingRight",
				frames = Frames("assets/player/IdleRight", 4),
			},
			{
				condition = "facingLeft",
				frames = Frames("assets/player/IdleRight", 4,
					{ flipped = true },
					{ flipped = true },
					{ flipped = true },
					{ flipped = true }
				),
			}
		}
	}
}

return function(e, props)
	local image, quad = loadSprite()

	return e
		:ensure("position", {
			x = Default(props.x, 0),
			y = Default(props.y, 0),
		})
		:ensure("sprite", {
			image   = image,
			quad    = quad,
			flipped = false,
		})
		:ensure("controls")
		:ensure("animationGraph", { graph = graph })
		:ensure("facing", { value = "down" })
		:ensure("shadow")
end
