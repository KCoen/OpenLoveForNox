lightEngine = {}

function love.graphics.drawLight(x,y,radius,brightness,falloff)
	local lx,ly = camera:worldToLocal(x,y)
	shaders.lightHalo:send("light_pos",{lx,ly,0}) -- shader needs this in screen space :/
	shaders.lightHalo:send("light_info",{radius,brightness or 1,falloff or 2})
	love.graphics.rectangle("fill",x-radius,y-radius,radius*2,radius*2)
end
