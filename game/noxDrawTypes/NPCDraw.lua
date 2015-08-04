local NPCDraw = {}

NPCDraw.name = "NPCDraw"

NPCDraw.AnimatePerSecond = 1 / 10

local rdraw = renderer.drawObject

function NPCDraw:initObject(obj)
	local angle = (0 + 45.0*0.5) % 360.0
	--angle = (angle + 45.0*0.5) % 360.0
	local offset = math.floor(angle/45.0) + 1
	obj.anidirection = AnimationDirectionConversion[offset] 
	obj.animationOffset = 1
	obj.sequence = "IDLE"

	local tt = ThingDB.Things["NewPlayer"]
	obj.spriteStatesS = {}

	for k,v in pairs(tt.SpriteStates) do
		obj.spriteStatesS[v.Name] = v
		obj.spriteStatesS[v.Name].sequences = {}
		for k2,v2 in pairs(obj.spriteStatesS[v.Name].Animation.Sequences) do
			obj.spriteStatesS[v.Name].sequences[v2.Name] = v2
		end
	end

end

function NPCDraw:draw(obj)
	-- Hack, renderer draws generic objects only, but isn't build to deal with complex objects such as the player 
	-- So We set various variables on the player object and then draw it multiple times
	local curtime = love.timer.getTime()

	if curtime - obj.animationLastUpdate > NPCDraw.AnimatePerSecond then
		obj.animationLastUpdate = curtime

		obj.animationOffset = ((obj.animationOffset + 1) % (#obj.spriteStatesS[obj.sequence].sequences["NAKED"].Frames / 8))
	else
		obj.animationOffset = ((obj.animationOffset) % (#obj.spriteStatesS[obj.sequence].sequences["NAKED"].Frames / 8))
	end

	local toRender = {}

	local playerColorObject = {}
	playerColorObject.sequencename = "NAKED"
	for k,v in pairs(obj.mapXfer.NPCColors) do
		playerColorObject["COLOR" .. k] = { v.R, v.G, v.B, v.A }
	end
	toRender[#toRender + 1] = playerColorObject

	for _,seqid in pairs(PlayerArmorIds) do
		for k,v in pairs(obj.npcInventoryList) do
			local db = ModDB.Mods[v.Name]
			if (ItemNameToSequenceID[v.Name] == seqid and db.type == "ARMOR_DEFINITIONS")  then
				local item = {}
				item.sequencename = ItemNameToSequenceName[v.Name]

				
				if(db.COLOR1) then
					item.COLOR1 = { db.COLOR1.R, db.COLOR1.G, db.COLOR1.B, db.COLOR1.A }
				end
				if(db.COLOR1) then
					item.COLOR2 = { db.COLOR2.R, db.COLOR2.G, db.COLOR2.B, db.COLOR2.A }
				end
				if(db.COLOR2) then
					item.COLOR3 = { db.COLOR3.R, db.COLOR3.G, db.COLOR3.B, db.COLOR3.A }
				end
				if(db.COLOR3) then
					item.COLOR4 = { db.COLOR4.R, db.COLOR4.G, db.COLOR4.B, db.COLOR4.A }
				end
				if(db.COLOR4) then
					item.COLOR5 = { db.COLOR5.R, db.COLOR5.G, db.COLOR5.B, db.COLOR5.A }
				end
				if(db.COLOR6) then
					item.COLOR6 = { db.COLOR6.R, db.COLOR6.G, db.COLOR6.B, db.COLOR6.A }
				end
				toRender[#toRender + 1] = item
			end
		end
	end

	for _,seqid in pairs(PlayerWeaponIds) do
		for k,v in pairs(obj.npcInventoryList) do
			local db = ModDB.Mods[v.Name]
			if (ItemNameToSequenceID[v.Name] == seqid and db.type == "WEAPON_DEFINITIONS")  then
				local item = {}
				item.sequencename = ItemNameToSequenceName[v.Name]

				
				if(db.COLOR1) then
					item.COLOR1 = { db.COLOR1.R, db.COLOR1.G, db.COLOR1.B, db.COLOR1.A }
				end
				if(db.COLOR1) then
					item.COLOR2 = { db.COLOR2.R, db.COLOR2.G, db.COLOR2.B, db.COLOR2.A }
				end
				if(db.COLOR2) then
					item.COLOR3 = { db.COLOR3.R, db.COLOR3.G, db.COLOR3.B, db.COLOR3.A }
				end
				if(db.COLOR3) then
					item.COLOR4 = { db.COLOR4.R, db.COLOR4.G, db.COLOR4.B, db.COLOR4.A }
				end
				if(db.COLOR4) then
					item.COLOR5 = { db.COLOR5.R, db.COLOR5.G, db.COLOR5.B, db.COLOR5.A }
				end
				if(db.COLOR6) then
					item.COLOR6 = { db.COLOR6.R, db.COLOR6.G, db.COLOR6.B, db.COLOR6.A }
				end
				toRender[#toRender + 1] = item
			end
		end
	end



	


	for k,v in pairs(toRender) do
		obj:UpdateSpriteId(obj.spriteStatesS[obj.sequence].sequences[v.sequencename].Frames[obj.animationOffset + 
			(#obj.spriteStatesS[obj.sequence].sequences[v.sequencename].Frames / 8) * obj.anidirection + 1])

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

return NPCDraw
