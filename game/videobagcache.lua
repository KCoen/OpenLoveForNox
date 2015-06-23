videobagcache = {}

videobagcache.cacheSize = 8192
videobagcache.canvas = nil;
videobagcache.maxlineheight = 0
videobagcache.x = 0
videobagcache.y = 0
videobagcache.imageids = {}
local G = love.graphics

function videobagcache:load()
	local canvas = love.graphics.newCanvas(videobagcache.cacheSize, videobagcache.cacheSize)
	love.graphics.setCanvas(canvas)
	canvas:clear()
	love.graphics.setCanvas(nil)

	videobagcache.canvas = canvas
end

function videobagcache:getObject(spriteid)
	if(videobagcache.imageids[spriteid]) then
		return videobagcache.imageids[spriteid].quad, videobagcache.imageids[spriteid].img
	end
	local quad, img = GetObject(spriteid)
	
	local quad2,img2 = self:storeObject(quad,img)

	videobagcache.imageids[spriteid] = {}
	videobagcache.imageids[spriteid].quad = quad2
	videobagcache.imageids[spriteid].img = img2

	return quad2,img2
end

function videobagcache:getWall(spriteid)
	if(videobagcache.imageids[spriteid]) then
		return videobagcache.imageids[spriteid].quad, videobagcache.imageids[spriteid].img
	end
	local quad, img = GetWall(spriteid)
	if quad == nil or img == nil then
		return nil,nil
	end
	
	local quad2,img2 = self:storeObject(quad,img)

	videobagcache.imageids[spriteid] = {}
	videobagcache.imageids[spriteid].quad = quad2
	videobagcache.imageids[spriteid].img = img2

	return quad2,img2
end

function videobagcache:getSequence(spriteid)
	if(videobagcache.imageids[spriteid]) then
		return videobagcache.imageids[spriteid].quad, videobagcache.imageids[spriteid].img
	end
	local quad, img = GetSequence(spriteid)
	
	local quad2,img2 = self:storeObject(quad,img)

	videobagcache.imageids[spriteid] = {}
	videobagcache.imageids[spriteid].quad = quad2
	videobagcache.imageids[spriteid].img = img2

	return quad2,img2
end

function videobagcache:storeObject(quad, img)
	local x,y,w,h = quad:getViewport()

	local prevcanvas = G.getCanvas()
	local preshader = G.getShader()
	--love.graphics.reset()


	G.push()
	G.origin()
	G.setCanvas(videobagcache.canvas)
	G.setColor(255,255,255,255)
	G.setShader()
	G.setBlendMode('replace')
	local rquad;
	local rimg = videobagcache.canvas
	if(videobagcache.x + w < videobagcache.cacheSize) then
		G.draw(img, quad, videobagcache.x, videobagcache.y)
		rquad = G.newQuad(videobagcache.x, videobagcache.y, w, h,videobagcache.cacheSize,videobagcache.cacheSize)
		videobagcache.x = videobagcache.x + w
	else	
		videobagcache.y = videobagcache.y + videobagcache.maxlineheight
		videobagcache.maxlineheight = 0
		videobagcache.x = 0
		G.draw(img, quad, videobagcache.x, videobagcache.y)
		rquad = G.newQuad(videobagcache.x, videobagcache.y, w, h,videobagcache.cacheSize,videobagcache.cacheSize)
		videobagcache.x = videobagcache.x + w
	end
	if(h > videobagcache.maxlineheight) then
		videobagcache.maxlineheight = h
	end
	G.setBlendMode('alpha')
	G.pop()
	G.setCanvas(prevcanvas)
	G.setShader(preshader)

	return rquad,rimg
end