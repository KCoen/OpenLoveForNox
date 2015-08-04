Updates = {}
Updates.interfaces = {}

function Updates:load()
	local dir = "noxUpdates/"
	for k,file in ipairs(love.filesystem.getDirectoryItems(dir)) do
		local result = require(dir..getBasename(file))
		self.interfaces[result.name] = result
	end
end


function Updates:update(dt)
	for k,v in pairs(Updates.interfaces) do
		if(v.update) then
			v:update(dt)
		end
	end
end

function Updates:RegisterObject(object)
	if object.update or not object.updateType or object.updateType == "NoUpdate" then
		return
	end
	
	object.updater = Updates.interfaces[object.updateType]
	if(object.updater) then
		object.updater:initObject(object)
	else
		--print("Unsuported update type " .. object.updateType, object.objname)
	end
end


