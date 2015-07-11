Colliders = {}
Colliders.interfaces = {}

function Colliders:load()
	local dir = "Colliders/"
	for k,file in ipairs(love.filesystem.getDirectoryItems(dir)) do
		local ok,chunk,result
		ok,chunk = pcall(love.filesystem.load,dir..file)
		if not ok then
			print('The following error happend (#1): ' .. tostring(chunk))
		else
			ok,result = pcall(chunk)
			if not ok then
				print('The following error happened (#2): ' .. tostring(result))
			else
				--print('The result of loading is: ' .. tostring(result))
				if(result) then
					self.interfaces[result.name] = result
				else
					print("Invalid interface" .. file)
				end
			end
		end
	end
end

function Colliders:RegisterObject(obj) -- DrawFunction
	if(obj.collide) then
		return
	end

	if not obj.flags["NO_COLLIDE"] and obj.tt.Collide then
		local cfa = obj.tt.Collide:split(" ")
		local collidefunction = cfa[1]
		table.remove(cfa, 1)

		obj.collider = Colliders.interfaces[collidefunction]		
		if(obj.collider) then
			obj.collider:initObject(obj, unpack(cfa))
		else
			print("Unsuported collider " .. obj.tt.Collide, collidefunction)
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


