scene = {}
scene.objects = {}

function scene:add(object)
	table.insert(scene.objects, object)
end

function scene:load()
	for key, obj in pairs(scene.objects) do
		if(obj.load) then
			obj:load()
		end
	end
end

function scene:draw()
	for key, obj in pairs(scene.objects) do
		if(obj.draw) then
			obj:draw()
		end
	end
end
function scene:update(dt)
	for key, obj in pairs(scene.objects) do
		if(obj.update) then
			obj:update(dt)
		end
	end
end
function scene:keypressed(key, isrepeat)
	for k, obj in pairs(scene.objects) do
		if(obj.keypressed) then
			obj:keypressed(key, isrepeat)
		end
	end
end

function scene:keyreleased(key, isrepeat)
	for k, obj in pairs(scene.objects) do
		if(obj.keyreleased) then
			obj:keyreleased(key, isrepeat)
		end
	end
end