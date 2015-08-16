local AnimateStateDraw = {}
AnimateStateDraw.name = "AnimateStateDraw"

local rdraw = renderer.drawObject
local UpdateObjectSpriteId = UpdateObjectSpriteId

AnimateStateDraw.AnimatePerSecond = 1 / 16

function AnimateStateDraw:initObject(obj)	
	obj.spriteState = 1
	obj.animationState = 1
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 


	local spriteid = obj.spriteStates[obj.spriteState].Animation.Frames[obj.animationState]
	UpdateObjectSpriteId(obj, spriteid)
	self.curTime = love.timer.getTime()
end

function AnimateStateDraw:update(dt)
	self.curTime = love.timer.getTime()
end
function AnimateStateDraw:draw(obj)
	if (obj.animationLastUpdate + AnimateStateDraw.AnimatePerSecond) < self.curTime then
		obj.animationLastUpdate = self.curTime

		if obj.animationState == #obj.spriteStates[obj.spriteState].Animation.Frames then
			if obj.updater and obj.updater.onAnimationStateEnd then
				obj.updater:onAnimationStateEnd(obj, obj.spriteState)
			end
		end

		obj.animationState = obj.animationState + 1

		obj.animationState = ((obj.animationState -1) % #obj.spriteStates[obj.spriteState].Animation.Frames) + 1

		local spriteid = obj.spriteStates[obj.spriteState].Animation.Frames[obj.animationState]
		UpdateObjectSpriteId(obj, spriteid)
	end
	
	rdraw(obj)
end

return AnimateStateDraw
