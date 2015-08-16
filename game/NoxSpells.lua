NoxSpells = {}

NoxAbilities = {}

function NoxSpells:load()
	ThingDB.SpellsSorted = {}

	for k,v in pairs(ThingDB.Spells) do
		table.insert(ThingDB.SpellsSorted, v)
	end

	table.sort(ThingDB.SpellsSorted, function(a,b) 
			return getNoxString(a.NameString) < getNoxString(b.NameString)
		end)

	for k,v in pairs(ThingDB.Spells) do -- Hack
		local start, ending = string.find(v.NameString, "thing.db:Summon")
		if ending then
			local monsterName = string.sub(v.NameString, ending + 1)


			if MonsterDB[monsterName] then
				MonsterDB[monsterName].SummonSpell = v
				v.SummonMonster = MonsterDB[monsterName]
			end			
		end
	end
end

function NoxSpells:get(name)
	return ThingDB.Spells[name]
end

function NoxAbilities:get(name)
	return ThingDB.Abilities[name]
end