local ResourceRegistry = import("/src/resources/resourceRegistry")

local SpriteRendering = Concord.system({
	pool = { "position", "sprite" }
})

function SpriteRendering:draw()
	for _, e in ipairs(self.pool) do
		local resource = ResourceRegistry:getSprite(e.sprite.resource)

		if (resource == nil) then
			resource = ResourceRegistry:getSprite("assets/dungeon_tilesheet/Floor-Stone-Red")
		end

		local sx = e.sprite.flipped and -1 or 1
		local _, _, vw, vh = resource.quad:getViewport()
		local ox, oy = math.floor(vw / 2), math.floor(vh / 2)

		love.graphics.draw(
			resource.image,
			resource.quad,
			e.position.x * 16, e.position.y * 16,
			0,
			sx, 1,
			ox, oy
		)
	end
end

return SpriteRendering
