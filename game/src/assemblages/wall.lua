return function(e, props)
	return e
		:ensure("position", {
			x = Default(props.x, 0),
			y = Default(props.y, 0),
		})
		:ensure("sprite", {})
		:ensure("ruletile", {})
end
