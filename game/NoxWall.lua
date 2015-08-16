WallFacing = 
{
	NORTH = 0,
	WEST = 1,
	CROSS = 2,
	
	SOUTH_T = 3,
	EAST_T = 4,
	NORTH_T = 5,
	WEST_T = 6,
	
	SW_CORNER = 7,
	NW_CORNER = 8,
	NE_CORNER = 9,
	SE_CORNER = 10
}

function GetWallPoints(wall)
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
		return wCorner, eCorner
	elseif (wall.Facing == WallFacing["WEST"]) then
		return nCorner, sCorner
	elseif (wall.Facing == WallFacing["CROSS"]) then
		return wCorner, eCorner, nCorner, sCorner
	elseif (wall.Facing == WallFacing["NORTH_T"]) then
		return wCorner, eCorner, center, sCorner
	elseif (wall.Facing == WallFacing["SOUTH_T"]) then
		return wCorner, eCorner, center, nCorner
	elseif (wall.Facing == WallFacing["WEST_T"]) then
		return nCorner, sCorner, center, eCorner
	elseif (wall.Facing == WallFacing["EAST_T"]) then
		return nCorner, sCorner, center, wCorner
	elseif (wall.Facing == WallFacing["NE_CORNER"]) then
		return center, eCorner, center, sCorner
	elseif (wall.Facing == WallFacing["NW_CORNER"]) then
		return center, wCorner, center, sCorner
	elseif (wall.Facing == WallFacing["SW_CORNER"]) then
		return center, nCorner, center, wCorner
	elseif (wall.Facing == WallFacing["SE_CORNER"]) then
		return center, nCorner, center, eCorner
	else
		print("unknown wall direction")
	end
end

function fixWallPosition(x, y, wri)
	local vbc_ent = VideoBag.Sprites[wri.SpriteIndex]
	
	if(vbc_ent) then
		local offX = (0 - wri.unknown1) - vbc_ent.offsetX
		local offY = wri.unknown2 - vbc_ent.offsetY

		local x = x - (offX + 50)
		local y = y - (offY + 72)
		
		return x, y
	else

		return 0, 0
	end
end

function WallFromMapWall(mwall)
	local wall = {}

	wall.iswall = true
	wall.type = "WALL"
	wall.mobject = mwall
	wall.z = 40
	wall.window = mwall.Window
	wall.destructable = mwall.Destructable
	wall.bottomClip = 0
	

	local facing = mwall.Facing
	local thingWall = ThingDB.Walls[mwall.matId + 1]
	local actualVari = mwall.Variation * 2
	
	wall.transparent = false
	
	if(thingWall.unk1 ~= 1) then -- @todo Should only compare first bit 
		wall.transparent = true
	end
	
	local wri
	if(mwall.Window) then
		if(mwall.Facing == WallFacing["NORTH"]) then
			wri = thingWall.RenderNormal[12][actualVari+1]
		elseif (mwall.Facing == WallFacing["WEST"]) then
			wri = thingWall.RenderNormal[13][actualVari+1]
		end
	else
		if(mwall.Destructable) then
			wri = thingWall.RenderBreakable[facing+1][actualVari+1]
		else
			wri = thingWall.RenderNormal[facing+1][actualVari+1]
		end
	end
	
	if(wri) then
		wall.spriteId = wri.SpriteIndex
	else
		print("Failed to get wri for wall, " .. thingWall.Name)
	end
	
	wall.Facing = mwall.Facing
	wall.x = mwall.Location.X * 23
	wall.y = mwall.Location.Y * 23
	wall.centerX = wall.x + 23 / 2
	wall.centerY = wall.y + 23 / 2
	
	wall.quad, wall.img = videobagcache:getSprite(wall.spriteId)
	if(wall.quad == nil or wall.img == nil) then
			--print("Failed to get sprite for wall, " .. thingWall.Name)
	else
		wall.drawOffsetX, wall.drawOffsetY = fixWallPosition(0,0,wri)
		if(wall.drawOffsetX == nil or wall.drawOffsetY == nil) then
			--print("Failed to get drawoffsets for " .. thingWall.Name)
		end
	end
	
	physics:AddWallToCollider(wall)
	
	local c1, c2, c3, c4 = GetWallPoints(wall)
	local points = {}
	table.insert(points, c1)
	table.insert(points, c2)
	table.insert(points, c3)
	table.insert(points, c4)
	
	wall.points = points
	
	return wall
end