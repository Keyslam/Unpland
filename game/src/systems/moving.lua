local Moving = Concord.system({
	pool = { "position", "movement" }
})

local function lerp(a, b, t)
	return a + (b - a) * t
end

function Moving:update(dt)
	for _, e in ipairs(self.pool) do
		e.movement.progress = math.min(
			e.movement.progress + e.movement.speed * dt,
			1
		)

		e.position.x = lerp(e.movement.start.x, e.movement.target.x, e.movement.progress)
		e.position.y = lerp(e.movement.start.y, e.movement.target.y, e.movement.progress)

		if (e.movement.progress == 1) then
			e:remove("movement")
		end
	end
end

return Moving
