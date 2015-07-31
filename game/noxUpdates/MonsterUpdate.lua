local MonsterUpdate = {}
MonsterUpdate.name = "MonsterUpdate"

MonsterAnimationTypeId = {
	walk = 12,
	run = 13,
	meleeAttack = 1 ,
	castSpell = 7,
	missileAttack = 3,
	blockStart = 5,
	blockFinish = 6,
	idle = 8,
	dying = 9,
	dead = 10,
	morphRevert = 15,
	morphToChest = 14
}


function MonsterUpdate:initObject(obj)
	obj.monster = {}
	obj.monster.animationType = "idle"
	obj.monster.animationOffset = -1
	obj.monster._object = obj -- Add a circulare reference

end

function MonsterUpdate:update(dt)
end

function MonsterUpdate:updateObject(obj, dt)	

end

return MonsterUpdate
