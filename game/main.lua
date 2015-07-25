-- Initalize JIT
jit.opt = require("jit.opt")
jit.opt.start(3)
jit.opt.start("-dce")
jit.opt.start("hotloop=10", "hotexit=2")

-- Global requires
CLIENT = true

vector = require("libs/vector")
JSON = require("libs/JSON")
ProFi = require("libs/ProFi")

require("gameconf")
require("renderer")
require("utils")
require("camera")
require("spatialhash")
require("physics")
marshal = require("marshal")

require("NoxWall")
require("NoxObject")
require("NoxThingdb")
require("NoxVideobag")
require("NoxPlayer")
require("NoxDrawTypes")
require("NoxColliders")
require("NoxMap")
require("NoxMapScriptFunctions")
require("NoxMapScript")
require("NoxUpdates")
require("NoxMusic")
require("NoxInterface")
require("NoxSpells")
require("NoxLocalPlayerController")

love.graphics.setDefaultFilter("nearest","nearest",1)



function LoadDatabases()
	love.timer.starTimer("Loading JSON")
	ThingDB = loadJSON("content/Json/ThingDB.min.json")	
	ModDB = loadJSON("content/Json/ModDB.min.json")	
	--Map = loadJSON("Json/War02a.min.json")	
	VideoBag = {}
	VideoBag._Tiles = loadJSON("content/Json/TileSprites.min.json")
	VideoBag._TileEdges = loadJSON("content/Json/TileEdgeSprites.min.json")
	VideoBag._Walls = loadJSON("content/Json/WallSprites.min.json")
	VideoBag._Objects = loadJSON("content/Json/ObjectSprites.min.json")
	VideoBag._Others = loadJSON("content/Json/OtherSprites.min.json")
	VideoBag._Sequences = loadJSON("content/Json/SequenceSprites.min.json")
	love.timer.stopTimer("Loading JSON")
end


mapListOffset = 0
function loadMap(name)
	camera = Camera.new()
	--scene:add(camera)
	--scene:add(physics)
	--scene:add(NoxMap)
	
	player = nil
	for k,v in pairs(mapList) do
		if(v == name) then
			mapListOffset = k
		end
	end
	
	JsonMap = loadJSON("content/Json/jsonmaps/" .. mapList[mapListOffset])
	NoxMap:load(JsonMap)
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

	mapList = love.filesystem.getDirectoryItems( "content/Json/jsonmaps" )
	name, version, vendor, device = love.graphics.getRendererInfo( )
	
	print("Render Name: " .. name)
	print("Render Version: " .. version)
	print("Render Vendor: " .. vendor)
	print("Render Device: " .. device)
	print("Jit status: ")
	local jstatus =  { jit.status() }
	tprint(jstatus)
	
	shaders = {}
	shaders.blurH = love.graphics.newShader("shaders/blurh.c")
	shaders.blurV = love.graphics.newShader("shaders/blurv.c")
	shaders.sampleShadow = love.graphics.newShader("shaders/sampleShadow.c")
	shaders.edgeBlend = love.graphics.newShader("shaders/edge.c")
	shaders.lightHalo = love.graphics.newShader("shaders/lighthalo.c")
	shaders.overBright = love.graphics.newShader("shaders/overbright.c")
	shaders.shadowedObject = love.graphics.newShader("shaders/shadowedObject.c")
	shaders.shadowedWall = love.graphics.newShader("shaders/shadowedWall.c")
	shaders.unshadowedObject = love.graphics.newShader("shaders/unshadowedObject.c")
	LoadDatabases()
	PreProcessSprites()

	DrawTypes:load()
	Updates:load()
	Colliders:load()
	physics:load()
	camera = Camera.new()
	
	
	screenBuffer = love.graphics.newCanvas(camera.wwidth,camera.wheight)
	lightEngine = {}
	lightEngine.shadowBuffer = love.graphics.newCanvas(camera.wwidth,camera.wheight,"rgba4")
	lightEngine.shadowBufferObjects = love.graphics.newCanvas(camera.wwidth,camera.wheight,"rgba4")
	shaders.sampleShadow:send("shadowbuffer",lightEngine.shadowBuffer)
	shaders.overBright:send("canvas",lightEngine.shadowBuffer)
	

	--scene:add(camera)
	--scene:add(map)
	renderer.load()

	runMapScript("content/luamaps/War01A.map.lua")
	mapscriptenv.GLOBAL()

	
	loadMap(getFirstMap())	

	localplayer = NoxBaseObject.new("NewPlayer")
	localplayer:setPosition(NoxMap.Spawns[1].x, NoxMap.Spawns[1].y)
	--localplayer.x = NoxMap.Spawns[1].x
	--localplayer.y = NoxMap.Spawns[1].y

	NoxMap:insertObject(localplayer)
	NoxLocalPlayerController:bind(localplayer)

	NoxInterface:load()
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
	
	NoxLocalPlayerController:update(dt)
	physics:update(dt)
	Updates:update(dt)
	--player:update(dt)
	camera:update(dt)
	NoxMap:update(dt)	
	

	renderer:update(dt)
	DrawTypes:update(dt)

	
	


end

function love.draw()
	NoxMap:draw()

	NoxInterface:draw()

	love.debug.print("FPS: " .. love.timer.getFPS())
	
	local stats = love.graphics.getStats( )
	
	love.debug.print("Drawcalls: " .. stats.drawcalls)
	love.debug.print("Canvasswitches: " .. stats.canvasswitches)
	love.debug.print("Texturememory: " .. stats.texturememory)
	love.debug.print("Images: " .. stats.images)
	love.debug.print("Canvases: " .. stats.canvases)
	love.debug.print("Fonts: " .. stats.fonts)
	if(camera) then
		love.debug.print("Camera: " .. camera.x .. " " .. camera.y)
	end
	if(localplayer) then
		love.debug.print("Player: " .. localplayer.x .. " " .. localplayer.y)
	end
	
	
	
	love.debug.printReset()
end

function love.keypressed(key, u)
	NoxLocalPlayerController:keypressed(key,u)
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
		local objects = NoxMap.Objects:getPVS(mwx - 128,mwy - 128,mwy + 128,mwy + 128)
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


	--[[if(localplayer) then
		localplayer:keypressed(key, u)
	end--]]
	
end

function love.keyreleased(key, u)
	NoxLocalPlayerController:keyreleased(key,u)
end

function love.mousereleased(x,y,button)
	NoxLocalPlayerController:mousereleased(x,y,button)
end

function love.mousepressed(x,y,button)
	NoxLocalPlayerController:mousepressed(x,y,button)

	local wx,wy = camera:localToWorld(x,y)
	if camera then
		if button == "wu" then
			camera.scale = camera.scale * 2
		elseif button == "wd" then
			camera.scale = camera.scale * 0.5
		end
	end
end
