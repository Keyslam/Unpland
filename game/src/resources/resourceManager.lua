local ResourceManager = Class("ResourceManager")

function ResourceManager:initialize()
	self.sprites = {}
end

function ResourceManager:registerSprite(key, image, viewport)
	local iw, ih = image:getDimensions()
	local quad = love.graphics.newQuad(
		viewport.x, viewport.y,
		viewport.w, viewport.h,
		iw, ih
	)

	self.sprites[key] = {
		image = image,
		quad  = quad,
	}
end

function ResourceManager:getSprite(key)
	return self.sprites[key]
end

return ResourceManager()
