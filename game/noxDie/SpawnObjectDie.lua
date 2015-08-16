local SpawnObjectDie = {}
SpawnObjectDie.name = "SpawnObjectDie"

function SpawnObjectDie:initObject(obj, ...)
	local arg = {...}
	obj.spawnObjectDie = {}
	obj.spawnObjectDie.sound = arg[2]
end

function SpawnObjectDie:objectDie(obj)	

	local rotationVariable = math.pi

	if obj.inventoryList then
		for k,v in pairs(obj.inventoryList) do
			
			local rotation = obj.rotation + math.random() * rotationVariable - rotationVariable/2
			local x,y = -1 * math.cos(rotation),  math.sin(rotation)


			local obj2 = NoxBaseObject.new(v)
			obj2:setPosition(obj.x + x * 30, obj.y + y * 30)
		end
	end
end

return SpawnObjectDie
