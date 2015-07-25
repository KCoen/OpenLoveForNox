local DamageCollide = {}
DamageCollide.name = "DamageCollide"

function DamageCollide:initObject(obj, ...)
	local arg = {...}
	obj.damagecollide = {}
	obj.damagecollide.type = arg[2]
	obj.damagecollide.amount = arg[1]
end

function DamageCollide:onCollide(objself, objtarget, fixself, fixtarget)

end

return DamageCollide
