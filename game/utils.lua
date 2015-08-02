function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

-- remove trailing and leading whitespace from string.
-- http://en.wikipedia.org/wiki/Trim_(8programming)
function string:trim()
  -- from PiL2 20.4
  return (self:gsub("^%s*(.-)%s*$", "%1"))
end

-- remove leading whitespace from string.
-- http://en.wikipedia.org/wiki/Trim_(8programming)
function string:ltrim()
  return (self:gsub("^%s*", ""))
end

-- remove trailing whitespace from string.
-- http://en.wikipedia.org/wiki/Trim_(8programming)
function string:rtrim()
  local n = #self
  while n > 0 and self:find("^%s", n) do n = n - 1 end
  return self:sub(1, n)
end


-- Private methods

-- write thing (dispatcher)
write = function (file, item, level, objRefNames)
	writers[type(item)](file, item, level, objRefNames);
end;

-- write indent
writeIndent = function (file, level)
	for i = 1, level do
		file:write("\t");
	end;
end;

-- recursively count references
refCount = function (objRefCount, item)
	-- only count reference types (tables)
	if type(item) == "table" then
		-- Increase ref count
		if objRefCount[item] then
			objRefCount[item] = objRefCount[item] + 1;
		else
			objRefCount[item] = 1;
			-- If first encounter, traverse
			for k, v in pairs(item) do
				refCount(objRefCount, k);
				refCount(objRefCount, v);
			end;
		end;
	end;
end;

-- Format items for the purpose of restoring
writers = {
	["nil"] = function (file, item)
			file:write("nil");
		end;
	["number"] = function (file, item)
			file:write(tostring(item));
		end;
	["string"] = function (file, item)
			file:write(string.format("%q", item));
		end;
	["boolean"] = function (file, item)
			if item then
				file:write("true");
			else
				file:write("false");
			end
		end;
	["table"] = function (file, item, level, objRefNames)
			local refIdx = objRefNames[item];
			if refIdx then
				-- Table with multiple references
				file:write("multiRefObjects["..refIdx.."]");
			else
				-- Single use table
				file:write("{\n");
				for k, v in pairs(item) do
					writeIndent(file, level+1);
					file:write("[");
					write(file, k, level+1, objRefNames);
					file:write("] = ");
					write(file, v, level+1, objRefNames);
					file:write(";\n");
				end
				writeIndent(file, level);
				file:write("}");
			end;
		end;
	["function"] = function (file, item)
			-- Does only work for "normal" functions, not those
			-- with upvalues or c functions
			local dInfo = debug.getinfo(item, "uS");
			if dInfo.nups > 0 then
				file:write("nil --[[functions with upvalue not supported]]");
			elseif dInfo.what ~= "Lua" then
				file:write("nil --[[non-lua function not supported]]");
			else
				local r, s = pcall(string.dump,item);
				if r then
					file:write(string.format("loadstring(%q)", s));
				else
					file:write("nil --[[function could not be dumped]]");
				end
			end
		end;
	["thread"] = function (file, item)
			file:write("nil --[[thread]]\n");
		end;
	["userdata"] = function (file, item)
			file:write("nil --[[userdata]]\n");
		end;
}

math.rad2deg = 180 / math.pi
math.deg2rad = math.pi / 180


love.timer.timers = {}
love.debug = {}
function love.timer.starTimer(name)
	love.timer.timers[name] = love.timer.getTime()
end

function love.timer.stopTimer(name)
	local dif = love.timer.getTime() - love.timer.timers[name]
	print("Timer " .. name .. ", took: " .. dif)
	return dif
end

love.timer.profilers = {}
love.timer.frameCount = 1
function love.timer.startProfile(name)
	love.timer.profilers[love.timer.frameCount] = love.timer.profilers[love.timer.frameCount] or {}
	love.timer.profilers[love.timer.frameCount][name] = love.timer.getTime()
end

function love.timer.stopProfile(name)
	love.timer.profilers[love.timer.frameCount][name] = love.timer.getTime() - love.timer.profilers[love.timer.frameCount][name]
end

function love.timer.drawProfiles()
	if(love.timer.profilers[love.timer.frameCount]) then
		for name, t in pairs(love.timer.profilers[love.timer.frameCount]) do
			if love.timer.profilers[love.timer.frameCount - 10] then
				local total = 0
				for k = 0,10 do
					total = total + love.timer.profilers[love.timer.frameCount - k][name]
				end
				local avg = total / 10
				love.debug.print(name .. ": " .. round(avg, 4))
			end
		end
		love.timer.frameCount = love.timer.frameCount + 1
	end
end

love.debug.toPrint = {}
function love.debug.print(str)
	table.insert(love.debug.toPrint, str)
end

function love.debug.printProfiles()
	local printoffset = 0
	for k,v in pairs(love.debug.toPrint) do
		love.graphics.print(v, 0, printoffset)
		printoffset = printoffset + 12
	end
end

function love.debug.printResetNoPrint()
	love.debug.toPrint = {}
end


local shouldCache = true
local shouldLoadCache = true
function loadJSON(path)
	if(shouldLoadCache == true) then
		if love.filesystem.isFile("cache/" .. path .. ".lua") then
			local luaStr = love.filesystem.read("cache/" .. path .. ".lua")
			print("Load from cache: " .. path)
			local luaObj = marshal.decode(luaStr)
			if(luaObj == nil) then
				print("Failed to load " .. path .. "from cache")
			end
			return luaObj
		end
	end
	local contents, size = love.filesystem.read(path);
	local json = JSON:decode(contents)
	
	if(shouldCache == true) then
		love.filesystem.createDirectory( "cache" )
		love.filesystem.createDirectory( "cache/json" )
		love.filesystem.createDirectory( "cache/content/json/jsonmaps" )
		local luaStr = marshal.encode(json)
	
		if(not love.filesystem.write("cache/" .. path .. ".lua", luaStr)) then
			print("Failed to write cache to: " .. "cache/" .. path .. ".lua")
		end
	end
	print("Load from json: " .. path)
	
	return json
end

function tprint (tbl, indent)
	if not indent then indent = 0 end
	for k, v in pairs(tbl) do
		formatting = string.rep("  ", indent) .. k .. ": "
		if type(v) == "table" then
			print(formatting)
			--tprint(v, indent+1)
		elseif type(v) == 'boolean' then
			print(formatting .. tostring(v))      
		elseif type(v) == 'function' then
			print(formatting .. tostring(v))
		elseif type(v) == 'userdata' then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end

function table.contains(tbl, value)
	for k,v in pairs(tbl) do
		if(v == value) then
			return true
		end
	end
	return false
end

function love.graphics.cross(x,y,scale)
	scale = scale or 2
	love.graphics.line(x-scale,y-scale,x+scale,y+scale)
	love.graphics.line(x+scale,y-scale,x-scale,y+scale)
end

function table.copy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
	for orig_key, orig_value in next, orig, nil do
		copy[table.copy(orig_key)] = table.copy(orig_value)
	end
		setmetatable(copy,table.copy(getmetatable(orig)))
	else
		copy = orig
	end
	return copy
end

function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

function math.clamp(num,_min,_max)
	return math.max(math.min(num,_max),_min)
end

function table.find(t,element)
	for k,v in pairs(t) do
		if v == element then
			return k
		end
	end
end

function getBasename(filename)
  return filename:match("^([^%.]*)%.?") -- "myfile.lua" -> "myfile"
end

function table.prealloc(n)
	local obj = {}
	for i=1, n do
		obj[i] = false
	end

	return obj
end



local currentStateX = 0
local currentStateY = 0
local currentStateScaleX = 1
local currentStateScaleY = 1
love.graphics._translate = love.graphics.translate
love.graphics._push = love.graphics.push
love.graphics._pop = love.graphics.pop
love.graphics._scale = love.graphics.scale
love.graphics._rotate = love.graphics.rotate
love.graphics._orgin = love.graphics.orgin

local states = {}
local statesPos = 1000
states[statesPos] = { x=0, y=0, scalex = 1, scaley = 1 }

function love.graphics.translate(dx,dy)
	states[statesPos].x = states[statesPos].x + dx
	states[statesPos].y = states[statesPos].y + dy

	love.graphics._translate(dx,dy)
end

function love.graphics.pop()
	statesPos = statesPos - 1

	love.graphics._pop()
end

function love.graphics.push()
	local cpy = table.copy(states[statesPos])
	statesPos = statesPos + 1
	states[statesPos] = cpy

	love.graphics._push()
end

function love.graphics.scale(sx, sy)
	states[statesPos].scalex = sx
	states[statesPos].scaley = sy

	love.graphics._scale(sx,sy)
end

function love.graphics.translateQuad(x,y,w,h)
	local s = states[statesPos]
	return (x + s.x) * s.scalex, (y + s.y) * s.scaley, w * s.scalex, h * s.scaley
end

function love.graphics.orgin()
	states[statesPos] = { x=0, y=0, scalex = 1, scaley = 1 }
	love.graphics._origin()
end