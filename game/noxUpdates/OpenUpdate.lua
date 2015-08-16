local OpenUpdate = {}
OpenUpdate.name = "OpenUpdate"

function OpenUpdate:initObject(obj)
	for k,v in pairs(chestDirectionConversion) do
		if obj.subclass[k] then
			obj.rotation = v
		end
	end
end

function OpenUpdate:update(dt)
end

function OpenUpdate:updateObject(obj, dt)	
	
end

function OpenUpdate:onAnimationStateEnd(obj, state)
	if state == 2 then	
		obj.spriteState = 3
		local rotationVariable = math.pi
		if obj.inventoryList then
			for k,v in pairs(obj.inventoryList) do
				
				local rotation = obj.rotation + math.random() * rotationVariable - rotationVariable/2
				local x,y = -1 * math.cos(rotation),  math.sin(rotation)


				local obj2 = NoxBaseObject.new(v)
				obj2:setPosition(obj.x + x * 30, obj.y + y * 30)
			end
		end
		if obj.spawnObjectDie.sound then
			audio:emitSoundByMapping(obj, obj.spawnObjectDie.sound)
		end
	end
end


return OpenUpdate
