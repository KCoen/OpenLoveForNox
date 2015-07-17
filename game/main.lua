jit.opt = require("jit.opt")
jit.opt.start(3)
jit.opt.start("-dce")
jit.opt.start("hotloop=10", "hotexit=2")


require("gameconf")
vector = require("vector")
require("renderer")
require("utils")
require("scene")
require("camera")
require("map")
require("thingdb")
require("videobag")
require("lighting")
require("noxmap")
require("videobagcache")
require("door")
require("mapscriptfunctions")
require("Updates")
require("music")

local function runMapScript(untrusted_code_name)
	print(untrusted_code_name)
	untrusted_code = love.filesystem.read(untrusted_code_name)
	if untrusted_code:byte(1) == 27 then 
		return nil, "binary bytecode prohibited" 
	end
	
	local untrusted_function, message = loadstring(untrusted_code)
	if not untrusted_function then 
		print(untrusted_code_name .. message)
		return nil, untrusted_code_name .. message 
	end
	
	setfenv(untrusted_function, mapscriptenv)
	local status, err = pcall(untrusted_function)
	if err then
		print(err .. untrusted_code_name)
	end
	
	return status, err
end

--[[runMapScript("luamaps/War02A.map.lua")
runMapScript("luamaps/War02b.map.lua")
runMapScript("luamaps/War03a.map.lua")
runMapScript("luamaps/War03b.map.lua")
runMapScript("luamaps/War03c.map.lua")
runMapScript("luamaps/War03d.map.lua")
runMapScript("luamaps/War04a.map.lua")
runMapScript("luamaps/War04b.map.lua")
runMapScript("luamaps/War04c.map.lua")
runMapScript("luamaps/War05A.map.lua")
runMapScript("luamaps/War05B.map.lua")
runMapScript("luamaps/War05C.map.lua")
runMapScript("luamaps/War06a.map.lua")
runMapScript("luamaps/War06b.map.lua")
runMapScript("luamaps/War07A.map.lua")
runMapScript("luamaps/War07B.map.lua")
runMapScript("luamaps/War07C.map.lua")
runMapScript("luamaps/War07D.map.lua")
runMapScript("luamaps/War07E.map.lua")
runMapScript("luamaps/War07F.map.lua")
runMapScript("luamaps/War07G.map.lua")
runMapScript("luamaps/War07H.map.lua")
runMapScript("luamaps/War08a.map.lua")
runMapScript("luamaps/War08b.map.lua")
runMapScript("luamaps/War08c.map.lua")
runMapScript("luamaps/War08d.map.lua")
runMapScript("luamaps/War08e.map.lua")
runMapScript("luamaps/War09a.map.lua")
runMapScript("luamaps/War09b.map.lua")
runMapScript("luamaps/War09c.map.lua")
runMapScript("luamaps/War09d.map.lua")
runMapScript("luamaps/War10a.map.lua")
runMapScript("luamaps/War10b.map.lua")
runMapScript("luamaps/War10c.map.lua")
runMapScript("luamaps/War10d.map.lua")
runMapScript("luamaps/War11a.map.lua")]]


JSON = require("JSON")
ProFi = require 'ProFi'

love.graphics.setDefaultFilter("nearest","nearest",1)

function PreProcessSprites()
	love.timer.starTimer("Preprocessing Sprites")
	VideoBag.Tiles = {}
	VideoBag.TilesByFile = {}
	for k, obj in pairs(VideoBag._Tiles) do
		VideoBag.Tiles[obj.Value.imageID] = obj.Value
		
		VideoBag.TilesByFile[obj.Value.file] = VideoBag.TilesByFile[obj.Value.file] or {}
		VideoBag.TilesByFile[obj.Value.file][obj.Value.imageID] = obj.Value
		
	end
	
	VideoBag.TileEdges = {}
	VideoBag.TileEdgesByFile = {}
	for k, obj in pairs(VideoBag._TileEdges) do
		VideoBag.TileEdges[obj.Value.imageID] = obj.Value
		
		VideoBag.TileEdgesByFile[obj.Value.file] = VideoBag.TileEdgesByFile[obj.Value.file] or {}
		VideoBag.TileEdgesByFile[obj.Value.file][obj.Value.imageID] = obj.Value
		
	end
	
	VideoBag.Walls = {}
	VideoBag.WallsByFile = {}
	for k, obj in pairs(VideoBag._Walls) do
		VideoBag.Walls[obj.Value.imageID] = obj.Value
		
		VideoBag.WallsByFile[obj.Value.file] = VideoBag.WallsByFile[obj.Value.file] or {}
		VideoBag.WallsByFile[obj.Value.file][obj.Value.imageID] = obj.Value
		
	end
	
	VideoBag.Objects = {}
	VideoBag.ObjectsByFile = {}
	for k, obj in pairs(VideoBag._Objects) do
		VideoBag.Objects[obj.Value.imageID] = obj.Value
		
		VideoBag.ObjectsByFile[obj.Value.file] = VideoBag.ObjectsByFile[obj.Value.file] or {}
		VideoBag.ObjectsByFile[obj.Value.file][obj.Value.imageID] = obj.Value
		
	end
	
	VideoBag.Sequences = {}
	VideoBag.SequencesByFile = {}
	for k, obj in pairs(VideoBag._Sequences) do
		VideoBag.Sequences[obj.Value.imageID] = obj.Value
		
		VideoBag.SequencesByFile[obj.Value.file] = VideoBag.SequencesByFile[obj.Value.file] or {}
		VideoBag.SequencesByFile[obj.Value.file][obj.Value.imageID] = obj.Value
		
	end
	
	love.timer.stopTimer("Preprocessing Sprites")
end

function LoadDatabases()
	love.timer.starTimer("Loading JSON")
	ThingDB = loadJSON("Json/ThingDB.min.json")	
	ModDB = loadJSON("Json/ModDB.min.json")	
	--Map = loadJSON("Json/War02a.min.json")	
	VideoBag = {}
	VideoBag._Tiles = loadJSON("Json/TileSprites.min.json")
	VideoBag._TileEdges = loadJSON("Json/TileEdgeSprites.min.json")
	VideoBag._Walls = loadJSON("Json/WallSprites.min.json")
	VideoBag._Objects = loadJSON("Json/ObjectSprites.min.json")
	VideoBag._Sequences = loadJSON("Json/SequenceSprites.min.json")
	love.timer.stopTimer("Loading JSON")
end


mapListOffset = 0
function loadMap(name)
	scene.objects = {}
	camera = Camera.new()
	scene:add(camera)
	scene:add(physics)
	scene:add(map)
	
	player = nil
	for k,v in pairs(mapList) do
		if(v == name) then
			mapListOffset = k
		end
	end
	
	Map = loadJSON("Json/jsonmaps/" .. mapList[mapListOffset])
	scene:load()
end

function getFirstMap()
	return mapList[1]
end

function getNextMap()
	return mapList[mapListOffset + 1]
end




function love.load(arg)
	--collectgarbage('restart')
	videobagcache:load()

	mapList = love.filesystem.getDirectoryItems( "Json/jsonmaps" )
	name, version, vendor, device = love.graphics.getRendererInfo( )
	
	print("Render Name: " .. name)
	print("Render Version: " .. version)
	print("Render Vendor: " .. vendor)
	print("Render Device: " .. device)
	print("Jit status: ")
	local jstatus =  { jit.status() }
	tprint(jstatus)
	
	
	shaders = {}
	shaders.blurH = love.graphics.newShader("Shaders/blurh.c")
	shaders.blurV = love.graphics.newShader("Shaders/blurv.c")
	shaders.sampleShadow = love.graphics.newShader("Shaders/sampleShadow.c")
	shaders.edgeBlend = love.graphics.newShader("Shaders/edge.c")
	shaders.lightHalo = love.graphics.newShader("Shaders/lighthalo.c")
	shaders.overBright = love.graphics.newShader("Shaders/overbright.c")
	shaders.shadowedObject = love.graphics.newShader("Shaders/shadowedObject.c")
	shaders.shadowedWall = love.graphics.newShader("Shaders/shadowedWall.c")
	shaders.unshadowedObject = love.graphics.newShader("Shaders/unshadowedObject.c")
	LoadDatabases()
	PreProcessSprites()
	DrawTypes:load()
	Updates:load()
	Colliders:load()
	
	camera = Camera.new()
	
	screenBuffer = love.graphics.newCanvas(camera.wwidth,camera.wheight)
	lightEngine.shadowBuffer = love.graphics.newCanvas(camera.wwidth,camera.wheight,"rgba4")
	lightEngine.shadowBufferObjects = love.graphics.newCanvas(camera.wwidth,camera.wheight,"rgba4")
	shaders.sampleShadow:send("shadowbuffer",lightEngine.shadowBuffer)
	shaders.overBright:send("canvas",lightEngine.shadowBuffer)
	

	scene:add(camera)
	scene:add(map)
	renderer.load()

	runMapScript("luamaps/War01A.map.lua")
	mapscriptenv.GLOBAL()

	
	loadMap(getFirstMap())	
	
	--love.system.openURL("https://www.youtube.com/watch?v=dQw4w9WgXcQ") -- by grim
end

local hasStarted = 0
local doReport = false
function love.update(dt)
	--collectgarbage()
	if(doReport) then
		if(hasStarted == 5) then
			ProFi:stop()
			ProFi:writeReport( 'profreport.txt' )
			collectgarbage('restart')
			doReport = false
			hasStarted = 0
		elseif(hasStarted == 0) then
			collectgarbage('stop')
			ProFi:start()
			hasStarted = 1;
		else
			hasStarted = hasStarted + 1
		end
	end
	
	Updates:update(dt)

	renderer.update(dt)
	
	DrawTypes:update(dt)

	
	scene:update(dt)
	
end

function love.draw()
	scene:draw()
	love.debug.print("FPS: " .. love.timer.getFPS())
	
	local stats = love.graphics.getStats( )
	
	love.debug.print("Drawcalls: " .. stats.drawcalls)
	love.debug.print("Canvasswitches: " .. stats.canvasswitches)
	love.debug.print("Texturememory: " .. stats.texturememory)
	love.debug.print("Images: " .. stats.images)
	love.debug.print("Canvases: " .. stats.canvases)
	love.debug.print("Fonts: " .. stats.fonts)
	
	love.debug.printReset()
end

function love.keypressed(key, u)
	if camera then
		if key == "r" then
			camera.scale = 1
		end
	end
	
	if key == "f8" then
		doReport = true;
	end
	
	
	if key == "f7" then
		debug.debug()
	end
	
	if(key == 'f9') then
		loadMap(getNextMap())
	end
	if(key == 'f10') then
		gameconf.debug = not gameconf.debug
	end
	if(key == 'f11') then
		local mwx, mwy = camera:localToWorld(love.mouse.getX(),love.mouse.getY())
		local objects = map.Objects:getPVS(mwx - 128,mwy - 128,mwy + 128,mwy + 128)
		for k, obj in pairs(objects) do
			if (obj.phys) then
				for k,v in ipairs(obj.phys) do
					local body = v.body 
					local posx, posy = body:getPosition()
					local fixtures = body:getFixtureList()
					for k2, fixture in pairs(fixtures) do
						if(fixture:testPoint( mwx, mwy )) then
							print(obj.tt.Name)
						end
					end
				end
			end
		end
	end

	if(key == 'f6') then
		for k,v in pairs(keysfound) do
			print(k, v)
		end
	end



	scene:keypressed(key, u)
end

function love.keyreleased(key, u)
	scene:keyreleased(key, u)
end

function love.mousepressed(x,y,button)
	local wx,wy = camera:localToWorld(x,y)
	if camera then
		if button == "wu" then
			camera.scale = camera.scale * 2
		elseif button == "wd" then
			camera.scale = camera.scale * 0.5
		end
	end
end
