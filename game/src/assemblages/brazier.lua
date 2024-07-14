local Frames = import("./util/animations").frames

local graph = {
	{
		frames = Frames("dungeon_tilesheet/Brazier-1/Idle", 4)
	}
}

return function(e, props)
	return e
		:ensure("position", {
			x = Default(props.x, 0),
			y = Default(props.y, 0),
		})
		:ensure("sprite", {})
		:ensure("animationGraph", { graph = graph })
end
