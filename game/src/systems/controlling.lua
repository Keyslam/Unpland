local Controlling = Concord.system({
	pool = { "position", "controls" }
})

local keymap = {
	["w"] = { dx = 0, dy = -1, facing = "up" },
	["a"] = { dx = -1, dy = 0, facing = "left" },
	["s"] = { dx = 0, dy = 1, facing = "down" },
	["d"] = { dx = 1, dy = 0, facing = "right" }
}

function Controlling:keypressed(key)
	if (keymap[key] == nil) then
		return
	end

	for _, e in ipairs(self.pool) do
		e.controls.lastInput = key
	end
end

function Controlling:keyreleased(key)
	if (keymap[key] == nil) then
		return
	end

	for _, e in ipairs(self.pool) do
		if (e.controls.lastInput == key) then
			e.controls.lastInput = nil
		end
	end
end

function Controlling:update(dt)
	for _, e in ipairs(self.pool) do
		if (e:has("movement")) then
			goto continue
		end

		if (e.controls.lastInput) then
			local map = keymap[e.controls.lastInput]

			e:give("movement", {
				start = {
					x = e.position.x,
					y = e.position.y,
				},
				target = {
					x = e.position.x + map.dx * 16,
					y = e.position.y + map.dy * 16,
				},
				speed = 4,
			})
			e.facing.value = map.facing
		end

		::continue::
	end
end

return Controlling
