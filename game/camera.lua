Camera = {}
Camera.__index = Camera

function Camera.new()
	local self = setmetatable({}, Camera)
	
	self.x = 0
	self.y = 0
	self.xsafe = 0
	self.ysafe = 0
	
	self.scale = 1
	
	self.inputx = 0
	self.inputy = 0
	
	self.speed = 300
	
	self.wwidth = love.graphics.getWidth()
	self.wheight = love.graphics.getHeight()
	
	return self
end

function Camera:push(typ)
	if typ then
		love.graphics.push(typ)
	else
		love.graphics.push()
	end
	love.graphics.rotate(0)
	love.graphics.scale(1/self.scale,1/self.scale)
	love.graphics.translate(-self.xsafe+self.wwidth/2*self.scale,-self.ysafe+self.wheight/2*self.scale)
end

function Camera:pop()
	love.graphics.pop()
end

function Camera:set(x,y)
	self.x = x
	self.y = y
	self.xsafe = round(self.x, 0)
	self.ysafe = round(self.y, 0)
end

function Camera:localToWorld(lx,ly)
	local scale = self.scale
	local gx = lx*scale-(-self.xsafe+self.wwidth*0.5*scale)
	local gy = ly*scale-(-self.ysafe+self.wheight*0.5*scale)
	return gx,gy
end

function Camera:worldToLocal(gx,gy)
	local scale = self.scale
	local lx = (gx+(-self.xsafe+self.wwidth*0.5*scale))/scale
	local ly = (gy+(-self.ysafe+self.wheight*0.5*scale))/scale
	return lx,ly
end

local floor = math.floor
function round(num,idp)
	local mult = 10^(idp or 0)
	return floor(num * mult + 0.5) / mult
end

function Camera:update(dt)
	--[[if love.keyboard.isDown('s') then
		self.inputy = 1
	elseif love.keyboard.isDown('w') then
		self.inputy = -1
	else
		self.inputy = 0
	end
	
	if love.keyboard.isDown('d') then
		self.inputx = 1
	elseif love.keyboard.isDown('a') then
		self.inputx = -1
	else
		self.inputx = 0
	end
	
	self:set(self.x + self.inputx * self.speed * dt, self.y + self.inputy * self.speed * dt)--]]
end

function Camera:draw()
	
end

function Camera:worldaabb()
	local x1, y1 = self:localToWorld(0, 0)
	local x2, y2 = self:localToWorld(camera.wwidth, camera.wheight)
	x2 = x2 - x1
	y2 = y2 - y1
	
	return x1, y1, x2, y2
end

function Camera:isVisible(quad, posx, posy)
	local x,y,w,h = quad:getViewport()
	
	local x1,y1 = self:worldToLocal(posx,posy)
	local x2,y2 = self:worldToLocal(posx+w,posy+h)
	
	if 	(x1 > self.wwidth) or
		(x2 < 0) or
		(y1 > self.wheight) or
		(y2 < 0) then
		return false
	end
	return true
end

function Camera:isPixelVisible(posx, posy)
	posx,posy = self:worldToLocal(posx,posy)
	
	if (posx > self.wwidth) or (posx < 0) or (posy > self.wheight) or (posy < 0) then
		return false
	end
	return true
end

function Camera:rdraw(image, quad, x, y, r, sx, sy, ox, oy, kx, ky)
	--if self:isVisible(quad, x, y) then
		love.graphics.draw(image,quad,x,y,r,sx,sy,ox,oy,kx,ky)
	--end
end

function Camera:rdrawline(x1, y1, x2, y2)
	love.graphics.line(x1, y1 ,x2 , y2)
end

function Camera:keypressed(key, isrepeat)
end
function Camera:keyreleased(key, isrepeat)
end
