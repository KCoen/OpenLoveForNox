renderer = {}
renderer.batches = {}
renderer.batches["objects"] = {}
renderer.batches["wallA"] = {}
renderer.batches["wallB"] = {}

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

function renderer.addToBatch(obj, batchname)
	local height = 0
	if(obj.isonelevator) then
		height = (obj.isonelevator.elevatorheight - 1) * 4
	end

	local lbatch = renderer.batches[batchname]
	lbatch.batch:add(obj.quad, round(obj.x + obj.drawOffsetX), round(obj.y + obj.drawOffsetY - height))

	

	local x, y
	if(obj.type == "WALL") then
		local cx,cy = player.x,player.y
		x,y = camera:worldToLocal(GetClosestWallPoint(obj, cx, cy))
	else
		x,y = camera:worldToLocal(obj.x,obj.y)	
	end

	-- todo, find a way to avoid calling setPixel 7 items per object/wall etc
	lbatch.textureData:setPixel(
		lbatch.textureDataOffset % 512, 
		(lbatch.textureDataOffset - (lbatch.textureDataOffset % 512)) / 512,
		x % 255,
		(x - (x % 255)) / 255,
		y % 255,
		(y - (y % 255)) / 255
		)

	lbatch.textureDataOffset = lbatch.textureDataOffset + 1

	if(obj.type ~= "WALL") then
		local colors = {}
		colors[1] = obj.COLOR1 or { 255, 0, 255, 255 }
		colors[2] = obj.COLOR2 or { 255, 0, 255, 255 }
		colors[3] = obj.COLOR3 or { 255, 0, 255, 255 }
		colors[4] = obj.COLOR4 or { 255, 0, 255, 255 }
		colors[5] = obj.COLOR5 or { 255, 0, 255, 255 }
		colors[6] = obj.COLOR6 or { 255, 0, 255, 255 }

		for k,v in ipairs(colors) do
			lbatch.textureData:setPixel(
			lbatch.textureDataOffset % 512, 
			(lbatch.textureDataOffset - (lbatch.textureDataOffset % 512)) / 512,
			v[1],
			v[2],
			v[3],
			v[4]
			)

			lbatch.textureDataOffset = lbatch.textureDataOffset + 1
		end

		if(obj.nopartial) then
			lbatch.textureData:setPixel(
				lbatch.textureDataOffset % 512, 
				(lbatch.textureDataOffset - (lbatch.textureDataOffset % 512)) / 512,
				255,
				255,
				255,
				255
			)
		else
			lbatch.textureData:setPixel(
				lbatch.textureDataOffset % 512, 
				(lbatch.textureDataOffset - (lbatch.textureDataOffset % 512)) / 512,
				0,
				0,
				0,
				0
			)
		end
		lbatch.textureDataOffset = lbatch.textureDataOffset + 1
	end

	
	
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
		v.texture = love.graphics.newImage(v.textureData)
		v.textureDataOffset = 0
	end
end

function renderer.update()
	for k,v in pairs(renderer.batches) do
		v.batch:clear()
		v.textureDataOffset = 0
	end
end

function renderer.drawBatch(batchname, useshadow, iswall)
	local v = renderer.batches[batchname]

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