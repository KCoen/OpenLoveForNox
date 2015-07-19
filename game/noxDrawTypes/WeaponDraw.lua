local WeaponDraw = {}

WeaponDraw.name = "WeaponDraw"

WeaponDraw.AnimatePerSecond = 1 / 16

local rdraw = renderer.drawObject

function WeaponDraw:initObject(obj)
	local index = obj.spriteAnimFrames[1];
	UpdateObjectSpriteId(obj, index)
	
	local db = ModDB.Mods[obj.objName]
	if(db.COLOR1) then
		obj.COLOR1 = { db.COLOR1.R, db.COLOR1.G, db.COLOR1.B, db.COLOR1.A }
	end
	if(db.COLOR1) then
		obj.COLOR2 = { db.COLOR2.R, db.COLOR2.G, db.COLOR2.B, db.COLOR2.A }
	end
	if(db.COLOR2) then
		obj.COLOR3 = { db.COLOR3.R, db.COLOR3.G, db.COLOR3.B, db.COLOR3.A }
	end
	if(db.COLOR3) then
		obj.COLOR4 = { db.COLOR4.R, db.COLOR4.G, db.COLOR4.B, db.COLOR4.A }
	end
	if(db.COLOR4) then
		obj.COLOR5 = { db.COLOR5.R, db.COLOR5.G, db.COLOR5.B, db.COLOR5.A }
	end
	if(db.COLOR6) then
		obj.COLOR6 = { db.COLOR6.R, db.COLOR6.G, db.COLOR6.B, db.COLOR6.A }
	end
end

function WeaponDraw:draw(obj)
	rdraw(obj)
end

return WeaponDraw
