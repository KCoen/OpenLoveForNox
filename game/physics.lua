require("Colliders")

physics = {}
physics.objects = {}

function physics:load()
	love.physics.setMeter(23)
	physworld = love.physics.newWorld(0, 0, true)
	physworldbody = love.physics.newBody(physworld,1,1)
end

function physics:InitObjectPhysics(obj)
	if not obj.flags["NO_COLLIDE"] and obj.tt.Collide then
		if obj.tt.Collide == "DefaultCollide" then
			
		elseif obj.tt.Collide == "NoCollide" then

		else
			print("Unsupported collision type: " .. obj.tt.Collide)
		end
		
		
	end


	if not obj.class["IMMOBILE"] then
		if(obj.phys) then
			self:registerDynamicObject(obj)
		end
	end
end

function physics:AddWallPart(wall, pos1, pos2)	
	-- Try to merge walls
	if(not wall.destructable) then
		for pswall in map.Walls:Iter(pos1.X - 512, pos1.Y - 512, 1024, 1024) do
			if(pswall.phys) then
				if(wall.window ~= pswall.window) or (wall.transparent ~= pswall.transparent) then
					goto lend
				end
				for k=1, #pswall.phys do
					local body = pswall.phys[k].body
					local shape = pswall.phys[k].shape
					local fix = pswall.phys[k].fix
					local x1, y1, x2, y2 = body:getWorldPoints(shape:getPoints())


					if(math.abs(math.abs(x2) - math.abs(pos2.X)) < 0.1 and math.abs(math.abs(y2) - math.abs(pos2.Y)) < 0.1) then
						local dx = x2 - x1 
						local dy = y2 - y1
						
						local dx2 = pos1.X - pos2.X
						local dy2 = pos1.Y - pos2.Y
						
						local length = math.sqrt(dx^2 + dy^2)
						local length2 = math.sqrt(dx2^2 + dy2^2)
						
						dx = dx / length
						dy = dy / length
						
						dx2 = dx2 / length2
						dy2 = dy2 / length2
						
						if(math.abs(math.abs(dx - dx2)) < 0.1 and math.abs(math.abs(dy - dy2)) < 0.1) then
							pswall.phys[k].body = love.physics.newBody(physworld, pos1.X, pos1.Y)
							pswall.phys[k].shape = love.physics.newEdgeShape(0,0, x1 - pos1.X, y1 - pos1.Y)
							pswall.phys[k].fix = love.physics.newFixture(pswall.phys[k].body, pswall.phys[k].shape)		
							physics:setFilterData(pswall.phys[k].fix, "WALL",false, { "DOOR" } )
							return
						end		
					end
					
					if(math.abs(math.abs(x2) - math.abs(pos1.X)) < 0.1 and math.abs(math.abs(y2) - math.abs(pos1.Y)) < 0.1) then
						local dx = x1 - x2
						local dy = y1 - y2
						
						local dx2 = pos1.X - pos2.X
						local dy2 = pos1.Y - pos2.Y
						
						local length = math.sqrt(dx^2 + dy^2)
						local length2 = math.sqrt(dx2^2 + dy2^2)
						
						dx = dx / length
						dy = dy / length
						
						dx2 = dx2 / length2
						dy2 = dy2 / length2
						
						if(math.abs(math.abs(dx - dx2)) < 0.1 and math.abs(math.abs(dy - dy2)) < 0.1) then
							pswall.phys[k].body = love.physics.newBody(physworld, x1, y1)
							pswall.phys[k].shape = love.physics.newEdgeShape(0,0, pos2.X - x1, pos2.Y - y1)
							pswall.phys[k].fix = love.physics.newFixture(pswall.phys[k].body, pswall.phys[k].shape)		
							--pswall.phys[k].fix:setFilterData(1,0x2,0) 
							physics:setFilterData(pswall.phys[k].fix, "WALL",false, { "DOOR" } )
							return
						end		
					end			
				end
				::lend::
			end
		end
	end
	
	wall.phys = wall.phys or {}
	local phys = {}
	phys.body = love.physics.newBody(physworld, pos1.X, pos1.Y)
	phys.shape = love.physics.newEdgeShape(0, 0, pos2.X - pos1.X, pos2.Y - pos1.Y)
	phys.fix = love.physics.newFixture(phys.body, phys.shape)	
	physics:setFilterData(phys.fix, "WALL",false, { "DOOR" } )
	--phys.fix:setFilterData(1,0x2,0) 	
	
	table.insert(wall.phys, phys)
end

local bit16Unroll = { 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768 } 

physics.cats = { WALL = bit16Unroll[1], DOOR = bit16Unroll[2], 
	OBJECT = bit16Unroll[3], OBJECT_SHORT = bit16Unroll[4], 
	PLAYER = bit16Unroll[5], EVERYTHING = 65535 }



function physics:setFilterData(fixture, catagory, shouldcollide, catagorycollidlist)
	local ncollide
	local multi
	if shouldcollide == true then
		multi = 1
		ncollide = 0
	else
		multi = -1
		ncollide = 65535
	end
	for k,v in pairs(catagorycollidlist) do
		ncollide = ncollide + (physics.cats[v] * multi)
	end

	fixture:setFilterData(physics.cats[catagory], ncollide,0 )
end

function physics:AddWallToCollider(wall)
	local squareSize = 23
	
	local x = wall.x
	local y = wall.y

	local center = {}
	center.X = x + squareSize / 2
	center.Y = y + squareSize / 2
	
	local nCorner = {}
	nCorner.X = x
	nCorner.Y = y
	
	local sCorner = {}
	sCorner.X = x + squareSize
	sCorner.Y = y + squareSize
	
	local wCorner = {}
	wCorner.X = x + squareSize
	wCorner.Y = y
	
	local eCorner = {}
	eCorner.X = x
	eCorner.Y = y + squareSize

	if(wall.Facing == WallFacing["NORTH"]) then
		self:AddWallPart(wall,wCorner, eCorner)
	elseif (wall.Facing == WallFacing["WEST"]) then
		self:AddWallPart(wall,nCorner, sCorner)
	elseif (wall.Facing == WallFacing["CROSS"]) then
		self:AddWallPart(wall,wCorner, eCorner)
		self:AddWallPart(wall,nCorner, sCorner)
	elseif (wall.Facing == WallFacing["NORTH_T"]) then
		self:AddWallPart(wall,wCorner, eCorner)
		self:AddWallPart(wall,center, sCorner)
	elseif (wall.Facing == WallFacing["SOUTH_T"]) then
		self:AddWallPart(wall,wCorner, eCorner)
		self:AddWallPart(wall,center, nCorner)
	elseif (wall.Facing == WallFacing["WEST_T"]) then
		self:AddWallPart(wall,nCorner, sCorner)
		self:AddWallPart(wall,center, eCorner)
	elseif (wall.Facing == WallFacing["EAST_T"]) then
		self:AddWallPart(wall,nCorner, sCorner)
		self:AddWallPart(wall,center, wCorner)
	elseif (wall.Facing == WallFacing["NE_CORNER"]) then
		self:AddWallPart(wall,center, eCorner)
		self:AddWallPart(wall,center, sCorner)
	elseif (wall.Facing == WallFacing["NW_CORNER"]) then
		self:AddWallPart(wall,center, wCorner)
		self:AddWallPart(wall,center, sCorner)
	elseif (wall.Facing == WallFacing["SW_CORNER"]) then
		self:AddWallPart(wall,center, nCorner)
		self:AddWallPart(wall,center, wCorner)
	elseif (wall.Facing == WallFacing["SE_CORNER"]) then
		self:AddWallPart(wall,center, nCorner)
		self:AddWallPart(wall,center, eCorner)
	else
		print("unknown wall direction")
	end
end

function physics:update(dt)
	for i=1, #physics.objects do
		local obj = physics.objects[i]
		
		obj.last_x, obj.last_y = obj.x, obj.y
		obj.x, obj.y = obj.phys[1].body:getPosition()
		
		for k,v in pairs(obj.spatialhashes) do
			v:updateObject(obj)
		end
		
	end
	physworld:update(dt)
end

function physics:registerDynamicObject(obj)
	table.insert(physics.objects, obj)
	obj.last_x = obj.x
	obj.last_y = obj.y
end