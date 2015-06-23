
ents = {}
ents.lookup = {}
ents.active = {}

function ents:load()
	local dir = "entities/"
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
				ents.lookup[string.gsub(file,".lua","")] = result
			end
		end
	end
	for name,ent in pairs(self.lookup) do
		local kindOf = {}
		if ent.kindOf then
			table.insert(kindOf,ent.kindOf)
		end
		if ent.base then
			local parent = ents.lookup[ent.base]
			while parent do
				if parent.kindOf then
					local temp = parent.kindOf
					if type(temp) ~= "string" then
						temp = temp[1]
					end
					if not table.find(kindOf,temp) then
						table.insert(kindOf,temp)
					end
				end
				
				for k,v in pairs(parent) do
					if not ent[k] then
						ent[k] = table.copy(v)
					end
				end
				if parent.base then
					parent = ents.lookup[parent.base]
				else
					parent = nil
				end
			end
		end
		ent.kindOf = kindOf
		ent.class = name
		ent:onLoad()
	end
end

function ents.getAll()
	return ents.active
end

function ents.findByClass(class)
	local class_ents = {}
	for i,ent in pairs(ents.getAll()) do
		if ent.class == class then
			table.insert(class_ents,ent)
		end
	end
	return class_ents
end

function Entity(name)
	local ent = table.copy(ents.lookup[name])
	table.insert(ents.active,ent)
	ent:init()
	return ent
end
