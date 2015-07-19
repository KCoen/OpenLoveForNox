-- Elevators and Levers
local SlaveDraw = {}

SlaveDraw.name = "SlaveDraw"

local rdraw = renderer.drawObject

SlaveDraw.AnimatePerSecond = 1 / 16

function SlaveDraw:initObject(obj)
	local index = obj.spriteAnimFrames[#obj.spriteAnimFrames];
	UpdateObjectSpriteId(obj, index)
end

function SlaveDraw:draw(obj)	
	--self.shader:send("type46",false)
	--.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
end

return SlaveDraw
