local Frames = import("./util/animations").frames

local graph = {
	{
		condition = "entity-is-moving",
		{
			{
				condition = "entity-is-facing-up",
				frames = Frames("player/WalkUp", 4)
			},
			{
				condition = "entity-is-facing-down",
				frames = Frames("player/WalkDown", 4)
			},
			{
				condition = "entity-is-facing-right",
				frames = Frames("player/WalkRight", 4)
			},
			{
				condition = "entity-is-facing-left",
				frames = Frames("player/WalkRight", 4,
					{ flipped = true },
					{ flipped = true },
					{ flipped = true },
					{ flipped = true }
				)
			}
		}
	},
	{
		condition = nil,
		{
			{
				condition = "entity-is-facing-up",
				frames = Frames("player/IdleUp", 4)
			},
			{
				condition = "entity-is-facing-down",
				frames = Frames("player/IdleDown", 4),
			},
			{
				condition = "entity-is-facing-right",
				frames = Frames("player/IdleRight", 4),
			},
			{
				condition = "entity-is-facing-left",
				frames = Frames("player/IdleRight", 4,
					{ flipped = true },
					{ flipped = true },
					{ flipped = true },
					{ flipped = true }
				),
			}
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
		:ensure("controls")
		:ensure("animationGraph", { graph = graph })
		:ensure("facing", { value = "down" })
		:ensure("shadow")
end
