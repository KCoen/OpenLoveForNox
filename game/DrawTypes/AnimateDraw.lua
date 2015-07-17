local AnimateDraw = {}

local rdraw = renderer.drawObject
local UpdateObjectSpriteId = UpdateObjectSpriteId

AnimateDraw.name = "AnimateDraw"

AnimateDraw.AnimatePerSecond = 1 / 16

function AnimateDraw:initObject(obj)
	obj.animationState = math.random(1, #obj.spriteAnimFrames)
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 
	
	local spriteid = obj.spriteAnimFrames[obj.animationState];
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
		obj.animationState = ((obj.animationState -1) % #obj.spriteAnimFrames) + 1

		UpdateObjectSpriteId(obj, obj.spriteAnimFrames[obj.animationState])
	end
	
	--self.shader:send("type46",false)
	--self.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
	
end

return AnimateDraw
