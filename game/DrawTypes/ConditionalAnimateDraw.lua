local ConditionalAnimateDraw = {}

ConditionalAnimateDraw.name = "ConditionalAnimateDraw"

ConditionalAnimateDraw.AnimatePerSecond = 1 / 15

local rdraw = renderer.drawObject
local UpdateObjectSpriteId = UpdateObjectSpriteId

function ConditionalAnimateDraw:initObject(obj)
	obj.spriteState = 1

	obj.animationState = math.random(1, #obj.tt.ConditionalAnimations[obj.spriteState].Frames) -- Random starting animation
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 -- Random starting time

	local spriteid = obj.tt.ConditionalAnimations[obj.spriteState].Frames[obj.animationState]
	UpdateObjectSpriteId(obj, spriteid)
	self.shader = shaders.sampleShadow
end

function ConditionalAnimateDraw:update(dt)
	self.curTime = love.timer.getTime()
end

function ConditionalAnimateDraw:draw(obj)
	if (obj.animationLastUpdate + ConditionalAnimateDraw.AnimatePerSecond) < self.curTime then
		obj.animationLastUpdate = self.curTime

		obj.animationState = obj.animationState + 1
		obj.animationState = ((obj.animationState -1) % #obj.tt.ConditionalAnimations[obj.spriteState].Frames) + 1

		local spriteid = obj.tt.ConditionalAnimations[obj.spriteState].Frames[obj.animationState]
		UpdateObjectSpriteId(obj, spriteid)
	end
	
	--self.shader:send("type46",false)
	--self.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
	
end

return ConditionalAnimateDraw
