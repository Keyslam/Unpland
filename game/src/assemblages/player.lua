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
				frames = {
					{ resource = "assets/player/WalkUp-0", flipped = false },
					{ resource = "assets/player/WalkUp-1", flipped = false },
					{ resource = "assets/player/WalkUp-2", flipped = false },
					{ resource = "assets/player/WalkUp-3", flipped = false },
				}
			},
			{
				condition = "facingDown",
				frames = {
					{ resource = "assets/player/WalkDown-0", flipped = false },
					{ resource = "assets/player/WalkDown-1", flipped = false },
					{ resource = "assets/player/WalkDown-2", flipped = false },
					{ resource = "assets/player/WalkDown-3", flipped = false },
				}
			},
			{
				condition = "facingRight",
				frames = {
					{ resource = "assets/player/WalkRight-0", flipped = false },
					{ resource = "assets/player/WalkRight-1", flipped = false },
					{ resource = "assets/player/WalkRight-2", flipped = false },
					{ resource = "assets/player/WalkRight-3", flipped = false },
				}
			},
			{
				condition = "facingLeft",
				frames = {
					{ resource = "assets/player/WalkRight-0", flipped = true },
					{ resource = "assets/player/WalkRight-1", flipped = true },
					{ resource = "assets/player/WalkRight-2", flipped = true },
					{ resource = "assets/player/WalkRight-3", flipped = true },
				}
			}
		}
	},
	{
		condition = nil,
		{
			{
				condition = "facingUp",
				frames = {
					{ resource = "assets/player/IdleUp-0", flipped = false },
					{ resource = "assets/player/IdleUp-1", flipped = false },
					{ resource = "assets/player/IdleUp-2", flipped = false },
					{ resource = "assets/player/IdleUp-3", flipped = false },
				}
			},
			{
				condition = "facingDown",
				frames = {
					{ resource = "assets/player/IdleDown-0", flipped = false },
					{ resource = "assets/player/IdleDown-1", flipped = false },
					{ resource = "assets/player/IdleDown-2", flipped = false },
					{ resource = "assets/player/IdleDown-3", flipped = false },
				}
			},
			{
				condition = "facingRight",
				frames = {
					{ resource = "assets/player/IdleRight-0", flipped = false },
					{ resource = "assets/player/IdleRight-1", flipped = false },
					{ resource = "assets/player/IdleRight-2", flipped = false },
					{ resource = "assets/player/IdleRight-3", flipped = false },
				}
			},
			{
				condition = "facingLeft",
				frames = {
					{ resource = "assets/player/IdleRight-0", flipped = true },
					{ resource = "assets/player/IdleRight-1", flipped = true },
					{ resource = "assets/player/IdleRight-2", flipped = true },
					{ resource = "assets/player/IdleRight-3", flipped = true },
				}
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
