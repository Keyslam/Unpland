local Controlling = Concord.system({
	pool = { "position", "controls" }
})

function Controlling:keypressed(key)
	for _, e in ipairs(self.pool) do
		if (e:has("movement")) then
			goto continue
		end

		if (key == "w") then
			e:give("movement", {
				start = {
					x = e.position.x,
					y = e.position.y,
				},
				target = {
					x = e.position.x,
					y = e.position.y - 16,
				},
				speed = 1,
			})
			e.facing.value = "up"
		end

		if (key == "s") then
			e:give("movement", {
				start = {
					x = e.position.x,
					y = e.position.y,
				},
				target = {
					x = e.position.x,
					y = e.position.y + 16,
				},
				speed = 1,
			})
			e.facing.value = "down"
		end

		if (key == "a") then
			e:give("movement", {
				start = {
					x = e.position.x,
					y = e.position.y,
				},
				target = {
					x = e.position.x - 16,
					y = e.position.y,
				},
				speed = 1,
			})
			e.facing.value = "left"
		end

		if (key == "d") then
			e:give("movement", {
				start = {
					x = e.position.x,
					y = e.position.y,
				},
				target = {
					x = e.position.x + 16,
					y = e.position.y,
				},
				speed = 1,
			})
			e.facing.value = "right"
		end

		::continue::
	end
end

return Controlling
