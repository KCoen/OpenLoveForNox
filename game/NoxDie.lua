Die = {}
Die.interfaces = {}

function Die:load()
	local dir = "noxDie/"
	for k,file in ipairs(love.filesystem.getDirectoryItems(dir)) do
		local result = require(dir..getBasename(file))
		self.interfaces[result.name] = result
	end
end


function Die:update(dt)
	for k,v in pairs(Die.interfaces) do
		if(v.update) then
			v:update(dt)
		end
	end
end

function Die:RegisterObject(object)
	if object.ondie or not object.dieType then
		return
	end

	local cfa = object.dieType:split(" ")
	local collidefunction = cfa[1]
	table.remove(cfa, 1)

	object.ondie = Die.interfaces[collidefunction]		
	if(object.ondie) then
		object.ondie:initObject(object, unpack(cfa))
	else
		print("Unsuported die type " .. object.dieType, object.objname)
	end
end


