local AnimationGraphResolving = Concord.system({
	pool = { "animationGraph", "sprite" }
})

function AnimationGraphResolving:update(dt)
	for _, e in ipairs(self.pool) do
		e.animationGraph.time = e.animationGraph.time + dt
		if (e.animationGraph.time > 0.2) then
			e.animationGraph.time = e.animationGraph.time - 0.2

			e.animationGraph.frame = e.animationGraph.frame + 1
			if (e.animationGraph.frame > #e.animationGraph.graph) then
				e.animationGraph.frame = 1
			end
		end

		e.sprite.resource = e.animationGraph.graph[e.animationGraph.frame]
	end
end

return AnimationGraphResolving
