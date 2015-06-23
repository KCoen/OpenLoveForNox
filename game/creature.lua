Creature = {}
Creature.__index = Creature

function Creature.new()
	local self = setmetatable({}, Creature)
	
end