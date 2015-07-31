NoxLocalPlayerController = {}
NoxLocalPlayerController.player = false

NoxLocalPlayerController.pressedKeys = {}
NoxLocalPlayerController.releasedKeys = {}
NoxLocalPlayerController.downKeys = {}

function NoxLocalPlayerController:load()

end

function NoxLocalPlayerController:bind(ply)
	NoxLocalPlayerController.player = ply
end

function NoxLocalPlayerController:update(dt)
	if not NoxLocalPlayerController.player then
		return
	end
	local ply = NoxLocalPlayerController.player 

	local mouseDirectionX = 0
	local mouseDirectionY = 0
	local speed = 0

	if(NoxLocalPlayerController.pressedKeys[binds.noclip]) then
		ply.player:toggleNoclip()
	end

	local cx,cy = camera:localToWorld(love.mouse.getX(),love.mouse.getY())
				
	mouseDirectionX = cx - ply.x
	mouseDirectionY = cy - ply.y
				
	local mouseDirectionLength = math.sqrt(mouseDirectionX^2 + mouseDirectionY^2)

	mouseDirectionX = mouseDirectionX / mouseDirectionLength		
	mouseDirectionY = mouseDirectionY / mouseDirectionLength	

	if NoxLocalPlayerController.downKeys[binds.move] then
		if(mouseDirectionLength < 5) then
			speed = 0
		elseif (mouseDirectionLength < 100) then
			speed = 1
		else
			speed = 2
		end
	end

	ply.player:sendMove(mouseDirectionX, mouseDirectionY, speed, NoxLocalPlayerController.pressedKeys[binds.jump])

	local dx = camera.x - ply.x
	local dy = camera.y - ply.y
	local length = math.sqrt(dx*dx + dy*dy)

	if length > 100 * camera.scale then
		camera:set(ply.x, ply.y)
	elseif length > 5 * camera.scale then
		camera:set(camera.x + (ply.x - camera.x) * 5 * dt, camera.y + (ply.y - camera.y) * 5 * dt)
	end

	
end

function NoxLocalPlayerController:flushInputBuffer()
	NoxLocalPlayerController.pressedKeys = {}
end

function NoxLocalPlayerController:keypressed(key, u)
	NoxLocalPlayerController.pressedKeys[key] = true
	NoxLocalPlayerController.downKeys[key] = true
end

function NoxLocalPlayerController:mousepressed(x,y,button)
	NoxLocalPlayerController.pressedKeys["mouse:" .. button] = true
	NoxLocalPlayerController.downKeys["mouse:" .. button] = true
end

function NoxLocalPlayerController:mousereleased(x,y,button)
	NoxLocalPlayerController.downKeys["mouse:" .. button] = false
end

function NoxLocalPlayerController:keyreleased(key, u)
	NoxLocalPlayerController.downKeys[key] = false
end
