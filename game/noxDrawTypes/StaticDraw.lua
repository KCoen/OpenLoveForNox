-- Everything else
local StaticDraw = {}

StaticDraw.name = "StaticDraw"

local rdraw = renderer.drawObject

StaticDraw.AnimatePerSecond = 1 / 16

function StaticDraw:initObject(obj)
	local index = obj.spriteAnimFrames[1];
	UpdateObjectSpriteId(obj, index)
end

function StaticDraw:draw(obj)	
	rdraw(obj)
end

return StaticDraw
