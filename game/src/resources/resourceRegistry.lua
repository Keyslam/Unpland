local ResourceRegistry = Class("ResourceRegistry")

function ResourceRegistry:initialize()
	self.sprites = {}
end

function ResourceRegistry:registerSprite(key, image, viewport)
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

function ResourceRegistry:getSprite(key)
	return self.sprites[key]
end

return ResourceRegistry()
