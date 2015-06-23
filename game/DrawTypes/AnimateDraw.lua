local AnimateDraw = {}

local rdraw = renderer.drawObject
local UpdateObjectSpriteId = UpdateObjectSpriteId

AnimateDraw.name = "AnimateDraw"

AnimateDraw.AnimatePerSecond = 1 / 15

function AnimateDraw:initObject(obj)
	obj.animationState = math.random(1, #obj.tt.SpriteAnimFrames)
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 
	
	local spriteid = obj.tt.SpriteAnimFrames[obj.animationState];
	UpdateObjectSpriteId(obj, spriteid)

	self.shader = shaders.sampleShadow
end

function AnimateDraw:update(dt)
	self.curTime = love.timer.getTime()
end

function AnimateDraw:draw(obj)
	if (obj.animationLastUpdate + AnimateDraw.AnimatePerSecond) < self.curTime then
		obj.animationLastUpdate = self.curTime

		obj.animationState = obj.animationState + 1
		obj.animationState = ((obj.animationState -1) % #obj.tt.SpriteAnimFrames) + 1

		UpdateObjectSpriteId(obj, obj.tt.SpriteAnimFrames[obj.animationState])
	end
	
	--self.shader:send("type46",false)
	--self.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
	
end

return AnimateDraw
