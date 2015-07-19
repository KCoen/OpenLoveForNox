-- Everything else
local DoorUpdate = {}
DoorUpdate.name = "DoorUpdate"

DoorUpdate.DoorTorque = -100000

--[[
function Door:lock()
	self.isLocked = true
	self.phys[1].joint:setLimits(-0.01, 0.01)
end

function Door:unlock()
	self.isLocked = false
	self.phys[1].joint:setLimits((1/16) * -14.5 * math.pi, (1/16) * 14.5 * math.pi)
end
--]]

function DoorUpdate:initObject(obj)
	obj.door = {}
	obj.door.isLocked = false
	obj.door.isBolted = false
	obj.door.isClosed = false
	obj.door._object = obj -- Add a circulare reference so we can thiscall functions on the "door" compenent

	obj.door.lock = function(_obj) 
		local obj = _obj._object
		obj.door.isLocked = true 
		obj.phys[1].joint:setLimits(-0.01, 0.01)
	end

	obj.door.unlock = function(_obj)
		local obj = _obj._object
		obj.door.isLocked = false
		obj.phys[1].joint:setLimits((1/16) * -14.5 * math.pi, (1/16) * 14.5 * math.pi)
	end
end

function DoorUpdate:update(dt)
end

function DoorUpdate:updateObject(obj, dt)	
	local b = obj.phys[1].body
	local angle = b:getAngle()
	b:applyTorque(angle * DoorUpdate.DoorTorque * dt) 


end

return DoorUpdate
