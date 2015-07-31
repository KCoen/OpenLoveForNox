local MonsterDraw = {}

MonsterDraw.name = "MonsterDraw"

local rdraw = renderer.drawObject


MonsterDraw.AnimatePerSecond = 1 / 10

function MonsterDraw:initObject(obj)
	--local index = obj.spriteAnimFrames[MonsterAnimationTypes[obj.animationType]];


	
	obj:UpdateSpriteId(obj.spriteStates[1].Animation.Frames[1])
end

function MonsterDraw:update(dt)
	self.curTime = love.timer.getTime()
end

function MonsterDraw:draw(obj)	
	if (obj.animationLastUpdate + MonsterDraw.AnimatePerSecond) < self.curTime then
		for k,v in pairs(obj.spriteStates) do
			if(v.AnimationId == MonsterAnimationTypeId[obj.monster.animationType]) then
				local loopSize = #v.Animation.Frames / 8
				obj.animationState = (obj.animationState + 1) % loopSize

				local a = math.deg(obj.phys[1].body:getAngle())

				if ((a >= 315 and a < 337.5) or (a <= 22.5)) then
					animationDirection = 4;
				elseif (a >= 22.5 and a < 67.5) then
					animationDirection = 2;
				elseif (a >= 67.5 and a < 112.5) then
					animationDirection = 1;
				elseif (a >= 112.5 and a < 157.5) then 
					animationDirection = 0;
				elseif (a >= 157.5 and a < 202.5) then
					animationDirection = 3;
				elseif (a >= 202.5) then 
					animationDirection = round((float) (a / 45));
				end

				if (animationDirection >= 8) then 
					animationDirection = 4
				end

				local index = v.Animation.Frames[animationDirection * loopSize + obj.animationState + 1]
				obj:UpdateSpriteId(index)
			end
		end
		obj.animationLastUpdate = self.curTime
	end
	
	rdraw(obj)
end

return MonsterDraw
