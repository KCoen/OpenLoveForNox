-- Whole bunch of offsets based on https://bitbucket.org/awesie/nox-js
-- Should probably have went down the statebased path a littlebit more.


NoxInterface = {}
NoxInterface.scale = 1.0
NoxInterface.drawwidth = 0
NoxInterface.drawheight = 0

local G = love.graphics

NoxInterface.player = nil
NoxInterface.font6pt = G.newFont( "content/VeraMono.ttf", 8 )
NoxInterface.inventoryX = 10
NoxInterface.inventoryY = 0

NoxInterface.inventoryYMin = -325

NoxInterface.inventoryScrollLocation = 0

NoxInterface.inventoryYSpeed = 0

NoxInterface.mouseCollides = {}

NoxInterface.draggingItem = false
NoxInterface.draggingItemSlot = 1

NoxInterface.lastPressX = 0
NoxInterface.lastPressY = 0
NoxInterface.lastPressTime = 0


function NoxInterface:toggleInventory()
	--[[if NoxInterface.inventoryY ~= 0 and NoxInterface.inventoryY ~= NoxInterface.inventoryYMin then
		return
	end--]]
	audio:playSound("uinveop")

	if NoxInterface.inventoryY == 0 then
		NoxInterface.inventoryYSpeed = -600
	else
		NoxInterface.inventoryYSpeed = 600
	end
end

function isPointInCollider(mx,my,v)
	if v.shape == "circle" then
		return false
	else
		if mx < v.x then return false end
		if my < v.y then return false end
		if mx > v.x + v.w then return false end
		if my > v.y + v.h then return false end

		return true
	end
end



function NoxInterface:setMouseCollideCircle(x,y,radius, onPressCallback, onReleaseCallback, whileDown, userdata)
	local x,y,w,h = love.graphics.translateQuad(x,y,radius,radius)
	radius = w + h / 2
	local mousecollide = { shape="circle", x=x, y=y, radius=radius, userdata=userdata, onPressCallback=onPressCallback, onReleaseCallback=onReleaseCallback, whileDown=whileDown }
	table.insert(NoxInterface.mouseCollides, mousecollide)

	return mousecollide
end

function NoxInterface:setMouseCollide(x,y,w,h, onPressCallback, onReleaseCallback, whileDown, userdata)
	local x,y,w,h = love.graphics.translateQuad(x,y,w,h)
	local mousecollide = { shape="rectangle",x=x, y=y, w=w, h=h, userdata=userdata, onPressCallback=onPressCallback, onReleaseCallback=onReleaseCallback, whileDown=whileDown }
	table.insert(NoxInterface.mouseCollides, mousecollide)

	return mousecollide
end

function NoxInterface:drawMouseCollides()
	for k,v in pairs(NoxInterface.mouseCollides) do
		if(v.shape =="rectangle") then
			G.rectangle("line", v.x, v.y, v.w, v.h)
		elseif(v.shape =="circle") then
			G.circle("line", v.x,v.y, v.radius, 32)
		end
	end
end

function drawNoxImageID(id, x,y)
	local quad,img = videobagcache:getSprite(id, true)
	if(quad and img) then
		local vbc_ent = VideoBag.Sprites[id]

		G.draw(img, quad, vbc_ent.offsetX + x, vbc_ent.offsetY + y)
	else
		print("Can't find imgid", id)
	end
end

function drawNoxButton(idA, idB, x,y, collider)
	if isPointInCollider(NoxInterface.lastPressX, NoxInterface.lastPressY, collider) and NoxInterface.lastPressTime + 0.2 > love.timer.getTime() then
		drawNoxImageID(idB, x,y)
		return
	end
	if idA > 0 then
		drawNoxImageID(idA, x,y)
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

NoxInterface.barPressY = 0
NoxInterface.pressInventoryScrollLocation = 0

function NoxInterface:drawInventory()
	G.push()
	G.translate(NoxInterface.inventoryX, NoxInterface.inventoryY)

	-- Background
	G.setColor(0,0,0,255)
	G.rectangle("fill", 0, 0, 210, 215 )
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
			if v then
				if (v.sequenceid == seqid) and v.isequiped and v.modtype == "ARMOR_DEFINITIONS" then
					drawNoxImageID46(v, ModelArmor[v.sequenceid], 0,15);
				end
			end
		end
	end

	for _,seqid in pairs(PlayerWeapon) do
		for k,v in pairs(NoxInterface.player.player.inventory) do
			if v then
				if (v.sequenceid == seqid) and v.isequiped and v.modtype == "WEAPON_DEFINITIONS" then
					drawNoxImageID46(v, ModelWeapon[v.sequenceid], 0,15);
				end
			end
		end
	end

	drawNoxImageID(14755,0, 0)
	drawNoxImageID(14775,254, 13)
	drawNoxImageID(14757,314, 13) 
	drawNoxImageID(14763,314, 63) 
	drawNoxImageID(14767,314, 113)


	drawNoxButton(-1, 14782, 0, 0, 
	self:setMouseCollide(549, 2, 13, 13, function()
		NoxInterface:toggleInventory()
	end))

	local barYOffset = (NoxInterface.inventoryScrollLocation / (NoxInterface.player.player.inventorySlots/4) * 80)
	drawNoxButton(14601, 14593, 522, 25 + barYOffset,
	self:setMouseCollide(525, 37 + barYOffset, 11, 22,
			function(x,y) 
				NoxInterface.barPressY = y
				NoxInterface.pressInventoryScrollLocation = NoxInterface.inventoryScrollLocation
			end,
			function ()	end,
			function(x,y,dx,dy) 
				local dy = y - NoxInterface.barPressY
				NoxInterface.inventoryScrollLocation = NoxInterface.pressInventoryScrollLocation + round(dy / 80 * (NoxInterface.player.player.inventorySlots/4))

				if (NoxInterface.inventoryScrollLocation < 0) then
					NoxInterface.inventoryScrollLocation = 0
				end

				if(NoxInterface.inventoryScrollLocation > NoxInterface.player.player.inventorySlots / 4) then
					NoxInterface.inventoryScrollLocation = NoxInterface.player.player.inventorySlots / 4
				end
			end
	)) -- Bar

	drawNoxButton(14778,14779, 522, 0,
	self:setMouseCollide(522, 0, 22, 25, function()
		NoxInterface.inventoryScrollLocation = NoxInterface.inventoryScrollLocation - 1

		if (NoxInterface.inventoryScrollLocation < 0) then
			NoxInterface.inventoryScrollLocation = 0
		end
	end))

	drawNoxButton(14780,14781, 522, 150,
	self:setMouseCollide(522, 150, 22, 25, function()
		NoxInterface.inventoryScrollLocation = NoxInterface.inventoryScrollLocation + 1

		if(NoxInterface.inventoryScrollLocation > NoxInterface.player.player.inventorySlots / 4) then
			NoxInterface.inventoryScrollLocation = NoxInterface.player.player.inventorySlots / 4
		end
	end))


	local offset = 0
	for i = (self.inventoryScrollLocation * 4), ((self.inventoryScrollLocation + 3) * 4) - 1 do
		local v = self.player.player.inventory[i + 1]

		col = offset % 4 
		row = (offset - offset % 4) / 4


		if v then
			if v == NoxInterface.draggingItem then
				local length = math.sqrt((NoxInterface.lastPressX - love.mouse.getX()) * (NoxInterface.lastPressX - love.mouse.getX()) + 
					(NoxInterface.lastPressY - love.mouse.getY()) * (NoxInterface.lastPressY - love.mouse.getY()))

				if(length < 15) then
					drawNoxImageID46(v, v.spriteMenuIcon, 314 + (col * 50) - 40, 13 + (row * 50) - 40);

					if(v.isequiped) then
						drawNoxImageID(14672, 314 + (col * 50), 13 + (row * 50))
					elseif(v.isprevweapon) then
						drawNoxImageID(14691, 314 + (col * 50), 13 + (row * 50))
					end
				end
			else
				drawNoxImageID46(v, v.spriteMenuIcon, 314 + (col * 50) - 40, 13 + (row * 50) - 40);

				if(v.isequiped) then
					drawNoxImageID(14672, 314 + (col * 50), 13 + (row * 50))
				elseif(v.isprevweapon) then
					drawNoxImageID(14691, 314 + (col * 50), 13 + (row * 50))
				end
			end
		end

		self:setMouseCollide(314 + (col * 50), 13 + (row * 50), 50, 50, 
					function(x,y) 
						if v then
							NoxInterface.draggingItem = v
							NoxInterface.draggingItemSlot = i + 1
						end
					end,
					function(x,y) 

						if NoxInterface.draggingItem and NoxInterface.draggingItem == v then
							if v.use then
								v.use()
							end
						elseif NoxInterface.draggingItem then
							self.player.player.inventory[i + 1] = NoxInterface.draggingItem 
							if v then
								self.player.player.inventory[NoxInterface.draggingItemSlot] = v
							else
								self.player.player.inventory[NoxInterface.draggingItemSlot] = false
							end
						end
						NoxInterface.draggingItem = false
					end,
					function() 


					end)

		offset = offset +1
	end

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
		if v then
			drawNoxImageID(v.i1, 71 + offsetx * 37, 34)
			self:setMouseCollide(71 + offsetx * 37, 34, 32, 32)
			
			offsetx = offsetx + 1
		end
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

	NoxInterface:setMouseCollideCircle(NoxInterface.drawwidth - (1024 - 952),NoxInterface.drawheight - (768 - 748) ,7)
	NoxInterface:setMouseCollideCircle(NoxInterface.drawwidth - (1024 - 981),NoxInterface.drawheight - (768 - 748) ,7)


	if(drawMana) then
		G.print(string.upper(binds.potion3), NoxInterface.drawwidth - (1024 - 990), NoxInterface.drawheight - (768 - 757))
		NoxInterface:setMouseCollideCircle(NoxInterface.drawwidth - (1024 - 1009),NoxInterface.drawheight - (768 - 748) ,7)
	end

	G.print(string.upper(binds.swap), 18, NoxInterface.drawheight - (768- 742))

	local hasweaponequiped = false
	
	for k,v in pairs(NoxInterface.player.player.inventory) do
		if v then
			if v.isequiped and v.modtype == "WEAPON_DEFINITIONS" then
				drawNoxImageID46(v, v.spriteMenuIcon, -13, NoxInterface.drawheight - 112);

				if v.equipment.charges then
					G.print(v.equipment.charges .. "", 64, NoxInterface.drawheight - (768 - 668))
				end
				hasweaponequiped = true
			end
		end
	end

	if not hasweaponequiped then
		drawNoxImageID(14399, 23, NoxInterface.drawheight - 78);
	end
	
end

function NoxInterface:update(dt)
	NoxInterface.inventoryY = NoxInterface.inventoryY + NoxInterface.inventoryYSpeed * dt
	if(NoxInterface.inventoryY > 0) then
		NoxInterface.inventoryY = 0
		NoxInterface.inventoryYSpeed = 0
	end

	if(NoxInterface.inventoryY < NoxInterface.inventoryYMin) then
		NoxInterface.inventoryY = NoxInterface.inventoryYMin
		NoxInterface.inventoryYSpeed = 0
	end

	if(NoxLocalPlayerController.pressedKeys[binds.toggleinventory]) then
		self:toggleInventory()
	end
end

function NoxInterface:mousemoved(x,y,dx,dy)
	for k,v in pairs(NoxInterface.downCallbacks) do
		if(v.whileDown) then
			v.whileDown(x,y,dx,dy, v.userdata)
		end	
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

	if NoxInterface.draggingItem then

		local length = math.sqrt((NoxInterface.lastPressX - love.mouse.getX()) * (NoxInterface.lastPressX - love.mouse.getX()) + 
			(NoxInterface.lastPressY - love.mouse.getY()) * (NoxInterface.lastPressY - love.mouse.getY()))

		if(length > 15) then
			drawNoxImageID46(NoxInterface.draggingItem, NoxInterface.draggingItem.spriteMenuIcon, mouseX - 40, mouseY - 40);
		end
	end
	
end



function NoxInterface:draw()
	if(not NoxInterface.player) then
		return
	end

	NoxInterface.mouseCollides = {}

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

	if NoxInterface.inventoryY ~= NoxInterface.inventoryYMin then
		self:drawInventory()
	end

	-- Undo scaling
	G.pop()

	-- Unapply scaling i guess
	NoxInterface.drawwidth = G.getWidth()
	NoxInterface.drawheight = G.getHeight()

	self:drawCursor()

	if(gameconf.debug) then
		self:drawMouseCollides()
	end

end

NoxInterface.lastPressX = 0
NoxInterface.lastPressY = 0
NoxInterface.lastPressTime = 0


NoxInterface.downCallbacks = {}



function NoxInterface:mousereleased(mx,my,button)
	if button ~= "l" then
		return
	end

	for k,v in pairs(NoxInterface.mouseCollides) do
		if(isPointInCollider(mx,my, v)) then
			if(v.onReleaseCallback) then
				v.onReleaseCallback(mx,my, v.userdata)
			end
		end


		--[[if v.shape == "circle" then

		else
			if mx < v.x then goto continue end
			if my < v.y then goto continue end
			if mx > v.x + v.w then goto continue end
			if my > v.y + v.h then goto continue end

			if(v.onReleaseCallback) then
				v.onReleaseCallback(mx,my, v.userdata)
			end
		end
		::continue::--]]
	end

	NoxInterface.downCallbacks = {}
end

function NoxInterface:mousepressed(mx,my,button)
	if button ~= "l" then
		return
	end

	NoxInterface.lastPressX = mx
	NoxInterface.lastPressY = my
	NoxInterface.lastPressTime = love.timer.getTime()
 
	for k,v in pairs(NoxInterface.mouseCollides) do
		if(isPointInCollider(mx,my, v)) then
			if(v.onPressCallback) then
				v.onPressCallback(mx,my, v.userdata)
				table.insert(NoxInterface.downCallbacks, v)
			end
		end
	end
end
