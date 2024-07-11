local ConditionRegistry = Class("ConditionRegistry")

function ConditionRegistry:initialize()
	self.conditions = {}
end

function ConditionRegistry:register(key, fn)
	self.conditions[key] = fn
end

function ConditionRegistry:get(key)
	return self.conditions[key]
end

local instance = ConditionRegistry()

instance:register("entity-is-facing-up", function(e)
	return e.facing ~= nil and e.facing.value == "up"
end)

instance:register("entity-is-facing-down", function(e)
	return e.facing ~= nil and e.facing.value == "down"
end)

instance:register("entity-is-facing-left", function(e)
	return e.facing ~= nil and e.facing.value == "left"
end)

instance:register("entity-is-facing-right", function(e)
	return e.facing ~= nil and e.facing.value == "right"
end)

instance:register("entity-is-facing-down", function(e)
	return e.facing ~= nil and e.facing.value == "down"
end)

instance:register("entity-is-moving", function(e)
	return e.movement ~= nil
end)

return instance
