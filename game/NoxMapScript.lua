function runMapScript(untrusted_code_name)
	print(untrusted_code_name)
	untrusted_code = love.filesystem.read(untrusted_code_name)
	if untrusted_code:byte(1) == 27 then 
		return nil, "binary bytecode prohibited" 
	end
	
	local untrusted_function, message = loadstring(untrusted_code)
	if not untrusted_function then 
		print(untrusted_code_name .. message)
		return nil, untrusted_code_name .. message 
	end
	
	setfenv(untrusted_function, mapscriptenv)
	local status, err = pcall(untrusted_function)
	if err then
		print(err .. untrusted_code_name)
	end
	
	return status, err
end