local PlayerDraw = {}

PlayerDraw.name = "PlayerDraw"

PlayerDraw.AnimatePerSecond = 1 / 10

local rdraw = renderer.drawObject

function PlayerDraw:initObject(obj)
end

function PlayerDraw:draw(obj)
	-- Hack, renderer draws generic objects only, but isn't build to deal with complex objects such as the player 
	-- So We set various variables on the player object and then draw it multiple times

	local toRender = {}

	table.insert(toRender, {
		sequencename = "NAKED",
		COLOR1 = { 0x73, 0x4d, 0x22, 255 },
		COLOR2 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR3 = { 0xFF, 0x0,  0xFF, 255 },
		COLOR4 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR5 = { 0xda, 0x9a, 0x6e, 255 },
		COLOR6 = { 0xda, 0x9a, 0x6e, 255 }
	})

	for _,seqid in pairs(PlayerArmor) do
		for k,v in pairs(obj.player.inventory) do
			if (v.sequenceid == seqid) and v.isequiped then
				table.insert(toRender, v)
			end
		end
	end


	for k,v in pairs(toRender) do
		obj:UpdateSpriteId(obj.player.spriteStates[obj.player.sequence].sequences[v.sequencename].Frames[obj.player.animationOffset + 
			(#obj.player.spriteStates[obj.player.sequence].sequences[v.sequencename].Frames / 8) * obj.player.anidirection + 1])

		if(v.COLOR1) then
			obj.COLOR1 = v.COLOR1
		end
		if(v.COLOR2) then
			obj.COLOR2 = v.COLOR2
		end
		if(v.COLOR3) then
			obj.COLOR3 = v.COLOR3
		end
		if(v.COLOR4) then
			obj.COLOR4 = v.COLOR4
		end
		if(v.COLOR5) then
			obj.COLOR5 = v.COLOR5
		end
		if(v.COLOR6) then 
			obj.COLOR6 = v.COLOR6
		end

		if(obj.quad) then
			renderer.drawObject(obj)			
		end
	end
end

return PlayerDraw
