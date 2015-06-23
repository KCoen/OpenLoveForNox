-- Quadtree would outperform memory wise, especially with larger levels, but we could always implement it over this interface if we need it
-- Because of identifying system, can currently slows down over time
local SpatialHashUID = 1


SpatialHash = {}
SpatialHash.__index = SpatialHash

function SpatialHash.new(width, height, chunksize)
	local self = setmetatable({}, SpatialHash)
	
	self.width = width
	self.height = height
	self.chunksize = chunksize
	self.totalObjects = 0
	self.uid = SpatialHashUID
	SpatialHashUID = SpatialHashUID + 1
	
	self.data = {}
	
	for x = 1, width/chunksize+1 do
		self.data[x] = {}
		for y = 1, height/chunksize+1 do
			self.data[x][y] = {}
		end
	end

	return self
end

-- Obj assumes .x .y
function SpatialHash:add(obj)
	obj.spatialhashes = obj.spatialhashes or {}
	obj.spatialhashPos = obj.spatialhashPos or {}
	obj.spatialhashes[self.uid] = self
	
	local sx = math.floor(obj.x / self.chunksize) + 1
	local sy = math.floor(obj.y / self.chunksize) + 1
	
	local sph = {} -- Store the position of the object in the array for O(1) deletion/moving
	sph.sx = sx
	sph.sy = sy
	sph.n = #self.data[sx][sy] + 1 --table.insert(self.data[sx][sy], obj)
	self.data[sx][sy][#self.data[sx][sy] + 1] = obj

	obj.spatialhashPos[self.uid] = sph
	
	self.totalObjects = self.totalObjects + 1
end

function SpatialHash:updateObject(obj)
	local sx = math.floor(obj.x / self.chunksize) + 1
	local sy = math.floor(obj.y / self.chunksize) + 1
	local sph = obj.spatialhashPos[self.uid]
	
	if sx ~= sph.sx or sy ~= sph.sy then
		self.data[sph.sx][sph.sy][sph.n] = 0
		
		--table.remove(self.data[sph.sx][sph.sy], sph.n) -- Expensive?
		
		sph.sx = sx
		sph.sy = sy
		sph.n = #self.data[sx][sy] + 1
		self.data[sx][sy][#self.data[sx][sy] + 1] = obj
		--sph.n = table.insert(self.data[sx][sy], obj)
	end
end

function SpatialHash:removeObject(obj)
	local sph = obj.spatialhashPos[self.uid]
	self.data[sph.sx][sph.sy][sph.n] = 0
end

function SpatialHash:getPVS(x,y,w,h)
	local pvs = {}
	for obj in self:Iter(x, y, w, h) do
		pvs[#pvs + 1] = obj
	end
	return pvs
end

function SpatialHash:Iter(x,y,w,h) 
	local sx = math.floor(x / self.chunksize) + 1 
	local sy = math.floor(y / self.chunksize) + 1
	local sx2 = math.floor((x + w)  / self.chunksize) + 1
	local sy2 = math.floor((y + h) / self.chunksize) + 1	
	
	if(sy2 > self.height/self.chunksize+1) then
		sy2 = math.floor(self.height/self.chunksize+1)
	end
	if(sx2 > self.width/self.chunksize+1) then
		sx2 = math.floor(self.width/self.chunksize+1)
	end

	if(sx < 1) then
		sx = 1
	end
	
	if(sy < 1) then
		sy = 1
	end
	
	local nx = 0
	local ny = 0
	local nl = 0
	
	return function ()
		::top::
		nl = nl + 1
		local r = self.data[sx2 - nx][sy2 - ny][nl]

		if(r) then
			if(type(r) == 'number') then
				goto top
			else
				return r
			end
		elseif (sx2 - nx) > sx then
			nl = 0
			nx = nx + 1
			goto top
		elseif (sy2 - ny) > ny then
			nx = 0
			ny = ny + 1
			nl = 0
			goto top
		else
			return nil
		end
    end
end