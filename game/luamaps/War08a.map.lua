
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_4 = 0
	Gvar_5 = 1
	Gvar_6 = 2
	Gvar_7 = 3
	Gvar_8 = 4
	Gvar_9 = 5
	Gvar_10 = 6
	Gvar_11 = 7
	Gvar_12 = 8
	Gvar_13 = 9
	Gvar_14 = 10
	Gvar_15 = 11
	Gvar_16 = 12
	Gvar_17 = 13
	Gvar_18 = 14
	Gvar_19 = 15
	Gvar_20 = 16
	Gvar_21 = 17
	Gvar_22 = 18
	Gvar_23 = 19
	Gvar_24 = 20
	Gvar_25 = 21
	Gvar_26 = 22
	Gvar_27 = 23
	Gvar_28 = 24
	Gvar_29 = 25
	Gvar_30 = 26
	Gvar_31 = Gvar_14
	Gvar_32 = Gvar_11
	Gvar_33 = Gvar_8
	Gvar_34 = Gvar_15
	Gvar_35 = Gvar_19
	Gvar_36 = Gvar_23
	Gvar_37 = Gvar_24
	Gvar_38 = Gvar_25
	Gvar_39 = Gvar_26
	Gvar_40 = Gvar_27
	Gvar_41 = Gvar_4
	Gvar_42 = 200
	Gvar_43 = 2
	Gvar_44 = 0
	Gvar_45 = 0
	Gvar_46 = false
	Gvar_90 = 0
	Gvar_91 = 1
	Gvar_92 = 2
	Gvar_93 = 3
	Gvar_94 = 4
	Gvar_95 = 5
	Gvar_96 = 6
	Gvar_97 = Gvar_90
	Gvar_98 = 0
	Gvar_99 = false
	Gvar_100 = false
	Gvar_101 = false
	Gvar_102 = false
	Gvar_103 = false
	Gvar_104 = false
	Gvar_105 = true
	Gvar_106 = false
	Gvar_107 = false
	Gvar_129 = 60
	Gvar_130 = true
	if true then return end
end
function JandorStart()
	var_0 = Gvar_41
	if var_0 == Gvar_4 then 
		goto l45
	end
	if var_0 == Gvar_5 then 
		goto l53
	end
	if var_0 == Gvar_6 then 
		goto l61
	end
	if var_0 == Gvar_7 then 
		goto l69
	end
	goto l86
	::l45::
	StartDialogWithCaller("HumanMaleEatFood","War08a:CaptainProd")
	goto l86
	::l53::
	StartDialogWithCaller("HumanMaleEatFood","War08a:CaptainProd")
	goto l86
	::l61::
	StartDialogWithCaller("SwordsmanHurt","Con03A.scr:JandorB")
	goto l86
	::l69::
	ObjFreeze(GetHostPlayer(),true)
	CinematicFade()
	WaitFrames(45,46)
	goto l86
	::l86::
	if true then return end
end
function JandorEnd()
	var_0 = Gvar_41
	if var_0 == Gvar_4 then 
		goto l45
	end
	if var_0 == Gvar_5 then 
		goto l66
	end
	if var_0 == Gvar_6 then 
		goto l68
	end
	if var_0 == Gvar_7 then 
		goto l77
	end
	goto l94
	::l45::
	JournalAddEntry(GetHostPlayer(),"Chapter8LocateAldwyn",2)
	PrintToAll("Con01a:NewJournalEntry")
	Gvar_41 = Gvar_5
	goto l94
	::l66::
	goto l94
	::l68::
	Gvar_41 = Gvar_7
	goto l94
	::l77::
	ObjFreeze(GetHostPlayer(),true)
	CinematicFade()
	WaitFrames(45,46)
	goto l94
	::l94::
	if true then return end
end
function JacobDialogStart()
	var_2 = Gvar_40
	if var_2 == Gvar_27 then 
		goto l36
	end
	if var_2 == Gvar_28 then 
		goto l105
	end
	if var_2 == Gvar_29 then 
		goto l113
	end
	goto l121
	::l36::
	var_0 = RandomInteger(1,3)
	var_1 = var_0
	if var_1 == 1 then 
		goto l79
	end
	if var_1 == 2 then 
		goto l87
	end
	if var_1 == 3 then 
		goto l95
	end
	goto l103
	::l79::
	StartDialogWithCaller("HumanMaleEatFood","Con02A:JailerTalk01")
	goto l103
	::l87::
	StartDialogWithCaller("HumanMaleEatFood","Con02A:JailerTalk02")
	goto l103
	::l95::
	StartDialogWithCaller("HumanMaleEatFood","Con02A:JailerTalk03")
	goto l103
	::l103::
	goto l121
	::l105::
	StartDialogWithCaller("HumanMaleEatFood","Con02A:JailerTalk04")
	goto l121
	::l113::
	StartDialogWithCaller("HumanMaleEatFood","Con02A:JailerTalk05")
	goto l121
	::l121::
	if true then return end
end
function JacobDialogEnd()
	var_0 = Gvar_40
	if var_0 == Gvar_28 then 
		goto l36
	end
	if var_0 == Gvar_29 then 
		goto l52
	end
	if var_0 == Gvar_30 then 
		goto l68
	end
	goto l82
	::l36::
	ObjFreeze(GetHostPlayer(),false)
	Gvar_46 = false
	goto l82
	::l52::
	ObjFreeze(GetHostPlayer(),false)
	Gvar_46 = false
	goto l82
	::l68::
	CancelDialog(Gvar_75)
	ObjFreeze(GetHostPlayer(),false)
	goto l82
	::l82::
	if true then return end
end
function ResetJacobDialog()
	if not ObjIsCaller(Gvar_75) then 
		goto l52
	end
	if not Gvar_40 == Gvar_30 then 
		goto l52
	end
	Gvar_40 = Gvar_27
	Gvar_46 = false
	SetupDialog(Gvar_75,"NORMAL",4,5)
	Gvar_45 = 0
	DisableObject(Gvar_77)
	::l52::
	if true then return end
end
function MorganInjured()
	if not Gvar_46 == false then 
		goto l200
	end
	Gvar_46 = true
	Gvar_45 = Gvar_45 + 1
	var_0 = Gvar_45
	if var_0 == 1 then 
		goto l55
	end
	if var_0 == 2 then 
		goto l106
	end
	if var_0 == 3 then 
		goto l157
	end
	goto l200
	::l55::
	Gvar_40 = Gvar_28
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_75)
	ObjLookAtObj(Gvar_75,GetHostPlayer())
	if not GetObjHealth(Gvar_75) > 0 then 
		goto l104
	end
	ForceDialog(Gvar_75,GetHostPlayer())
	::l104::
	goto l200
	::l106::
	Gvar_40 = Gvar_29
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_75)
	ObjLookAtObj(Gvar_75,GetHostPlayer())
	if not GetObjHealth(Gvar_75) > 0 then 
		goto l155
	end
	ForceDialog(Gvar_75,GetHostPlayer())
	::l155::
	goto l200
	::l157::
	Gvar_40 = Gvar_30
	CancelDialog(Gvar_75)
	ObjResetMaster(Gvar_75)
	MonsterSetAggressiveness(Gvar_75,0.83)
	if not GetObjHealth(Gvar_75) > 0 then 
		goto l198
	end
	MonsterGoFight(Gvar_75,GetHostPlayer())
	::l198::
	goto l200
	::l200::
	if true then return end
end
function PlayerFlee()
	if not Gvar_40 == Gvar_30 then 
		goto l53
	end
	EnableObject(Gvar_77)
	ObjSetMaster(GetHostPlayer(),Gvar_75)
	MonsterSetAggressiveness(Gvar_75,0)
	MonsterGuardArea(Gvar_75,GetWaypointX(Gvar_79),GetWaypointY(Gvar_79),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l53::
	if true then return end
end
function HenrickDialogStart()
	var_0 = Gvar_32
	if var_0 == Gvar_11 then 
		goto l36
	end
	if var_0 == Gvar_12 then 
		goto l51
	end
	if var_0 == Gvar_13 then 
		goto l66
	end
	goto l81
	::l36::
	ObjLookAtObj(Gvar_48,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSalesPitchA")
	goto l81
	::l51::
	ObjLookAtObj(Gvar_48,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSalesPitchB")
	goto l81
	::l66::
	ObjLookAtObj(Gvar_48,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickNoMoreWolves")
	goto l81
	::l81::
	if true then return end
end
function HenrickDialogEnd()
	var_0 = 0
	var_1 = 0
	var_2 = 1
	var_3 = 2
	var_4 = 0
	var_7 = Gvar_32
	if var_7 == Gvar_11 then 
		goto l66
	end
	if var_7 == Gvar_12 then 
		goto l198
	end
	if var_7 == Gvar_13 then 
		goto l349
	end
	goto l351
	::l66::
	var_1 = DialogGetResult(Gvar_48)
	var_5 = var_1
	if var_5 == var_2 then 
		goto l111
	end
	if var_5 == var_3 then 
		goto l192
	end
	if var_5 == var_4 then 
		goto l194
	end
	goto l196
	::l111::
	var_0 = PlayerGetGold(GetHostPlayer())
	if not var_0 < Gvar_42 then 
		goto l147
	end
	SetupDialog(Gvar_48,"NORMAL",45,11)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickNotEnoughGold")
	goto l190
	::l147::
	PlayerAddGold(GetHostPlayer(),-Gvar_42)
	Gvar_32 = Gvar_12
	ReleaseCharmedWolf(Gvar_44)
	Gvar_44 = Gvar_44 + 1
	SetupDialog(Gvar_48,"NORMAL",45,11)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSaleSuccessful")
	::l190::
	goto l196
	::l192::
	goto l196
	::l194::
	goto l196
	::l196::
	goto l351
	::l198::
	var_1 = DialogGetResult(Gvar_48)
	var_6 = var_1
	if var_6 == var_2 then 
		goto l243
	end
	if var_6 == var_3 then 
		goto l343
	end
	if var_6 == var_4 then 
		goto l345
	end
	goto l347
	::l243::
	var_0 = PlayerGetGold(GetHostPlayer())
	if not var_0 < Gvar_42 then 
		goto l279
	end
	SetupDialog(Gvar_48,"NORMAL",45,11)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickNotEnoughGold")
	goto l341
	::l279::
	PlayerAddGold(GetHostPlayer(),-Gvar_42)
	ReleaseCharmedWolf(Gvar_44)
	Gvar_44 = Gvar_44 + 1
	SetupDialog(Gvar_48,"NORMAL",45,11)
	StartDialogWithCaller("SwordsmanHurt","War08b:HenrickSaleSuccessful")
	if not Gvar_44 >= 2 then 
		goto l341
	end
	Gvar_32 = Gvar_13
	SetupDialog(Gvar_48,"NORMAL",9,10)
	::l341::
	goto l347
	::l343::
	goto l347
	::l345::
	goto l347
	::l347::
	goto l351
	::l349::
	goto l351
	::l351::
	if true then return end
end
function ResetHenrickDialogChoice()
	SetupDialog(Gvar_48,"YESNO",9,10)
	if true then return end
end
function DrunkDialogStart()
	ObjLookAtObj(Gvar_49,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:DrunkGreeting")
	if true then return end
end
function DrunkDialogEnd()
	if true then return end
end
function GatekeeperDialogStart()
	ObjLookAtObj(Gvar_52,GetHostPlayer())
	var_0 = Gvar_36
	if var_0 == Gvar_23 then 
		goto l25
	end
	goto l33
	::l25::
	StartDialogWithCaller("SwordsmanHurt","Con02a:GatekeeperWaiting")
	goto l33
	::l33::
	if true then return end
end
function GatekeeperDialogEnd()
	if true then return end
end
function Gatekeeper2DialogStart()
	ObjLookAtObj(Gvar_63,GetHostPlayer())
	var_0 = Gvar_37
	if var_0 == Gvar_24 then 
		goto l25
	end
	goto l33
	::l25::
	StartDialogWithCaller("SwordsmanHurt","Wiz08a:Guard01Greet")
	goto l33
	::l33::
	if true then return end
end
function Gatekeeper2DialogEnd()
	if true then return end
end
function Gatekeeper3DialogStart()
	ObjLookAtObj(Gvar_64,GetHostPlayer())
	var_0 = Gvar_38
	if var_0 == Gvar_25 then 
		goto l25
	end
	goto l33
	::l25::
	StartDialogWithCaller("SwordsmanHurt","War08a:Guard02Greet")
	goto l33
	::l33::
	if true then return end
end
function Gatekeeper3DialogEnd()
	if true then return end
end
function MayorDialogStart()
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_55)
	var_0 = RandomInteger(1,2)
	var_1 = var_0
	if var_1 == 1 then 
		goto l53
	end
	if var_1 == 2 then 
		goto l61
	end
	goto l69
	::l53::
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorPre")
	goto l69
	::l61::
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorBye")
	goto l69
	::l69::
	if true then return end
end
function MayorDialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function MayorsGuardDialogStart()
	var_0 = Gvar_31
	if var_0 == Gvar_14 then 
		goto l18
	end
	goto l33
	::l18::
	ObjLookAtObj(Gvar_53,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War03b:MayorsGuardIntro")
	goto l33
	::l33::
	if true then return end
end
function MayorsGuardDialogEnd()
	if true then return end
end
function AldwinDialogStart()
	var_0 = Gvar_33
	if var_0 == Gvar_8 then 
		goto l36
	end
	if var_0 == Gvar_9 then 
		goto l51
	end
	if var_0 == Gvar_10 then 
		goto l66
	end
	goto l81
	::l36::
	ObjLookAtObj(Gvar_54,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08a:AldwynGreet")
	goto l81
	::l51::
	ObjLookAtObj(Gvar_54,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War08a:AldwynProd")
	goto l81
	::l66::
	ObjLookAtObj(Gvar_54,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con08:AldwynProd")
	goto l81
	::l81::
	if true then return end
end
function AldwinDialogEnd()
	var_0 = Gvar_33
	if var_0 == Gvar_8 then 
		goto l36
	end
	if var_0 == Gvar_9 then 
		goto l80
	end
	if var_0 == Gvar_10 then 
		goto l89
	end
	goto l91
	::l36::
	InvPutObj(GetHostPlayer(),Gvar_50)
	PrintToAll("GeneralPrint:GainedKey")
	Gvar_33 = Gvar_9
	JournalUpdateEntry(GetHostPlayer(),"Chapter8LocateAldwyn",4)
	PrintToAll("Con02a:ObjectiveComplete")
	JournalAddEntry(GetHostPlayer(),"Chapter8IxPriest",2)
	PrintToAll("Con01a:NewJournalEntry")
	goto l91
	::l80::
	Gvar_33 = Gvar_9
	goto l91
	::l89::
	goto l91
	::l91::
	if true then return end
end
function BridgeGuardDialogStart()
	var_0 = Gvar_39
	if var_0 == Gvar_26 then 
		goto l18
	end
	goto l33
	::l18::
	ObjLookAtObj(Gvar_65,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con02a:RandomSay")
	goto l33
	::l33::
	if true then return end
end
function BridgeGuardDialogEnd()
	var_0 = Gvar_39
	if var_0 == Gvar_26 then 
		goto l18
	end
	goto l20
	::l18::
	goto l20
	::l20::
	if true then return end
end
function Maiden1DialogStart()
	ObjLookAtObj(Gvar_67,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con02a:BarMaiden")
	if true then return end
end
function Maiden1DialogEnd()
	if true then return end
end
function Maiden2DialogStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_68,true)
	MonsterIdle(GetHostPlayer())
	MonsterIdle(Gvar_68)
	ObjLookAtObj(GetHostPlayer(),Gvar_68)
	ObjLookAtObj(Gvar_68,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War03b:Maiden1")
	if true then return end
end
function Maiden2DialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_68,false)
	MonsterGoRoam(Gvar_68)
	if true then return end
end
function Maiden3DialogStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_69,true)
	MonsterIdle(GetHostPlayer())
	MonsterIdle(Gvar_69)
	ObjLookAtObj(GetHostPlayer(),Gvar_69)
	ObjLookAtObj(Gvar_69,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","Wiz02A.scr:MaidenTalk05")
	if true then return end
end
function Maiden3DialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_69,false)
	MonsterGoRoam(Gvar_69)
	if true then return end
end
function Maiden4DialogStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_70,true)
	MonsterIdle(GetHostPlayer())
	MonsterIdle(Gvar_70)
	ObjLookAtObj(GetHostPlayer(),Gvar_70)
	ObjLookAtObj(Gvar_70,GetHostPlayer())
	var_0 = RandomInteger(1,2)
	var_1 = var_0
	if var_1 == 1 then 
		goto l73
	end
	if var_1 == 2 then 
		goto l81
	end
	goto l89
	::l73::
	StartDialogWithCaller("HumanMaleEatFood","War02a:NewTownswoman1")
	goto l89
	::l81::
	StartDialogWithCaller("HumanMaleEatFood","War02a:NewTownswoman3")
	goto l89
	::l89::
	if true then return end
end
function Maiden4DialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_70,false)
	MonsterGoRoam(Gvar_70)
	if true then return end
end
function Townsman1DialogStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_72,true)
	MonsterIdle(GetHostPlayer())
	MonsterIdle(Gvar_72)
	ObjLookAtObj(GetHostPlayer(),Gvar_72)
	ObjLookAtObj(Gvar_72,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War02a:NewTownsman3")
	if true then return end
end
function Townsman1DialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_72,false)
	MonsterGoRoam(Gvar_72)
	if true then return end
end
function Townsman2DialogStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_73,true)
	MonsterIdle(GetHostPlayer())
	MonsterIdle(Gvar_73)
	ObjLookAtObj(GetHostPlayer(),Gvar_73)
	ObjLookAtObj(Gvar_73,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","Wiz02A.scr:AlbiTalk01")
	if true then return end
end
function Townsman2DialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_73,false)
	MonsterGoRoam(Gvar_73)
	if true then return end
end
function Townsman3DialogStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_74,true)
	MonsterIdle(GetHostPlayer())
	MonsterIdle(Gvar_74)
	ObjLookAtObj(GetHostPlayer(),Gvar_74)
	ObjLookAtObj(Gvar_74,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","Wiz02A.scr:MaxRumor03")
	if true then return end
end
function Townsman3DialogEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_74,false)
	MonsterGoRoam(Gvar_74)
	if true then return end
end
function ReleaseCharmedWolf(arg_0)
	var_1 = arg_0
	if var_1 == 0 then 
		goto l41
	end
	if var_1 == 1 then 
		goto l113
	end
	if var_1 == 2 then 
		goto l185
	end
	if var_1 == 3 then 
		goto l257
	end
	goto l329
	::l41::
	OpenSecretWall(GetWallAt(128,106))
	CancelEnchant(Gvar_120[arg_0],"ENCHANT_INVULNERABLE")
	MonsterFollowObj(Gvar_120[arg_0],GetHostPlayer())
	MonsterWait(Gvar_120[arg_0],30)
	MonsterSetAggressiveness(Gvar_120[arg_0],0.83)
	ObjSetMasterByHost(Gvar_120[arg_0])
	MonsterMakeFriendly(Gvar_120[arg_0])
	goto l329
	::l113::
	OpenSecretWall(GetWallAt(130,104))
	CancelEnchant(Gvar_120[arg_0],"ENCHANT_INVULNERABLE")
	MonsterFollowObj(Gvar_120[arg_0],GetHostPlayer())
	MonsterWait(Gvar_120[arg_0],30)
	MonsterSetAggressiveness(Gvar_120[arg_0],0.83)
	ObjSetMasterByHost(Gvar_120[arg_0])
	MonsterMakeFriendly(Gvar_120[arg_0])
	goto l329
	::l185::
	OpenSecretWall(GetWallAt(132,102))
	CancelEnchant(Gvar_120[arg_0],"ENCHANT_INVULNERABLE")
	MonsterFollowObj(Gvar_120[arg_0],GetHostPlayer())
	MonsterWait(Gvar_120[arg_0],30)
	MonsterSetAggressiveness(Gvar_120[arg_0],0.83)
	ObjSetMasterByHost(Gvar_120[arg_0])
	MonsterMakeFriendly(Gvar_120[arg_0])
	goto l329
	::l257::
	OpenSecretWall(GetWallAt(134,100))
	CancelEnchant(Gvar_120[arg_0],"ENCHANT_INVULNERABLE")
	MonsterFollowObj(Gvar_120[arg_0],GetHostPlayer())
	MonsterWait(Gvar_120[arg_0],30)
	MonsterSetAggressiveness(Gvar_120[arg_0],0.83)
	ObjSetMasterByHost(Gvar_120[arg_0])
	MonsterMakeFriendly(Gvar_120[arg_0])
	goto l329
	::l329::
	if true then return end
end
function InitializeDialogs()
	SetDialogPortrait(Gvar_48,"HenrickPic")
	SetDialogPortrait(Gvar_49,"DrunkPic")
	SetDialogPortrait(Gvar_51,"Townsman1Pic")
	SetDialogPortrait(Gvar_52,"IxGuard2Pic")
	SetDialogPortrait(Gvar_53,"Warrior3Pic")
	SetDialogPortrait(Gvar_55,"TheogrinPic")
	SetDialogPortrait(Gvar_54,"AldwynPic")
	SetDialogPortrait(Gvar_63,"IxGuard2Pic")
	SetDialogPortrait(Gvar_64,"IxGuard1Pic")
	SetDialogPortrait(Gvar_65,"Townsman3Pic")
	SetDialogPortrait(Gvar_67,"MaidenPic")
	SetDialogPortrait(Gvar_68,"MaidenPic2")
	SetDialogPortrait(Gvar_69,"MaidenPic3")
	SetDialogPortrait(Gvar_70,"MaidenPic4")
	SetDialogPortrait(Gvar_72,"MalePic4")
	SetDialogPortrait(Gvar_73,"MalePic11")
	SetDialogPortrait(Gvar_74,"MalePic12")
	SetDialogPortrait(Gvar_47,"AirshipCaptainPic")
	SetDialogPortrait(Gvar_75,"WardenPic")
	SetupDialog(Gvar_75,"NORMAL",4,5)
	SetupDialog(Gvar_48,"YESNO",9,10)
	SetupDialog(Gvar_49,"NORMAL",12,13)
	SetupDialog(Gvar_63,"NORMAL",16,17)
	SetupDialog(Gvar_64,"NORMAL",18,19)
	SetupDialog(Gvar_53,"NORMAL",22,23)
	SetupDialog(Gvar_54,"NORMAL",24,25)
	SetupDialog(Gvar_65,"NORMAL",26,27)
	SetupDialog(Gvar_67,"NORMAL",28,29)
	SetupDialog(Gvar_68,"NORMAL",30,31)
	SetupDialog(Gvar_69,"NORMAL",32,33)
	SetupDialog(Gvar_70,"NORMAL",34,35)
	SetupDialog(Gvar_72,"NORMAL",36,37)
	SetupDialog(Gvar_73,"NORMAL",38,39)
	SetupDialog(Gvar_74,"NORMAL",40,41)
	if true then return end
end
function InitializeSecondaryDialogs()
	Gvar_41 = Gvar_6
	if true then return end
end
function NullDialogStart()
	if true then return end
end
function ExitToSwamp()
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),GetWaypointX(WaypointFromName("SwampExitWP")),GetWaypointY(WaypointFromName("SwampExitWP")))
	if true then return end
end
function StartCaptainConversation()
	SetupDialog(Gvar_47,"NORMAL",2,3)
	ForceDialog(Gvar_47,GetHostPlayer())
	if true then return end
end
function PlayerDeath()
	DeathScreen(8)
	if true then return end
end
function GoToMineSEG2()
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_80),GetWaypointY(Gvar_80))
	if true then return end
end
function GoToMine()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l14
	end
	CinematicFade()
	WaitFrames(60,49)
	::l14::
	if true then return end
end
function GoToCaveSEG2()
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_81),GetWaypointY(Gvar_81))
	if true then return end
end
function GoToCave()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l14
	end
	CinematicFade()
	WaitFrames(60,51)
	::l14::
	if true then return end
end
function InversionInit()
	Gvar_82 = ObjFromName("Teacher")
	Gvar_83 = ObjFromName("Apprentice")
	Gvar_84 = ObjFromName("InvertSpell")
	Gvar_85 = ObjFromName("LessonGate1")
	Gvar_86 = ObjFromName("LessonGate2")
	Gvar_87 = ObjFromName("ApprenticeTrigger")
	Gvar_88 = WaypointFromName("PlayerSounds")
	Gvar_89 = WaypointFromName("ApprenticeWP")
	SetDialogPortrait(Gvar_82,"WizardGuard1Pic")
	SetupDialog(Gvar_82,"YESNO",55,56)
	LockDoor(Gvar_85)
	LockDoor(Gvar_86)
	DisableObject(Gvar_87)
	WaitFrames(1,54)
	if true then return end
end
function InversionOwnObject()
	ObjSetMaster(GetHostPlayer(),Gvar_82)
	ApplyEnchant(Gvar_83,"ENCHANT_INVULNERABLE",0)
	ApplyEnchant(Gvar_82,"ENCHANT_ANCHORED",0)
	ApplyEnchant(Gvar_83,"ENCHANT_ANCHORED",0)
	if true then return end
end
function TeacherStart()
	var_0 = Gvar_97
	if var_0 == Gvar_90 then 
		goto l72
	end
	if var_0 == Gvar_91 then 
		goto l98
	end
	if var_0 == Gvar_92 then 
		goto l106
	end
	if var_0 == Gvar_93 then 
		goto l114
	end
	if var_0 == Gvar_94 then 
		goto l122
	end
	if var_0 == Gvar_95 then 
		goto l130
	end
	if var_0 == Gvar_96 then 
		goto l138
	end
	goto l146
	::l72::
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_82)
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk01")
	goto l146
	::l98::
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk04")
	goto l146
	::l106::
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk02")
	goto l146
	::l114::
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk03")
	goto l146
	::l122::
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk05")
	goto l146
	::l130::
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk04a")
	goto l146
	::l138::
	StartDialogWithCaller("HumanMaleEatFood","Wiz02B.scr:InversionBoyTalk06")
	goto l146
	::l146::
	if true then return end
end
function TeacherEnd()
	var_0 = 0
	var_1 = 0
	var_2 = 1
	var_3 = 2
	var_4 = 0
	var_6 = Gvar_97
	if var_6 == Gvar_90 then 
		goto l102
	end
	if var_6 == Gvar_91 then 
		goto l292
	end
	if var_6 == Gvar_92 then 
		goto l319
	end
	if var_6 == Gvar_93 then 
		goto l340
	end
	if var_6 == Gvar_94 then 
		goto l354
	end
	if var_6 == Gvar_95 then 
		goto l384
	end
	if var_6 == Gvar_96 then 
		goto l414
	end
	goto l434
	::l102::
	var_1 = DialogGetResult(Gvar_82)
	var_5 = var_1
	if var_5 == var_2 then 
		goto l147
	end
	if var_5 == var_3 then 
		goto l236
	end
	if var_5 == var_4 then 
		goto l263
	end
	goto l290
	::l147::
	var_0 = PlayerGetGold(GetHostPlayer())
	if not var_0 < 100 then 
		goto l192
	end
	SetupDialog(Gvar_82,"NORMAL",55,56)
	Gvar_97 = Gvar_91
	ForceDialog(Gvar_82,GetHostPlayer())
	goto l290
	goto l236
	::l192::
	PlayerAddGold(GetHostPlayer(),-100)
	UnlockDoor(Gvar_85)
	UnlockDoor(Gvar_86)
	SetupDialog(Gvar_82,"NORMAL",55,56)
	Gvar_97 = Gvar_92
	ForceDialog(Gvar_82,GetHostPlayer())
	goto l290
	::l236::
	ObjFreeze(GetHostPlayer(),false)
	Gvar_97 = Gvar_90
	SetupDialog(Gvar_82,"YESNO",55,56)
	goto l290
	::l263::
	ObjFreeze(GetHostPlayer(),false)
	Gvar_97 = Gvar_90
	SetupDialog(Gvar_82,"YESNO",55,56)
	goto l290
	::l290::
	goto l434
	::l292::
	ObjFreeze(GetHostPlayer(),false)
	Gvar_97 = Gvar_90
	SetupDialog(Gvar_82,"YESNO",55,56)
	goto l434
	::l319::
	CancelDialog(Gvar_82)
	ObjFreeze(GetHostPlayer(),false)
	InvPutObj(GetHostPlayer(),Gvar_84)
	goto l434
	::l340::
	CancelDialog(Gvar_82)
	Gvar_103 = false
	goto l434
	::l354::
	UnlockDoor(Gvar_58)
	UnlockDoor(Gvar_59)
	Gvar_97 = Gvar_96
	SetupDialog(Gvar_82,"NORMAL",55,56)
	goto l434
	::l384::
	UnlockDoor(Gvar_58)
	UnlockDoor(Gvar_59)
	Gvar_97 = Gvar_96
	SetupDialog(Gvar_82,"NORMAL",55,56)
	goto l434
	::l414::
	Gvar_97 = Gvar_96
	SetupDialog(Gvar_82,"NORMAL",55,56)
	goto l434
	::l434::
	if true then return end
end
function Phoneme1()
	if not Gvar_103 == false then 
		goto l45
	end
	if not GetObjHealth(Gvar_83) > 0 then 
		goto l45
	end
	PrintToAll("Phoneme1")
	TeleportWaypoint(Gvar_88,1326,2493)
	AudioEvent("SpellPhonemeDown",Gvar_88)
	WaitFrames(10,58)
	::l45::
	if true then return end
end
function Phoneme2()
	if not Gvar_103 == false then 
		goto l36
	end
	if not GetObjHealth(Gvar_83) > 0 then 
		goto l36
	end
	PrintToAll("Phoneme2")
	AudioEvent("SpellPhonemeDown",Gvar_88)
	WaitFrames(10,59)
	::l36::
	if true then return end
end
function Phoneme3()
	if not Gvar_103 == false then 
		goto l36
	end
	if not GetObjHealth(Gvar_83) > 0 then 
		goto l36
	end
	PrintToAll("Phoneme3")
	AudioEvent("SpellPhonemeDown",Gvar_88)
	WaitFrames(10,61)
	::l36::
	if true then return end
end
function LessonBegin()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l91
	end
	if not Gvar_97 == Gvar_92 then 
		goto l91
	end
	if not Gvar_105 == true then 
		goto l39
	end
	MoveTo(Gvar_83,Gvar_89)
	Gvar_105 = false
	::l39::
	if not Gvar_99 == false and Gvar_104 == true then 
		goto l91
	end
	DisableObject(Trigger)
	ObjLookAtObj(Gvar_83,GetHostPlayer())
	Gvar_99 = true
	LockDoor(Gvar_58)
	LockDoor(Gvar_59)
	WaitSeconds(1,57)
	::l91::
	if true then return end
end
function CastSpells()
	if not Gvar_103 == false then 
		goto l169
	end
	if not Gvar_98 < 4 then 
		goto l45
	end
	PrintToAll("Casting Spell")
	ApplySpellObjXY("SPELL_SLOW",Gvar_83,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	ApplyEnchant(Gvar_83,"ENCHANT_INVULNERABLE",0)
	::l45::
	if not Gvar_98 == 4 then 
		goto l79
	end
	PrintToAll("CastingSpell")
	CancelEnchant(Gvar_83,"ENCHANT_INVULNERABLE")
	ApplySpellObjXY("SPELL_MAGIC_MISSILE",Gvar_83,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	::l79::
	Gvar_98 = Gvar_98 + 1
	if not Gvar_98 < 5 then 
		goto l101
	end
	WaitSeconds(3,57)
	goto l169
	::l101::
	Gvar_100 = true
	if not Gvar_102 == true then 
		goto l144
	end
	Gvar_97 = Gvar_94
	SetupDialog(Gvar_82,"NORMAL",55,56)
	ForceDialog(Gvar_82,GetHostPlayer())
	goto l169
	::l144::
	Gvar_97 = Gvar_95
	SetupDialog(Gvar_82,"NORMAL",55,56)
	ForceDialog(Gvar_82,GetHostPlayer())
	::l169::
	if true then return end
end
function CheckApprentice()
	if not IsEnchantActive(Gvar_83,"ENCHANT_SLOWED") then 
		goto l67
	end
	DisableObject(Gvar_87)
	Gvar_103 = true
	Gvar_97 = Gvar_93
	Gvar_102 = true
	if not Gvar_98 > 2 then 
		goto l49
	end
	Gvar_98 = 2
	::l49::
	SetupDialog(Gvar_82,"NORMAL",55,56)
	ForceDialog(Gvar_82,GetHostPlayer())
	::l67::
	if not GetObjHealth(Gvar_83) <= 0 then 
		goto l89
	end
	DisableObject(Trigger)
	Gvar_102 = true
	::l89::
	if true then return end
end
function ApprenticeDie()
	AudioEvent("HumanMaleHurtHeavy",Gvar_88)
	if true then return end
end
function ApprenticeReport()
	MonsterGuardArea(Gvar_83,GetWaypointX(Gvar_89),GetWaypointY(Gvar_89),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	EnableObject(Gvar_87)
	Gvar_104 = true
	if true then return end
end
function OwnObjects()
	ObjGroupSetMaster(GetHostPlayer(),Gvar_126)
	ObjSetMaster(GetHostPlayer(),Gvar_48)
	ObjSetMaster(GetHostPlayer(),Gvar_108)
	ObjGroupSetMaster(GetHostPlayer(),Gvar_127)
	ObjSetMaster(GetHostPlayer(),Gvar_49)
	ObjSetMaster(GetHostPlayer(),Gvar_67)
	ObjSetMaster(GetHostPlayer(),Gvar_68)
	ObjSetMaster(GetHostPlayer(),Gvar_69)
	ObjSetMaster(GetHostPlayer(),Gvar_70)
	ObjSetMaster(GetHostPlayer(),Gvar_47)
	ObjSetMaster(GetHostPlayer(),Gvar_75)
	SetDialogPortrait(Gvar_51,"ShopKeeperBrownPic")
	if true then return end
end
function DisableElevators()
	DisableObject(Gvar_60)
	DisableObject(Gvar_66)
	if true then return end
end
function MapInitialize()
	Gvar_48 = ObjFromName("Henrick")
	Gvar_108 = ObjFromName("HenricksWolf")
	Gvar_120[0] = ObjFromName("CharmedWolf01")
	Gvar_120[1] = ObjFromName("CharmedWolf02")
	Gvar_120[2] = ObjFromName("CharmedWolf03")
	Gvar_120[3] = ObjFromName("CharmedWolf04")
	var_0 = 0
	::l66::
	if not var_0 < 4 then 
		goto l95
	end
	ApplyEnchant(Gvar_120[var_0],"ENCHANT_INVULNERABLE",0)
	var_0 = var_0 + 1
	goto l66
	::l95::
	Gvar_49 = ObjFromName("Drunk")
	Gvar_54 = ObjFromName("Aldwyn")
	Gvar_52 = ObjFromName("Geoff")
	Gvar_63 = ObjFromName("Ryan")
	Gvar_64 = ObjFromName("Ed")
	Gvar_55 = ObjFromName("Mayor_Theogrin")
	Gvar_53 = ObjFromName("Mayor's_Guard")
	Gvar_51 = ObjFromName("Barkeeper")
	Gvar_65 = ObjFromName("Bridge_Guard")
	Gvar_47 = ObjFromName("Jandor")
	Gvar_75 = ObjFromName("Jacob")
	Gvar_76 = ObjFromName("Morgan")
	Gvar_119 = ObjFromName("CaveDoor")
	Gvar_116 = ObjFromName("MorganDoor")
	Gvar_56 = ObjFromName("MayorGate1")
	Gvar_57 = ObjFromName("MayorGate2")
	Gvar_58 = ObjFromName("ContestGate1")
	Gvar_59 = ObjFromName("ContestGate2")
	Gvar_112 = ObjFromName("CemDoorL")
	Gvar_113 = ObjFromName("CemDoorR")
	Gvar_110 = ObjFromName("BasementDoor")
	Gvar_60 = ObjFromName("AldwinElevator")
	Gvar_61 = ObjFromName("RightTownGate")
	Gvar_62 = ObjFromName("LeftTownGate")
	Gvar_72 = ObjFromName("Bryan")
	Gvar_73 = ObjFromName("Clyde")
	Gvar_74 = ObjFromName("Tommy")
	Gvar_66 = ObjFromName("MagicShopElevator")
	Gvar_67 = ObjFromName("Joyce")
	Gvar_68 = ObjFromName("Julie")
	Gvar_69 = ObjFromName("Tanya")
	Gvar_70 = ObjFromName("Gretchen")
	Gvar_50 = ObjFromName("BlueKey")
	Gvar_71 = ObjFromName("AldwynFireplace")
	Gvar_77 = ObjFromName("JacobTrigger")
	Gvar_111 = ObjFromName("AldwynsDoor")
	Gvar_114 = ObjFromName("TempDoorL")
	Gvar_115 = ObjFromName("TempDoorR")
	Gvar_117 = ObjFromName("Mystic")
	Gvar_118 = ObjFromName("Mystic2")
	Gvar_78 = WaypointFromName("AldwynHome")
	Gvar_122 = WaypointFromName("AldwynStorage")
	Gvar_79 = WaypointFromName("JacobWP")
	Gvar_123 = WaypointFromName("MysticWP")
	Gvar_124 = WaypointFromName("MysticStorage")
	Gvar_125 = WaypointFromName("FaceWP")
	Gvar_126 = ObjGroupFromName("NPC's")
	Gvar_127 = ObjGroupFromName("CharmedWolves")
	Gvar_128 = WallGroupFromName("MagicShopElevatorWalls")
	Gvar_80 = WaypointFromName("MineExitWP")
	Gvar_81 = WaypointFromName("CaveExitWP")
	MonsterGoRoam(Gvar_72)
	MonsterGoRoam(Gvar_73)
	MonsterGoRoam(Gvar_74)
	MonsterGoRoam(Gvar_68)
	MonsterGoRoam(Gvar_69)
	LockDoor(Gvar_56)
	LockDoor(Gvar_57)
	LockDoor(Gvar_112)
	LockDoor(Gvar_113)
	LockDoor(Gvar_61)
	LockDoor(Gvar_62)
	LockDoor(Gvar_116)
	LockDoor(Gvar_119)
	InversionInit()
	InitializeDialogs()
	OwnObjects()
	StartScreen(8)
	WaitFrames(5,47)
	WaitFrames(35,66)
	if true then return end
end
function MapEntry()
	var_0 = JournalSetQuest("Chapter8:HasWeirdling")
	if not var_0 == 1 then 
		goto l72
	end
	Gvar_107 = true
	TeleportObj(Gvar_54,GetWaypointX(Gvar_122),GetWaypointY(Gvar_122))
	LockDoor(Gvar_111)
	LockDoor(Gvar_114)
	LockDoor(Gvar_115)
	InitializeSecondaryDialogs()
	SetShopkeeperGreet(Gvar_117,"War08a:Mystic")
	CancelDialog(Gvar_63)
	CancelDialog(Gvar_64)
	::l72::
	PlayMusic(15,100)
	CinematicFadeout()
	if true then return end
end
function DebugOn()
	Gvar_106 = true
	PrintToAll("Debug mode is enabled.")
	if true then return end
end
function DebugOff()
	Gvar_106 = false
	PrintToAll("Debug mode has been disabled.")
	if true then return end
end
function OpenCaveDoor()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l16
	end
	UnlockDoor(Gvar_119)
	DisableObject(Trigger)
	::l16::
	if true then return end
end
function EnableRandomBump()
	Gvar_130 = true
	if true then return end
end
function RandomBump()
	if not ObjIsCaller(GetHostPlayer()) and Gvar_130 then 
		goto l31
	end
	SayChat(Trigger,"Con02a:RandomBump")
	Gvar_130 = false
	WaitFrames(Gvar_129,72)
	::l31::
	if true then return end
end
function RestAwhile()
	var_0 = RandomInteger(60,120)
	MonsterWait(Caller,var_0)
	if true then return end
end
function OpenMagicShopElevatorWalls()
	OpenSecretWallGroup(Gvar_128)
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",WaypointFromName("WellWP"))
	if true then return end
end