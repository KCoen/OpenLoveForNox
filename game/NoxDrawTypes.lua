DrawTypes = {}
DrawTypes.interfaces = {}

function DrawTypes:load()
	local dir = "noxDrawTypes/"
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


