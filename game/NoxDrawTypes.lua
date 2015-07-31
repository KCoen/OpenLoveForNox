DrawTypes = {}
DrawTypes.interfaces = {}

function DrawTypes:load()
	local dir = "noxDrawTypes/"
	for k,file in ipairs(love.filesystem.getDirectoryItems(dir)) do
		local result = require(dir..getBasename(file))
		self.interfaces[result.name] = result
	end
end


function DrawTypes:update(dt)
	for k,v in pairs(DrawTypes.interfaces) do
		if(v.update) then
			v:update(dt)
		end
	end
end

function DrawTypes:RegisterObject(object) -- DrawFunction
	if(object.draw) then
		return
	end
	
	object.renderer = DrawTypes.interfaces[object.drawType]
	if(object.renderer) then
		object.renderer:initObject(object)
	else
		print("Unsuported drawtype " .. object.drawType, object.objName)
	end
end


