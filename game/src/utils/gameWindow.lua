local Push = import("/lib/push")

local GameWindow = Class("GameWindow")

function GameWindow:initialize()
	self.virtualResolution = {
		width  = 320,
		height = 180,
	}
end

function GameWindow:setup()
	local scale = self:getMaximumScale() - 1

	Push:setupScreen(
		self.virtualResolution.width,
		self.virtualResolution.height,
		self.virtualResolution.width * scale,
		self.virtualResolution.height * scale,
		{
			fullscreen   = false,
			resizable    = false,
			canvas       = false,
			pixelperfect = true,
			highdpi      = false,
			stretched    = false
		}
	)

	love.window.setTitle("Unpland")
	love.window.setVSync(0)
end

function GameWindow:getMaximumScale()
	local desktopWidth, desktopHeight = love.window.getDesktopDimensions()

	local maximumScale = math.floor(math.min(
		desktopWidth / self.virtualResolution.width,
		desktopHeight / self.virtualResolution.height
	))

	return maximumScale
end

function GameWindow:draw(fn)
	Push:start()
	fn()
	Push:finish()
end

local instance = GameWindow()
return instance
