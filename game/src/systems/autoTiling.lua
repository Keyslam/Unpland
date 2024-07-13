local AutoTiling = Concord.system({
	pool = { "ruletile", "sprite", "position" }
})

function AutoTiling:init()
	self.map = {}

	self.pool.onAdded = function(_, e)
		local x, y = math.floor(e.position.x / 16), math.floor(e.position.y / 16)

		self.map[x] = self.map[x] or {}
		self.map[x][y] = self.map[x][y] or {}

		table.insert(self.map[x][y], e)
	end
end

local masks = {
	{ value = 1, dx = -1, dy = -1},
	{ value = 2, dx = 0, dy = -1},
	{ value = 4, dx = 1, dy = -1},
	{ value = 8, dx = -1, dy = 0},
	{ value = 16, dx = 1, dy = 0},
	{ value = 32, dx = -1, dy = 1},
	{ value = 64, dx = 0, dy = 1},
	{ value = 128, dx = 1, dy = 1},
}

function AutoTiling:update(dt)
	for _, e in ipairs(self.pool) do
		local x, y = math.floor(e.position.x / 16), math.floor(e.position.y / 16)

		local maskValue = 0
		for _, mask in ipairs(masks) do
			local row = self.map[x + mask.dx] or {}
			local column = row[y + mask.dy] or {}

			if (#column ~= 0) then
				maskValue = maskValue + mask.value
			end
		end

		for _, rule in pairs(e.ruletile.rules) do
			if (bit.band(rule.mask, maskValue) == rule.mask) then
				e.sprite.resource = "assets/dungeon_tilesheet/" .. rule.resource
				break
			end
		end
	end
end

return AutoTiling
