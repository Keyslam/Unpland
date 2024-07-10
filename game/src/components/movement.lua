Concord.component("movement", function(e, props)
	e.start = {
		x = props.start.x,
		y = props.start.y,
	}

	e.target = {
		x = props.target.x,
		y = props.target.y,
	}

	e.speed = Default(props.speed, 1)
	e.progress = 0
end)
