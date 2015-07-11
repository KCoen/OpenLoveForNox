local AnimateStateDraw = {}
AnimateStateDraw.name = "AnimateStateDraw"

local rdraw = renderer.drawObject
local UpdateObjectSpriteId = UpdateObjectSpriteId

AnimateStateDraw.AnimatePerSecond = 1 / 16

function AnimateStateDraw:initObject(obj)	
	obj.spriteState = 1
	obj.animationState = 1
	obj.animationLastUpdate = love.timer.getTime() + math.random(0, 100) / 100 


	local spriteid = obj.tt.SpriteStates[obj.spriteState].Animation.Frames[obj.animationState]
	UpdateObjectSpriteId(obj, spriteid)
	self.shader = shaders.sampleShadow
	self.curTime = love.timer.getTime()
end

function AnimateStateDraw:update(dt)
	self.curTime = love.timer.getTime()
end
function AnimateStateDraw:draw(obj)
	if (obj.animationLastUpdate + AnimateStateDraw.AnimatePerSecond) < self.curTime then
		obj.animationLastUpdate = self.curTime

		obj.animationState = obj.animationState + 1
		obj.animationState = ((obj.animationState -1) % #obj.tt.SpriteStates[obj.spriteState].Animation.Frames) + 1

		local spriteid = obj.tt.SpriteStates[obj.spriteState].Animation.Frames[obj.animationState]
		UpdateObjectSpriteId(obj, spriteid)
	end
	
	--self.shader:send("type46",false)
	--self.shader:send("pos",{camera:worldToLocal(obj.x,obj.y)})

	rdraw(obj)
	
end

return AnimateStateDraw
