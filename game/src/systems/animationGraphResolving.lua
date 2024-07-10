local AnimationGraphResolving = Concord.system({
	pool = { "animationGraph", "sprite" }
})

local function resolveNode(e, node)
	if (#node == 0) then
		return node
	end

	for _, subNode in ipairs(node) do
		local passesCondition = false

		if (subNode.condition == nil) then
			passesCondition = true
		end

		if (subNode.condition == "isMoving") then
			passesCondition = e:has("movement")
		end

		if (subNode.condition == "facingUp") then
			passesCondition = e.facing.value == "up"
		end

		if (subNode.condition == "facingDown") then
			passesCondition = e.facing.value == "down"
		end

		if (subNode.condition == "facingRight") then
			passesCondition = e.facing.value == "right"
		end

		if (subNode.condition == "facingLeft") then
			passesCondition = e.facing.value == "left"
		end

		if (passesCondition) then
			return resolveNode(e, subNode)
		end
	end
end

function AnimationGraphResolving:update(dt)
	for _, e in ipairs(self.pool) do
		local rootNode = e.animationGraph.graph
		local node = resolveNode(e, rootNode)

		e.animationGraph.time = e.animationGraph.time + dt
		if (e.animationGraph.time > 0.14) then
			e.animationGraph.time = e.animationGraph.time - 0.14
			e.animationGraph.frame = e.animationGraph.frame + 1

			if (e.animationGraph.frame > #node.frames) then
				e.animationGraph.frame = 1
			end
		end

		local frame = node.frames[e.animationGraph.frame]

		e.sprite.resource = frame.resource
		e.sprite.flipped  = frame.flipped
	end
end

return AnimationGraphResolving
