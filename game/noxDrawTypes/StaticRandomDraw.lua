local StaticRandomDraw = {}

StaticRandomDraw.name = "StaticRandomDraw"

StaticRandomDraw.AnimatePerSecond = 1 / 16

local rdraw = renderer.drawObject

function StaticRandomDraw:initObject(obj)
	local rindex = obj.spriteAnimFrames[math.random(1, #obj.spriteAnimFrames)];
	UpdateObjectSpriteId(obj, rindex)
end

function StaticRandomDraw:draw(obj)	
	--self.shader:send("type46",false)
	--self.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
end

return StaticRandomDraw
