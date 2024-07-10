local graph = {
	{
		frames = {
			{ resource = "assets/dungeon_tilesheet/Brazier-1/Idle-0", flipped = false },
			{ resource = "assets/dungeon_tilesheet/Brazier-1/Idle-1", flipped = false },
			{ resource = "assets/dungeon_tilesheet/Brazier-1/Idle-2", flipped = false },
			{ resource = "assets/dungeon_tilesheet/Brazier-1/Idle-3", flipped = false },
		}
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
