-- Whole bunch of offsets, re work and code taken from https://bitbucket.org/awesie/nox-js

NoxInterface = {}
NoxInterface.pixeldouble = false
local G = love.graphics

local wwidth
local wheight

NoxInterface.player = nil
NoxInterface.font6pt = G.newFont( "content/VeraMono.ttf", 8 )

local PlayerAbility = {
	ABILITY_BERSERKER_CHARGE = 1,
	ABILITY_WARCRY = 2,
	ABILITY_HARPOON = 3,
	ABILITY_TREAD_LIGHTLY = 4,
	ABILITY_EYE_OF_THE_WOLF = 5
}

local AbilityDelays = {};
AbilityDelays[PlayerAbility.ABILITY_BERSERKER_CHARGE] = { 300 };
AbilityDelays[PlayerAbility.ABILITY_WARCRY] = { 300 };
AbilityDelays[PlayerAbility.ABILITY_HARPOON] = { 150 };
AbilityDelays[PlayerAbility.ABILITY_TREAD_LIGHTLY] = { 30 };
AbilityDelays[PlayerAbility.ABILITY_EYE_OF_THE_WOLF] = { 600 };

local AbilityImages = {}
AbilityImages[PlayerAbility.ABILITY_BERSERKER_CHARGE] = {132051, 132056 };
AbilityImages[PlayerAbility.ABILITY_WARCRY] = { 132049, 132054 };
AbilityImages[PlayerAbility.ABILITY_HARPOON] = { 135678, 135679 };
AbilityImages[PlayerAbility.ABILITY_TREAD_LIGHTLY] = { 132048, 132053 };
AbilityImages[PlayerAbility.ABILITY_EYE_OF_THE_WOLF] = { 132052, 132057 };

local QuickBarSlots = {
	PlayerAbility.ABILITY_BERSERKER_CHARGE,
	PlayerAbility.ABILITY_WARCRY,
	PlayerAbility.ABILITY_HARPOON,
	PlayerAbility.ABILITY_TREAD_LIGHTLY,
	PlayerAbility.ABILITY_EYE_OF_THE_WOLF
};


function drawNoxImageID(id, x,y)
	local quad,img = videobagcache:getSprite(id, true)
	if(quad and img) then
		local vbc_ent = VideoBag.Sprites[id]

		G.draw(img, quad, vbc_ent.offsetX + x, vbc_ent.offsetY + y)
	else
		print("Can't find imgid", id)
	end
end


function NoxInterface:load()
	NoxInterface.player = localplayer
end

function NoxInterface:bind(playerobject)
	NoxInterface.player = playerobject
end

function NoxInterface:drawquickBar()
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
	G.print(binds.spell1, 83, 62)
	G.print(binds.spell2, 120, 62)
	G.print(binds.spell3, 158, 62)
	G.print(binds.spell4, 195, 62)
	G.print(binds.spell5, 232, 62)
end

function NoxInterface:drawgui()
	local drawMana = NoxInterface.player.player.maxmana > 0
	drawNoxImageID(14508,-1,wheight - 126)
	drawNoxImageID(14453,wwidth - 91, wheight - 201)

	-- Health
	if(NoxInterface.player.player.ispoisioned) then
		G.setColor(0,0xD0,0,255 * 0.7)
	else
		G.setColor(0xD0,0,0,255 * 0.7)
	end

	G.rectangle("fill", wwidth - 52, wheight - 168, 15, 126 * (NoxInterface.player.health / NoxInterface.player.player.maxhealth))

	if(drawMana) then
		G.setColor(0,0,0xD0,255 * 0.7)
		G.rectangle("fill", wwidth - 27, wheight - 168, 15, 126 * (NoxInterface.player.player.mana / NoxInterface.player.player.maxmana))
	end

	G.setColor(255,255,255,255)
	if(drawMana) then
		drawNoxImageID(14448,wwidth - 91, wheight - 201)
	else
		drawNoxImageID(14505,wwidth - 91, wheight - 201)
	end

	G.print(binds.potion1, wwidth - (1024 - 936), wheight - (768 - 757))
	G.print(binds.potion2, wwidth - (1024 - 963), wheight - (768 - 757))

	if(drawMana) then
		G.print(binds.potion3, wwidth - (1024 - 990), wheight - (768 - 757))
	end
	
end

function NoxInterface:draw()
	if(not NoxInterface.player) then
		return
	end

	
	if(NoxInterface.pixeldouble) then
		wwidth = G.getWidth() / 2
		wheight = G.getHeight() / 2
		G.push()
		G.scale(2.0,2.0)
	else
		wwidth = G.getWidth()
		wheight = G.getHeight()
	end

	G.setCanvas()
	G.setShader(nil)
	G.setColor(255,255,255,255)
	
	self:drawgui()

	G.push()
	G.translate(wwidth/2 - 152, wheight - (768-693))
	
	self:drawquickBar()
	
	G.pop()

	if(NoxInterface.pixeldouble) then
		G.pop()
	end

end