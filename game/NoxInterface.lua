-- Whole bunch of offsets, re work and code taken from https://bitbucket.org/awesie/nox-js

NoxInterface = {}
NoxInterface.scale = 1.0
NoxInterface.drawwidth = 0
NoxInterface.drawheight = 0

local G = love.graphics

NoxInterface.player = nil
NoxInterface.font6pt = G.newFont( "content/VeraMono.ttf", 8 )
NoxInterface.inventoryVisible = true
NoxInterface.inventoryX = 10
NoxInterface.inventoryY = 0

function drawNoxImageID(id, x,y)
	local quad,img = videobagcache:getSprite(id, true)
	if(quad and img) then
		local vbc_ent = VideoBag.Sprites[id]

		G.draw(img, quad, vbc_ent.offsetX + x, vbc_ent.offsetY + y)
	else
		print("Can't find imgid", id)
	end
end

function drawNoxImageID46(obj, id, x,y)
	local quad,img = videobagcache:getSprite(id, true)
	if(quad and img) then
		local vbc_ent = VideoBag.Sprites[id]

		G.setShader(shaders.type46)

		if(obj.COLOR1) then
			shaders.type46:send("Color1", obj.COLOR1)
		end
		if(obj.COLOR2) then
			shaders.type46:send("Color2", obj.COLOR2)
		end
		if(obj.COLOR3) then
			shaders.type46:send("Color3", obj.COLOR3)
		end
		if(obj.COLOR4) then
			shaders.type46:send("Color4", obj.COLOR4)
		end
		if(obj.COLOR5) then
			shaders.type46:send("Color5", obj.COLOR5)
		end
		if(obj.COLOR6) then 
			shaders.type46:send("Color6", obj.COLOR6)
		end

		G.draw(img, quad, vbc_ent.offsetX + x, vbc_ent.offsetY + y)

		G.setShader()
	else
		print("Can't find imgid", id)
	end
end


function NoxInterface:load()
	NoxInterface.player = localplayer

	love.mouse.setVisible( false )
end

function NoxInterface:bind(playerobject)
	NoxInterface.player = playerobject
end

function NoxInterface:drawInventory()
	G.push()
	G.translate(NoxInterface.inventoryX, NoxInterface.inventoryY)

	-- Background
	G.setColor(0,0,0,255)
	G.rectangle( "fill", 0, 0, 210, 215 )
	G.setColor(255,255,255,255)

	drawNoxImageID46({
		sequencename = "NAKED",
		COLOR1 = { 0x73, 0x4d, 0x22, 255 },
		COLOR2 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR3 = { 0xFF, 0x0,  0xFF, 255 },
		COLOR4 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR5 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR6 = { 0xda, 0x9a, 0x6e, 255 }
	}, 14342, 0,15);


	for _,seqid in pairs(PlayerArmor) do
		for k,v in pairs(NoxInterface.player.player.inventory) do
			if (v.sequenceid == seqid) and v.isequiped and v.type == "ARMOR_DEFINITIONS" then
				drawNoxImageID46(v, ModelArmor[v.sequenceid], 0,15);
			end
		end
	end

	for _,seqid in pairs(PlayerWeapon) do
		for k,v in pairs(NoxInterface.player.player.inventory) do
			if (v.sequenceid == seqid) and v.isequiped and v.type == "WEAPON_DEFINITIONS" then
				drawNoxImageID46(v, ModelWeapon[v.sequenceid], 0,15);
			end
		end
	end



	drawNoxImageID(14755,0, 0)
	drawNoxImageID(14775,254, 13)
	drawNoxImageID(14757,314, 13) 
	drawNoxImageID(14763,314, 63) 
	drawNoxImageID(14767,314, 113)

	drawNoxImageID(14601, 522, 25)
	drawNoxImageID(14778, 522, 0)
	drawNoxImageID(14780, 522, 150)



	G.pop()
end

function NoxInterface:drawquickBar()
	G.push()
	G.translate(NoxInterface.drawwidth/2 - 152, NoxInterface.drawheight - (768-693))

	-- Draw left, mid, right part of quickbar
	drawNoxImageID(14415,0,0)
	drawNoxImageID(14446,0,0)
	drawNoxImageID(14447,0,0)

	G.setFont(NoxInterface.font6pt)

	-- Draw spell icons
	local offsetx = 0
	local set = NoxInterface.player.player.spellsets[self.player.player.activespellset]
	for k,v in pairs(set) do
		drawNoxImageID(v.i1, 71 + offsetx * 37, 34)
		
		offsetx = offsetx + 1
	end

	-- Draw backdrop for binds
	drawNoxImageID(14424,0,0)
	drawNoxImageID(14425,0,0)
	drawNoxImageID(14426,0,0)
	drawNoxImageID(14427,0,0)
	drawNoxImageID(14428,0,0)

	-- Draw binds
	G.print(string.upper(binds.spell1), 83, 62)
	G.print(string.upper(binds.spell2), 120, 62)
	G.print(string.upper(binds.spell3), 158, 62)
	G.print(string.upper(binds.spell4), 195, 62)
	G.print(string.upper(binds.spell5), 232, 62)

	G.pop()
end

function NoxInterface:drawgui()
	local drawMana = NoxInterface.player.player.maxmana > 0
	drawNoxImageID(14508,-1,NoxInterface.drawheight - 126)
	drawNoxImageID(14453,NoxInterface.drawwidth - 91, NoxInterface.drawheight - 201)

	-- Health
	if(NoxInterface.player.player.ispoisioned) then
		G.setColor(0,0xD0,0,255 * 0.7)
	else
		G.setColor(0xD0,0,0,255 * 0.7)
	end

	G.rectangle("fill", NoxInterface.drawwidth - 52, NoxInterface.drawheight - 168, 15, 126 * (NoxInterface.player.health / NoxInterface.player.player.maxhealth))

	if(drawMana) then
		G.setColor(0,0,0xD0,255 * 0.7)
		G.rectangle("fill", NoxInterface.drawwidth - 27, NoxInterface.drawheight - 168, 15, 126 * (NoxInterface.player.player.mana / NoxInterface.player.player.maxmana))
	end

	G.setColor(255,255,255,255)
	if(drawMana) then
		drawNoxImageID(14448,NoxInterface.drawwidth - 91, NoxInterface.drawheight - 201)
	else
		drawNoxImageID(14505,NoxInterface.drawwidth - 91, NoxInterface.drawheight - 201)
	end

	G.print(string.upper(binds.potion1), NoxInterface.drawwidth - (1024 - 936), NoxInterface.drawheight - (768 - 757))
	G.print(string.upper(binds.potion2), NoxInterface.drawwidth - (1024 - 963), NoxInterface.drawheight - (768 - 757))

	if(drawMana) then
		G.print(string.upper(binds.potion3), NoxInterface.drawwidth - (1024 - 990), NoxInterface.drawheight - (768 - 757))
	end

	G.print(string.upper(binds.swap), 18, NoxInterface.drawheight - (768- 742))

	
end

function NoxInterface:update()
	if(NoxLocalPlayerController.pressedKeys[binds.toggleinventory]) then
		NoxInterface.inventoryVisible = not NoxInterface.inventoryVisible
	end
end

local CursorMoveImages = {135953, 135954, 135955, 135956, 135957, 
	135958, 135959, 135960, 135961, 135962, 135963, 135964, 135965, 135966, 
	135928, 135967, 135929, 135930, 135931, 135932, 135933, 135934, 135935, 
	135936, 135937, 135940, 135941, 135942, 135943, 135944, 135938, 135945, 
	135946, 135947, 135968, 135969, 135970, 135971, 135972, 135973, 135974, 
	135975, 135976, 135977, 135978, 135979, 135980, 135981, 135982, 135983, 
	135984, 135985, 135986, 135987, 135988, 135989, 135990, 135991, 135992, 
	135993, 135994, 135995, 135996, 135997}

function NoxInterface:drawCursor()
	local mouseX, mouseY = love.mouse.getPosition();

	local centerX, centerY = camera:worldToLocal(NoxInterface.player.x, NoxInterface.player.y)

	local cursorangle = math.atan2(centerY - mouseY, centerX - mouseX)
	local cursordist = math.pow(mouseY - centerY, 2) + math.pow(mouseX - centerX, 2);
	local frame = math.min(math.floor(((cursorangle + math.pi) / (math.pi * 2)) *32), 31);

	if (cursordist >= 10000) then
		frame = frame + 32;
	end

	drawNoxImageID(CursorMoveImages[frame + 1], mouseX - 64, mouseY - 64)
end



function NoxInterface:draw()
	if(not NoxInterface.player) then
		return
	end

	-- Scaling trick
	NoxInterface.drawwidth = G.getWidth() / NoxInterface.scale
	NoxInterface.drawheight = G.getHeight() / NoxInterface.scale
	G.push()
	G.scale(NoxInterface.scale,NoxInterface.scale)


	G.setCanvas()
	G.setShader(nil)
	G.setColor(255,255,255,255)
	
	self:drawgui()
	self:drawquickBar()	

	if NoxInterface.inventoryVisible then
		self:drawInventory()
	end

	-- Undo scaling
	G.pop()

	-- Unapply scaling i guess
	NoxInterface.drawwidth = G.getWidth()
	NoxInterface.drawheight = G.getHeight()

	self:drawCursor()

end
