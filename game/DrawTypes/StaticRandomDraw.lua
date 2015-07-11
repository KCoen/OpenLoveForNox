local StaticRandomDraw = {}

StaticRandomDraw.name = "StaticRandomDraw"

StaticRandomDraw.AnimatePerSecond = 1 / 16

local rdraw = renderer.drawObject

function StaticRandomDraw:initObject(obj)
	local rindex = obj.tt.SpriteAnimFrames[math.random(1, #obj.tt.SpriteAnimFrames)];
	UpdateObjectSpriteId(obj, rindex)

	self.shader = shaders.sampleShadow
end

function StaticRandomDraw:draw(obj)	
	--self.shader:send("type46",false)
	--self.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
end

return StaticRandomDraw
