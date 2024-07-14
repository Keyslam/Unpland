local ShadowRendering = Concord.system({
	pool = { "position", "shadow" }
})

function ShadowRendering:init()
	self.shadowImage = love.graphics.newImage("assets/shadow.png")
end

function ShadowRendering:draw()
	for _, e in ipairs(self.pool) do
		local iw, ih = self.shadowImage:getDimensions()
		local ox, oy = math.floor(iw / 2), math.floor(ih / 2)

		love.graphics.draw(
			self.shadowImage,
			e.position.x * 16, e.position.y * 16,
			0,
			1, 1,
			ox, oy
		)
	end
end

return ShadowRendering
