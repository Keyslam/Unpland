local TileEditing = Concord.system({
	pool = { "position", "ruletile" }
})

local function findTile(self, x, y)
	for _, e in ipairs(self.pool) do
		if (e.position.x == x and e.position.y == y) then
			return e
		end
	end
end

function TileEditing:mousepressed(x, y, button)
	local gx, gy = math.floor(x / 16), math.floor(y / 16)
	print(gx, gy)

    if (button == 1) then
		local e = findTile(self, gx * 16, gy * 16)
		if (e == nil) then
			Concord.entity(self:getWorld()):assemble(Assemblages.wall, {
				x = gx * 16,
				y = gy * 16,
			})
		end
	end

	if (button == 2) then
		local e = findTile(self, gx * 16, gy * 16)
		if (e ~= nil) then
			e:remove()
		end
	end
end

return TileEditing
