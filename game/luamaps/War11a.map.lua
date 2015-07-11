
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_4 = 0
	Gvar_5 = 1
	Gvar_6 = 2
	Gvar_7 = 3
	Gvar_8 = 4
	Gvar_14 = Gvar_4
	Gvar_15 = Gvar_5
	Gvar_16 = Gvar_4
	Gvar_17 = Gvar_5
	Gvar_18 = Gvar_4
	Gvar_19 = Gvar_5
	Gvar_20 = Gvar_4
	Gvar_21 = Gvar_5
	Gvar_22 = Gvar_4
	Gvar_23 = Gvar_5
	Gvar_24 = Gvar_4
	Gvar_25 = Gvar_5
	Gvar_26 = Gvar_4
	Gvar_27 = Gvar_5
	Gvar_28 = Gvar_4
	Gvar_29 = Gvar_5
	Gvar_30 = Gvar_4
	Gvar_31 = Gvar_5
	Gvar_32 = false
	Gvar_33 = true
	Gvar_36 = 0
	Gvar_37 = 0
	Gvar_39 = 0
	Gvar_40 = 0
	Gvar_41 = 0
	Gvar_42 = 0
	Gvar_43 = 1
	if true then return end
end
function Flame0()
	var_2 = Gvar_15
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_15 = Gvar_5
	Gvar_14 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_9[0])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[0])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[0])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[0])
	if not Gvar_14 == Gvar_4 then 
		goto l218
	end
	Gvar_15 = Gvar_6
	goto l225
	::l218::
	Gvar_15 = Gvar_4
	::l225::
	Gvar_14 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_9[0])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[0])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[0])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[0])
	if not Gvar_14 == Gvar_5 then 
		goto l351
	end
	Gvar_15 = Gvar_7
	goto l358
	::l351::
	Gvar_15 = Gvar_5
	::l358::
	Gvar_14 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_9[0])
	var_1[1] = SpawnObject("Flame",Gvar_11[0])
	var_1[2] = SpawnObject("Flame",Gvar_12[0])
	var_1[3] = SpawnObject("Flame",Gvar_13[0])
	if not Gvar_14 == Gvar_6 then 
		goto l484
	end
	Gvar_15 = Gvar_8
	goto l491
	::l484::
	Gvar_15 = Gvar_6
	::l491::
	Gvar_14 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_9[0])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_9[0])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[0])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[0])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[0])
	Gvar_15 = Gvar_7
	Gvar_14 = Gvar_8
	goto l625
	::l625::
	if not Gvar_14 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,2)
	::l640::
	if true then return end
end
function Flame1()
	var_2 = Gvar_17
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_17 = Gvar_5
	Gvar_16 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_9[1])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[1])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[1])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[1])
	if not Gvar_16 == Gvar_4 then 
		goto l218
	end
	Gvar_17 = Gvar_6
	goto l225
	::l218::
	Gvar_17 = Gvar_4
	::l225::
	Gvar_16 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_9[1])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[1])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[1])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[1])
	if not Gvar_16 == Gvar_5 then 
		goto l351
	end
	Gvar_17 = Gvar_7
	goto l358
	::l351::
	Gvar_17 = Gvar_5
	::l358::
	Gvar_16 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_9[1])
	var_1[1] = SpawnObject("Flame",Gvar_11[1])
	var_1[2] = SpawnObject("Flame",Gvar_12[1])
	var_1[3] = SpawnObject("Flame",Gvar_13[1])
	if not Gvar_16 == Gvar_6 then 
		goto l484
	end
	Gvar_17 = Gvar_8
	goto l491
	::l484::
	Gvar_17 = Gvar_6
	::l491::
	Gvar_16 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_9[1])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_9[1])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[1])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[1])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[1])
	Gvar_17 = Gvar_7
	Gvar_16 = Gvar_8
	goto l625
	::l625::
	if not Gvar_16 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,3)
	::l640::
	if true then return end
end
function Flame2()
	var_2 = Gvar_19
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_19 = Gvar_5
	Gvar_18 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_9[2])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[2])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[2])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[2])
	if not Gvar_18 == Gvar_4 then 
		goto l218
	end
	Gvar_19 = Gvar_6
	goto l225
	::l218::
	Gvar_19 = Gvar_4
	::l225::
	Gvar_18 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_9[2])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[2])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[2])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[2])
	if not Gvar_18 == Gvar_5 then 
		goto l351
	end
	Gvar_19 = Gvar_7
	goto l358
	::l351::
	Gvar_19 = Gvar_5
	::l358::
	Gvar_18 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_9[2])
	var_1[1] = SpawnObject("Flame",Gvar_11[2])
	var_1[2] = SpawnObject("Flame",Gvar_12[2])
	var_1[3] = SpawnObject("Flame",Gvar_13[2])
	if not Gvar_18 == Gvar_6 then 
		goto l484
	end
	Gvar_19 = Gvar_8
	goto l491
	::l484::
	Gvar_19 = Gvar_6
	::l491::
	Gvar_18 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_9[2])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_9[2])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[2])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[2])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[2])
	Gvar_19 = Gvar_7
	Gvar_18 = Gvar_8
	goto l625
	::l625::
	if not Gvar_18 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,4)
	::l640::
	if true then return end
end
function Flame3()
	var_2 = Gvar_21
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_21 = Gvar_5
	Gvar_20 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_9[3])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[3])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[3])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[3])
	if not Gvar_20 == Gvar_4 then 
		goto l218
	end
	Gvar_21 = Gvar_6
	goto l225
	::l218::
	Gvar_21 = Gvar_4
	::l225::
	Gvar_20 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_9[3])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[3])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[3])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[3])
	if not Gvar_20 == Gvar_5 then 
		goto l351
	end
	Gvar_21 = Gvar_7
	goto l358
	::l351::
	Gvar_21 = Gvar_5
	::l358::
	Gvar_20 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_9[3])
	var_1[1] = SpawnObject("Flame",Gvar_11[3])
	var_1[2] = SpawnObject("Flame",Gvar_12[3])
	var_1[3] = SpawnObject("Flame",Gvar_13[3])
	if not Gvar_20 == Gvar_6 then 
		goto l484
	end
	Gvar_21 = Gvar_8
	goto l491
	::l484::
	Gvar_21 = Gvar_6
	::l491::
	Gvar_20 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_9[3])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_9[3])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[3])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[3])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[3])
	Gvar_21 = Gvar_7
	Gvar_20 = Gvar_8
	goto l625
	::l625::
	if not Gvar_20 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,5)
	::l640::
	if true then return end
end
function Flame4()
	var_2 = Gvar_23
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_23 = Gvar_5
	Gvar_22 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_9[4])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[4])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[4])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[4])
	if not Gvar_22 == Gvar_4 then 
		goto l218
	end
	Gvar_23 = Gvar_6
	goto l225
	::l218::
	Gvar_23 = Gvar_4
	::l225::
	Gvar_22 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_9[4])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[4])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[4])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[4])
	if not Gvar_22 == Gvar_5 then 
		goto l351
	end
	Gvar_23 = Gvar_7
	goto l358
	::l351::
	Gvar_23 = Gvar_5
	::l358::
	Gvar_22 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_9[4])
	var_1[1] = SpawnObject("Flame",Gvar_11[4])
	var_1[2] = SpawnObject("Flame",Gvar_12[4])
	var_1[3] = SpawnObject("Flame",Gvar_13[4])
	if not Gvar_22 == Gvar_6 then 
		goto l484
	end
	Gvar_23 = Gvar_8
	goto l491
	::l484::
	Gvar_23 = Gvar_6
	::l491::
	Gvar_22 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_9[4])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_9[4])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[4])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[4])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[4])
	Gvar_23 = Gvar_7
	Gvar_22 = Gvar_8
	goto l625
	::l625::
	if not Gvar_22 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,6)
	::l640::
	if true then return end
end
function Flame5()
	var_2 = Gvar_25
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_25 = Gvar_5
	Gvar_24 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_10[0])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[5])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[5])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[5])
	if not Gvar_24 == Gvar_4 then 
		goto l218
	end
	Gvar_25 = Gvar_6
	goto l225
	::l218::
	Gvar_25 = Gvar_4
	::l225::
	Gvar_24 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_10[0])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[5])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[5])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[5])
	if not Gvar_24 == Gvar_5 then 
		goto l351
	end
	Gvar_25 = Gvar_7
	goto l358
	::l351::
	Gvar_25 = Gvar_5
	::l358::
	Gvar_24 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_10[0])
	var_1[1] = SpawnObject("Flame",Gvar_11[5])
	var_1[2] = SpawnObject("Flame",Gvar_12[5])
	var_1[3] = SpawnObject("Flame",Gvar_13[5])
	if not Gvar_24 == Gvar_6 then 
		goto l484
	end
	Gvar_25 = Gvar_8
	goto l491
	::l484::
	Gvar_25 = Gvar_6
	::l491::
	Gvar_24 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_10[0])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_10[0])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[5])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[5])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[5])
	Gvar_25 = Gvar_7
	Gvar_24 = Gvar_8
	goto l625
	::l625::
	if not Gvar_24 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,7)
	::l640::
	if true then return end
end
function Flame6()
	var_2 = Gvar_27
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_27 = Gvar_5
	Gvar_26 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_10[1])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[6])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[6])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[6])
	if not Gvar_26 == Gvar_4 then 
		goto l218
	end
	Gvar_27 = Gvar_6
	goto l225
	::l218::
	Gvar_27 = Gvar_4
	::l225::
	Gvar_26 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_10[1])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[6])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[6])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[6])
	if not Gvar_26 == Gvar_5 then 
		goto l351
	end
	Gvar_27 = Gvar_7
	goto l358
	::l351::
	Gvar_27 = Gvar_5
	::l358::
	Gvar_26 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_10[1])
	var_1[1] = SpawnObject("Flame",Gvar_11[6])
	var_1[2] = SpawnObject("Flame",Gvar_12[6])
	var_1[3] = SpawnObject("Flame",Gvar_13[6])
	if not Gvar_26 == Gvar_6 then 
		goto l484
	end
	Gvar_27 = Gvar_8
	goto l491
	::l484::
	Gvar_27 = Gvar_6
	::l491::
	Gvar_26 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_10[1])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_10[1])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[6])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[6])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[6])
	Gvar_27 = Gvar_7
	Gvar_26 = Gvar_8
	goto l625
	::l625::
	if not Gvar_26 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,8)
	::l640::
	if true then return end
end
function Flame7()
	var_2 = Gvar_29
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_29 = Gvar_5
	Gvar_28 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_10[2])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[7])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[7])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[7])
	if not Gvar_28 == Gvar_4 then 
		goto l218
	end
	Gvar_29 = Gvar_6
	goto l225
	::l218::
	Gvar_29 = Gvar_4
	::l225::
	Gvar_28 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_10[2])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[7])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[7])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[7])
	if not Gvar_28 == Gvar_5 then 
		goto l351
	end
	Gvar_29 = Gvar_7
	goto l358
	::l351::
	Gvar_29 = Gvar_5
	::l358::
	Gvar_28 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_10[2])
	var_1[1] = SpawnObject("Flame",Gvar_11[7])
	var_1[2] = SpawnObject("Flame",Gvar_12[7])
	var_1[3] = SpawnObject("Flame",Gvar_13[7])
	if not Gvar_28 == Gvar_6 then 
		goto l484
	end
	Gvar_29 = Gvar_8
	goto l491
	::l484::
	Gvar_29 = Gvar_6
	::l491::
	Gvar_28 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_10[2])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_10[2])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[7])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[7])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[7])
	Gvar_29 = Gvar_7
	Gvar_28 = Gvar_8
	goto l625
	::l625::
	if not Gvar_28 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,9)
	::l640::
	if true then return end
end
function Flame8()
	var_2 = Gvar_31
	if var_2 == Gvar_4 then 
		goto l54
	end
	if var_2 == Gvar_5 then 
		goto l101
	end
	if var_2 == Gvar_6 then 
		goto l234
	end
	if var_2 == Gvar_7 then 
		goto l367
	end
	if var_2 == Gvar_8 then 
		goto l500
	end
	goto l625
	::l54::
	var_0 = 0
	::l60::
	if not var_0 < 4 then 
		goto l85
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l60
	::l85::
	Gvar_31 = Gvar_5
	Gvar_30 = Gvar_4
	goto l625
	::l101::
	var_0 = 0
	::l107::
	if not var_0 < 4 then 
		goto l132
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l107
	::l132::
	var_1[0] = SpawnObject("SmallFlame",Gvar_10[3])
	var_1[1] = SpawnObject("SmallFlame",Gvar_11[8])
	var_1[2] = SpawnObject("SmallFlame",Gvar_12[8])
	var_1[3] = SpawnObject("SmallFlame",Gvar_13[8])
	if not Gvar_30 == Gvar_4 then 
		goto l218
	end
	Gvar_31 = Gvar_6
	goto l225
	::l218::
	Gvar_31 = Gvar_4
	::l225::
	Gvar_30 = Gvar_5
	goto l625
	::l234::
	var_0 = 0
	::l240::
	if not var_0 < 4 then 
		goto l265
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l240
	::l265::
	var_1[0] = SpawnObject("MediumFlame",Gvar_10[3])
	var_1[1] = SpawnObject("MediumFlame",Gvar_11[8])
	var_1[2] = SpawnObject("MediumFlame",Gvar_12[8])
	var_1[3] = SpawnObject("MediumFlame",Gvar_13[8])
	if not Gvar_30 == Gvar_5 then 
		goto l351
	end
	Gvar_31 = Gvar_7
	goto l358
	::l351::
	Gvar_31 = Gvar_5
	::l358::
	Gvar_30 = Gvar_6
	goto l625
	::l367::
	var_0 = 0
	::l373::
	if not var_0 < 4 then 
		goto l398
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l373
	::l398::
	var_1[0] = SpawnObject("Flame",Gvar_10[3])
	var_1[1] = SpawnObject("Flame",Gvar_11[8])
	var_1[2] = SpawnObject("Flame",Gvar_12[8])
	var_1[3] = SpawnObject("Flame",Gvar_13[8])
	if not Gvar_30 == Gvar_6 then 
		goto l484
	end
	Gvar_31 = Gvar_8
	goto l491
	::l484::
	Gvar_31 = Gvar_6
	::l491::
	Gvar_30 = Gvar_7
	goto l625
	::l500::
	AudioEvent("DemonBreath",Gvar_10[3])
	var_0 = 0
	::l516::
	if not var_0 < 4 then 
		goto l541
	end
	DeleteObject(var_1[var_0])
	var_0 = var_0 + 1
	goto l516
	::l541::
	var_1[0] = SpawnObject("LargeFlame",Gvar_10[3])
	var_1[1] = SpawnObject("LargeFlame",Gvar_11[8])
	var_1[2] = SpawnObject("LargeFlame",Gvar_12[8])
	var_1[3] = SpawnObject("LargeFlame",Gvar_13[8])
	Gvar_31 = Gvar_7
	Gvar_30 = Gvar_8
	goto l625
	::l625::
	if not Gvar_30 ~= Gvar_4 then 
		goto l640
	end
	WaitFrames(2,10)
	::l640::
	if true then return end
end
function LightTrigger0()
	DisableObject(Gvar_60)
	EnableObject(Gvar_56)
	EnableObject(Gvar_52)
	DisableObject(Gvar_44)
	EnableObject(Gvar_48)
	if true then return end
end
function LightTrigger1()
	DisableObject(Gvar_61)
	EnableObject(Gvar_57)
	EnableObject(Gvar_53)
	DisableObject(Gvar_45)
	EnableObject(Gvar_49)
	if true then return end
end
function LightTrigger2()
	DisableObject(Gvar_62)
	EnableObject(Gvar_58)
	EnableObject(Gvar_54)
	DisableObject(Gvar_46)
	EnableObject(Gvar_50)
	if true then return end
end
function LightTrigger3()
	DisableObject(Gvar_63)
	EnableObject(Gvar_59)
	EnableObject(Gvar_55)
	DisableObject(Gvar_47)
	EnableObject(Gvar_51)
	if true then return end
end
function LightTrigger0b()
	SpawnObject("RedPotion",Gvar_72)
	EnableObject(Gvar_60)
	DisableObject(Gvar_56)
	DisableObject(Gvar_52)
	EnableObject(Gvar_44)
	DisableObject(Gvar_48)
	if true then return end
end
function LightTrigger1b()
	SpawnObject("RedPotion",Gvar_73)
	EnableObject(Gvar_61)
	DisableObject(Gvar_57)
	DisableObject(Gvar_53)
	EnableObject(Gvar_45)
	DisableObject(Gvar_49)
	if true then return end
end
function LightTrigger2b()
	SpawnObject("RedPotion",Gvar_74)
	EnableObject(Gvar_62)
	DisableObject(Gvar_58)
	DisableObject(Gvar_54)
	EnableObject(Gvar_46)
	DisableObject(Gvar_50)
	if true then return end
end
function LightTrigger3b()
	SpawnObject("RedPotion",Gvar_75)
	EnableObject(Gvar_63)
	DisableObject(Gvar_59)
	DisableObject(Gvar_55)
	EnableObject(Gvar_47)
	DisableObject(Gvar_51)
	if true then return end
end
function DemonCreate(arg_0)
	Gvar_37 = Gvar_37 + 1
	checkTotalDead()
	if not Gvar_37 < 5 then 
		goto l178
	end
	if not Gvar_41 == 0 then 
		goto l178
	end
	Gvar_38 = RandomInteger(1,100)
	if not Gvar_38 <= 25 and Gvar_42 == 0 then 
		goto l89
	end
	Gvar_42 = 1
	Gvar_66[arg_0] = SpawnObject("Demon",Gvar_10[arg_0])
	MonsterEventScript(Gvar_66[arg_0],5,22)
	goto l121
	::l89::
	Gvar_66[arg_0] = SpawnObject("EmberDemon",Gvar_10[arg_0])
	MonsterEventScript(Gvar_66[arg_0],5,23)
	::l121::
	MonsterSetRetreatRatio(Gvar_66[arg_0],0)
	MonsterEventScript(Gvar_66[arg_0],4,21)
	MonsterEventScript(Gvar_66[arg_0],4,21)
	ObjLookAtObj(Gvar_66[arg_0],GetHostPlayer())
	WaitSpecial(5,arg_0,20)
	::l178::
	if true then return end
end
function DemonInit(arg_0)
	MonsterEventScript(Gvar_66[arg_0],4,21)
	ObjLookAtObj(Gvar_66[arg_0],GetHostPlayer())
	MonsterSetAggressiveness(Gvar_66[arg_0],0.83)
	MonsterGoRoam(Gvar_66[arg_0])
	if true then return end
end
function DemonIdle()
	MonsterSetAggressiveness(Trigger,0.83)
	MonsterGoRoam(Trigger)
	if true then return end
end
function DemonDie()
	Gvar_42 = 0
	if not Gvar_39 == 0 then 
		goto l37
	end
	Gvar_39 = Gvar_39 + 1
	WaitFrames(590,8)
	WaitSpecial(600,Gvar_39,19)
	goto l128
	::l37::
	if not Gvar_39 == 1 then 
		goto l68
	end
	Gvar_39 = Gvar_39 + 1
	WaitFrames(590,9)
	WaitSpecial(600,Gvar_39,19)
	goto l128
	::l68::
	if not Gvar_39 == 2 then 
		goto l99
	end
	Gvar_39 = Gvar_39 + 1
	WaitFrames(590,10)
	WaitSpecial(600,Gvar_39,19)
	goto l128
	::l99::
	if not Gvar_39 == 3 then 
		goto l128
	end
	Gvar_39 = 0
	WaitFrames(590,7)
	WaitSpecial(600,Gvar_39,19)
	::l128::
	if true then return end
end
function EmberDie()
	if not Gvar_39 == 0 then 
		goto l31
	end
	Gvar_39 = Gvar_39 + 1
	WaitFrames(590,8)
	WaitSpecial(600,Gvar_39,19)
	goto l122
	::l31::
	if not Gvar_39 == 1 then 
		goto l62
	end
	Gvar_39 = Gvar_39 + 1
	WaitFrames(590,9)
	WaitSpecial(600,Gvar_39,19)
	goto l122
	::l62::
	if not Gvar_39 == 2 then 
		goto l93
	end
	Gvar_39 = Gvar_39 + 1
	WaitFrames(590,10)
	WaitSpecial(600,Gvar_39,19)
	goto l122
	::l93::
	if not Gvar_39 == 3 then 
		goto l122
	end
	Gvar_39 = 0
	WaitFrames(590,7)
	WaitSpecial(600,Gvar_39,19)
	::l122::
	if true then return end
end
function SetupGuards()
	Gvar_40 = 0
	::l6::
	if not Gvar_40 < 5 then 
		goto l115
	end
	if not Gvar_40 == 4 then 
		goto l24
	end
	Flame4()
	::l24::
	Gvar_67[Gvar_40] = SpawnObject("EmberDemon",Gvar_9[Gvar_40])
	MonsterSetRetreatRatio(Gvar_67[Gvar_40],0)
	MonsterGuardArea(Gvar_67[Gvar_40],GetWaypointX(Gvar_9[Gvar_40]),GetWaypointY(Gvar_9[Gvar_40]),2900,2900,300)
	ObjLookAtObj(Gvar_67[Gvar_40],GetHostPlayer())
	WaitSpecial(2,Gvar_40,31)
	Gvar_40 = Gvar_40 + 1
	goto l6
	::l115::
	MonsterEventScript(Gvar_67[0],5,25)
	MonsterEventScript(Gvar_67[1],5,26)
	MonsterEventScript(Gvar_67[2],5,27)
	MonsterEventScript(Gvar_67[3],5,28)
	MonsterEventScript(Gvar_67[4],5,29)
	if true then return end
end
function Guard0Die()
	WaitFrames(590,2)
	WaitSpecial(600,0,30)
	if true then return end
end
function Guard1Die()
	WaitFrames(590,3)
	WaitSpecial(600,1,30)
	if true then return end
end
function Guard2Die()
	WaitFrames(590,4)
	WaitSpecial(600,2,30)
	if true then return end
end
function Guard3Die()
	WaitFrames(590,5)
	WaitSpecial(600,3,30)
	if true then return end
end
function Guard4Die()
	WaitFrames(590,6)
	WaitSpecial(600,4,30)
	if true then return end
end
function GuardCreate(arg_0)
	Gvar_36 = Gvar_36 + 1
	checkTotalDead()
	if not Gvar_36 < 5 then 
		goto l207
	end
	if not Gvar_41 == 0 then 
		goto l207
	end
	Gvar_67[arg_0] = SpawnObject("EmberDemon",Gvar_9[arg_0])
	MonsterSetRetreatRatio(Gvar_67[arg_0],0)
	MonsterGuardArea(Gvar_67[arg_0],GetWaypointX(Gvar_9[arg_0]),GetWaypointY(Gvar_9[arg_0]),2900,2900,300)
	ObjLookAtObj(Gvar_67[arg_0],GetHostPlayer())
	if not arg_0 == 0 then 
		goto l118
	end
	MonsterEventScript(Gvar_67[0],5,25)
	::l118::
	if not arg_0 == 1 then 
		goto l138
	end
	MonsterEventScript(Gvar_67[1],5,26)
	::l138::
	if not arg_0 == 2 then 
		goto l158
	end
	MonsterEventScript(Gvar_67[2],5,27)
	::l158::
	if not arg_0 == 3 then 
		goto l178
	end
	MonsterEventScript(Gvar_67[3],5,28)
	::l178::
	if not arg_0 == 4 then 
		goto l198
	end
	MonsterEventScript(Gvar_67[4],5,29)
	::l198::
	WaitSpecial(2,arg_0,31)
	::l207::
	if true then return end
end
function GuardInit(arg_0)
	MonsterGuardArea(Gvar_67[arg_0],GetWaypointX(Gvar_9[arg_0]),GetWaypointY(Gvar_9[arg_0]),2900,2900,300)
	ObjLookAtObj(Gvar_67[arg_0],GetHostPlayer())
	if true then return end
end
function SetupDemons()
	if not Gvar_39 < 4 then 
		goto l47
	end
	TeleportObj(Gvar_66[Gvar_39],GetWaypointX(Gvar_68[Gvar_39]),GetWaypointY(Gvar_68[Gvar_39]))
	Gvar_39 = Gvar_39 + 1
	WaitFrames(30,32)
	::l47::
	if true then return end
end
function SetupFight()
	CinematicBorders(true)
	ObjLookAtObj(GetHostPlayer(),Gvar_64)
	ObjLookAtObj(Gvar_64,GetHostPlayer())
	WaitFrames(50,35)
	if true then return end
end
function StartFight()
	CinematicBorders(false)
	MonsterSetAggressiveness(Gvar_64,0.83)
	MonsterGoHunt(Gvar_64)
	ObjFreeze(GetHostPlayer(),false)
	WaitFrames(40,45)
	if true then return end
end
function HecTalk1()
	ApplyEnchant(Gvar_64,"ENCHANT_PROTECT_FROM_FIRE",0)
	SetDialogPortrait(Gvar_64,"HecubahPic")
	SetupDialog(Gvar_64,"NEXT",55,56)
	ForceDialog(Gvar_64,GetHostPlayer())
	if true then return end
end
function HecTalk2()
	Gvar_43 = 2
	SetupDialog(Gvar_64,"NORMAL",55,56)
	ForceDialog(Gvar_64,GetHostPlayer())
	if true then return end
end
function hecTalkDemonStart()
	if not Gvar_33 then 
		goto l18
	end
	SayChat(Gvar_64,"War11a:Bah")
	WaitFrames(60,38)
	::l18::
	if true then return end
end
function hecTalkDemonEnd()
	Gvar_32 = true
	if true then return end
end
function hecTaunts()
	if not Gvar_32 then 
		goto l25
	end
	Gvar_32 = false
	SayChat(Gvar_64,"War11a:HecubahTaunts")
	WaitFrames(600,40)
	::l25::
	if true then return end
end
function resetTaunts()
	Gvar_32 = true
	if true then return end
end
function hecRetreatTalk()
	if not ObjCanInteractWith(GetHostPlayer(),Gvar_64) then 
		goto l34
	end
	ObjFreeze(GetHostPlayer(),true)
	SetupDialog(Gvar_64,"NORMAL",42,43)
	ForceDialog(Gvar_64,GetHostPlayer())
	::l34::
	if true then return end
end
function hecTalkRetreatStart()
	CinematicBorders(true)
	ObjFreeze(Gvar_64,true)
	ObjFreeze(Gvar_66[0],true)
	ObjFreeze(Gvar_66[1],true)
	ObjFreeze(Gvar_66[2],true)
	ObjFreeze(Gvar_66[3],true)
	ObjFreeze(Gvar_67[0],true)
	ObjFreeze(Gvar_67[1],true)
	ObjFreeze(Gvar_67[2],true)
	ObjFreeze(Gvar_67[3],true)
	ObjFreeze(Gvar_67[4],true)
	StartDialogWithCaller("HecubahRecognize","War11a:HecubahIntro")
	if true then return end
end
function hecTalkRetreatEnd()
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_64,false)
	ObjFreeze(Gvar_66[0],false)
	ObjFreeze(Gvar_66[1],false)
	ObjFreeze(Gvar_66[2],false)
	ObjFreeze(Gvar_66[3],false)
	ObjFreeze(Gvar_67[0],false)
	ObjFreeze(Gvar_67[1],false)
	ObjFreeze(Gvar_67[2],false)
	ObjFreeze(Gvar_67[3],false)
	ObjFreeze(Gvar_67[4],false)
	CancelDialog(Gvar_64)
	if true then return end
end
function checkTotalDead()
	if not Gvar_37 >= 8 and Gvar_36 >= 9 then 
		goto l17
	end
	hecTalkDemonStart()
	::l17::
	if true then return end
end
function EnableDemons()
	SetupGuards()
	Gvar_39 = 0
	::l8::
	if not Gvar_39 < 4 then 
		goto l78
	end
	EnableObject(Gvar_66[Gvar_39])
	MonsterSetRetreatRatio(Gvar_66[Gvar_39],0)
	if not Gvar_39 ~= 2 then 
		goto l57
	end
	MonsterEventScript(Gvar_66[Gvar_39],5,23)
	::l57::
	MonsterEventScript(Gvar_66[Gvar_39],4,21)
	Gvar_39 = Gvar_39 + 1
	goto l8
	::l78::
	if true then return end
end
function EndScene()
	PlayMusic(25,100)
	CinematicFadeout()
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_71),GetWaypointY(Gvar_71))
	ObjLookAtObj(GetHostPlayer(),Gvar_65)
	ObjFreeze(GetHostPlayer(),false)
	WaitFrames(2,47)
	if true then return end
end
function EndScene2()
	ObjLookAtObj(GetHostPlayer(),Gvar_65)
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_65,true)
	Gvar_43 = 3
	HecubahDies()
	SetupDialog(Gvar_64,"NORMAL",55,56)
	ForceDialog(Gvar_64,GetHostPlayer())
	if true then return end
end
function EndScene3()
	ExitLevel(0)
	if true then return end
end
function HecubahDies()
	ObjFreeze(Gvar_65,false)
	EnableObject(Gvar_65)
	DamageObject(Gvar_65,0,5000,0)
	Gvar_34 = GetObjX(Gvar_65)
	Gvar_35 = GetObjY(Gvar_65)
	TeleportWaypoint(Gvar_70,Gvar_34,Gvar_35)
	PlayMusic(0,100)
	AudioEvent("HecubahDieFrame0A",Gvar_70)
	WaitFrames(66,50)
	WaitFrames(130,51)
	WaitFrames(170,52)
	WaitFrames(280,53)
	if true then return end
end
function HecubahDie1()
	AudioEvent("HecubahDieFrame98",Gvar_70)
	if true then return end
end
function HecubahDie2()
	AudioEvent("HecubahDieFrame194",Gvar_70)
	if true then return end
end
function HecubahDie3()
	AudioEvent("HecubahDieFrame283",Gvar_70)
	if true then return end
end
function HecubahDie4()
	AudioEvent("HecubahDieFrame439",Gvar_70)
	if true then return end
end
function HecubahDie5()
	CinematicFade()
	WaitFrames(100,48)
	if true then return end
end
function HecubahDialogStart()
	if not Gvar_43 == 1 then 
		goto l14
	end
	StartDialogWithCaller("DemonRecognize","War11a:PunyFlea")
	::l14::
	if not Gvar_43 == 2 then 
		goto l28
	end
	StartDialogWithCaller("DemonRecognize","War11a:CatchMe")
	::l28::
	if not Gvar_43 == 3 then 
		goto l42
	end
	StartDialogWithCaller("DemonRecognize","War11a:Nooooooooo")
	::l42::
	if true then return end
end
function HecubahDialogEnd()
	if not Gvar_43 == 1 then 
		goto l21
	end
	CancelDialog(Gvar_64)
	SetupDemons()
	WaitFrames(150,36)
	::l21::
	if not Gvar_43 == 2 then 
		goto l42
	end
	CancelDialog(Gvar_64)
	MoveTo(Gvar_64,Gvar_69)
	::l42::
	if not Gvar_43 == 3 then 
		goto l57
	end
	CancelDialog(Gvar_64)
	HecubahDie5()
	::l57::
	if true then return end
end
function MapInitialize()
	PlayMusic(24,100)
	Gvar_64 = ObjFromName("Hecubah")
	Gvar_65 = ObjFromName("Hecubah2")
	Gvar_44 = ObjFromName("LightTrigger0")
	Gvar_45 = ObjFromName("LightTrigger1")
	Gvar_46 = ObjFromName("LightTrigger2")
	Gvar_47 = ObjFromName("LightTrigger3")
	Gvar_48 = ObjFromName("LightTrigger0b")
	Gvar_49 = ObjFromName("LightTrigger1b")
	Gvar_50 = ObjFromName("LightTrigger2b")
	Gvar_51 = ObjFromName("LightTrigger3b")
	Gvar_52 = ObjFromName("InnerLight0")
	Gvar_53 = ObjFromName("InnerLight1")
	Gvar_54 = ObjFromName("InnerLight2")
	Gvar_55 = ObjFromName("InnerLight3")
	Gvar_56 = ObjFromName("MiddleLight0")
	Gvar_57 = ObjFromName("MiddleLight1")
	Gvar_58 = ObjFromName("MiddleLight2")
	Gvar_59 = ObjFromName("MiddleLight3")
	Gvar_60 = ObjFromName("OuterLight0")
	Gvar_61 = ObjFromName("OuterLight1")
	Gvar_62 = ObjFromName("OuterLight2")
	Gvar_63 = ObjFromName("OuterLight3")
	Gvar_66[0] = ObjFromName("Demon0")
	Gvar_66[1] = ObjFromName("Demon1")
	Gvar_66[2] = ObjFromName("Demon2")
	Gvar_66[3] = ObjFromName("Demon3")
	Gvar_67[0] = ObjFromName("Guard0")
	Gvar_67[1] = ObjFromName("Guard1")
	Gvar_67[2] = ObjFromName("Guard2")
	Gvar_67[3] = ObjFromName("Guard3")
	Gvar_67[4] = ObjFromName("Guard4")
	Gvar_69 = WaypointFromName("HecRun1")
	Gvar_70 = WaypointFromName("HecubahWP")
	Gvar_71 = WaypointFromName("EndPlayer")
	Gvar_68[0] = WaypointFromName("DemonStart0")
	Gvar_68[1] = WaypointFromName("DemonStart1")
	Gvar_68[2] = WaypointFromName("DemonStart2")
	Gvar_68[3] = WaypointFromName("DemonStart3")
	Gvar_10[0] = WaypointFromName("Loc0")
	Gvar_10[1] = WaypointFromName("Loc1")
	Gvar_10[2] = WaypointFromName("Loc2")
	Gvar_10[3] = WaypointFromName("Loc3")
	Gvar_9[0] = WaypointFromName("GuardLoc0")
	Gvar_9[1] = WaypointFromName("GuardLoc1")
	Gvar_9[2] = WaypointFromName("GuardLoc2")
	Gvar_9[3] = WaypointFromName("GuardLoc3")
	Gvar_9[4] = WaypointFromName("GuardLoc4")
	Gvar_72 = WaypointFromName("PotionLoc0")
	Gvar_73 = WaypointFromName("PotionLoc1")
	Gvar_74 = WaypointFromName("PotionLoc2")
	Gvar_75 = WaypointFromName("PotionLoc3")
	Gvar_11[0] = WaypointFromName("FireLocA0")
	Gvar_11[1] = WaypointFromName("FireLocA1")
	Gvar_11[2] = WaypointFromName("FireLocA2")
	Gvar_11[3] = WaypointFromName("FireLocA3")
	Gvar_11[4] = WaypointFromName("FireLocA4")
	Gvar_11[5] = WaypointFromName("FireLocA5")
	Gvar_11[6] = WaypointFromName("FireLocA6")
	Gvar_11[7] = WaypointFromName("FireLocA7")
	Gvar_11[8] = WaypointFromName("FireLocA8")
	Gvar_12[0] = WaypointFromName("FireLocB0")
	Gvar_12[1] = WaypointFromName("FireLocB1")
	Gvar_12[2] = WaypointFromName("FireLocB2")
	Gvar_12[3] = WaypointFromName("FireLocB3")
	Gvar_12[4] = WaypointFromName("FireLocB4")
	Gvar_12[5] = WaypointFromName("FireLocB5")
	Gvar_12[6] = WaypointFromName("FireLocB6")
	Gvar_12[7] = WaypointFromName("FireLocB7")
	Gvar_12[8] = WaypointFromName("FireLocB8")
	Gvar_13[0] = WaypointFromName("FireLocC0")
	Gvar_13[1] = WaypointFromName("FireLocC1")
	Gvar_13[2] = WaypointFromName("FireLocC2")
	Gvar_13[3] = WaypointFromName("FireLocC3")
	Gvar_13[4] = WaypointFromName("FireLocC4")
	Gvar_13[5] = WaypointFromName("FireLocC5")
	Gvar_13[6] = WaypointFromName("FireLocC6")
	Gvar_13[7] = WaypointFromName("FireLocC7")
	Gvar_13[8] = WaypointFromName("FireLocC8")
	StartScreen(11)
	ObjFreeze(GetHostPlayer(),true)
	WaitFrames(2,33)
	if true then return end
end
function HecubahDie()
	Gvar_41 = 1
	Gvar_33 = false
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	DisableObject(Gvar_64)
	RemoveAllChat()
	CancelDialog(Gvar_64)
	Gvar_40 = 0
	::l43::
	if not Gvar_40 < 5 then 
		goto l74
	end
	DamageObject(Gvar_67[Gvar_40],0,1000,0)
	Gvar_40 = Gvar_40 + 1
	goto l43
	::l74::
	Gvar_39 = 0
	::l80::
	if not Gvar_39 < 4 then 
		goto l111
	end
	DamageObject(Gvar_66[Gvar_39],0,1000,0)
	Gvar_39 = Gvar_39 + 1
	goto l80
	::l111::
	CinematicFade()
	WaitFrames(100,46)
	if true then return end
end
function killHecubah()
	DamageObject(Gvar_64,0,5000,0)
	if true then return end
end
function PlayerDeath()
	DeathScreen(11)
	if true then return end
end