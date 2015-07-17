
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_65 = false
	Gvar_66 = false
	Gvar_67 = false
	Gvar_68 = false
	Gvar_69 = false
	Gvar_70 = false
	Gvar_71 = false
	Gvar_72 = false
	Gvar_73 = false
	Gvar_74 = false
	Gvar_75 = false
	Gvar_76 = false
	Gvar_77 = false
	Gvar_78 = false
	Gvar_79 = false
	Gvar_80 = false
	Gvar_81 = false
	Gvar_82 = false
	Gvar_83 = false
	Gvar_84 = false
	Gvar_85 = false
	Gvar_86 = false
	Gvar_87 = false
	Gvar_88 = false
	Gvar_89 = false
	Gvar_90 = false
	Gvar_92 = false
	Gvar_93 = false
	Gvar_94 = 0
	Gvar_95 = 0
	Gvar_96 = 0
	Gvar_97 = 0
	Gvar_98 = 0
	Gvar_99 = 0
	Gvar_100 = 0
	Gvar_101 = 0
	Gvar_102 = 0
	Gvar_103 = 0
	Gvar_104 = 0
	Gvar_105 = 0
	Gvar_106 = 0
	Gvar_108 = 100
	Gvar_118 = 0
	Gvar_119 = 1
	Gvar_120 = 2
	Gvar_121 = 3
	Gvar_122 = 0
	Gvar_123 = 1
	Gvar_124 = 2
	Gvar_125 = 3
	Gvar_126 = 0
	Gvar_127 = 1
	Gvar_128 = 2
	Gvar_129 = 3
	Gvar_142 = 0
	Gvar_143 = 1
	Gvar_144 = 2
	Gvar_145 = 3
	Gvar_146 = 4
	Gvar_147 = 5
	Gvar_148 = Gvar_142
	Gvar_149 = 0
	Gvar_150 = 1
	Gvar_151 = Gvar_149
	Gvar_152 = 0
	Gvar_153 = 0
	Gvar_154 = 0
	Gvar_155 = true
	Gvar_157 = false
	Gvar_158 = false
	Gvar_159 = false
	Gvar_160 = false
	Gvar_161 = false
	Gvar_162 = false
	Gvar_91 = false
	if true then return end
end
function CreatureSetup()
	Gvar_107 = GetObjHealth(Gvar_38)
	Gvar_106 = 0
	::l15::
	if not (Gvar_106 < 100) then 
		goto l41
	end
	Gvar_5[Gvar_106] = 0
	Gvar_106 = Gvar_106 + 1
	goto l15
	::l41::
	InvPutObj(Gvar_22,Gvar_59)
	ObjSetMaster(GetHostPlayer(),Gvar_23)
	ObjSetMaster(GetHostPlayer(),Gvar_24)
	ObjSetMaster(GetHostPlayer(),Gvar_11)
	ObjSetMaster(GetHostPlayer(),Gvar_6)
	ObjSetMaster(GetHostPlayer(),Gvar_7)
	ObjSetMaster(GetHostPlayer(),Gvar_8)
	ObjSetMaster(Gvar_22,Gvar_33)
	ObjSetMaster(Gvar_22,Gvar_28)
	ObjSetMaster(Gvar_22,Gvar_26)
	ObjSetMaster(Gvar_22,Gvar_25)
	ObjSetMaster(Gvar_22,Gvar_27)
	ObjSetMaster(Gvar_22,Gvar_29)
	ObjSetMaster(Gvar_22,Gvar_30)
	ObjSetMaster(Gvar_22,Gvar_31)
	ObjSetMaster(Gvar_22,Gvar_21)
	ObjSetMaster(GetHostPlayer(),Gvar_36)
	MonsterGoRoam(Gvar_38)
	MonsterGuardArea(Gvar_12,GetObjX(Gvar_12),GetObjY(Gvar_12),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_16,GetObjX(Gvar_16),GetObjY(Gvar_16),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_31,GetObjX(Gvar_31),GetObjY(Gvar_31),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	Gvar_110 = GetObjX(Gvar_14)
	Gvar_111 = GetObjY(Gvar_14)
	Gvar_112 = GetObjX(Gvar_9)
	Gvar_113 = GetObjY(Gvar_9)
	Gvar_114 = GetObjX(Gvar_12)
	Gvar_115 = GetObjY(Gvar_12)
	Gvar_116 = GetObjX(Gvar_16)
	Gvar_117 = GetObjY(Gvar_16)
	PlayMusic(17,100)
	if true then return end
end
function PlayerChurchEnter()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l15
	end
	Gvar_82 = true
	goto l20
	::l15::
	MonsterGoRoam(Caller)
	::l20::
	if true then return end
end
function PlayerChurchExit()
	Gvar_82 = false
	if not (Gvar_81 == true) then 
		goto l53
	end
	Gvar_81 = false
	MonsterGoHunt(Gvar_25)
	MonsterGoHunt(Gvar_28)
	MonsterGoHunt(Gvar_27)
	MonsterGoHunt(Gvar_26)
	MonsterGoHunt(Gvar_29)
	MonsterGoHunt(Gvar_30)
	::l53::
	if true then return end
end
function PlayerSneakExit()
	Gvar_82 = false
	if true then return end
end
function DrunkRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l57
	end
	if not (Gvar_100 == Gvar_118) then 
		goto l57
	end
	if not (GetObjHealth(Gvar_31) > 0) then 
		goto l57
	end
	SetupDialog(Gvar_31,"NORMAL",11,12)
	Gvar_100 = Gvar_119
	MonsterFollowObj(Gvar_31,GetHostPlayer())
	ForceDialog(Gvar_31,GetHostPlayer())
	::l57::
	if not (ObjIsCaller(Gvar_22)) then 
		goto l98
	end
	if not (Gvar_72 == false and Gvar_68 == false) then 
		goto l98
	end
	if not (GetObjHealth(Gvar_22) > 0) then 
		goto l98
	end
	MonsterFollowObj(Gvar_22,GetHostPlayer())
	::l98::
	if true then return end
end
function DrunkReport()
	if not (Gvar_93 == true) then 
		goto l21
	end
	Gvar_93 = false
	MonsterGoRoam(Gvar_31)
	::l21::
	if true then return end
end
function DrunkAttacks()
	if not (Gvar_100 == Gvar_119) then 
		goto l136
	end
	if not (GetObjHealth(Gvar_31) > 0) then 
		goto l136
	end
	var_0 = RandomInteger(1,5)
	var_1 = var_0
	if (var_1 == 1) then 
		goto l78
	end
	if (var_1 == 2) then 
		goto l87
	end
	if (var_1 == 3) then 
		goto l96
	end
	if (var_1 == 4) then 
		goto l105
	end
	if (var_1 == 5) then 
		goto l114
	end
	goto l123
	::l78::
	SayChat(Gvar_31,"War07A.scr:DrunkardTaunt01")
	goto l123
	::l87::
	SayChat(Gvar_31,"War07A.scr:DrunkardTaunt02")
	goto l123
	::l96::
	SayChat(Gvar_31,"War07A.scr:DrunkardTaunt03")
	goto l123
	::l105::
	SayChat(Gvar_31,"War07A.scr:DrunkardTaunt04")
	goto l123
	::l114::
	SayChat(Gvar_31,"War07A.scr:DrunkardTaunt05")
	goto l123
	::l123::
	MonsterGoFight(Gvar_31,GetHostPlayer())
	WaitSeconds(5,8)
	::l136::
	if true then return end
end
function DrunkInjured()
	if not (Gvar_72 == false) then 
		goto l83
	end
	if not (GetObjHealth(Gvar_31) > 0) then 
		goto l81
	end
	if not (Gvar_74 == false) then 
		goto l42
	end
	Gvar_74 = true
	SayChat(Gvar_31,"War07A.scr:DrunkardHelp01")
	::l42::
	Gvar_100 = Gvar_120
	MonsterSetAggressiveness(Gvar_22,0.16)
	MonsterSetAggressiveness(Gvar_31,0.16)
	if not (GetObjHealth(Gvar_22) > 0) then 
		goto l81
	end
	MonsterFollowObj(Gvar_31,Gvar_22)
	::l81::
	goto l90
	::l83::
	MonsterSetAggressiveness(Gvar_31,0.83)
	::l90::
	if true then return end
end
function DrunkDied()
	RemoveAllChat()
	Gvar_68 = true
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	CancelDialog(Gvar_22)
	if not (Gvar_102 == Gvar_126) then 
		goto l134
	end
	Gvar_102 = Gvar_127
	MonsterSetAggressiveness(Gvar_28,0.16)
	MonsterSetAggressiveness(Gvar_27,0.16)
	MonsterSetAggressiveness(Gvar_25,0.16)
	MonsterSetAggressiveness(Gvar_26,0.16)
	MonsterSetAggressiveness(Gvar_29,0.16)
	MonsterSetAggressiveness(Gvar_30,0.16)
	goto l141
	::l134::
	Gvar_102 = Gvar_128
	::l141::
	if true then return end
end
function DrunkStart()
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_31)
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:DrunkardIntro01")
	if true then return end
end
function DrunkEnd()
	ObjFreeze(GetHostPlayer(),false)
	CancelDialog(Gvar_31)
	MonsterSetAggressiveness(Gvar_31,0.5)
	MonsterGoFight(Gvar_31,GetHostPlayer())
	WaitSeconds(3,8)
	if true then return end
end
function DrunkLoseSight()
	if not (Gvar_100 == Gvar_119 and Gvar_72 == false and Gvar_70 == false) then 
		goto l54
	end
	MonsterSetAggressiveness(Gvar_31,0.16)
	MonsterFollowObj(Gvar_31,Gvar_22)
	Gvar_100 = Gvar_120
	Gvar_74 = false
	::l54::
	if true then return end
end
function PutPeopleInJail()
	IndexPlayerInventory()
	Gvar_71 = true
	PrintToAll("War07A.scr:TimePass")
	TeleportObj(GetHostPlayer(),3741,5350)
	TeleportObj(Gvar_22,3774,5385)
	MonsterSetAggressiveness(Gvar_22,0)
	ObjLookAtObj(Gvar_22,GetHostPlayer())
	Gvar_72 = true
	if not (GetObjHealth(Gvar_31) > 0) then 
		goto l73
	end
	MonsterSetAggressiveness(Gvar_31,0.16)
	MonsterGoRoam(Gvar_31)
	::l73::
	CinematicFadeout()
	WardenJailCellTalk()
	if true then return end
end
function GetRandomMobYell()
	Gvar_105 = RandomInteger(1,Gvar_103)
	var_0 = Gvar_105
	if (var_0 == 1) then 
		goto l68
	end
	if (var_0 == 2) then 
		goto l203
	end
	if (var_0 == 3) then 
		goto l338
	end
	if (var_0 == 4) then 
		goto l473
	end
	if (var_0 == 5) then 
		goto l608
	end
	if (var_0 == 6) then 
		goto l743
	end
	goto l878
	::l68::
	if not (Gvar_75 == true and GetObjHealth(Gvar_25) > 0) then 
		goto l186
	end
	SayChat(Gvar_25,"War07A.scr:MobYell")
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoFight(Gvar_25,GetHostPlayer())
	MonsterGoFight(Gvar_28,GetHostPlayer())
	MonsterGoFight(Gvar_27,GetHostPlayer())
	MonsterGoFight(Gvar_26,GetHostPlayer())
	MonsterGoFight(Gvar_29,GetHostPlayer())
	MonsterGoFight(Gvar_30,GetHostPlayer())
	Gvar_80 = true
	goto l201
	::l186::
	if not (Gvar_80 == false) then 
		goto l201
	end
	WaitFrames(1,15)
	::l201::
	goto l878
	::l203::
	if not (Gvar_73 == true and GetObjHealth(Gvar_28) > 0) then 
		goto l321
	end
	SayChat(Gvar_28,"War07A.scr:MobYell")
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoFight(Gvar_25,GetHostPlayer())
	MonsterGoFight(Gvar_28,GetHostPlayer())
	MonsterGoFight(Gvar_27,GetHostPlayer())
	MonsterGoFight(Gvar_26,GetHostPlayer())
	MonsterGoFight(Gvar_29,GetHostPlayer())
	MonsterGoFight(Gvar_30,GetHostPlayer())
	Gvar_80 = true
	goto l336
	::l321::
	if not (Gvar_80 == false) then 
		goto l336
	end
	WaitFrames(1,15)
	::l336::
	goto l878
	::l338::
	if not (Gvar_76 == true and GetObjHealth(Gvar_26) > 0) then 
		goto l456
	end
	SayChat(Gvar_26,"War07A.scr:MobYell")
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoFight(Gvar_25,GetHostPlayer())
	MonsterGoFight(Gvar_28,GetHostPlayer())
	MonsterGoFight(Gvar_27,GetHostPlayer())
	MonsterGoFight(Gvar_26,GetHostPlayer())
	MonsterGoFight(Gvar_29,GetHostPlayer())
	MonsterGoFight(Gvar_30,GetHostPlayer())
	Gvar_80 = true
	goto l471
	::l456::
	if not (Gvar_80 == false) then 
		goto l471
	end
	WaitFrames(1,15)
	::l471::
	goto l878
	::l473::
	if not (Gvar_77 == true and GetObjHealth(Gvar_27) > 0) then 
		goto l591
	end
	SayChat(Gvar_27,"War07A.scr:MobYell")
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoFight(Gvar_25,GetHostPlayer())
	MonsterGoFight(Gvar_28,GetHostPlayer())
	MonsterGoFight(Gvar_27,GetHostPlayer())
	MonsterGoFight(Gvar_26,GetHostPlayer())
	MonsterGoFight(Gvar_29,GetHostPlayer())
	MonsterGoFight(Gvar_30,GetHostPlayer())
	Gvar_80 = true
	goto l606
	::l591::
	if not (Gvar_80 == false) then 
		goto l606
	end
	WaitFrames(1,15)
	::l606::
	goto l878
	::l608::
	if not (Gvar_78 == true and GetObjHealth(Gvar_29) > 0) then 
		goto l726
	end
	SayChat(Gvar_29,"War07A.scr:MobYell")
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoFight(Gvar_25,GetHostPlayer())
	MonsterGoFight(Gvar_28,GetHostPlayer())
	MonsterGoFight(Gvar_27,GetHostPlayer())
	MonsterGoFight(Gvar_26,GetHostPlayer())
	MonsterGoFight(Gvar_29,GetHostPlayer())
	MonsterGoFight(Gvar_30,GetHostPlayer())
	Gvar_80 = true
	goto l741
	::l726::
	if not (Gvar_80 == false) then 
		goto l741
	end
	WaitFrames(1,15)
	::l741::
	goto l878
	::l743::
	if not (Gvar_79 == true and GetObjHealth(Gvar_30) > 0) then 
		goto l861
	end
	SayChat(Gvar_30,"War07A.scr:MobYell")
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoFight(Gvar_25,GetHostPlayer())
	MonsterGoFight(Gvar_28,GetHostPlayer())
	MonsterGoFight(Gvar_27,GetHostPlayer())
	MonsterGoFight(Gvar_26,GetHostPlayer())
	MonsterGoFight(Gvar_29,GetHostPlayer())
	MonsterGoFight(Gvar_30,GetHostPlayer())
	Gvar_80 = true
	goto l876
	::l861::
	if not (Gvar_80 == false) then 
		goto l876
	end
	WaitFrames(1,15)
	::l876::
	goto l878
	::l878::
	if true then return end
end
function AppleManRecognize()
	SayChat(Gvar_32,"War07A.scr:AppleManTalk01")
	if true then return end
end
function PlayerPit()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l11
	end
	EnableObject(Gvar_52)
	::l11::
	if true then return end
end
function MaxDialogStart()
	var_0 = Gvar_148
	if (var_0 == Gvar_142) then 
		goto l27
	end
	if (var_0 == Gvar_143) then 
		goto l35
	end
	goto l43
	::l27::
	StartDialogWithCaller("HumanMaleEatFood","War07a.scr:MaxOffer01")
	goto l43
	::l35::
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MaxWaiting")
	goto l43
	::l43::
	if true then return end
end
function MaxDialogEnd()
	var_0 = 0
	var_1 = 0
	var_2 = 1
	var_3 = 2
	var_4 = 0
	var_0 = DialogGetResult(Gvar_21)
	var_5 = var_0
	if (var_5 == var_4) then 
		goto l75
	end
	if (var_5 == var_3) then 
		goto l86
	end
	if (var_5 == var_2) then 
		goto l112
	end
	goto l199
	::l75::
	Gvar_148 = Gvar_143
	ResetMaxDialog()
	goto l199
	::l86::
	SetupDialog(Gvar_21,"NORMAL",100,99)
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:TurnMaxDown")
	Gvar_148 = Gvar_143
	goto l199
	::l112::
	var_1 = PlayerGetGold(GetHostPlayer())
	if not (var_1 >= 50000) then 
		goto l173
	end
	SetupDialog(Gvar_21,"NORMAL",100,99)
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:HaveGoldForMax")
	PlayerAddGold(GetHostPlayer(),-50000)
	Gvar_148 = Gvar_147
	UnlockDoor(Gvar_41)
	UnlockDoor(Gvar_42)
	goto l199
	goto l199
	::l173::
	SetupDialog(Gvar_21,"NORMAL",100,99)
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:NoGoldForMax")
	Gvar_148 = Gvar_143
	goto l199
	::l199::
	if true then return end
end
function PriestGreetingStart()
	if not (Gvar_81 == false) then 
		goto l17
	end
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:PriestTalk01")
	goto l23
	::l17::
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:PriestTalk02")
	::l23::
	if true then return end
end
function PriestGreetingEnd()
	SetupDialog(Gvar_11,"NORMAL",20,21)
	if true then return end
end
function UndertakerTalkStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:UndertakerTalk01")
	if true then return end
end
function UndertakerTalkEnd()
	SetupDialog(Gvar_33,"NORMAL",22,23)
	if true then return end
end
function DorianRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l113
	end
	Gvar_83 = true
	if not (Gvar_82 == false) then 
		goto l113
	end
	var_0 = Gvar_102
	if (var_0 == Gvar_127) then 
		goto l49
	end
	if (var_0 == Gvar_128) then 
		goto l97
	end
	goto l113
	::l49::
	MonsterFollowObj(Gvar_28,GetHostPlayer())
	if not (Gvar_73 == false) then 
		goto l78
	end
	Gvar_103 = Gvar_103 + 1
	Gvar_73 = true
	::l78::
	if not (Gvar_103 == 3) then 
		goto l95
	end
	Gvar_102 = Gvar_128
	GetRandomMobYell()
	::l95::
	goto l113
	::l97::
	Gvar_81 = false
	MonsterGoFight(Gvar_28,GetHostPlayer())
	goto l113
	::l113::
	if true then return end
end
function GrunbarRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l113
	end
	Gvar_85 = true
	if not (Gvar_82 == false) then 
		goto l113
	end
	var_0 = Gvar_102
	if (var_0 == Gvar_127) then 
		goto l49
	end
	if (var_0 == Gvar_128) then 
		goto l97
	end
	goto l113
	::l49::
	MonsterFollowObj(Gvar_27,GetHostPlayer())
	if not (Gvar_77 == false) then 
		goto l78
	end
	Gvar_103 = Gvar_103 + 1
	Gvar_77 = true
	::l78::
	if not (Gvar_103 == 3) then 
		goto l95
	end
	Gvar_102 = Gvar_128
	GetRandomMobYell()
	::l95::
	goto l113
	::l97::
	Gvar_81 = false
	MonsterGoFight(Gvar_27,GetHostPlayer())
	goto l113
	::l113::
	if true then return end
end
function JorganRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l113
	end
	Gvar_86 = true
	if not (Gvar_82 == false) then 
		goto l113
	end
	var_0 = Gvar_102
	if (var_0 == Gvar_127) then 
		goto l49
	end
	if (var_0 == Gvar_128) then 
		goto l97
	end
	goto l113
	::l49::
	MonsterFollowObj(Gvar_26,GetHostPlayer())
	if not (Gvar_76 == false) then 
		goto l78
	end
	Gvar_103 = Gvar_103 + 1
	Gvar_76 = true
	::l78::
	if not (Gvar_103 == 3) then 
		goto l95
	end
	Gvar_102 = Gvar_128
	GetRandomMobYell()
	::l95::
	goto l113
	::l97::
	Gvar_81 = false
	MonsterGoFight(Gvar_26,GetHostPlayer())
	goto l113
	::l113::
	if true then return end
end
function AlbiRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l113
	end
	Gvar_84 = true
	if not (Gvar_82 == false) then 
		goto l113
	end
	var_0 = Gvar_102
	if (var_0 == Gvar_127) then 
		goto l49
	end
	if (var_0 == Gvar_128) then 
		goto l97
	end
	goto l113
	::l49::
	MonsterFollowObj(Gvar_25,GetHostPlayer())
	if not (Gvar_75 == false) then 
		goto l78
	end
	Gvar_103 = Gvar_103 + 1
	Gvar_75 = true
	::l78::
	if not (Gvar_103 == 3) then 
		goto l95
	end
	Gvar_102 = Gvar_128
	GetRandomMobYell()
	::l95::
	goto l113
	::l97::
	Gvar_81 = false
	MonsterGoFight(Gvar_25,GetHostPlayer())
	goto l113
	::l113::
	if true then return end
end
function Civvy3Recognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l113
	end
	Gvar_87 = true
	if not (Gvar_82 == false) then 
		goto l113
	end
	var_0 = Gvar_102
	if (var_0 == Gvar_127) then 
		goto l49
	end
	if (var_0 == Gvar_128) then 
		goto l97
	end
	goto l113
	::l49::
	MonsterFollowObj(Gvar_29,GetHostPlayer())
	if not (Gvar_78 == false) then 
		goto l78
	end
	Gvar_103 = Gvar_103 + 1
	Gvar_78 = true
	::l78::
	if not (Gvar_103 == 3) then 
		goto l95
	end
	Gvar_102 = Gvar_128
	GetRandomMobYell()
	::l95::
	goto l113
	::l97::
	Gvar_81 = false
	MonsterGoFight(Gvar_29,GetHostPlayer())
	goto l113
	::l113::
	if true then return end
end
function Civvy4Recognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l113
	end
	Gvar_88 = true
	if not (Gvar_82 == false) then 
		goto l113
	end
	var_0 = Gvar_102
	if (var_0 == Gvar_127) then 
		goto l49
	end
	if (var_0 == Gvar_128) then 
		goto l97
	end
	goto l113
	::l49::
	MonsterFollowObj(Gvar_30,GetHostPlayer())
	if not (Gvar_79 == false) then 
		goto l78
	end
	Gvar_103 = Gvar_103 + 1
	Gvar_79 = true
	::l78::
	if not (Gvar_103 == 3) then 
		goto l95
	end
	Gvar_102 = Gvar_128
	GetRandomMobYell()
	::l95::
	goto l113
	::l97::
	Gvar_81 = false
	MonsterGoFight(Gvar_30,GetHostPlayer())
	goto l113
	::l113::
	if true then return end
end
function AlbiWaiting()
	if not (ObjIsCaller(Gvar_25)) then 
		goto l76
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_94 == 1) then 
		goto l76
	end
	if not (Gvar_82 == true) then 
		goto l76
	end
	Gvar_81 = true
	MonsterIdle(Gvar_25)
	MonsterSetAggressiveness(Gvar_25,0.16)
	MonsterGuardArea(Gvar_25,GetObjX(Gvar_25),GetObjY(Gvar_25),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l76::
	if true then return end
end
function DorianWaiting()
	if not (ObjIsCaller(Gvar_28)) then 
		goto l76
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_95 == 1) then 
		goto l76
	end
	if not (Gvar_82 == true) then 
		goto l76
	end
	Gvar_81 = true
	MonsterIdle(Gvar_28)
	MonsterSetAggressiveness(Gvar_28,0.16)
	MonsterGuardArea(Gvar_28,GetObjX(Gvar_28),GetObjY(Gvar_28),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l76::
	if true then return end
end
function GrunbarWaiting()
	if not (ObjIsCaller(Gvar_27)) then 
		goto l76
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_96 == 1) then 
		goto l76
	end
	if not (Gvar_82 == true) then 
		goto l76
	end
	Gvar_81 = true
	MonsterIdle(Gvar_27)
	MonsterSetAggressiveness(Gvar_27,0.16)
	MonsterGuardArea(Gvar_27,GetObjX(Gvar_27),GetObjY(Gvar_27),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l76::
	if true then return end
end
function JorganWaiting()
	if not (ObjIsCaller(Gvar_26)) then 
		goto l76
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_97 == 1) then 
		goto l76
	end
	if not (Gvar_82 == true) then 
		goto l76
	end
	Gvar_81 = true
	MonsterIdle(Gvar_26)
	MonsterSetAggressiveness(Gvar_26,0.16)
	MonsterGuardArea(Gvar_26,GetObjX(Gvar_26),GetObjY(Gvar_26),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l76::
	if true then return end
end
function Civvy3Waiting()
	if not (ObjIsCaller(Gvar_29)) then 
		goto l76
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_98 == 1) then 
		goto l76
	end
	if not (Gvar_82 == true) then 
		goto l76
	end
	Gvar_81 = true
	MonsterIdle(Gvar_29)
	MonsterSetAggressiveness(Gvar_29,0.16)
	MonsterGuardArea(Gvar_29,GetObjX(Gvar_29),GetObjY(Gvar_29),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l76::
	if true then return end
end
function Civvy4Waiting()
	if not (ObjIsCaller(Gvar_30)) then 
		goto l76
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_99 == 1) then 
		goto l76
	end
	if not (Gvar_82 == true) then 
		goto l76
	end
	Gvar_81 = true
	MonsterIdle(Gvar_30)
	MonsterSetAggressiveness(Gvar_30,0.16)
	MonsterGuardArea(Gvar_30,GetObjX(Gvar_30),GetObjY(Gvar_30),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l76::
	if true then return end
end
function DorianLoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_83 = false
	::l13::
	if true then return end
end
function AlbiLoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_84 = false
	::l13::
	if true then return end
end
function JorganLoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_86 = false
	::l13::
	if true then return end
end
function GrunbarLoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_85 = false
	::l13::
	if true then return end
end
function Civvy3LoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_87 = false
	::l13::
	if true then return end
end
function Civvy4LoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_88 = false
	::l13::
	if true then return end
end
function MlurghWelcomeStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MlurghTalk01")
	if true then return end
end
function MlurghWelcomeEnd()
	SetupDialog(Gvar_34,"NORMAL",44,45)
	if true then return end
end
function MlurghRumorStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MlurghTalk02")
	if true then return end
end
function MlurghRumorEnd()
	SetupDialog(Gvar_34,"NORMAL",44,45)
	if true then return end
end
function FreezePhim()
	if not (ObjIsCaller(Gvar_9)) then 
		goto l39
	end
	DisableObject(Trigger)
	TeleportObj(Gvar_10,Gvar_112,Gvar_113)
	ObjFreeze(Gvar_9,true)
	ObjFreeze(Gvar_10,true)
	::l39::
	if true then return end
end
function FreezeMage()
	if not (ObjIsCaller(Gvar_12)) then 
		goto l39
	end
	DisableObject(Trigger)
	TeleportObj(Gvar_13,Gvar_114,Gvar_115)
	ObjFreeze(Gvar_12,true)
	ObjFreeze(Gvar_13,true)
	::l39::
	if true then return end
end
function FreezeKin()
	if not (ObjIsCaller(Gvar_16)) then 
		goto l39
	end
	DisableObject(Trigger)
	TeleportObj(Gvar_17,Gvar_116,Gvar_117)
	ObjFreeze(Gvar_16,true)
	ObjFreeze(Gvar_17,true)
	::l39::
	if true then return end
end
function FreezeBB()
	if not (ObjIsCaller(Gvar_14)) then 
		goto l39
	end
	DisableObject(Trigger)
	TeleportObj(Gvar_15,Gvar_110,Gvar_111)
	ObjFreeze(Gvar_14,true)
	ObjFreeze(Gvar_15,true)
	::l39::
	if true then return end
end
function WardenRecognize()
	if not (Gvar_68 == true) then 
		goto l34
	end
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l34
	end
	MonsterSetAggressiveness(Gvar_22,0.83)
	MonsterGoHunt(Gvar_22)
	MonsterGoFight(Gvar_22,GetHostPlayer())
	::l34::
	if not (Gvar_72 == false and Gvar_68 == false and Gvar_70 == false) then 
		goto l122
	end
	if not (ObjIsCaller(Gvar_31)) then 
		goto l80
	end
	MonsterSetAggressiveness(Gvar_22,0.16)
	MonsterFollowObj(Gvar_22,GetHostPlayer())
	::l80::
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l120
	end
	Gvar_101 = Gvar_124
	MonsterSetAggressiveness(Gvar_22,0.16)
	MonsterFollowObj(Gvar_22,GetHostPlayer())
	SetupDialog(Gvar_22,"YESNO",51,52)
	StartWardenTalk()
	::l120::
	goto l221
	::l122::
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l221
	end
	if not (Gvar_72 == true) then 
		goto l202
	end
	if not (Gvar_71 == false) then 
		goto l184
	end
	SayChat(Gvar_22,"War07A.scr:WardenTalk02")
	MonsterSetAggressiveness(Gvar_22,0.83)
	MonsterGoHunt(Gvar_22)
	MonsterGoFight(Gvar_22,GetHostPlayer())
	Gvar_101 = Gvar_125
	LockDoor(Gvar_43)
	::l184::
	if not (Gvar_71 == true) then 
		goto l200
	end
	MonsterSetAggressiveness(Gvar_22,0.16)
	::l200::
	goto l221
	::l202::
	MonsterSetAggressiveness(Gvar_22,0.83)
	MonsterGoHunt(Gvar_22)
	MonsterGoFight(Gvar_22,GetHostPlayer())
	::l221::
	if true then return end
end
function WardenArrestStart()
	ObjFreeze(Gvar_31,true)
	ObjFreeze(Gvar_25,true)
	ObjFreeze(Gvar_28,true)
	ObjFreeze(Gvar_27,true)
	ObjFreeze(Gvar_26,true)
	ObjFreeze(Gvar_29,true)
	ObjFreeze(Gvar_30,true)
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(Gvar_31)
	MonsterIdle(Gvar_25)
	MonsterIdle(Gvar_28)
	MonsterIdle(Gvar_27)
	MonsterIdle(Gvar_26)
	MonsterIdle(Gvar_29)
	MonsterIdle(Gvar_30)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_22)
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:WardenPreArrest04")
	if true then return end
end
function WardenArrestEnd()
	var_0 = 0
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_31,false)
	ObjFreeze(Gvar_25,false)
	ObjFreeze(Gvar_26,false)
	ObjFreeze(Gvar_27,false)
	ObjFreeze(Gvar_28,false)
	ObjFreeze(Gvar_29,false)
	ObjFreeze(Gvar_30,false)
	MonsterGoRoam(Gvar_25)
	MonsterGoRoam(Gvar_28)
	MonsterGoRoam(Gvar_27)
	MonsterGoRoam(Gvar_26)
	MonsterGoRoam(Gvar_29)
	MonsterGoRoam(Gvar_30)
	var_0 = DialogGetResult(Gvar_22)
	var_1 = var_0
	if (var_1 == 0) then 
		goto l141
	end
	if (var_1 == 1) then 
		goto l203
	end
	if (var_1 == 2) then 
		goto l227
	end
	goto l289
	::l141::
	Gvar_101 = Gvar_125
	LockDoor(Gvar_43)
	MonsterSetAggressiveness(Gvar_22,0.83)
	MonsterSetAggressiveness(Gvar_31,0.5)
	MonsterGoFight(Gvar_22,GetHostPlayer())
	MonsterGoFight(Gvar_31,GetHostPlayer())
	MonsterGuardArea(Gvar_23,3622,5460,3737,5579,0)
	CancelDialog(Gvar_23)
	goto l289
	::l203::
	CinematicFade()
	MonsterSetAggressiveness(Gvar_22,0)
	MonsterSetAggressiveness(Gvar_31,0.16)
	WaitFrames(60,14)
	goto l289
	::l227::
	Gvar_101 = Gvar_125
	LockDoor(Gvar_43)
	MonsterSetAggressiveness(Gvar_22,0.83)
	MonsterSetAggressiveness(Gvar_31,0.5)
	MonsterGoFight(Gvar_22,GetHostPlayer())
	MonsterGoFight(Gvar_31,GetHostPlayer())
	MonsterGuardArea(Gvar_23,3622,5460,3737,5579,0)
	CancelDialog(Gvar_23)
	goto l289
	::l289::
	CancelDialog(Gvar_22)
	if true then return end
end
function WardenUpsetStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:WardenTalk01")
	if true then return end
end
function WardenUpsetEnd()
	CancelDialog(Gvar_22)
	MonsterGoRoam(Gvar_22)
	WaitFrames(1,62)
	if true then return end
end
function WardenJailCellTalk()
	if not (Gvar_65 == false) then 
		goto l31
	end
	MonsterSetAggressiveness(Gvar_22,0)
	Gvar_65 = true
	WaitFrames(60,55)
	goto l63
	::l31::
	MonsterSetAggressiveness(Gvar_22,0)
	SetupDialog(Gvar_22,"NORMAL",53,54)
	ObjLookAtObj(Gvar_22,GetHostPlayer())
	ForceDialog(Gvar_22,GetHostPlayer())
	::l63::
	if true then return end
end
function WardenBack()
	EnableObject(Gvar_22)
	ObjLookAtObj(Gvar_22,Gvar_46)
	Gvar_71 = false
	MonsterSetAggressiveness(Gvar_22,0.16)
	DisableObject(Gvar_50)
	if true then return end
end
function WardenDied()
	if not (DoorIsLocked(Gvar_43)) then 
		goto l12
	end
	UnlockDoor(Gvar_43)
	::l12::
	if not (GetObjHealth(Gvar_31) > 0) then 
		goto l34
	end
	Gvar_93 = true
	MonsterGotoHome(Gvar_31)
	::l34::
	if not (Gvar_69 == false) then 
		goto l267
	end
	if not (Gvar_66 == true) then 
		goto l88
	end
	MonsterGuardArea(Gvar_24,GetObjX(Gvar_24),GetObjY(Gvar_24),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	SetupDialog(Gvar_24,"NORMAL",79,80)
	::l88::
	Gvar_69 = true
	CancelDialog(Gvar_22)
	if not (Gvar_84 == true or Gvar_85 == true or Gvar_86 == true or Gvar_83 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l267
	end
	if not (Gvar_102 ~= Gvar_128) then 
		goto l267
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l267::
	if true then return end
end
function WardenMad()
	SayChat(Gvar_22,"War07A.scr:WardenTalk04")
	if true then return end
end
function StartWardenTalk()
	if not (Gvar_70 == false) then 
		goto l81
	end
	if not (GetDistance(GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),GetObjX(Gvar_22),GetObjY(Gvar_22)) > 120) then 
		goto l42
	end
	WaitFrames(10,59)
	goto l81
	::l42::
	if not (HostPlayerIsTrading() == true) then 
		goto l58
	end
	WaitFrames(10,59)
	goto l81
	::l58::
	if not (GetObjHealth(GetHostPlayer()) > 0) then 
		goto l81
	end
	Gvar_70 = true
	ForceDialog(Gvar_22,GetHostPlayer())
	::l81::
	if true then return end
end
function WardenHurt()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l25
	end
	MonsterSetAggressiveness(Gvar_22,0.83)
	Gvar_101 = Gvar_125
	CancelDialog(Gvar_22)
	::l25::
	if true then return end
end
function LockBackDoor()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l16
	end
	DisableObject(Trigger)
	LockDoor(Gvar_46)
	::l16::
	if true then return end
end
function MorganWhisper()
	SayChat(Gvar_23,"War07A.scr:MorganTalk01")
	if true then return end
end
function MorganHintStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MorganTalk02")
	if true then return end
end
function MorganHintEnd()
	CancelDialog(Gvar_23)
	JournalAddEntry(GetHostPlayer(),"FindTunnel",2)
	PrintToAll("Con01a:NewJournalEntry")
	MonsterGoto(Gvar_23,3633,5472)
	if true then return end
end
function MorganRequestStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MorganTalk04")
	if true then return end
end
function MorganRequestEnd()
	CancelDialog(Gvar_23)
	JournalAddEntry(GetHostPlayer(),"RescueMorgan",2)
	if true then return end
end
function OpenEscapeWall()
	if not (ObjIsCaller(Gvar_23)) then 
		goto l15
	end
	OpenSecretWall(GetWallAt(166,220))
	::l15::
	if true then return end
end
function MorganThanksTrigger()
	if not (ObjIsCaller(Gvar_23)) then 
		goto l43
	end
	MonsterGuardArea(Gvar_23,GetObjX(Gvar_23),GetObjY(Gvar_23),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	SetupDialog(Gvar_23,"NORMAL",69,70)
	::l43::
	if not (Gvar_89 == true) then 
		goto l100
	end
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_22,true)
	ObjFreeze(Gvar_31,true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_23)
	ForceDialog(Gvar_23,GetHostPlayer())
	DisableObject(Gvar_51)
	goto l176
	::l100::
	if not (Gvar_91 == true and Gvar_90 == true) then 
		goto l170
	end
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_22,true)
	ObjFreeze(Gvar_31,true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_23)
	ForceDialog(Gvar_23,GetHostPlayer())
	DisableObject(Gvar_51)
	DisableObjectGroup(Gvar_53)
	goto l176
	::l170::
	WaitFrames(10,68)
	::l176::
	if true then return end
end
function MorganThanksStart()
	if not (Gvar_66 == true) then 
		goto l27
	end
	TeleportObj(Gvar_24,3756,4777)
	MonsterFollowObj(Gvar_24,GetHostPlayer())
	goto l32
	::l27::
	LockDoor(Gvar_39)
	::l32::
	StartDialogWithCaller("HumanMaleEatFood","War07a.scr:MorganTalk06")
	SetupDialog(Gvar_24,"NORMAL",77,78)
	if true then return end
end
function MorganThanksEnd()
	CancelDialog(Gvar_23)
	InvPutObj(GetHostPlayer(),Gvar_56)
	InvPutObj(GetHostPlayer(),Gvar_57)
	PlayerGiveExp(GetHostPlayer(),500)
	PrintToAll("GeneralPrint:GainedKey")
	if not (Gvar_66 == true) then 
		goto l59
	end
	JournalUpdateEntry(GetHostPlayer(),"RescueMorgan",4)
	PrintToAll("Con02a:ObjectiveComplete")
	ForceDialog(Gvar_24,GetHostPlayer())
	goto l94
	::l59::
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_22,false)
	ObjFreeze(Gvar_31,false)
	Gvar_92 = true
	::l94::
	if true then return end
end
function MorganContact()
	if not (ObjIsHostileTo(Gvar_23,Caller)) then 
		goto l26
	end
	if not (Gvar_92 == true) then 
		goto l26
	end
	MonsterSetAggressiveness(Gvar_23,0.83)
	::l26::
	if true then return end
end
function MorganFriendStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MorganFriendTalk01")
	if true then return end
end
function MorganFriendEnd()
	JournalUpdateEntry(GetHostPlayer(),"FindTunnel",4)
	PrintToAll("Con02a:ObjectiveComplete")
	JournalAddEntry(GetHostPlayer(),"RescueMorgan",2)
	PrintToAll("Con01a:NewJournalEntry")
	Gvar_66 = true
	CancelDialog(Gvar_24)
	if true then return end
end
function UnlockGearDoor()
	if not (DoorIsLocked(Gvar_39)) then 
		goto l12
	end
	UnlockDoor(Gvar_39)
	::l12::
	if true then return end
end
function CheckMorganDoor()
	if not (DoorIsLocked(Gvar_45)) then 
		goto l15
	end
	WaitFrames(10,75)
	goto l49
	::l15::
	CancelDialog(Gvar_23)
	DisableObject(Gvar_49)
	ObjLookAtObj(Gvar_23,GetHostPlayer())
	SayChat(Gvar_23,"War07A.scr:MorganTalk05")
	EnableWaypointGroup(Gvar_134)
	MonsterGoRoam(Gvar_23)
	::l49::
	if true then return end
end
function SeeMorgan()
	if not (ObjIsCaller(Gvar_23)) then 
		goto l34
	end
	if not (Gvar_67 == false) then 
		goto l34
	end
	Gvar_67 = true
	SetupDialog(Gvar_24,"NORMAL",77,78)
	::l34::
	if true then return end
end
function GiveShieldStart()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_22,true)
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MorganFriendTalk02")
	if true then return end
end
function GiveShieldEnd()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_22,false)
	ObjFreeze(Gvar_31,false)
	CinematicBorders(false)
	Gvar_92 = true
	MonsterGuardArea(Gvar_23,GetObjX(Gvar_23),GetObjY(Gvar_23),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_24,GetObjX(Gvar_24),GetObjY(Gvar_24),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	CancelDialog(Gvar_24)
	InvPutObj(GetHostPlayer(),Gvar_55)
	PrintToAll("GeneralPrint:GainedItem")
	JournalUpdateEntry(GetHostPlayer(),"RescueMorgan",4)
	PrintToAll("Con02a:ObjectiveComplete")
	if true then return end
end
function FriendWaitStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MorganFriendTalk04")
	if true then return end
end
function FriendWaitEnd()
	SetupDialog(Gvar_24,"NORMAL",79,80)
	if true then return end
end
function LookForPlayer()
	if not (HostPlayerIsTalking() == 0) then 
		goto l55
	end
	if not (Gvar_89 == true or Gvar_90 == true) then 
		goto l55
	end
	MonsterGuardArea(Gvar_24,GetObjX(Gvar_24),GetObjY(Gvar_24),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	ForceDialog(Gvar_24,GetHostPlayer())
	if true then return end
	::l55::
	WaitFrames(10,81)
	if true then return end
end
function RewardTrigger()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l49
	end
	if not (DoorIsLocked(Gvar_45) == 0) then 
		goto l49
	end
	DisableObjectGroup(Gvar_53)
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_51)
	CinematicBorders(true)
	Gvar_89 = true
	::l49::
	if true then return end
end
function PlayerExitRoom()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_90 = false
	::l13::
	if not (ObjIsCaller(Gvar_23)) then 
		goto l52
	end
	MonsterSetAggressiveness(Gvar_23,0.16)
	MonsterGuardArea(Gvar_23,GetWaypointX(Gvar_140),GetWaypointY(Gvar_140),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l52::
	if not (ObjIsCaller(Gvar_24)) then 
		goto l91
	end
	MonsterSetAggressiveness(Gvar_24,0.16)
	MonsterGuardArea(Gvar_24,GetWaypointX(Gvar_141),GetWaypointY(Gvar_141),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l91::
	if true then return end
end
function OpenTowerGate()
	if not (DoorIsLocked(Gvar_47) == 0 or DoorIsLocked(Gvar_48) == 0) then 
		goto l81
	end
	var_0 = InvGetTopObj(GetHostPlayer())
	::l23::
	if not (var_0 ~= 0) then 
		goto l81
	end
	if not (var_0 == ObjFromName("GoldKey2")) then 
		goto l48
	end
	DeleteObject(var_0)
	goto l81
	::l48::
	if not (var_0 == ObjFromName("GoldKey1")) then 
		goto l70
	end
	DeleteObject(var_0)
	DisableObject(Trigger)
	goto l81
	::l70::
	var_0 = InvGetNextObj(var_0)
	goto l23
	::l81::
	if true then return end
end
function BoothStart()
	ObjLookAtObj(Gvar_36,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War03b:T4Post")
	if true then return end
end
function BoothEnd()
	if true then return end
end
function NewMaxStart()
	RemoveAllChat()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:MaxOffer01")
	if true then return end
end
function NewMaxEnd()
	if true then return end
end
function IndexPlayerInventory()
	if true then return end
end
function WarTrigger()
	DisableObject(Trigger)
	UnlockDoor(Gvar_41)
	UnlockDoor(Gvar_42)
	if true then return end
end
function Injured()
	if not (Gvar_82 ~= true) then 
		goto l16
	end
	MonsterSetAggressiveness(Trigger,0.83)
	::l16::
	if not (ObjIsTrigger(Gvar_25)) then 
		goto l130
	end
	Gvar_94 = 1
	if not (Gvar_82 ~= true) then 
		goto l128
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_85 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l128
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	::l128::
	goto l698
	::l130::
	if not (ObjIsTrigger(Gvar_26)) then 
		goto l244
	end
	Gvar_97 = 1
	if not (Gvar_82 ~= true) then 
		goto l242
	end
	if not (Gvar_84 == true or Gvar_83 == true or Gvar_85 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l242
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	::l242::
	goto l698
	::l244::
	if not (ObjIsTrigger(Gvar_28)) then 
		goto l358
	end
	Gvar_95 = 1
	if not (Gvar_82 ~= true) then 
		goto l356
	end
	if not (Gvar_86 == true or Gvar_84 == true or Gvar_85 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l356
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	::l356::
	goto l698
	::l358::
	if not (ObjIsTrigger(Gvar_27)) then 
		goto l472
	end
	Gvar_96 = 1
	if not (Gvar_82 ~= true) then 
		goto l470
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_84 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l470
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	::l470::
	goto l698
	::l472::
	if not (ObjIsTrigger(Gvar_29)) then 
		goto l586
	end
	Gvar_98 = 1
	if not (Gvar_82 ~= true) then 
		goto l584
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_85 == true or Gvar_84 == true or Gvar_88 == true) then 
		goto l584
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	::l584::
	goto l698
	::l586::
	if not (ObjIsTrigger(Gvar_30)) then 
		goto l698
	end
	Gvar_99 = 1
	if not (Gvar_82 ~= true) then 
		goto l698
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_85 == true or Gvar_87 == true or Gvar_84 == true) then 
		goto l698
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	::l698::
	if true then return end
end
function Killed()
	if not (Gvar_82 ~= true) then 
		goto l16
	end
	MonsterSetAggressiveness(Trigger,0.83)
	::l16::
	if not (ObjIsTrigger(Gvar_25)) then 
		goto l184
	end
	if not (Gvar_82 ~= true) then 
		goto l182
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_85 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l182
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l182::
	goto l1022
	::l184::
	if not (ObjIsTrigger(Gvar_26)) then 
		goto l352
	end
	if not (Gvar_82 ~= true) then 
		goto l350
	end
	if not (Gvar_84 == true or Gvar_83 == true or Gvar_85 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l350
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l350::
	goto l1022
	::l352::
	if not (ObjIsTrigger(Gvar_28)) then 
		goto l520
	end
	if not (Gvar_82 ~= true) then 
		goto l518
	end
	if not (Gvar_86 == true or Gvar_84 == true or Gvar_85 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l518
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l518::
	goto l1022
	::l520::
	if not (ObjIsTrigger(Gvar_27)) then 
		goto l688
	end
	if not (Gvar_82 ~= true) then 
		goto l686
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_84 == true or Gvar_87 == true or Gvar_88 == true) then 
		goto l686
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l686::
	goto l1022
	::l688::
	if not (ObjIsTrigger(Gvar_29)) then 
		goto l856
	end
	if not (Gvar_82 ~= true) then 
		goto l854
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_85 == true or Gvar_84 == true or Gvar_88 == true) then 
		goto l854
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l854::
	goto l1022
	::l856::
	if not (ObjIsTrigger(Gvar_30)) then 
		goto l1022
	end
	if not (Gvar_82 ~= true) then 
		goto l1022
	end
	if not (Gvar_86 == true or Gvar_83 == true or Gvar_85 == true or Gvar_87 == true or Gvar_84 == true) then 
		goto l1022
	end
	Gvar_102 = Gvar_128
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	TeleportObj(Gvar_9,GetWaypointX(Gvar_137),GetWaypointY(Gvar_137))
	TeleportObj(Gvar_12,GetWaypointX(Gvar_139),GetWaypointY(Gvar_139))
	TeleportObj(Gvar_16,GetWaypointX(Gvar_138),GetWaypointY(Gvar_138))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_136),GetWaypointY(Gvar_136))
	::l1022::
	if true then return end
end
function EscapeHatch()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l11
	end
	OpenSecretWallGroup(Gvar_64)
	::l11::
	if true then return end
end
function CloseHatch()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l11
	end
	CloseSecretWallGroup(Gvar_64)
	::l11::
	if true then return end
end
function MapInitialize()
	Gvar_6 = ObjFromName("TowerNPC")
	Gvar_7 = ObjFromName("TowerNPC2")
	Gvar_8 = ObjFromName("TowerMaiden")
	Gvar_9 = ObjFromName("F6Townsman2")
	Gvar_10 = ObjFromName("Jesse")
	Gvar_11 = ObjFromName("Priest")
	Gvar_14 = ObjFromName("BrightBlades")
	Gvar_15 = ObjFromName("BrightBladesA")
	Gvar_12 = ObjFromName("Mystic")
	Gvar_13 = ObjFromName("Mystic2")
	Gvar_18 = ObjFromName("BookVendor")
	Gvar_19 = ObjFromName("BookVendorA")
	Gvar_16 = ObjFromName("Loreman")
	Gvar_17 = ObjFromName("Kincaid")
	Gvar_20 = ObjFromName("LameBarKeep")
	Gvar_21 = ObjFromName("Max")
	Gvar_22 = ObjFromName("Warden")
	Gvar_23 = ObjFromName("Morgan")
	Gvar_24 = ObjFromName("F6FireGuard8")
	Gvar_32 = ObjFromName("AppleMan")
	Gvar_33 = ObjFromName("Undertaker")
	Gvar_34 = ObjFromName("Mlurgh")
	Gvar_35 = ObjFromName("Grillf")
	Gvar_36 = ObjFromName("F6Elite4")
	Gvar_37 = ObjFromName("NPCMover")
	Gvar_38 = ObjFromName("DaMan")
	Gvar_28 = ObjFromName("Dorian")
	Gvar_26 = ObjFromName("Jorgan")
	Gvar_27 = ObjFromName("Grunbar")
	Gvar_25 = ObjFromName("Albi")
	Gvar_29 = ObjFromName("Civvy3")
	Gvar_30 = ObjFromName("Civvy4")
	Gvar_31 = ObjFromName("Daniel")
	Gvar_62 = ObjFromName("DaManKey")
	Gvar_39 = ObjFromName("GearRoomDoor")
	Gvar_40 = ObjFromName("GuardDoor1")
	Gvar_41 = ObjFromName("MaxHomeDoor1")
	Gvar_42 = ObjFromName("MaxHomeDoor2")
	Gvar_43 = ObjFromName("FirstJailDoor")
	Gvar_44 = ObjFromName("WarriorCellDoor")
	Gvar_45 = ObjFromName("MorganCellDoor")
	Gvar_46 = ObjFromName("BackRoomDoor")
	Gvar_47 = ObjFromName("TowerGate1")
	Gvar_48 = ObjFromName("TowerGate2")
	Gvar_49 = ObjFromName("JailCellTrigger")
	Gvar_50 = ObjFromName("WardenBackTrigger")
	Gvar_51 = ObjFromName("ThanksTrigger")
	Gvar_54 = ObjFromName("WardenFaceThis")
	Gvar_55 = ObjFromName("RogueShield")
	Gvar_56 = ObjFromName("MorganGold")
	Gvar_57 = ObjFromName("TowerKey")
	Gvar_58 = ObjFromName("GoldKey1")
	Gvar_59 = ObjFromName("GoldKey2")
	Gvar_60 = ObjFromName("SecretShirt")
	Gvar_61 = ObjFromName("SecretApple")
	Gvar_53 = ObjGroupFromName("RewardTriggerGroup")
	Gvar_63 = WallGroupFromName("JumpWalls")
	Gvar_64 = WallGroupFromName("FallWalls")
	Gvar_135 = WaypointFromName("MorganFriendWP")
	Gvar_133 = WaypointFromName("WardenFooledWP")
	Gvar_134 = WaypointGroupFromName("EscapeWP")
	Gvar_135 = WaypointGroupFromName("MorganFriendWP")
	Gvar_4 = WaypointFromName("Storage")
	Gvar_131 = WaypointFromName("PlayerSounds")
	Gvar_132 = WaypointFromName("SecretSounds")
	Gvar_136 = WaypointFromName("BBWP")
	Gvar_137 = WaypointFromName("PhimWP")
	Gvar_139 = WaypointFromName("MVWP")
	Gvar_138 = WaypointFromName("KinWP")
	Gvar_140 = WaypointFromName("MorganGuardWP")
	Gvar_141 = WaypointFromName("MickGuardWP")
	DisableWaypointGroup(Gvar_134)
	DisableWaypointGroup(Gvar_135)
	LockDoor(Gvar_39)
	LockDoor(Gvar_40)
	LockDoor(Gvar_44)
	LockDoor(Gvar_41)
	LockDoor(Gvar_42)
	ObjSetMaster(GetHostPlayer(),Gvar_11)
	SetupDialog(Gvar_11,"NORMAL",20,21)
	SetupDialog(Gvar_23,"NORMAL",63,64)
	SetupDialog(Gvar_24,"NORMAL",72,73)
	SetupDialog(Gvar_21,"NORMAL",87,88)
	SetupDialog(Gvar_33,"NORMAL",22,23)
	SetupDialog(Gvar_36,"NORMAL",85,86)
	SetDialogPortrait(Gvar_21,"MaxPic")
	SetDialogPortrait(Gvar_33,"UndertakerPic")
	SetDialogPortrait(Gvar_28,"Townsman3Pic")
	SetDialogPortrait(Gvar_27,"Townsman2Pic")
	SetDialogPortrait(Gvar_25,"Townsman1Pic")
	SetDialogPortrait(Gvar_26,"Warrior2Pic")
	SetDialogPortrait(Gvar_22,"WardenPic")
	SetDialogPortrait(Gvar_11,"GalavaPriestPic")
	SetDialogPortrait(Gvar_23,"MorganPic")
	SetDialogPortrait(Gvar_24,"FentonPic")
	SetDialogPortrait(Gvar_31,"DrunkPic")
	SetDialogPortrait(Gvar_36,"MalePic4")
	Gvar_100 = Gvar_118
	Gvar_101 = Gvar_122
	Gvar_102 = Gvar_126
	WaitFrames(1,2)
	if true then return end
end
function PlayerDeath()
	DeathScreen(7)
	if true then return end
end
function MickContact()
	if not (ObjIsHostileTo(Gvar_24,Caller)) then 
		goto l26
	end
	if not (Gvar_92 == true) then 
		goto l26
	end
	MonsterSetAggressiveness(Gvar_24,0.83)
	::l26::
	if true then return end
end
function WardenWaiting()
	if not (ObjIsCaller(Gvar_22)) then 
		goto l70
	end
	if not (Gvar_102 ~= Gvar_126 or Gvar_101 == Gvar_125) then 
		goto l70
	end
	if not (Gvar_82 == true) then 
		goto l70
	end
	MonsterIdle(Gvar_22)
	MonsterSetAggressiveness(Gvar_22,0.16)
	MonsterGuardArea(Gvar_22,GetObjX(Gvar_22),GetObjY(Gvar_22),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l70::
	if true then return end
end
function ResetMaxDialog()
	if not (Gvar_148 == Gvar_147) then 
		goto l16
	end
	CancelDialog(Gvar_21)
	goto l27
	::l16::
	SetupDialog(Gvar_21,"YESNO",18,19)
	::l27::
	if true then return end
end
function NullFunction()
	if true then return end
end
function MaxDie()
	CancelDialog(Gvar_21)
	if true then return end
end
function DaManDragged()
	if not (ObjIsCaller(Gvar_38)) then 
		goto l22
	end
	DisableObject(Trigger)
	UnlockDoor(Gvar_41)
	UnlockDoor(Gvar_42)
	::l22::
	if true then return end
end
function EmptyPlayerInventory()
	var_0 = Gvar_151
	if (var_0 == Gvar_149) then 
		goto l27
	end
	if (var_0 == Gvar_150) then 
		goto l57
	end
	goto l104
	::l27::
	InvDropObj(GetHostPlayer(),Gvar_5[Gvar_153])
	Gvar_154 = Gvar_154 + 1
	Gvar_151 = Gvar_150
	WaitFrames(1,103)
	::l57::
	if not (Gvar_153 <= Gvar_152) then 
		goto l104
	end
	TeleportObj(Gvar_5[Gvar_153],GetWaypointX(Gvar_4),GetWaypointY(Gvar_4))
	Gvar_151 = Gvar_149
	Gvar_153 = Gvar_153 + 1
	WaitFrames(1,103)
	::l104::
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	TeleportWaypoint(Gvar_131,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	AudioEvent("RestoreHealth",Gvar_131)
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",WaypointFromName("WellWP"))
	if true then return end
end
function Jump()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l52
	end
	if not (DoesHaveObject(GetHostPlayer(),Gvar_60)) then 
		goto l52
	end
	if not (DoesHaveObject(GetHostPlayer(),Gvar_61)) then 
		goto l52
	end
	DisableObject(Trigger)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_63)
	SayChat(Gvar_8,"Con02a:BarMaiden2")
	WaitSeconds(3,106)
	::l52::
	if true then return end
end
function Upset()
	RemoveAllChat()
	SayChat(Gvar_6,"Wiz02B.scr:LewisTalk06")
	WaitSeconds(3,107)
	if true then return end
end
function StartJump()
	OpenSecretWallGroup(Gvar_64)
	MonsterGoRoam(Gvar_6)
	if true then return end
end
function MoveJumper()
	if not (ObjIsCaller(Gvar_6)) then 
		goto l29
	end
	DisableObject(Trigger)
	MonsterIdle(Gvar_6)
	EnableObject(Gvar_37)
	SayChat(Gvar_6,"Wiz02B.scr:LewisTalk03")
	::l29::
	if true then return end
end
function KillJumper()
	if not (ObjIsCaller(Gvar_6)) then 
		goto l40
	end
	DisableObject(Trigger)
	RemoveAllChat()
	DamageObject(Gvar_6,0,500,0)
	CloseSecretWallGroup(Gvar_64)
	CloseSecretWallGroup(Gvar_63)
	WallMakeSilent(false)
	::l40::
	if true then return end
end
function DaManHurt()
	if not (DoorIsLocked(Gvar_41) == 0 or DoorIsLocked(Gvar_42) == 0) then 
		goto l29
	end
	MonsterSetAggressiveness(Gvar_38,0.83)
	MonsterGoFight(Gvar_38,GetHostPlayer())
	::l29::
	if true then return end
end
function DaManDie()
	if not (DoorIsLocked(Gvar_41) and DoorIsLocked(Gvar_42)) then 
		goto l26
	end
	InvDropObj(Gvar_38,Gvar_62)
	DeleteObject(Gvar_62)
	::l26::
	if true then return end
end
function MorganRecognize()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_91 = true
	::l13::
	if true then return end
end
function MorganLoseSight()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_91 = false
	::l13::
	if true then return end
end
function ScorpionAway()
	if not (ObjIsHostileTo(GetHostPlayer(),Caller)) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function CivvyJailCheck()
	if not (ObjIsCaller(Gvar_26)) then 
		goto l19
	end
	Gvar_160 = true
	MonsterGotoHome(Gvar_26)
	::l19::
	if not (ObjIsCaller(Gvar_27)) then 
		goto l38
	end
	Gvar_159 = true
	MonsterGotoHome(Gvar_27)
	::l38::
	if not (ObjIsCaller(Gvar_25)) then 
		goto l57
	end
	Gvar_158 = true
	MonsterGotoHome(Gvar_25)
	::l57::
	if not (ObjIsCaller(Gvar_28)) then 
		goto l76
	end
	Gvar_157 = true
	MonsterGotoHome(Gvar_28)
	::l76::
	if not (ObjIsCaller(Gvar_29)) then 
		goto l95
	end
	Gvar_161 = true
	MonsterGotoHome(Gvar_29)
	::l95::
	if not (ObjIsCaller(Gvar_30)) then 
		goto l114
	end
	Gvar_162 = true
	MonsterGotoHome(Gvar_30)
	::l114::
	if true then return end
end
function FireballSecret()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l41
	end
	DisableObject(Trigger)
	TeleportWaypoint(Gvar_132,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_132)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	::l41::
	if true then return end
end
function PlayerEnterRoom()
	if not (ObjIsCaller(GetHostPlayer())) then 
		goto l13
	end
	Gvar_90 = true
	::l13::
	if not (ObjIsCaller(Gvar_26)) then 
		goto l32
	end
	Gvar_160 = true
	MonsterGotoHome(Gvar_26)
	::l32::
	if not (ObjIsCaller(Gvar_27)) then 
		goto l51
	end
	Gvar_159 = true
	MonsterGotoHome(Gvar_27)
	::l51::
	if not (ObjIsCaller(Gvar_25)) then 
		goto l70
	end
	Gvar_158 = true
	MonsterGotoHome(Gvar_25)
	::l70::
	if not (ObjIsCaller(Gvar_28)) then 
		goto l89
	end
	Gvar_157 = true
	MonsterGotoHome(Gvar_28)
	::l89::
	if not (ObjIsCaller(Gvar_29)) then 
		goto l108
	end
	Gvar_161 = true
	MonsterGotoHome(Gvar_29)
	::l108::
	if not (ObjIsCaller(Gvar_30)) then 
		goto l127
	end
	Gvar_162 = true
	MonsterGotoHome(Gvar_30)
	::l127::
	if true then return end
end
function JorganReport()
	if not (Gvar_97 == 1) then 
		goto l22
	end
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterGoHunt(Gvar_26)
	goto l34
	::l22::
	MonsterSetAggressiveness(Gvar_26,0.16)
	MonsterGoRoam(Gvar_26)
	::l34::
	Gvar_160 = false
	if true then return end
end
function AlbiReport()
	if not (Gvar_94 == 1) then 
		goto l22
	end
	MonsterSetAggressiveness(Gvar_25,0.83)
	MonsterGoHunt(Gvar_25)
	goto l34
	::l22::
	MonsterSetAggressiveness(Gvar_25,0.16)
	MonsterGoRoam(Gvar_25)
	::l34::
	Gvar_158 = false
	if true then return end
end
function GrunbarReport()
	if not (Gvar_96 == 1) then 
		goto l22
	end
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterGoHunt(Gvar_27)
	goto l34
	::l22::
	MonsterSetAggressiveness(Gvar_27,0.16)
	MonsterGoRoam(Gvar_27)
	::l34::
	Gvar_159 = false
	if true then return end
end
function DorianReport()
	if not (Gvar_95 == 1) then 
		goto l22
	end
	MonsterSetAggressiveness(Gvar_28,0.83)
	MonsterGoHunt(Gvar_28)
	goto l34
	::l22::
	MonsterSetAggressiveness(Gvar_28,0.16)
	MonsterGoRoam(Gvar_28)
	::l34::
	Gvar_157 = false
	if true then return end
end
function Civvy3Report()
	if not (Gvar_98 == 1) then 
		goto l22
	end
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterGoHunt(Gvar_29)
	goto l34
	::l22::
	MonsterSetAggressiveness(Gvar_29,0.16)
	MonsterGoRoam(Gvar_29)
	::l34::
	Gvar_161 = false
	if true then return end
end
function Civvy4Report()
	if not (Gvar_99 == 1) then 
		goto l22
	end
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterGoHunt(Gvar_30)
	goto l34
	::l22::
	MonsterSetAggressiveness(Gvar_30,0.16)
	MonsterGoRoam(Gvar_30)
	::l34::
	Gvar_162 = false
	if true then return end
end