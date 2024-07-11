local ResourceRegistry = import("/src/resources/resourceRegistry")

local SpriteRendering = Concord.system({
	pool = { "position", "sprite" }
})

local function drawWithQuad(e)
	local sx = e.sprite.isFlipped and -1 or 1

	local _, _, vw, vh = e.sprite.quad:getViewport()
	local ox, oy = math.floor(vw / 2), math.floor(vh / 2)

	love.graphics.draw(
		e.sprite.image,
		e.sprite.quad,
		e.position.x, e.position.y,
		0,
		sx, 1,
		ox, oy
	)
end

local function drawWithoutQuad(e)
	local sx = e.sprite.isFlipped and -1 or 1

	local iw, ih = e.sprite.image:getDimensions()
	local ox, oy = math.floor(iw / 2), math.floor(ih / 2)

	love.graphics.draw(
		e.sprite.image,
		e.position.x, e.position.y,
		0,
		sx, 1,
		ox, oy
	)
end

function SpriteRendering:draw()
	for _, e in ipairs(self.pool) do
		local resource = ResourceRegistry:getSprite(e.sprite.resource)

		local sx = e.sprite.flipped and -1 or 1
		local _, _, vw, vh = resource.quad:getViewport()
		local ox, oy = math.floor(vw / 2), math.floor(vh / 2)

		love.graphics.draw(
			resource.image,
			resource.quad,
			e.position.x, e.position.y,
			0,
			sx, 1,
			ox, oy
		)
	end
end

return SpriteRendering
