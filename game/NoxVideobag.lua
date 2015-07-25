videobagcache = {}

videobagcache.cacheSize = 8192
videobagcache.canvas = nil;
videobagcache.maxlineheight = 0
videobagcache.x = 0
videobagcache.y = 0
videobagcache.imageids = {}
local G = love.graphics

function PreProcessSprites()
	love.timer.starTimer("Preprocessing Sprites")

	VideoBag.Sprites = {}
	for k, obj in pairs(VideoBag._Tiles) do
		VideoBag.Sprites[obj.Value.imageID] = obj.Value
	end
	
	for k, obj in pairs(VideoBag._TileEdges) do
		VideoBag.Sprites[obj.Value.imageID] = obj.Value
	end

	for k, obj in pairs(VideoBag._Walls) do
		VideoBag.Sprites[obj.Value.imageID] = obj.Value
	end

	for k, obj in pairs(VideoBag._Objects) do
		VideoBag.Sprites[obj.Value.imageID] = obj.Value
	end
	
	for k, obj in pairs(VideoBag._Sequences) do
		VideoBag.Sprites[obj.Value.imageID] = obj.Value
	end

	for k, obj in pairs(VideoBag._Others) do
		VideoBag.Sprites[obj.Value.imageID] = obj.Value
	end
	
	love.timer.stopTimer("Preprocessing Sprites")
end

function videobagcache:load()
	local canvas = love.graphics.newCanvas(videobagcache.cacheSize, videobagcache.cacheSize)
	love.graphics.setCanvas(canvas)
	love.graphics.clear()--canvas:clear()
	love.graphics.setCanvas(nil)

	videobagcache.canvas = canvas
end

function videobagcache:getSprite(spriteid, dontcache)
	if(videobagcache.imageids[spriteid]) then
		return videobagcache.imageids[spriteid].quad, videobagcache.imageids[spriteid].img
	end
	local quad, img = GetSprite(spriteid)
	if(dontcache) then
		return quad, img
	end

	if not (quad or img) then
		print("Unknown spriteid")
		return nil
	end
	
	local quad2,img2 = self:storeSprite(quad,img)

	videobagcache.imageids[spriteid] = {}
	videobagcache.imageids[spriteid].quad = quad2
	videobagcache.imageids[spriteid].img = img2

	return quad2,img2
end

function videobagcache:storeSprite(quad, img)
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

SpriteCache = {}
SpriteCache.images = {}
SpriteCache.imageQuads = {}
function GetSprite(id) -- LUA 101
	local fileinfo = VideoBag.Sprites[id]
	if(not fileinfo) then
		return nil
	end
	SpriteCache.images[fileinfo.file] = SpriteCache.images[fileinfo.file] or love.graphics.newImage("content/" .. fileinfo.file)
	SpriteCache.imageQuads[fileinfo.file] = SpriteCache.imageQuads[fileinfo.file] or {}
	SpriteCache.imageQuads[fileinfo.file].quads = SpriteCache.imageQuads[fileinfo.file].quads or {}
	SpriteCache.imageQuads[fileinfo.file].quads[id] = SpriteCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, SpriteCache.images[fileinfo.file]:getWidth(), SpriteCache.images[fileinfo.file]:getHeight())
	return SpriteCache.imageQuads[fileinfo.file].quads[id], SpriteCache.images[fileinfo.file]
end