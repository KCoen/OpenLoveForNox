-- Everything else
local PentagramCollide = {}
PentagramCollide.name = "PentagramCollide"

function PentagramCollide:initObject(obj)
	local phys = {}
	
	phys.body = love.physics.newBody(physworld,obj.x,obj.y)
	phys.shape = love.physics.newCircleShape(0,0,obj.physExtentX)
	phys.fix = love.physics.newFixture(phys.body,phys.shape)
	phys.fix:setSensor(true)
	
	obj.phys = {phys}
end

function PentagramCollide:onCollide(obj, obj2)	
	if obj.mapXfer.ExtentLink ~= 0 then
		local target = map:GetByExtendId(obj.mapXfer.ExtentLink)
		if target then
			local dx = obj2.x - obj.x
			local dy = obj2.y - obj.y

			if(obj2.setPosition) then
				obj2:setPosition(target.x + dx, target.y + dy)
			else
				obj2.x = target.x + dx
				obj2.y = target.y + dy
			end
		end
	end
end

function PentagramCollide:onEndCollide(obj, obj2)	
end


return PentagramCollide
