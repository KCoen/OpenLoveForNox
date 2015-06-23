
tileCache = {}
tileCache.images = {}
tileCache.imageQuads = {}
function GetTile(id) -- LUA 101
	local fileinfo = VideoBag.Tiles[id]
	tileCache.images[fileinfo.file] = tileCache.images[fileinfo.file] or love.graphics.newImage(fileinfo.file)
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
	tiledgeCache.images[fileinfo.file] = tiledgeCache.images[fileinfo.file] or love.graphics.newImage(fileinfo.file)
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
	wallCache.images[fileinfo.file] = wallCache.images[fileinfo.file] or love.graphics.newImage(fileinfo.file)
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
	ObjectCache.images[fileinfo.file] = ObjectCache.images[fileinfo.file] or love.graphics.newImage(fileinfo.file)
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
	SequenceCache.images[fileinfo.file] = SequenceCache.images[fileinfo.file] or love.graphics.newImage(fileinfo.file)
	SequenceCache.imageQuads[fileinfo.file] = SequenceCache.imageQuads[fileinfo.file] or {}
	SequenceCache.imageQuads[fileinfo.file].quads = SequenceCache.imageQuads[fileinfo.file].quads or {}
	SequenceCache.imageQuads[fileinfo.file].quads[id] = SequenceCache.imageQuads[fileinfo.file].quads[id] or love.graphics.newQuad(fileinfo.X, fileinfo.Y, fileinfo.width, fileinfo.height, SequenceCache.images[fileinfo.file]:getWidth(), SequenceCache.images[fileinfo.file]:getHeight())
	return SequenceCache.imageQuads[fileinfo.file].quads[id], SequenceCache.images[fileinfo.file]
end