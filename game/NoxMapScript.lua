NoxMapScript = {}

NoxMapScript.defferedCalls = {}
NoxMapScript.lastObject = nil

function NoxMapScript:runMapScript(untrusted_code_name)
	print(untrusted_code_name)
	untrusted_code = love.filesystem.read(untrusted_code_name)
	if untrusted_code:byte(1) == 27 then 
		return nil, "binary bytecode prohibited" 
	end

	preenv = love.filesystem.read("NoxMapScriptPreEnv.lua")
	
	local untrusted_function, message = loadstring(untrusted_code)
	if not untrusted_function then 
		print(untrusted_code_name .. message)
		return nil, untrusted_code_name .. message 
	end
	
	setmetatable(mapscriptenv, {__index = function(t,k) 
		if rawget(t,k) == nil then
			t[k] = {}
		end
		return t[k]
	end})

	setfenv(untrusted_function, mapscriptenv)
	local status, err = pcall(untrusted_function)
	if err then
		print(err .. untrusted_code_name)
	end
	
	return status, err
end

function NoxMapScript:update(dt)
	for k,v in pairs(NoxMapScript.defferedCalls) do
		if v.callTime < love.timer.getTime() then
			NoxMapScript:call(v.functionName)

			print("called function " .. v.functionName)

			table.remove(NoxMapScript.defferedCalls, k)
		end

	end
end

function NoxMapScript:call(functionName, sourceobj)
	if(mapscriptenv[functionName] and type(mapscriptenv[functionName]) == "function") then
		--[[local r = coroutine.create(mapscriptenv[functionName])
		local ret, err = coroutine.resume(r)

		if err then
			love.errhand("Map Script: " .. err)
		end--]]

		NoxMapScript.lastObject = sourceobj

		mapscriptenv[functionName]()
	end	
end
