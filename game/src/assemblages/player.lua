local function loadSprite()
	local image = love.graphics.newImage("assets/player.png")
	local quad = love.graphics.newQuad(
		0, 48 * 10,
		48, 48,
		image:getWidth(), image:getHeight()
	)

	return image, quad
end

return function(e, props)
	local image, quad = loadSprite()

	return e
		:ensure("position", {
			x = Default(props.x, 0),
			y = Default(props.y, 0),
		})
		:ensure("sprite", {
			image     = image,
			quad      = quad,
			isFlipped = false,
		})
		:ensure("shadow")
end
