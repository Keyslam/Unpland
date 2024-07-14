local FrameProvider = Class("FrameProvider")

function FrameProvider:initialize()
	self.currentFrame = 0
end

function FrameProvider:step()
	self.currentFrame = self.currentFrame + 1
end

function FrameProvider:getCurrentFrame()
	return self.currentFrame
end

return FrameProvider
