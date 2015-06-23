require("spatialhash")
require("player")
require("DrawTypes")
require("physics")
require("Wall")
require("Object")

map = {}

local G = love.graphics
local sqrt = math.sqrt

function rest(xs)
	local ys = {}
	for i = 2, #xs do
		table.insert(ys, xs[i])
	end
	return ys
end

function concat(xs, ys)
	local zs = {}
	for _, v in ipairs(xs) do
		table.insert(zs, v)
	end
	for _, v in ipairs(ys) do
		table.insert(zs, v)
	end
	return zs
end

function qsort(xs)
	if (#xs < 2) then
	 	return xs
	end
	local pObj = xs[1]
	local p = (xs[1].y + xs[1].z)

	local lesser, greater = {}, {}
	local nxs = #xs
	for i=2, nxs do
		if (xs[i].y + xs[i].z) <= p then
			lesser[#lesser + 1] = xs[i]
		else
			greater[#greater + 1] = xs[i]
		end
	end

	return concat(qsort(lesser), concat({pObj}, qsort(greater)))
end

function map:SortObjects(objects)
	return qsort(objects)
end

function map:preCacheFloorTiles()
	self.floortileSize = gameconf.maptilechunksize
	self.floorCache = {}
	
	for x=1,gameconf.maxmapsize/self.floortileSize do
		self.floorCache[x] = self.floorCache[x] or {}
		for y=1, gameconf.maxmapsize/self.floortileSize do
			self.floorCache[x][y] = {}

			local canvas = G.newCanvas(gameconf.maptilechunksize, gameconf.maptilechunksize)
			G.setCanvas(canvas)
		
			canvas:clear()

			local x1 = (x - 1) * self.floortileSize
			local y1 = (y - 1) * self.floortileSize
			
			G.push()
			G.translate(-1 * x1, -1 * y1)
			
			for tile in map.Tiles:Iter(x1 - 128, y1 - 128, gameconf.maptilechunksize + 128, gameconf.maptilechunksize + 128) do
				G.draw(tile.img, tile.quad, tile.x + tile.drawOffsetX, tile.y + tile.drawOffsetY)
			end

			
			
			G.setShader(shaders.edgeBlend)
			for tile in map.TileEdges:Iter(x1 - 128, y1 - 128, gameconf.maptilechunksize + 128, gameconf.maptilechunksize + 128) do
				local q1x,q1y,q1w,q1h = tile.quad:getViewport()
				local q2x,q2y,q2w,q2h = tile.BlendQuad:getViewport()
				shaders.edgeBlend:send("imgOverlay",tile.BlendImg)
				shaders.edgeBlend:send("quadInfoA",{q1x,q1y,q1w,q1h})
				shaders.edgeBlend:send("quadInfoB",{q2x,q2y,q2w,q2h})
				G.draw(tile.img, tile.quad, tile.x + tile.drawOffsetX, tile.y + tile.drawOffsetY)
			end
			G.setShader()
				
			for obj in map.Objects:Iter(x1 - 128, y1 - 128, gameconf.maptilechunksize + 128, gameconf.maptilechunksize + 128) do
				if(obj.renderer) then
					if(obj.flags["BELOW"] and obj.class["IMMOBILE"]) then
						obj.renderer:draw(obj)
						map.Objects:removeObject(obj)
					end
				end
				--G.draw(obj.img, obj.quad, tile.x + tile.drawOffsetX, tile.y + tile.drawOffsetY)
			end
			renderer.drawObjects(false)
			renderer.update()

			G.pop()
			
			G.setCanvas()
			
			self.floorCache[x][y].canvas = canvas		
		end
	end
end

function map:fixTilePosition(x,y)
	return x - 11, y + 11
end


local function distance( x1, y1, x2, y2 )
	local dx = x1 - x2
	local dy = y1 - y2
	return ( dx * dx + dy * dy )
end

function map:GetClosestWallPointToMouse(wall, cx ,cy)
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

function map:load()
	love.timer.starTimer("Map Load")
	
	map.Tiles = SpatialHash.new(gameconf.maxmapsize, gameconf.maxmapsize, gameconf.mapchunksize)
	map.TileEdges = SpatialHash.new(gameconf.maxmapsize, gameconf.maxmapsize, gameconf.mapchunksize)
	map.Objects = SpatialHash.new(gameconf.maxmapsize, gameconf.maxmapsize, gameconf.mapchunksize)
	map.Walls = SpatialHash.new(gameconf.maxmapsize, gameconf.maxmapsize, gameconf.mapchunksize)

	for k, obj in pairs(Map.Objects) do		
		local object = ObjectFromMapObject(obj)
		map.Objects:add(object)
	end
	
	for k, obj in pairs(Map.Walls) do
		local wall = WallFromMapWall(obj.Value)
		map.Walls:add(wall)
	end
	
	for k, obj in pairs(Map.Tiles) do
		local mtile = obj.Value
		local tile = {}
		tile.mtile = mtile
		tile.spriteId = mtile.Variations[mtile.Variation +1]
		tile.quad, tile.img = GetTile(tile.spriteId)
		
		tile.x = mtile.Location.X * 23
		tile.y = mtile.Location.Y * 23
		tile.width = 46
		tile.height = 46
		tile.drawOffsetX, tile.drawOffsetY = map:fixTilePosition(0, 0)
		
		map.Tiles:add(tile)
		
		for k2, edgetile in pairs(mtile.EdgeTiles) do
			local etile = {}
			etile.x = tile.x
			etile.y = tile.y
			etile.drawOffsetX = tile.drawOffsetX
			etile.drawOffsetY = tile.drawOffsetY
			etile.spriteId =  ThingDB.EdgeTiles[edgetile.Edge + 1].Variations[edgetile.Dir + 1]
			etile.quad, etile.img = GetTileEdge(etile.spriteId)
			etile.BlendSpriteId =  ThingDB.FloorTiles[edgetile.Graphic + 1].Variations[edgetile.Variation + 1]
			etile.BlendQuad, etile.BlendImg = GetTile(etile.BlendSpriteId)
			map.TileEdges:add(etile)
		end
	end
	
	self.shadowmesh = G.newMesh( 5000, nil, "triangles" )
	map:preCacheFloorTiles()
	love.timer.stopTimer("Map Load")
end

function map:drawCachedFloor()
	for x=1,gameconf.maxmapsize/self.floortileSize do
		for y=1, gameconf.maxmapsize/self.floortileSize do
			G.setBlendMode('premultiplied')
			G.setColor(255,255,255)
			G.draw(self.floorCache[x][y].canvas, (x-1) * self.floortileSize, (y-1) * self.floortileSize)
			G.setBlendMode('alpha')
		end
	end
end

local shadowMesh = {
	vertices = {},
	length = 0,
	oversize = 1
}

local function insertVertex(verts,i,x,y)
	verts[i] = verts[i] or {0,0}
	verts[i][1] = x
	verts[i][2] = y
end

function shadowMesh:constructEdgeShadow(cx,cy,x1,y1,x2,y2)
	local verts,offset,oversize,len = self.vertices,self.length,self.oversize,0
	
	--[[verts[offset+1] = { x1, y1 }
	verts[offset+2] = { x2, y2 }
	verts[offset+3] = { verts[offset +2][1]-cx, verts[offset +2][2]-cy }
	verts[offset+4] = { verts[offset +1][1]-cx, verts[offset +1][2]-cy }
	len = sqrt(verts[offset +3][1]*verts[offset + 3][1]+verts[offset + 3][2]*verts[offset + 3][2])
	verts[offset+3] = { verts[offset + 2][1]+verts[offset + 3][1]/len*oversize, verts[offset + 2][2]+verts[offset + 3][2]/len*oversize }
	len = sqrt(verts[offset+4][1]*verts[offset+4][1]+verts[offset+4][2]*verts[offset+4][2])
	verts[offset+4] = { verts[offset+1][1] + verts[offset+4][1]/len*oversize, verts[offset+1][2] + verts[offset+4][2]/len*oversize }
	verts[offset+5] = verts[offset+3]
	verts[offset+6] = verts[offset+1]--]]
	
	insertVertex(verts, offset+1, x1, y1)
	insertVertex(verts, offset+2, x2, y2)
	insertVertex(verts, offset+3, verts[offset +2][1]-cx, verts[offset +2][2]-cy)
	insertVertex(verts, offset+4, verts[offset +1][1]-cx, verts[offset +1][2]-cy)
	len = sqrt(verts[offset +3][1]*verts[offset + 3][1]+verts[offset + 3][2]*verts[offset + 3][2])
	insertVertex(verts, offset+3, verts[offset + 2][1]+verts[offset + 3][1]/len*oversize, verts[offset + 2][2]+verts[offset + 3][2]/len*oversize)
	len = sqrt(verts[offset+4][1]*verts[offset+4][1]+verts[offset+4][2]*verts[offset+4][2])
	insertVertex(verts, offset+4, verts[offset+1][1] + verts[offset+4][1]/len*oversize, verts[offset+1][2] + verts[offset+4][2]/len*oversize)
	insertVertex(verts, offset+5, verts[offset+3][1], verts[offset+3][2])
	insertVertex(verts, offset+6, verts[offset+1][1], verts[offset+1][2])
	
	self.length = offset+6
end

physDebug = {
	objects = {},
	length = 0
}

function physDebug:insert(shapeType,coords)
	local length = self.length+1
	local objects = self.objects
	objects[length] = objects[length] or {shapeType = false,coords = false}
	objects[length].shapeType = shapeType
	objects[length].coords = coords
	self.length = length
end

function physDebug:draw()
	if(gameconf.debug) then
		if self.length > 0 then
			camera:push()
			local physobjs = self.objects
			for j = self.length+1,#physobjs do
				physobjs[j] = nil
			end
			for k,v in ipairs(physobjs) do
				if v.shapeType == "circle" then
					G.circle("line",v.coords[1],v.coords[2],v.coords[3],16)
				elseif v.shapeType == "polygon" then
					G.polygon("line",v.coords)
				elseif v.shapeType == "edge" then
					G.line(v.coords)
				end
			end
			camera:pop()
		end
	end
end

function map:drawShadows(objects, walls)	
	local oldCanvas = G.getCanvas()
	G.setCanvas(lightEngine.shadowBuffer)
	lightEngine.shadowBuffer:clear(255,255,255,255)
	
	local bodies = physworld:getBodyList()
	shadowMesh.oversize = (camera.wwidth*camera.wwidth+camera.wheight*camera.wheight) --???
	shadowMesh.length = 0
	local cx,cy = player.x, player.y
	
	physDebug.length = 0
	
	if(gameconf.debug) then
		for i=1, #objects do
			local obj = objects[i]
			if (obj.phys) then
				for k,v in ipairs(obj.phys) do
					local body = v.body 
					--local posx, posy = body:getPosition()
					local fixtures = body:getFixtureList()

					for i2=1, #fixtures do -- in pairs(fixtures) do
						local shape = fixtures[i2]:getShape()
						local shapeType = shape:getType()
						if shapeType == "polygon" then
							local coords = {body:getWorldPoints(shape:getPoints())}
							
							physDebug:insert(shapeType,coords)
						elseif shapeType == "circle" then
							local x1,y1 = body:getWorldPoint(shape:getPoint())
							local r = shape:getRadius()
							
							physDebug:insert(shapeType,{x1,y1,r})
						end


					end
				end
			end
		end
	end

	for i=1, #objects do
		local obj = objects[i]
		if (obj.phys and obj.type == "DOOR") then
			for k,v in ipairs(obj.phys) do
				local body = v.body 
				--local posx, posy = body:getPosition()
				local fixtures = body:getFixtureList()

				for i2=1, #fixtures do -- in pairs(fixtures) do
					local shape = fixtures[i2]:getShape()
					local shapeType = shape:getType()
					if shapeType == "polygon" then
						local coords = {body:getWorldPoints(shape:getPoints())}
						
						for i3=1, #coords - 2, 2 do
							shadowMesh:constructEdgeShadow(cx,cy,coords[i3],coords[i3+1],coords[i3+2],coords[i3+3])
						end
					end
				end
			end
		end
	end
	
	for i=1, #walls do
		local obj = walls[i]
		if(not obj.window and not obj.transparent) then
			if(obj.phys) then
				for k,v in ipairs(obj.phys) do
					local body = v.body 
					--local posx, posy = body:getPosition()
					local fixtures = body:getFixtureList()

					for i2 = 1, #fixtures do
						local shape = fixtures[i2]:getShape()
						local shapeType = shape:getType()
						if shapeType == "edge" then
							local x1, y1, x2, y2 = body:getWorldPoints(shape:getPoints())
							
							shadowMesh:constructEdgeShadow(cx,cy,x1,y1,x2,y2)
							
							if(gameconf.debug) then
								physDebug:insert(shapeType,{x1,y1,x2,y2})
							end
						end
					end
				end
			end
		end
	end
	
	local shadow_verts = shadowMesh.vertices
	love.debug.print("shadow vertices: "..tostring(shadowMesh.length+1).."/"..tostring(#shadow_verts))
	for j = shadowMesh.length+1,#shadow_verts do
		shadow_verts[j] = nil
	end
	
	G.setColor(0,0,0,255)
	--local mesh = G.newMesh(shadow_verts, nil, "triangles")
	
	if shadowMesh.length > 0 then
		self.shadowmesh:setVertices(shadow_verts)
		G.draw(self.shadowmesh, 0, 0)
	end
	
	--G.polygon("fill",shadow_verts)
	G.setColor(255,255,255,255)
	
	G.setCanvas(oldCanvas)
	G.setColor(255,255,255,255)
	
	shaders.blurH:send("screen",{G.getWidth(),G.getHeight()})
	shaders.blurV:send("screen",{G.getWidth(),G.getHeight()})
	shaders.blurH:send("steps",round(8/camera.scale))
	shaders.blurV:send("steps",round(8/camera.scale))
	
	camera:pop()
	oldCanvas = G.getCanvas()
	G.setCanvas(lightEngine.shadowBufferObjects)
	G.setShader(shaders.blurV)
	G.draw(lightEngine.shadowBuffer,0,0)
	G.setCanvas(lightEngine.shadowBuffer)
	G.setShader(shaders.blurH)
	G.draw(lightEngine.shadowBufferObjects,0,0)
	G.setCanvas(oldCanvas)
	G.setShader()
	G.setBlendMode("multiplicative")
	G.draw(lightEngine.shadowBuffer,0,0)
	G.setBlendMode("alpha")
	camera:push()
	
end

function map:drawObjects(objects)	
	local cx,cy = player.x,player.y

	local nobjects = 0
	for i=1, #objects do
		local obj = objects[i]
		if(obj.renderer) then
			obj.renderer:draw(obj)
			nobjects = nobjects + 1
		elseif(obj.draw) then
			obj:draw()
		end
	end

	love.debug.print("Number of Objects drawn: " .. nobjects)
end

function map:drawWalls(walls)
	local cx,cy = player.x,player.y

	for i=1, #walls do
		local obj = walls[i]
		if (obj.img) then
			local drawA = false
			if (obj.Facing == WallFacing["NORTH"] or obj.Facing == WallFacing["NW_CORNER"] or obj.Facing == WallFacing["SOUTH_T"] or obj.Facing == WallFacing["NORTH_T"]) then
				if (obj.centerX + obj.centerY < player.x + player.y) then
					drawA = true
				else
					drawA = false
				end
			elseif (obj.Facing == WallFacing["WEST"] or obj.Facing == WallFacing["SE_CORNER"] or obj.Facing == WallFacing["WEST_T" ] or obj.Facing == WallFacing["EAST_T"]) then
				if (obj.centerX - obj.centerY > player.x - player.y) then
					drawA = true
				else
					drawA = false
				end
			else
				if (obj.centerY < player.y) then
					drawA = true
				else
					drawA = false
				end
			end
			if (drawA == true) then
				renderer.drawWallA(obj)
			else
				renderer.drawWallB(obj)
			end
		end
	end
end

--[[
function map:objectLOSPass(objects,walls) -- obsolete, dont delete yet though
	camera:pop()
	local oldCanvas = G.getCanvas()
	G.setCanvas(lightEngine.shadowBufferObjects)
	G.draw(lightEngine.shadowBuffer,0,0)
	camera:push()
	
	G.setShader(shaders.sampleShadow)
	G.setColor(255,255,255,255)
	local cx,cy = player.x,player.y
	shaders.sampleShadow:send("wall",false)
	--for obj in map.Objects:Iter(x1, y1, x2, y2) do
	for i=1, #objects do
		local obj = objects[i]
		if obj.spriteId then
			--i = i + 1
			local x,y = obj.x,obj.y
			shaders.sampleShadow:send("pos",{camera:worldToLocal(x,y)})
			G.draw(obj.img, obj.quad, obj.x + obj.drawOffsetX, obj.y + obj.drawOffsetY)
		end
	end
	shaders.sampleShadow:send("wall",true)
	--for obj in map.Walls:Iter(x1, y1, x2, y2) do
	for i=1, #walls do
		local obj = walls[i]
		if obj.spriteId and obj.img then	
			--i = i + 1
			local x,y = self:GetClosestWallPointToMouse(obj, cx ,cy)
			shaders.sampleShadow:send("pos",{camera:worldToLocal(x,y)})
			G.draw(obj.img, obj.quad, obj.x + obj.drawOffsetX, obj.y + obj.drawOffsetY)
		end
	end
	camera:pop()
	G.setShader()
	G.setCanvas(oldCanvas)
end]]


function map:drawLights(objects)
	if not screenBuffer then
		return;
	end

	local oldCanvas = G.getCanvas()
	local ambient = {126,110,100}
	shaders.lightHalo:send("cam_scale",camera.scale)
	G.setCanvas(lightEngine.shadowBuffer)
	lightEngine.shadowBuffer:clear(ambient[1],ambient[2],ambient[3],255)
	G.setBlendMode("additive")
	G.setShader(shaders.lightHalo)
	local theTime = love.timer.getTime()
	for i=1,#objects do
		local obj = objects[i]
		if obj.tt.Xfer == "InvisibleLightXfer" then
			local ObjXfer = obj.mobject.ObjXfer
			local color = ObjXfer.BaseColor
			local intensity = ObjXfer.LightIntensity/255
			local radius = ObjXfer.LightRadius
			local changeColors = ObjXfer.ChangeColors
			--[[local index = ObjXfer.ColorChangeIndex
			obj.lightUpdateTime = obj.lightUpdateTime or 0
			if obj.lightUpdateTime < theTime then
				obj.lightUpdateTime = theTime+0.15
				index = index+1
				if index > #changeColors then
					index = 1
				end
				ObjXfer.ColorChangeIndex = index
			end--]]
			color = changeColors[ObjXfer.StateMB+1]
			G.setColor(color.R,color.G,color.B,255)
			G.drawLight(obj.x,obj.y,radius,intensity,2)
		end
	end
	G.setBlendMode("alpha")
	G.setShader()
	G.setColor(255,255,255,255)
	G.setCanvas(lightEngine.shadowBufferObjects)
	camera:pop()
	G.setShader(shaders.overBright)
	--G.setBlendMode("multiplicative")
	G.draw(oldCanvas,0,0)
	G.setShader()
	G.setCanvas(oldCanvas)
	G.draw(lightEngine.shadowBufferObjects,0,0)
	camera:push()
end

function map:draw()
	if screenBuffer then
		G.setCanvas(screenBuffer)
		screenBuffer:clear(0,0,0,255)
	end
	
	camera:push()
	G.setColor(255,255,255,255)
	
	local x1, y1, x2, y2 = camera:worldaabb()
	
	local objects = self.Objects:getPVS(x1,y1,x2,y2)
	objects = self:SortObjects(objects)

	local walls = self.Walls:getPVS(x1,y1,x2,y2)
	love.debug.print("Number of Walls drawn: " .. #walls)
	
	map:drawCachedFloor()
	
	map:drawShadows(objects,walls)
	map:drawWalls(walls)
	renderer.drawWallsA()
	
	map:drawObjects(objects)
	renderer.drawObjects()
	renderer.drawWallsB()
	G.setColor(255,255,255,255)
	
	map:drawLights(objects)
	
	camera:pop()
	
	if screenBuffer then
		G.setCanvas()
		G.setColor(255,255,255,255)
		G.draw(screenBuffer,0,0)
		G.setShader()
	end
	
	physDebug:draw()
	
	love.timer.drawProfiles()
end

function map:update(dt)
	love.timer.startProfile("Physics update")
	love.timer.stopProfile("Physics update")	
end