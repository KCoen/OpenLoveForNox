Updates = {}
Updates.interfaces = {}

function Updates:load()
	local dir = "Updates/"
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


function Updates:update(dt)
	for k,v in pairs(Updates.interfaces) do
		if(v.update) then
			v:update(dt)
		end
	end
end

function Updates:RegisterObject(object)
	if object.update or not object.tt.Update or object.tt.Update == "NoUpdate" then
		return
	end
	
	object.updater = Updates.interfaces[object.tt.Update]
	if(object.updater) then
		object.updater:initObject(object)
	else
		print("Unsuported update type " .. object.tt.Update, object.tt.Name)
	end
end


