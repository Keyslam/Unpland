local function frames(name, amount, ...)
	local out = {}

	for i = 1, amount do
		local frame = {
			resource = name .. "-" .. tostring(i - 1)
		}

		local merge = select(i, ...) or {}

		for k, v in pairs(merge) do
			frame[k] = v
		end

		out[i] = frame
	end

	return out
end

return {
	frames = frames
}
