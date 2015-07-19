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
	love.graphics.clear()--canvas:clear()
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

tileCache = {}
tileCache.images = {}
tileCache.imageQuads = {}
function GetTile(id) -- LUA 101
	local fileinfo = VideoBag.Tiles[id]
	tileCache.images[fileinfo.file] = tileCache.images[fileinfo.file] or love.graphics.newImage("content/" .. fileinfo.file)
	tileCache.imageQuads[fileinfo.file] = tileCache.imageQuads[fileinfo.file] or {}
	tileCache.imageQuads[fileinfo.file].quads = tileCache.imageQuads[fileinfo.file].quads or {}
	tileCache.imageQuads[fileinfo.file].quads[id] = tileCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, tileCache.images[fileinfo.file]:getWidth(), tileCache.images[fileinfo.file]:getHeight())
	return tileCache.imageQuads[fileinfo.file].quads[id], tileCache.images[fileinfo.file]
end

tiledgeCache = {}
tiledgeCache.images = {}
tiledgeCache.imageQuads = {}
function GetTileEdge(id) -- LUA 101
	local fileinfo = VideoBag.TileEdges[id]
	tiledgeCache.images[fileinfo.file] = tiledgeCache.images[fileinfo.file] or love.graphics.newImage("content/" .. fileinfo.file)
	tiledgeCache.imageQuads[fileinfo.file] = tiledgeCache.imageQuads[fileinfo.file] or {}
	tiledgeCache.imageQuads[fileinfo.file].quads = tiledgeCache.imageQuads[fileinfo.file].quads or {}
	tiledgeCache.imageQuads[fileinfo.file].quads[id] = tiledgeCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, tiledgeCache.images[fileinfo.file]:getWidth(), tiledgeCache.images[fileinfo.file]:getHeight())
	return tiledgeCache.imageQuads[fileinfo.file].quads[id], tiledgeCache.images[fileinfo.file]
end

wallCache = {}
wallCache.images = {}
wallCache.imageQuads = {}
function GetWall(id) -- LUA 101
	local fileinfo = VideoBag.Walls[id]
	if(not fileinfo) then
		return nil
	end
	wallCache.images[fileinfo.file] = wallCache.images[fileinfo.file] or love.graphics.newImage("content/" .. fileinfo.file)
	wallCache.imageQuads[fileinfo.file] = wallCache.imageQuads[fileinfo.file] or {}
	wallCache.imageQuads[fileinfo.file].quads = wallCache.imageQuads[fileinfo.file].quads or {}
	wallCache.imageQuads[fileinfo.file].quads[id] = wallCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, wallCache.images[fileinfo.file]:getWidth(), wallCache.images[fileinfo.file]:getHeight())
	return wallCache.imageQuads[fileinfo.file].quads[id], wallCache.images[fileinfo.file]
end

ObjectCache = {}
ObjectCache.images = {}
ObjectCache.imageQuads = {}
function GetObject(id) -- LUA 101
	local fileinfo = VideoBag.Objects[id]
	if(not fileinfo) then
		return nil
	end
	ObjectCache.images[fileinfo.file] = ObjectCache.images[fileinfo.file] or love.graphics.newImage("content/" .. fileinfo.file)
	ObjectCache.imageQuads[fileinfo.file] = ObjectCache.imageQuads[fileinfo.file] or {}
	ObjectCache.imageQuads[fileinfo.file].quads = ObjectCache.imageQuads[fileinfo.file].quads or {}
	ObjectCache.imageQuads[fileinfo.file].quads[id] = ObjectCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, ObjectCache.images[fileinfo.file]:getWidth(), ObjectCache.images[fileinfo.file]:getHeight())
	return ObjectCache.imageQuads[fileinfo.file].quads[id], ObjectCache.images[fileinfo.file]
end

SequenceCache = {}
SequenceCache.images = {}
SequenceCache.imageQuads = {}
function GetSequence(id) -- LUA 101
	local fileinfo = VideoBag.Sequences[id]
	if(not fileinfo) then
		return nil
	end
	SequenceCache.images[fileinfo.file] = SequenceCache.images[fileinfo.file] or love.graphics.newImage("content/" .. fileinfo.file)
	SequenceCache.imageQuads[fileinfo.file] = SequenceCache.imageQuads[fileinfo.file] or {}
	SequenceCache.imageQuads[fileinfo.file].quads = SequenceCache.imageQuads[fileinfo.file].quads or {}
	SequenceCache.imageQuads[fileinfo.file].quads[id] = SequenceCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, SequenceCache.images[fileinfo.file]:getWidth(), SequenceCache.images[fileinfo.file]:getHeight())
	return SequenceCache.imageQuads[fileinfo.file].quads[id], SequenceCache.images[fileinfo.file]
end