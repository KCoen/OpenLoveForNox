renderer = {}
renderer.batches = {}
renderer.batches["objects"] = { batchType = "OBJECT" }
renderer.batches["wallA"] = { batchType = "WALL" }
renderer.batches["wallB"] = { batchType = "WALL"}

local ffi = require("ffi")

ffi.cdef[[
typedef struct WallData
{
	uint8_t x1, x2, y1, y2;
} WallData;
]]
local C_wallData = ffi.metatype("WallData", {})

ffi.cdef[[
typedef struct ObjectData
{
	uint8_t x1, x2, y1, y2;
	uint8_t Color1R, Color1G, Color1B, Color1A;
	uint8_t Color2R, Color2G, Color2B, Color2A;
	uint8_t Color3R, Color3G, Color3B, Color3A;
	uint8_t Color4R, Color4G, Color4B, Color4A;
	uint8_t Color5R, Color5G, Color5B, Color5A;
	uint8_t Color6R, Color6G, Color6B, Color6A;
	uint8_t FadeControlR, FadeControlG, FadeControlB, FadeControlA;
} ObjectData;
]]
local C_objectData = ffi.metatype("ObjectData", {})

--[[
ffi.cdef[[
typedef struct ImageData_Pixel
{
	uint8_t r, g, b, a;
} ImageData_Pixel;
]
local C_ImageData_Pixel = ffi.typeof("ImageData_Pixel *")
local C_char = ffi.typeof("unsigned char *")--]]

local function distance( x1, y1, x2, y2 )
	local dx = x1 - x2
	local dy = y1 - y2
	return ( dx * dx + dy * dy )
end

function GetClosestWallPoint(wall, cx ,cy)
	local shortestDistance = 100000000
	local index = nil
	local nwallpoitns = #wall.points
	for k = 1, nwallpoitns do
		local dist = distance(wall.points[k].X, wall.points[k].Y, cx, cy)
		if(dist < shortestDistance) then
			shortestDistance = dist
			index = k
		end
	end
	
	return wall.points[index].X, wall.points[index].Y
end

local function setPixelFaster(fastBuffer, x,y,r,g,b,a)

	fastBuffer[x + y * 512].x1 = r-- = string.char(r,g,b,a)
	fastBuffer[x + y * 512].x2 = g
	fastBuffer[x + y * 512].y1 = b
	fastBuffer[x + y * 512].y2 = a


	--[[local pointer = ffi.cast(C_ImageData_Pixel,imgdata:getPointer())
	local pColor = ffi.cast(C_char,string.char(r,g,b,a))

	pointer = pointer + x + y * 512

	ffi.copy(pointer,pColor,4); --]]
end
--[[
local function completeTransaction(imgdata, fastBuffer)
	local pointer = ffi.cast(C_ImageData_Pixel,imgdata:getPointer())

	for k,v in pairs(fastBuffer) do 
		local p2 = pointer + k
		local pColor = ffi.cast(C_char,v)
		ffi.copy(p2,pColor,4); 
	end

	fastBuffer = {}
end]]

local debugCOLOR = { 255, 0, 255, 255 }

function renderer.addToBatch(obj, batchname)
	local height = obj.height or 0

	local lbatch = renderer.batches[batchname]

	local lquad
	if(obj.isonelevator and obj.height < 0) then 
		-- Clip the object when moving under the floor, looks like ass but its done like that in the original game.
		-- Maybe make or get somebody to make some clipping masks for the various holes at some point.
		local x,y,w,h = obj.quad:getViewport()
		
		local clip = (h + obj.drawOffsetY + obj.y - obj.height) - (obj.isonelevator.y + 12)

		lquad = love.graphics.newQuad(x,y,w,h - clip, obj.img:getDimensions())
	else
		lquad = obj.quad
	end

	if(not obj.x) then
		tprint(obj)
	end
	

	lbatch.batch:add(lquad, round(obj.x + obj.drawOffsetX), round(obj.y + obj.drawOffsetY - height))

	local x, y
	if(obj.type == "WALL") then
		local cx,cy = camera.x,camera.y
		x,y = camera:worldToLocal(GetClosestWallPoint(obj, cx, cy))
	else
		x,y = camera:worldToLocal(obj.x,obj.y)	
	end

	if(x < 0) then
		x = 0
	end
	if(y < 0) then
		y = 0
	end

	if(obj.type == "WALL") then
		local buffer = lbatch.fastBuffer[lbatch.textureDataOffset]
		buffer.x1 = x % 255
		buffer.x2 = (x - (x % 255)) / 255
		buffer.y1 = y % 255
		buffer.y2 = (y - (y % 255)) / 255
	else
		local buffer = lbatch.fastBuffer[lbatch.textureDataOffset]
		buffer.x1 = x % 255
		buffer.x2 = (x - (x % 255)) / 255
		buffer.y1 = y % 255
		buffer.y2 = (y - (y % 255)) / 255

		if(obj.COLOR1) then
			buffer.Color1R = obj.COLOR1[1]
			buffer.Color1G = obj.COLOR1[2]
			buffer.Color1B = obj.COLOR1[3]
			buffer.Color1A = obj.COLOR1[4]
		else
			buffer.Color1R = debugCOLOR[1]
			buffer.Color1G = debugCOLOR[2]
			buffer.Color1B = debugCOLOR[3]
			buffer.Color1A = debugCOLOR[4]
		end

		if(obj.COLOR2) then
			buffer.Color2R = obj.COLOR2[1]
			buffer.Color2G = obj.COLOR2[2]
			buffer.Color2B = obj.COLOR2[3]
			buffer.Color2A = obj.COLOR2[4]
		else
			buffer.Color2R = debugCOLOR[1]
			buffer.Color2G = debugCOLOR[2]
			buffer.Color2B = debugCOLOR[3]
			buffer.Color2A = debugCOLOR[4]
		end

		if(obj.COLOR3) then
			buffer.Color3R = obj.COLOR3[1]
			buffer.Color3G = obj.COLOR3[2]
			buffer.Color3B = obj.COLOR3[3]
			buffer.Color3A = obj.COLOR3[4]
		else
			buffer.Color3R = debugCOLOR[1]
			buffer.Color3G = debugCOLOR[2]
			buffer.Color3B = debugCOLOR[3]
			buffer.Color3A = debugCOLOR[4]
		end

		if(obj.COLOR4) then
			buffer.Color4R = obj.COLOR4[1]
			buffer.Color4G = obj.COLOR4[2]
			buffer.Color4B = obj.COLOR4[3]
			buffer.Color4A = obj.COLOR4[4]
		else
			buffer.Color4R = debugCOLOR[1]
			buffer.Color4G = debugCOLOR[2]
			buffer.Color4B = debugCOLOR[3]
			buffer.Color4A = debugCOLOR[4]
		end

		if(obj.COLOR5) then
			buffer.Color5R = obj.COLOR5[1]
			buffer.Color5G = obj.COLOR5[2]
			buffer.Color5B = obj.COLOR5[3]
			buffer.Color5A = obj.COLOR5[4]
		else
			buffer.Color5R = debugCOLOR[1]
			buffer.Color5G = debugCOLOR[2]
			buffer.Color5B = debugCOLOR[3]
			buffer.Color5A = debugCOLOR[4]
		end

		if(obj.COLOR6) then
			buffer.Color6R = obj.COLOR6[1]
			buffer.Color6G = obj.COLOR6[2]
			buffer.Color6B = obj.COLOR6[3]
			buffer.Color6A = obj.COLOR6[4]
		else
			buffer.Color6R = debugCOLOR[1]
			buffer.Color6G = debugCOLOR[2]
			buffer.Color6B = debugCOLOR[3]
			buffer.Color6A = debugCOLOR[4]
		end


		if(obj.nopartial) then
			buffer.FadeControlR = 255
			buffer.FadeControlG = 255
			buffer.FadeControlB = 255
			buffer.FadeControlA = 255
		else
			buffer.FadeControlR = 0
			buffer.FadeControlG = 0
			buffer.FadeControlB = 0
			buffer.FadeControlA = 0
		end
	end

	lbatch.textureDataOffset = lbatch.textureDataOffset + 1	
end

function renderer.drawObject(obj)
	renderer.addToBatch(obj, "objects")
end

function renderer.drawWallA(obj)
	renderer.addToBatch(obj, "wallA")
end

function renderer.drawWallB(obj)
	renderer.addToBatch(obj, "wallB")
end

function renderer.load()
	for k,v in pairs(renderer.batches) do
		v.batch = love.graphics.newSpriteBatch(videobagcache.canvas, 16384)
		v.textureData = love.image.newImageData(512, 512)
		--v.fastBuffer = ffi.cast("void *",v.textureData:getPointer())
		if(v.batchType == "WALL") then
			v.fastBuffer = ffi.cast("WallData *",v.textureData:getPointer())
		else
			v.fastBuffer = ffi.cast("ObjectData *",v.textureData:getPointer())
		end
		
		v.texture = love.graphics.newImage(v.textureData)
		v.textureDataOffset = 0
	end
end

function renderer:update()
	for k,v in pairs(renderer.batches) do
		v.batch:clear()
		v.textureDataOffset = 0
	end
end

function renderer.drawBatch(batchname, useshadow, iswall)
	local v = renderer.batches[batchname]

	--completeTransaction(v.textureData, v.fastBuffer)

	if(useshadow == nil) then
		useshadow = true
	end
	
	local shader
	if(useshadow) then
		shader = shaders.shadowedObject
	else
		shader = shaders.unshadowedObject
	end
	if(iswall) then
		shader = shaders.shadowedWall
	end
	love.graphics.setShader(shader)

	--love.graphics.setColor(255,255,255,255)
	
	if(useshadow) then
		v.texture:refresh()
		shader:send("posbuffer", v.texture)
		shader:send("shadowbuffer", lightEngine.shadowBuffer)
	end
	v.batch:flush()

	v.batch:setTexture(videobagcache.canvas)

	love.graphics.draw(v.batch)
	love.graphics.setShader()
end

function renderer.drawObjects(useshadow)
	renderer.drawBatch("objects", useshadow)
end

function renderer.drawWallsA(useshadow)
	renderer.drawBatch("wallA", useshadow, true)
end

function renderer.drawWallsB(useshadow)
	love.graphics.setColor(255,255,255,128)
	renderer.drawBatch("wallB", useshadow, true)
	love.graphics.setColor(255,255,255,255)
end

function love.graphics.drawLight(x,y,radius,brightness,falloff)
	local lx,ly = camera:worldToLocal(x,y)
	shaders.lightHalo:send("light_pos",{lx,ly,0}) -- shader needs this in screen space :/
	shaders.lightHalo:send("light_info",{radius,brightness or 1,falloff or 2})
	love.graphics.rectangle("fill",x-radius,y-radius,radius*2,radius*2)
end