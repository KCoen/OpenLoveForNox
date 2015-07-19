-- Everything else
local DoorDraw = {}

DoorDraw.name = "DoorDraw"

local rdraw = renderer.drawObject

function DoorDraw:initObject(obj)
	local index = obj.spriteAnimFrames[1];
	UpdateObjectSpriteId(obj, index)
end

function DoorDraw:draw(door)	
	local b = door.phys[1].body
	local dir = door.mapXfer.Direction + round(((b:getAngle() - math.pi / 8) / (math.pi * 2)) * #door.spriteAnimFrames) + #door.spriteAnimFrames + 1
	dir = math.abs(dir)
	dir = (dir + 1) % #door.spriteAnimFrames + 1
	UpdateObjectSpriteId(door, door.spriteAnimFrames[dir])

	rdraw(door)
end

return DoorDraw
