NoxSpells = {}

NoxAbilities = {}

function NoxSpells:get(name)
	return ThingDB.Spells[name]
end

function NoxAbilities:get(name)
	return ThingDB.Abilities[name]
end