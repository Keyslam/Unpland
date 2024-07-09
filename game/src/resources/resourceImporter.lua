local Json = import("/lib/json")

local ResourceManager = import("./resourceManager")

local ResourceImporter = Class("ResourceImporter")

function ResourceImporter:initialize()
end

function ResourceImporter:importSpritesheet(path)
	local imagePath = path .. ".png"
	local jsonPath  = path .. ".json"

	local image = love.graphics.newImage(imagePath)

	local serializedData = love.filesystem.read(jsonPath)
	local data = Json.decode(serializedData)

	local slices = data.meta.slices
	for _, slice in ipairs(slices) do
		local name   = slice.name
		local bounds = slice.keys[1].bounds

		local key = path .. "/" .. name
		ResourceManager:registerSprite(key, image, bounds)
	end
end

function ResourceImporter:importAnimation(path)
	local imagePath = path .. ".png"
	local jsonPath  = path .. ".json"

	local image = love.graphics.newImage(imagePath)

	local serializedData = love.filesystem.read(jsonPath)
	local data = Json.decode(serializedData)

	local frames = data.frames
	for name, frame in pairs(frames) do
		local key = path .. "/" .. name
		ResourceManager:registerSprite(key, image, frame.frame)
	end
end

return ResourceImporter()
