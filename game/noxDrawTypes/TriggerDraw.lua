local TriggerDraw = {}

TriggerDraw.name = "TriggerDraw"

TriggerDraw.AnimatePerSecond = 1 / 16

local rdraw = renderer.drawObject

function TriggerDraw:initObject(obj)
	local index = obj.spriteMenuIcon;
	UpdateObjectSpriteId(obj, index)
end

function TriggerDraw:draw(obj)	
	if obj.flags["EDIT_VISIBLE"] and not gameconf.debug then
		return	
	end
	rdraw(obj)
end

return TriggerDraw
