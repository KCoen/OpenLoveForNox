-- Everything else
local TriggerCollide = {}
TriggerCollide.name = "TriggerCollide"

function TriggerCollide:initObject(obj)
	local phys = {}
	phys.body = love.physics.newBody(physworld,obj.x,obj.y, "dynamic")
	if obj.physExtentType == "CIRCLE" then
		phys.shape = love.physics.newCircleShape(0,0,obj.physExtentX)
		obj.phys = {phys}
	elseif obj.physExtentType == "BOX" then
		phys.shape = love.physics.newRectangleShape(0,0,obj.physExtentX,obj.physExtentY,math.pi/4)
		obj.phys = {phys}
	end
	
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	phys.fix:setSensor(true)

	table.insert(obj.phys, phys)
end

function TriggerCollide:onCollide(obj, obj2, fix1, fix2)
	if obj.mapXfer.ScriptOnPressed and obj2.player then
		NoxMapScript:call(obj.mapXfer.ScriptOnPressed)
	end

	if obj.mapXfer.ScriptOnCollided and obj2.player then
		NoxMapScript:call(obj.mapXfer.ScriptOnCollided)
	end
end

function TriggerCollide:onEndCollide(obj, obj2, fix1, fix2)
	if obj.mapXfer.ScriptOnReleased and obj2.player then
		NoxMapScript:call(obj.mapXfer.ScriptOnReleased)
	end
end


return TriggerCollide
