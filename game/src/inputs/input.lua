local Input = Class("Input")

local function newControl()
	return { framePressed = nil, frameReleased = nil, origins = {} }
end

function Input:initialize(frameProvider)
	self.frameProvider = frameProvider

	self.controls = {
		up = newControl(),
		down = newControl(),
		left = newControl(),
		right = newControl(),
	}

	self.keymap = {
		w = "up",
		a = "left",
		s = "down",
		d = "right",

		up = "up",
		down = "down",
		left = "left",
		right = "right",
	}
end

function Input:isControlDown(controlName)
	local control = self.controls[controlName]

	return control.framePressed ~= nil and control.frameReleased == nil
end

function Input:isControlPressed(controlName)
	local control = self.controls[controlName]

	return control.framePressed == self.frameProvider:getCurrentFrame()
end

function Input:isControlReleased(controlName)
	local control = self.controls[controlName]

	return control.frameReleased == self.frameProvider:getCurrentFrame()
end

function Input:keypressed(key)
	local controlName = self.keymap[key]
	if (controlName == nil) then
		return
	end

	local control = self.controls[controlName]

	if (#control.origins == 0) then
		control.framePressed = 1
		control.frameReleased = nil
	end
	table.insert(control.origins, key)
end

function Input:keyreleased(key)
	local controlName = self.keymap[key]
	if (controlName == nil) then
		return
	end

	local control = self.controls[controlName]

	if (#control.origins == 1) then
		control.frameReleased = 1
	end
	for i, origin in ipairs(control.origins) do
		if (origin == key) then
			table.remove(control.origins, i)
			break
		end
	end
end

return Input
