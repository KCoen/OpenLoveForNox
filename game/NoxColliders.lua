Colliders = {}
Colliders.interfaces = {}

function Colliders:load()
	local dir = "noxColliders/"
	for k,file in ipairs(love.filesystem.getDirectoryItems(dir)) do
		local result = require(dir..getBasename(file))
		self.interfaces[result.name] = result
	end
end

function Colliders:RegisterObject(obj) -- DrawFunction
	if(obj.collide) then
		return
	end

	if not obj.flags["NO_COLLIDE"] and obj.collideType then
		local cfa = obj.collideType:split(" ")
		local collidefunction = cfa[1]
		table.remove(cfa, 1)

		obj.collider = Colliders.interfaces[collidefunction]		
		if(obj.collider) then
			obj.collider:initObject(obj, unpack(cfa))
		else
			print("Unsuported collider " .. obj.collideType, collidefunction)
		end
	end


	if not obj.class["IMMOBILE"] and obj.phys then
		physics:registerDynamicObject(obj)

	end

	if(obj.phys) then
		for k,v in pairs(obj.phys) do
			v.fix:setUserData(obj)
			if obj.flags and obj.flags["SHORT"] then
				physics:setFilterData(v.fix, "OBJECT_SHORT", true, { "EVERYTHING" } )
			else
				physics:setFilterData(v.fix, "OBJECT", true, { "EVERYTHING" } )
			end
			
			--v.fix:setFilterData(1,1,1)
		end
	end
end


