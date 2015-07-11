
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
	Gvar_10 = 0
	Gvar_11 = 1
	Gvar_12 = 0
	Gvar_13 = 1
	Gvar_14 = 0
	Gvar_15 = 1
	Gvar_16 = 2
	Gvar_17 = 3
	Gvar_18 = 4
	Gvar_19 = 5
	Gvar_20 = 0
	Gvar_21 = 1
	Gvar_22 = 2
	Gvar_23 = 3
	Gvar_24 = 0
	Gvar_25 = 1
	Gvar_26 = 2
	Gvar_27 = 3
	Gvar_28 = 0
	Gvar_29 = 1
	Gvar_30 = 2
	Gvar_31 = 3
	Gvar_32 = 0
	Gvar_33 = 1
	Gvar_68 = false
	Gvar_69 = 0
	Gvar_70 = Gvar_4
	Gvar_71 = Gvar_10
	Gvar_72 = Gvar_12
	Gvar_73 = Gvar_20
	Gvar_74 = Gvar_14
	Gvar_75 = Gvar_24
	Gvar_76 = Gvar_28
	Gvar_77 = Gvar_32
	Gvar_84 = 0
	Gvar_85 = 0
	Gvar_86 = 0
	Gvar_229 = 0
	Gvar_230 = 0
	Gvar_231 = 1
	Gvar_232 = 2
	Gvar_233 = 3
	Gvar_234 = Gvar_230
	if true then return end
end
function OgreDeath()
	Gvar_69 = Gvar_69 + 1
	if not ObjIsTrigger(Gvar_51) then 
		goto l38
	end
	MonsterGuardArea(Gvar_130,GetWaypointX(Gvar_191),GetWaypointY(Gvar_191),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l38::
	if not Gvar_69 >= 7 then 
		goto l54
	end
	SetTownDialog()
	PlayMusic(23,100)
	::l54::
	if true then return end
end
function SetTownDialog()
	SetupDialog(Gvar_179,"NORMAL",38,39)
	SetDialogPortrait(Gvar_179,"MalePic8")
	SetupDialog(Gvar_180,"NORMAL",40,41)
	SetDialogPortrait(Gvar_180,"MalePic3")
	SetupDialog(Gvar_181,"NORMAL",42,43)
	SetDialogPortrait(Gvar_181,"MalePic2")
	SetupDialog(Gvar_182,"NORMAL",44,45)
	SetDialogPortrait(Gvar_182,"MalePic14")
	SetupDialog(Gvar_183,"NORMAL",46,47)
	SetDialogPortrait(Gvar_183,"MalePic9")
	SetupDialog(Gvar_130,"NORMAL",5,6)
	if true then return end
end
function CheckFlame()
	if not ObjIsEnabled(Gvar_66) then 
		goto l13
	end
	PrintToAll("Flame Exists")
	goto l17
	::l13::
	PrintToAll("Flame all gone :(")
	::l17::
	if true then return end
end
function FarmerSavedStart()
	StartDialogWithCaller("HumanMaleEatFood","Wiz05A.scr:FarmerIdle")
	if true then return end
end
function FarmerSavedEnd()
	SetupDialog(Gvar_130,"NORMAL",5,6)
	if true then return end
end
function BearGoAway()
	if not ObjIsCaller(Gvar_59) then 
		goto l19
	end
	Gvar_68 = true
	MonsterGotoHome(Gvar_59)
	::l19::
	if true then return end
end
function BearReport()
	if not Gvar_68 == true then 
		goto l48
	end
	MonsterSetAggressiveness(Gvar_59,0.5)
	MonsterGuardArea(Gvar_59,GetWaypointX(Gvar_41),GetWaypointY(Gvar_41),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),300)
	Gvar_68 = false
	::l48::
	if true then return end
end
function KillCorpses()
	WaitFrames(30,52)
	if true then return end
end
function DisableVillagers()
	var_0 = GetWaypointX(Gvar_191)
	var_1 = GetWaypointY(Gvar_191)
	var_2 = GetWaypointX(Gvar_192)
	var_3 = GetWaypointY(Gvar_192)
	MonsterGuardArea(Gvar_130,var_0,var_1,var_2,var_3,0)
	if true then return end
end
function LockDoors()
	LockDoor(Gvar_198)
	LockDoor(Gvar_199)
	LockDoor(Gvar_196)
	LockDoor(Gvar_197)
	if true then return end
end
function SwordsmanStart()
	ObjFreeze(Gvar_144,true)
	MonsterIdle(Gvar_144)
	ObjLookAtObj(Gvar_144,GetHostPlayer())
	var_0 = Gvar_72
	if var_0 == Gvar_12 then 
		goto l47
	end
	if var_0 == Gvar_13 then 
		goto l62
	end
	goto l77
	::l47::
	ObjLookAtObj(Gvar_144,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SwordsmanGreeting")
	goto l77
	::l62::
	ObjLookAtObj(Gvar_144,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SwordsmanEnd")
	goto l77
	::l77::
	if true then return end
end
function SwordsmanEnd()
	ObjFreeze(Gvar_144,false)
	MonsterGuardArea(Gvar_144,GetWaypointX(Gvar_189),GetWaypointY(Gvar_189),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),240)
	var_0 = Gvar_72
	if var_0 == Gvar_12 then 
		goto l60
	end
	if var_0 == Gvar_13 then 
		goto l75
	end
	goto l84
	::l60::
	WaitFrames(1,58)
	Gvar_72 = Gvar_13
	goto l84
	::l75::
	MonsterFaceObj(Gvar_144,2)
	goto l84
	::l84::
	if true then return end
end
function DrunkStart()
	ObjLookAtObj(Trigger,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:DrunkGreeting")
	if true then return end
end
function DrunkEnd()
	MonsterFaceObj(Trigger,0)
	if true then return end
end
function FarmerStart()
	var_2 = Gvar_70
	if var_2 == Gvar_4 then 
		goto l63
	end
	if var_2 == Gvar_5 then 
		goto l116
	end
	if var_2 == Gvar_6 then 
		goto l136
	end
	if var_2 == Gvar_7 then 
		goto l222
	end
	if var_2 == Gvar_8 then 
		goto l242
	end
	if var_2 == Gvar_9 then 
		goto l262
	end
	goto l290
	::l63::
	if not DoesHaveObject(GetHostPlayer(),Gvar_127) then 
		goto l96
	end
	Gvar_70 = Gvar_7
	SetupDialog(Gvar_130,"NORMAL",16,17)
	FarmerStart()
	goto l290
	goto l116
	::l96::
	MonsterIdle(Gvar_130)
	ObjLookAtObj(Gvar_130,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerGreeting")
	goto l290
	::l116::
	MonsterIdle(Gvar_130)
	ObjLookAtObj(Gvar_130,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerGreeting")
	goto l290
	::l136::
	MonsterIdle(Gvar_130)
	ObjLookAtObj(Gvar_130,GetHostPlayer())
	if not DoesHaveObject(GetHostPlayer(),Gvar_127) then 
		goto l214
	end
	var_0 = GetWaypointX(Gvar_191)
	var_1 = GetWaypointY(Gvar_191)
	AudioEvent("CurePoisonCast",Gvar_191)
	AudioEvent("CurePoisonEffect",Gvar_191)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	Gvar_70 = Gvar_7
	FarmerStart()
	goto l222
	::l214::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerWaiting")
	goto l290
	::l222::
	MonsterIdle(Gvar_130)
	ObjLookAtObj(Gvar_130,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerReturned")
	goto l290
	::l242::
	MonsterIdle(Gvar_130)
	ObjLookAtObj(Gvar_130,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerIdle")
	goto l290
	::l262::
	if not DoesHaveObject(GetHostPlayer(),Gvar_127) then 
		goto l282
	end
	Gvar_70 = Gvar_7
	FarmerStart()
	goto l290
	::l282::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerHuffy")
	goto l290
	::l290::
	if true then return end
end
function FarmerEnd()
	var_0 = 0
	var_1 = 1
	var_2 = 2
	var_3 = 0
	var_0 = DialogGetResult(Gvar_130)
	var_4 = Gvar_70
	if var_4 == Gvar_4 then 
		goto l96
	end
	if var_4 == Gvar_5 then 
		goto l186
	end
	if var_4 == Gvar_6 then 
		goto l276
	end
	if var_4 == Gvar_7 then 
		goto l278
	end
	if var_4 == Gvar_8 then 
		goto l328
	end
	if var_4 == Gvar_9 then 
		goto l330
	end
	goto l332
	::l96::
	if not var_0 == var_1 then 
		goto l139
	end
	Gvar_70 = Gvar_6
	SetupDialog(Gvar_130,"NORMAL",16,17)
	PrintToAll("Con01a:NewJournalEntry")
	JournalAddEntry(GetHostPlayer(),"War05Quest8",2)
	goto l332
	goto l186
	::l139::
	if not var_0 == var_2 then 
		goto l170
	end
	SetupDialog(Gvar_130,"YESNO",16,17)
	Gvar_70 = Gvar_5
	goto l332
	goto l186
	::l170::
	if not Gvar_130 == var_3 then 
		goto l186
	end
	Gvar_70 = Gvar_4
	::l186::
	if not var_0 == var_1 then 
		goto l229
	end
	Gvar_70 = Gvar_6
	SetupDialog(Gvar_130,"NORMAL",16,17)
	PrintToAll("Con01a:NewJournalEntry")
	JournalAddEntry(GetHostPlayer(),"War05Quest8",2)
	goto l332
	goto l276
	::l229::
	if not var_0 == var_2 then 
		goto l260
	end
	SetupDialog(Gvar_130,"NORMAL",16,17)
	Gvar_70 = Gvar_9
	goto l332
	goto l276
	::l260::
	if not Gvar_130 == var_3 then 
		goto l276
	end
	Gvar_70 = Gvar_4
	::l276::
	goto l332
	::l278::
	PrintToAll("War05A.scr:ObjectiveComplete")
	JournalUpdateEntry(GetHostPlayer(),"War05Quest8",4)
	PlayerGiveExp(GetHostPlayer(),250)
	InvDropObj(Gvar_130,Gvar_125)
	InvDropObj(Gvar_130,Gvar_126)
	DeleteObject(Gvar_127)
	EndCurse()
	Gvar_70 = Gvar_8
	goto l332
	::l328::
	goto l332
	::l330::
	goto l332
	::l332::
	if true then return end
end
function HoundStart()
	MonsterIdle(Gvar_131)
	ObjLookAtObj(Gvar_131,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:HoundGreeting")
	if true then return end
end
function HoundEnd()
	MonsterSetWayFlag(Gvar_131,2)
	MonsterGoRoam(Gvar_131)
	if true then return end
end
function FarmerWifeStart()
	var_0 = Gvar_71
	if var_0 == Gvar_10 then 
		goto l27
	end
	if var_0 == Gvar_11 then 
		goto l42
	end
	goto l57
	::l27::
	ObjLookAtObj(Gvar_132,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerWifeGreeting")
	goto l57
	::l42::
	ObjLookAtObj(Gvar_132,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FarmerWifeIdle")
	goto l57
	::l57::
	if true then return end
end
function FarmerWifeEnd()
	var_0 = Gvar_71
	if var_0 == Gvar_10 then 
		goto l27
	end
	if var_0 == Gvar_11 then 
		goto l45
	end
	goto l47
	::l27::
	Gvar_71 = Gvar_11
	LetterBoxOff()
	ObjFreeze(GetHostPlayer(),false)
	goto l47
	::l45::
	goto l47
	::l47::
	if true then return end
end
function IngridStart()
	var_2 = Gvar_76
	if var_2 == Gvar_28 then 
		goto l45
	end
	if var_2 == Gvar_29 then 
		goto l53
	end
	if var_2 == Gvar_30 then 
		goto l132
	end
	if var_2 == Gvar_31 then 
		goto l140
	end
	goto l148
	::l45::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:IngridGreeting")
	goto l148
	::l53::
	if not Gvar_84 == 1 then 
		goto l124
	end
	var_0 = GetWaypointX(Gvar_204)
	var_1 = GetWaypointY(Gvar_204)
	AudioEvent("CurePoisonCast",Gvar_204)
	AudioEvent("CurePoisonEffect",Gvar_204)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	Gvar_76 = Gvar_30
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:IngridWaiting")
	goto l148
	goto l132
	::l124::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:IngridWaiting")
	goto l148
	::l132::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:IngridReturned")
	goto l148
	::l140::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:IngridIdle")
	goto l148
	::l148::
	if true then return end
end
function IngridEnd()
	var_0 = Gvar_76
	if var_0 == Gvar_28 then 
		goto l45
	end
	if var_0 == Gvar_29 then 
		goto l72
	end
	if var_0 == Gvar_30 then 
		goto l74
	end
	if var_0 == Gvar_31 then 
		goto l83
	end
	goto l85
	::l45::
	Gvar_76 = Gvar_29
	SetupDialog(Gvar_92,"NORMAL",22,23)
	ForceDialog(Gvar_93,GetHostPlayer())
	goto l85
	::l72::
	goto l85
	::l74::
	Gvar_76 = Gvar_31
	goto l85
	::l83::
	goto l85
	::l85::
	if true then return end
end
function CaptainStart()
	var_2 = Gvar_77
	if var_2 == Gvar_32 then 
		goto l27
	end
	if var_2 == Gvar_33 then 
		goto l35
	end
	goto l43
	::l27::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:CaptainGreeting")
	goto l43
	::l35::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:CaptainWaiting")
	goto l43
	::l43::
	if true then return end
end
function CaptainEnd()
	var_0 = Gvar_77
	if var_0 == Gvar_32 then 
		goto l27
	end
	if var_0 == Gvar_33 then 
		goto l48
	end
	goto l50
	::l27::
	Gvar_77 = Gvar_33
	StartScreen(5)
	Ingrid4()
	WaitFrames(1,79)
	goto l50
	::l48::
	goto l50
	::l50::
	if true then return end
end
function MaidenStart()
	var_2 = Gvar_75
	if var_2 == Gvar_24 then 
		goto l45
	end
	if var_2 == Gvar_25 then 
		goto l90
	end
	if var_2 == Gvar_26 then 
		goto l153
	end
	if var_2 == Gvar_27 then 
		goto l161
	end
	goto l169
	::l45::
	if not DoesHaveObject(GetHostPlayer(),Gvar_129) then 
		goto l82
	end
	Gvar_75 = Gvar_26
	SetupDialog(Gvar_128,"NORMAL",26,27)
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:MaidenReturned")
	goto l169
	goto l90
	::l82::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:MaidenGreeting")
	goto l169
	::l90::
	if not DoesHaveObject(GetHostPlayer(),Gvar_129) then 
		goto l145
	end
	var_0 = GetWaypointX(Gvar_209)
	var_1 = GetWaypointY(Gvar_209)
	Gvar_75 = Gvar_26
	SetupDialog(Gvar_128,"NORMAL",26,27)
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:MaidenReturned")
	goto l169
	goto l153
	::l145::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:MaidenWaiting")
	goto l169
	::l153::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:MaidenReturned")
	goto l169
	::l161::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:MaidenIdle")
	goto l169
	::l169::
	if true then return end
end
function MaidenEnd()
	var_0 = 0
	var_1 = 1
	var_2 = 2
	var_3 = 0
	var_0 = DialogGetResult(Gvar_128)
	var_4 = Gvar_75
	if var_4 == Gvar_24 then 
		goto l78
	end
	if var_4 == Gvar_25 then 
		goto l174
	end
	if var_4 == Gvar_26 then 
		goto l187
	end
	if var_4 == Gvar_27 then 
		goto l237
	end
	goto l250
	::l78::
	if not var_0 == 1 then 
		goto l118
	end
	Gvar_75 = Gvar_25
	SetupDialog(Gvar_128,"NORMAL",26,27)
	JournalAddEntry(GetHostPlayer(),"War05Quest7",2)
	PrintToAll("Con01a:NewJournalEntry")
	goto l250
	::l118::
	if not var_0 == 2 then 
		goto l146
	end
	Gvar_75 = Gvar_24
	SetupDialog(Gvar_128,"YESNO",26,27)
	goto l250
	::l146::
	if not var_0 == 0 then 
		goto l174
	end
	Gvar_75 = Gvar_24
	SetupDialog(Gvar_128,"YESNO",26,27)
	goto l250
	::l174::
	SetupDialog(Gvar_128,"NORMAL",26,27)
	goto l250
	::l187::
	Gvar_75 = Gvar_27
	PrintToAll("War05A.scr:ObjectiveComplete")
	PlayerGiveExp(GetHostPlayer(),250)
	JournalUpdateEntry(GetHostPlayer(),"War05Quest7",4)
	DeleteObject(Gvar_129)
	InvPutObj(GetHostPlayer(),Gvar_123)
	SetupDialog(Gvar_128,"NORMAL",26,27)
	goto l250
	::l237::
	SetupDialog(Gvar_128,"NORMAL",26,27)
	goto l250
	::l250::
	if true then return end
end
function BartenderStart()
	ObjFreeze(Gvar_95,true)
	ObjLookAtObj(Gvar_95,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_95)
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:BartenderGreeting")
	if true then return end
end
function BartenderEnd()
	ObjFreeze(Gvar_95,false)
	MonsterFaceObj(Gvar_95,8)
	if true then return end
end
function EndCurse()
	var_8 = GetWaypointX(Gvar_191)
	var_9 = GetWaypointY(Gvar_191)
	var_0 = GetWaypointX(Gvar_212)
	var_1 = GetWaypointY(Gvar_212)
	var_2 = GetWaypointX(Gvar_210)
	var_3 = GetWaypointY(Gvar_210)
	var_6 = GetWaypointX(Gvar_211)
	var_7 = GetWaypointY(Gvar_211)
	var_4 = GetObjX(Gvar_131)
	var_5 = GetObjY(Gvar_131)
	ObjFreeze(GetHostPlayer(),true)
	LetterBoxOn()
	AudioEvent("CurePoisonCast",Gvar_191)
	AudioEvent("CurePoisonEffect",Gvar_191)
	PlayFX("LIGHTNING",var_8,var_9,var_4,var_5)
	WaitFrames(10,31)
	if true then return end
end
function EndCurse2()
	var_8 = GetWaypointX(Gvar_191)
	var_9 = GetWaypointY(Gvar_191)
	var_0 = GetWaypointX(Gvar_212)
	var_1 = GetWaypointY(Gvar_212)
	var_2 = GetWaypointX(Gvar_210)
	var_3 = GetWaypointY(Gvar_210)
	var_6 = GetWaypointX(Gvar_211)
	var_7 = GetWaypointY(Gvar_211)
	var_4 = GetObjX(Gvar_131)
	var_5 = GetObjY(Gvar_131)
	PlayFX("LIGHTNING",var_8,var_9,var_4,var_5)
	WaitFrames(7,32)
	if true then return end
end
function EndCurse3()
	var_8 = GetWaypointX(Gvar_191)
	var_9 = GetWaypointY(Gvar_191)
	var_0 = GetWaypointX(Gvar_212)
	var_1 = GetWaypointY(Gvar_212)
	var_2 = GetWaypointX(Gvar_210)
	var_3 = GetWaypointY(Gvar_210)
	var_6 = GetWaypointX(Gvar_211)
	var_7 = GetWaypointY(Gvar_211)
	var_4 = GetObjX(Gvar_131)
	var_5 = GetObjY(Gvar_131)
	PlayFX("LIGHTNING",var_8,var_9,var_4,var_5)
	WaitFrames(3,33)
	if true then return end
end
function EndCurse4()
	var_8 = GetWaypointX(Gvar_191)
	var_9 = GetWaypointY(Gvar_191)
	var_0 = GetWaypointX(Gvar_212)
	var_1 = GetWaypointY(Gvar_212)
	var_2 = GetWaypointX(Gvar_210)
	var_3 = GetWaypointY(Gvar_210)
	var_6 = GetWaypointX(Gvar_211)
	var_7 = GetWaypointY(Gvar_211)
	var_4 = GetObjX(Gvar_131)
	var_5 = GetObjY(Gvar_131)
	PlayFX("BLUE_SPARKS",var_4,var_5,0,0)
	TeleportObj(Gvar_131,var_0,var_1)
	TeleportObj(Gvar_132,var_4,var_5)
	MonsterGuardArea(Gvar_132,var_2,var_3,var_6,var_7,0)
	MonsterGuardArea(Gvar_130,var_8,var_9,var_8,var_9,0)
	if true then return end
end
function EndCurse5()
	ObjLookAtObj(Gvar_132,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_132)
	ForceDialog(Gvar_132,GetHostPlayer())
	if true then return end
end
function FrogStart()
	var_0 = Gvar_73
	if var_0 == Gvar_20 then 
		goto l45
	end
	if var_0 == Gvar_21 then 
		goto l95
	end
	if var_0 == Gvar_22 then 
		goto l110
	end
	if var_0 == Gvar_23 then 
		goto l125
	end
	goto l140
	::l45::
	ObjLookAtObj(Gvar_134,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FrogGreeting")
	ObjFreeze(Gvar_134,false)
	DisableObject(Gvar_136)
	DisableObject(Gvar_137)
	DisableObject(Gvar_138)
	EnableObject(Gvar_134)
	MonsterFollowObj(Gvar_134,GetHostPlayer())
	goto l140
	::l95::
	ObjLookAtObj(Gvar_134,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FrogFollowing")
	goto l140
	::l110::
	ObjLookAtObj(Gvar_134,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FrogThanks")
	goto l140
	::l125::
	ObjLookAtObj(Gvar_134,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:FrogIdle")
	goto l140
	::l140::
	if true then return end
end
function FrogEnd()
	var_0 = Gvar_73
	if var_0 == Gvar_20 then 
		goto l45
	end
	if var_0 == Gvar_21 then 
		goto l54
	end
	if var_0 == Gvar_22 then 
		goto l56
	end
	if var_0 == Gvar_23 then 
		goto l65
	end
	goto l67
	::l45::
	Gvar_73 = Gvar_21
	goto l67
	::l54::
	goto l67
	::l56::
	Gvar_73 = Gvar_23
	goto l67
	::l65::
	goto l67
	::l67::
	if true then return end
end
function FrogGuard()
	Gvar_73 = Gvar_22
	ApplyEnchant(Gvar_134,"ENCHANT_INVULNERABLE",0)
	Gvar_86 = 1
	if true then return end
end
function Villager1Start()
	ObjFreeze(Gvar_179,true)
	MonsterIdle(Gvar_179)
	ObjLookAtObj(Gvar_179,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con05:Townsman9Talk01")
	if true then return end
end
function Villager1End()
	ObjFreeze(Gvar_179,false)
	MonsterSetWayFlag(Gvar_179,32)
	MonsterGoRoam(Gvar_179)
	if true then return end
end
function Villager2Start()
	ObjFreeze(Gvar_180,true)
	MonsterIdle(Gvar_180)
	ObjLookAtObj(Gvar_180,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con05:Townsman10Talk01")
	if true then return end
end
function Villager2End()
	ObjFreeze(Gvar_180,false)
	MonsterSetWayFlag(Gvar_180,32)
	MonsterGoRoam(Gvar_180)
	if true then return end
end
function Villager3Start()
	ObjFreeze(Gvar_181,true)
	MonsterIdle(Gvar_181)
	ObjLookAtObj(Gvar_181,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con05:Townsman11Talk01")
	if true then return end
end
function Villager3End()
	ObjFreeze(Gvar_181,false)
	MonsterSetWayFlag(Gvar_181,32)
	MonsterGoRoam(Gvar_181)
	if true then return end
end
function Villager4Start()
	ObjFreeze(Gvar_182,true)
	MonsterIdle(Gvar_182)
	ObjLookAtObj(Gvar_182,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","Con05:Townsman11Talk02")
	if true then return end
end
function Villager4End()
	ObjFreeze(Gvar_182,false)
	MonsterSetWayFlag(Gvar_182,32)
	MonsterGoRoam(Gvar_182)
	if true then return end
end
function Villager5Start()
	ObjFreeze(Gvar_183,true)
	MonsterIdle(Gvar_183)
	ObjLookAtObj(Gvar_183,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:VillagerGreeting")
	if true then return end
end
function Villager5End()
	ObjFreeze(Gvar_183,false)
	MonsterSetWayFlag(Gvar_183,32)
	MonsterGoRoam(Gvar_183)
	if true then return end
end
function SadVillagerStart()
	var_2 = Gvar_74
	if var_2 == Gvar_14 then 
		goto l63
	end
	if var_2 == Gvar_15 then 
		goto l83
	end
	if var_2 == Gvar_16 then 
		goto l173
	end
	if var_2 == Gvar_17 then 
		goto l181
	end
	if var_2 == Gvar_18 then 
		goto l189
	end
	if var_2 == Gvar_19 then 
		goto l197
	end
	goto l205
	::l63::
	MonsterIdle(Gvar_133)
	ObjLookAtObj(Gvar_133,GetHostPlayer())
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SadVillagerGreeting")
	goto l205
	::l83::
	MonsterIdle(Gvar_133)
	ObjLookAtObj(Gvar_133,GetHostPlayer())
	if not Gvar_86 == 1 then 
		goto l165
	end
	var_0 = GetWaypointX(Gvar_206)
	var_1 = GetWaypointY(Gvar_206)
	AudioEvent("CurePoisonCast",Gvar_206)
	AudioEvent("CurePoisonEffect",Gvar_206)
	Gvar_74 = Gvar_16
	SetupDialog(Gvar_133,"NEXT",48,49)
	MonsterFollowObj(Gvar_134,Gvar_133)
	SadVillagerStart()
	goto l173
	::l165::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SadVillagerWaiting")
	goto l205
	::l173::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SadVillagerReturned")
	goto l205
	::l181::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SadVillagerIdle")
	goto l205
	::l189::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SadVillagerDead")
	goto l205
	::l197::
	StartDialogWithCaller("SwordsmanHurt","War05A.scr:SadVillagerDeadIdle")
	goto l205
	::l205::
	if true then return end
end
function SadVillagerEnd()
	var_0 = 0
	var_1 = 1
	var_2 = 2
	var_3 = 0
	var_0 = DialogGetResult(Gvar_133)
	var_4 = Gvar_74
	if var_4 == Gvar_14 then 
		goto l96
	end
	if var_4 == Gvar_15 then 
		goto l192
	end
	if var_4 == Gvar_16 then 
		goto l205
	end
	if var_4 == Gvar_17 then 
		goto l263
	end
	if var_4 == Gvar_18 then 
		goto l276
	end
	if var_4 == Gvar_19 then 
		goto l323
	end
	goto l330
	::l96::
	if not var_0 = 1 then 
		goto l136
	end
	Gvar_74 = Gvar_15
	SetupDialog(Gvar_133,"NORMAL",48,49)
	JournalAddEntry(GetHostPlayer(),"War05Quest9",2)
	PrintToAll("Con01a:NewJournalEntry")
	goto l330
	::l136::
	if not var_0 = 2 then 
		goto l164
	end
	Gvar_74 = Gvar_14
	SetupDialog(Gvar_133,"YESNO",48,49)
	goto l330
	::l164::
	if not var_0 = 0 then 
		goto l192
	end
	Gvar_74 = Gvar_14
	SetupDialog(Gvar_133,"YESNO",48,49)
	goto l330
	::l192::
	SetupDialog(Gvar_133,"NORMAL",48,49)
	goto l330
	::l205::
	Gvar_74 = Gvar_17
	SetupDialog(Gvar_133,"NORMAL",48,49)
	PrintToAll("War05A.scr:ObjectiveComplete")
	JournalUpdateEntry(GetHostPlayer(),"War05Quest9",4)
	PlayerGiveExp(GetHostPlayer(),250)
	InvDropObj(Gvar_133,Gvar_124)
	WaitFrames(1,73)
	WaitFrames(1,63)
	goto l330
	::l263::
	SetupDialog(Gvar_133,"NORMAL",48,49)
	goto l330
	::l276::
	Gvar_74 = Gvar_19
	MoveTo(Gvar_133,Gvar_206)
	MonsterEventScript(Gvar_133,9,74)
	JournalRemoveEntry(GetHostPlayer(),"War05Quest9")
	PrintToAll("War05A.scr:ObjectiveFailed")
	SetupDialog(Gvar_133,"NORMAL",48,49)
	goto l330
	::l323::
	CancelDialog(Gvar_133)
	goto l330
	::l330::
	if true then return end
end
function OwnVillagers()
	WaitFrames(1,51)
	if true then return end
end
function OwnVillagers2()
	ObjSetMaster(GetHostPlayer(),Gvar_134)
	ObjSetMaster(GetHostPlayer(),Gvar_93)
	ObjSetMaster(GetHostPlayer(),Gvar_92)
	ObjFreeze(Gvar_179,true)
	ObjFreeze(Gvar_180,true)
	ObjFreeze(Gvar_181,true)
	ObjFreeze(Gvar_182,true)
	ObjFreeze(Gvar_183,true)
	ObjFreeze(Gvar_184,true)
	ObjFreeze(Gvar_185,true)
	ObjFreeze(Gvar_186,true)
	ObjFreeze(Gvar_187,true)
	ObjFreeze(Gvar_50,true)
	ObjFreeze(Gvar_51,true)
	ObjFreeze(Gvar_130,true)
	ObjFreeze(Gvar_48,true)
	ObjFreeze(Gvar_49,true)
	ObjFreeze(Gvar_54,true)
	ObjFreeze(Gvar_55,true)
	MonsterSetRetreatRatio(Gvar_47,0)
	MonsterSetRetreatRatio(Gvar_48,0)
	MonsterSetRetreatRatio(Gvar_49,0)
	MonsterSetRetreatRatio(Gvar_50,0)
	MonsterSetRetreatRatio(Gvar_51,0)
	if true then return end
end
function KillCorpses2()
	DamageObject(Gvar_148,0,300,5)
	DamageObject(Gvar_149,0,300,5)
	DamageObject(Gvar_150,0,300,5)
	DamageObject(Gvar_151,0,300,5)
	DamageObject(Gvar_152,0,300,5)
	DamageObject(Gvar_153,0,300,5)
	DamageObject(Gvar_154,0,300,5)
	DamageObject(Gvar_155,0,300,5)
	DamageObject(Gvar_156,0,300,5)
	DamageObject(Gvar_157,0,300,5)
	DamageObject(Gvar_158,0,300,5)
	DamageObject(Gvar_159,0,300,5)
	DamageObject(Gvar_160,0,300,5)
	DamageObject(Gvar_161,0,300,5)
	DamageObject(Gvar_162,0,300,5)
	DamageObject(Gvar_163,0,300,0)
	DamageObject(Gvar_164,0,300,0)
	DamageObject(Gvar_165,0,300,0)
	DamageObject(Gvar_143,0,300,0)
	DamageObject(Gvar_45,0,300,0)
	DamageObject(Gvar_46,0,300,0)
	DamageObject(Gvar_60,0,300,0)
	DamageObject(Gvar_61,0,300,0)
	DamageObject(Gvar_62,0,300,0)
	DamageObject(Gvar_63,0,300,0)
	DamageObject(Gvar_64,0,300,0)
	DamageObject(Gvar_65,0,300,0)
	if true then return end
end
function VillagePath()
	MonsterSetWayFlag(Gvar_179,32)
	MonsterSetWayFlag(Gvar_180,32)
	MonsterSetWayFlag(Gvar_181,32)
	MonsterSetWayFlag(Gvar_182,32)
	MonsterSetWayFlag(Gvar_183,32)
	MonsterGoRoam(Gvar_179)
	MonsterGoRoam(Gvar_180)
	MonsterGoRoam(Gvar_181)
	MonsterGoRoam(Gvar_182)
	MonsterGoRoam(Gvar_183)
	if true then return end
end
function PickUpObjects()
	if true then return end
end
function StartSwordsmanTrigger()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l17
	end
	DisableObject(Trigger)
	WaitFrames(1,56)
	::l17::
	if true then return end
end
function SwordsmanTrigger()
	MonsterSetAggressiveness(Gvar_144,0.83)
	MonsterSetAggressiveness(Gvar_56,0.83)
	MonsterSetAggressiveness(Gvar_47,0.83)
	MonsterGoFight(Gvar_47,Gvar_144)
	if true then return end
end
function SwordsmanTriggerB()
	Gvar_72 = Gvar_12
	SetupDialog(Gvar_144,"NORMAL",12,13)
	SetDialogPortrait(Gvar_144,"Warrior8Pic")
	WaitFrames(1,58)
	if true then return end
end
function SwordsmanTriggerC()
	var_0 = GetWaypointX(Gvar_189)
	var_1 = GetWaypointY(Gvar_189)
	var_2 = GetWaypointX(Gvar_190)
	var_3 = GetWaypointY(Gvar_190)
	MonsterGuardArea(Gvar_144,var_0,var_1,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),240)
	MonsterGuardArea(Gvar_56,var_2,var_3,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),240)
	if true then return end
end
function SwordsmanTriggerD()
	if true then return end
end
function ShopKeeperGuard()
	var_0 = GetWaypointX(Gvar_225)
	var_1 = GetWaypointY(Gvar_225)
	var_2 = GetWaypointX(Gvar_226)
	var_3 = GetWaypointY(Gvar_226)
	MonsterGuardArea(Gvar_96,var_0,var_1,var_2,var_3,0)
	WaitFrames(1,62)
	if true then return end
end
function BartenderGuard()
	var_0 = GetWaypointX(Gvar_227)
	var_1 = GetWaypointY(Gvar_227)
	var_2 = GetWaypointX(Gvar_228)
	var_3 = GetWaypointY(Gvar_228)
	MonsterGuardArea(Gvar_95,var_0,var_1,var_2,var_3,0)
	WaitFrames(1,63)
	if true then return end
end
function GypsyGuard()
	var_0 = GetWaypointX(Gvar_223)
	var_1 = GetWaypointY(Gvar_223)
	var_2 = GetWaypointX(Gvar_224)
	var_3 = GetWaypointY(Gvar_224)
	MonsterGuardArea(Gvar_94,var_0,var_1,var_2,var_3,0)
	WaitFrames(1,61)
	if true then return end
end
function SadVillagerGuard()
	var_0 = GetWaypointX(Gvar_206)
	var_1 = GetWaypointY(Gvar_206)
	var_2 = GetWaypointX(Gvar_207)
	var_3 = GetWaypointY(Gvar_207)
	MonsterGuardArea(Gvar_133,var_0,var_1,var_2,var_3,0)
	if true then return end
end
function OpenGates()
	OpenSecretWall(GetWallAt(88,34))
	OpenSecretWall(GetWallAt(87,35))
	OpenSecretWall(GetWallAt(88,36))
	OpenSecretWall(GetWallAt(89,35))
	PrintToAll("War05A.scr:CityGatesOpen")
	if true then return end
end
function CloseGates()
	CloseSecretWall(GetWallAt(88,34))
	CloseSecretWall(GetWallAt(87,35))
	CloseSecretWall(GetWallAt(88,36))
	CloseSecretWall(GetWallAt(89,35))
	PrintToAll("War05A.scr:CityGatesClosed")
	if true then return end
end
function PlayerDeath()
	DeathScreen(5)
	if true then return end
end
function MapEntry()
	PlayMusic(23,100)
	ObjFreeze(GetHostPlayer(),false)
	LetterBoxOff()
	if not JournalSetQuest("War05B:ChicksSaved") == 1 then 
		goto l34
	end
	DeleteObject(Gvar_93)
	DeleteObject(Gvar_92)
	::l34::
	Gvar_87 = true
	if true then return end
end
function NoBump()
	Gvar_87 = false
	WaitFrames(90,69)
	if true then return end
end
function YesBump()
	Gvar_87 = true
	if true then return end
end
function BumpVillager()
	if true then return end
end
function LetterBoxOn()
	CinematicBorders(true)
	if true then return end
end
function LetterBoxOff()
	CinematicBorders(false)
	if true then return end
end
function FrogThanksPlayer()
	ForceDialog(Gvar_134,GetHostPlayer())
	if true then return end
end
function DummyBump()
	if true then return end
end
function FreePlayer()
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function HorvathAppears()
	ObjFreeze(GetHostPlayer(),true)
	LetterBoxOn()
	WaitFrames(30,77)
	WaitFrames(1,53)
	if true then return end
end
function HorvathAppears2()
	MoveTo(Gvar_93,Gvar_213)
	WaitFrames(45,78)
	if true then return end
end
function HorvathAppears3()
	ObjFreeze(Gvar_93,true)
	MonsterIdle(Gvar_93)
	MonsterIdle(GetHostPlayer())
	ObjLookAtObj(Gvar_93,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_93)
	ForceDialog(Gvar_93,GetHostPlayer())
	if true then return end
end
function HorvathAppears4()
	var_0 = GetWaypointX(Gvar_215)
	var_1 = GetWaypointY(Gvar_215)
	var_2 = GetWaypointX(Gvar_213)
	var_3 = GetWaypointY(Gvar_213)
	ObjFreeze(Gvar_93,false)
	MonsterGuardArea(Gvar_93,var_0,var_1,var_2,var_3,0)
	LetterBoxOff()
	WaitFrames(45,80)
	if true then return end
end
function HorvathAppears5()
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function Ingrid1()
	DisableObject(Gvar_120)
	DisableObject(Gvar_121)
	DisableObject(Gvar_122)
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	LetterBoxOn()
	MoveTo(Gvar_92,Gvar_204)
	MoveTo(Gvar_93,Gvar_213)
	if true then return end
end
function Ingrid2()
	SayChat(Gvar_92,"War05A.scr:IngridScream")
	if true then return end
end
function Ingrid3()
	if not ObjIsCaller(Gvar_92) then 
		goto l71
	end
	DisableObject(Trigger)
	ObjFreeze(Gvar_92,true)
	MonsterIdle(Gvar_92)
	ObjLookAtObj(GetHostPlayer(),Gvar_92)
	ObjLookAtObj(Gvar_92,GetHostPlayer())
	ObjFreeze(Gvar_93,true)
	MonsterIdle(Gvar_93)
	ObjLookAtObj(Gvar_93,GetHostPlayer())
	CancelChat(Gvar_92)
	ForceDialog(Gvar_92,GetHostPlayer())
	::l71::
	if true then return end
end
function Ingrid4()
	ObjFreeze(Gvar_92,false)
	MoveTo(Gvar_92,Gvar_205)
	WaitFrames(30,85)
	if true then return end
end
function Ingrid5()
	JournalAddEntry(GetHostPlayer(),"War05Quest4",2)
	PrintToAll("Con01a:NewJournalEntry")
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function Ingrid6()
	MonsterGuardArea(Gvar_92,GetObjX(Gvar_92),GetObjY(Gvar_92),GetObjX(GetHostPlayer()),GetObjX(GetHostPlayer()),0)
	if true then return end
end
function MapInitialize()
	Gvar_34 = WaypointFromName("WoundedRefugeeWayPoint")
	Gvar_35 = WaypointFromName("WoundedRefugeeWayPoint2")
	Gvar_36 = WaypointFromName("DeadGuyWP")
	Gvar_39 = WaypointFromName("PlayerSounds")
	Gvar_37 = WaypointFromName("LunchOgre1WP")
	Gvar_38 = WaypointFromName("LunchOgre2WP")
	Gvar_40 = WaypointFromName("WellWP")
	Gvar_41 = WaypointFromName("SecretBearWP")
	Gvar_42 = ObjFromName("WoundedRefugee")
	Gvar_43 = ObjFromName("WoundedRefugee2")
	Gvar_44 = ObjFromName("Antidote")
	Gvar_45 = ObjFromName("Kill")
	Gvar_46 = ObjFromName("Kill2")
	Gvar_47 = ObjFromName("FirstOgre")
	Gvar_48 = ObjFromName("LunchOgre1")
	Gvar_49 = ObjFromName("LunchOgre2")
	Gvar_50 = ObjFromName("TownOgre1")
	Gvar_51 = ObjFromName("TownOgre2")
	Gvar_55 = ObjFromName("DeadGuy")
	Gvar_56 = ObjFromName("Swordsman2")
	Gvar_57 = ObjFromName("Archer1")
	Gvar_58 = ObjFromName("Archer2")
	Gvar_54 = ObjFromName("BruteBoss")
	Gvar_52 = ObjFromName("MoreOgre1")
	Gvar_53 = ObjFromName("MoreOgre2")
	Gvar_59 = ObjFromName("SecretBear")
	Gvar_60 = ObjFromName("Bubbles1")
	Gvar_61 = ObjFromName("Bubbles2")
	Gvar_62 = ObjFromName("Bubbles3")
	Gvar_63 = ObjFromName("Bubbles4")
	Gvar_64 = ObjFromName("Bubbles5")
	Gvar_65 = ObjFromName("Bubbles6")
	Gvar_66 = ObjFromName("TestFlame")
	Gvar_67 = ObjGroupFromName("OgreAttackTriggers")
	Gvar_93 = ObjFromName("W5Captain")
	Gvar_92 = ObjFromName("W5Ingrid")
	Gvar_95 = ObjFromName("W5Bartender")
	Gvar_96 = ObjFromName("W5ShopKeeper")
	Gvar_94 = ObjFromName("W5Gypsy")
	Gvar_120 = ObjFromName("CaptainTrigger1")
	Gvar_121 = ObjFromName("CaptainTrigger2")
	Gvar_122 = ObjFromName("CaptainTrigger3")
	Gvar_97 = ObjFromName("BartenderTrigger1")
	Gvar_98 = ObjFromName("BartenderTrigger2")
	Gvar_99 = ObjFromName("ShopKeeperTrigger1")
	Gvar_100 = ObjFromName("ShopKeeperTrigger2")
	Gvar_101 = ObjFromName("GypsyTrigger1")
	Gvar_102 = ObjFromName("GypsyTrigger2")
	Gvar_103 = ObjFromName("GypsyTrigger3")
	Gvar_104 = ObjFromName("GypsyTrigger4")
	Gvar_105 = ObjFromName("GypsyTrigger5")
	Gvar_106 = ObjFromName("GypsyTrigger6")
	Gvar_107 = ObjFromName("GypsyTrigger7")
	Gvar_108 = ObjFromName("GypsyTrigger8")
	Gvar_109 = ObjFromName("GypsyTrigger9")
	Gvar_110 = ObjFromName("GypsyEndTrigger1")
	Gvar_111 = ObjFromName("GypsyEndTrigger2")
	Gvar_112 = ObjFromName("GypsyEndTrigger3")
	Gvar_113 = ObjFromName("GypsyEndTrigger4")
	Gvar_114 = ObjFromName("GypsyEndTrigger5")
	Gvar_115 = ObjFromName("GypsyEndTrigger6")
	Gvar_116 = ObjFromName("GypsyEndTrigger7")
	Gvar_117 = ObjFromName("GypsyEndTrigger8")
	Gvar_118 = ObjFromName("GypsyEndTrigger9")
	Gvar_144 = ObjFromName("W5Swordsman")
	Gvar_145 = ObjFromName("W5Swordsman2")
	Gvar_146 = ObjFromName("SwordsmanTrigger1")
	Gvar_147 = ObjFromName("SwordsmanTrigger2")
	Gvar_143 = ObjFromName("KeyGuy")
	Gvar_140 = ObjFromName("W5Drunk1")
	Gvar_141 = ObjFromName("W5Drunk2")
	Gvar_142 = ObjFromName("W5Drunk3")
	Gvar_123 = ObjFromName("MaidenReward")
	Gvar_124 = ObjFromName("SadVillagerReward")
	Gvar_125 = ObjFromName("FarmerReward1")
	Gvar_126 = ObjFromName("FarmerReward2")
	Gvar_130 = ObjFromName("W5Farmer")
	Gvar_131 = ObjFromName("W5Hound")
	Gvar_132 = ObjFromName("W5FarmerWife")
	Gvar_133 = ObjFromName("W5SadVillager")
	Gvar_134 = ObjFromName("W5Frog")
	Gvar_135 = ObjFromName("FrogTrigger")
	Gvar_136 = ObjFromName("FrogTrigger1")
	Gvar_137 = ObjFromName("FrogTrigger2")
	Gvar_138 = ObjFromName("FrogTrigger3")
	Gvar_139 = ObjFromName("FrogTrigger4")
	Gvar_127 = ObjFromName("FarmerStaff")
	Gvar_88 = ObjFromName("AutoSave1Trigger")
	Gvar_89 = ObjFromName("AutoSave2Trigger")
	Gvar_90 = ObjFromName("AutoSave3Trigger")
	Gvar_91 = ObjFromName("AutoSave4Trigger")
	Gvar_148 = ObjFromName("Corpse1")
	Gvar_149 = ObjFromName("Corpse2")
	Gvar_150 = ObjFromName("Corpse3")
	Gvar_151 = ObjFromName("Corpse4")
	Gvar_152 = ObjFromName("Corpse5")
	Gvar_153 = ObjFromName("Corpse6")
	Gvar_154 = ObjFromName("Corpse7")
	Gvar_155 = ObjFromName("Corpse8")
	Gvar_156 = ObjFromName("Corpse9")
	Gvar_157 = ObjFromName("Corpse10")
	Gvar_158 = ObjFromName("Corpse11")
	Gvar_159 = ObjFromName("Corpse12")
	Gvar_160 = ObjFromName("Corpse13")
	Gvar_161 = ObjFromName("Corpse14")
	Gvar_162 = ObjFromName("Corpse15")
	Gvar_119 = ObjFromName("JackLine5Trigger")
	Gvar_163 = ObjFromName("OgreCorpse1")
	Gvar_164 = ObjFromName("OgreCorpse2")
	Gvar_165 = ObjFromName("OgreCorpse3")
	Gvar_128 = ObjFromName("W5Maiden")
	Gvar_129 = ObjFromName("MaidenObject")
	Gvar_123 = ObjFromName("MaidenReward")
	Gvar_166 = ObjFromName("Ogre1")
	Gvar_167 = ObjFromName("Ogre2")
	Gvar_168 = ObjFromName("Ogre3")
	Gvar_169 = ObjFromName("Ogre4")
	Gvar_170 = ObjFromName("Ogre5")
	Gvar_171 = ObjFromName("Ogre6")
	Gvar_172 = ObjFromName("Ogre7")
	Gvar_173 = ObjFromName("Ogre8")
	Gvar_174 = ObjFromName("Ogre9")
	Gvar_174 = ObjFromName("Ogre10")
	Gvar_174 = ObjFromName("Ogre11")
	Gvar_174 = ObjFromName("Ogre12")
	Gvar_174 = ObjFromName("Ogre13")
	Gvar_196 = ObjFromName("HouseDoor1")
	Gvar_197 = ObjFromName("HouseDoor1")
	Gvar_198 = ObjFromName("CryptDoor1")
	Gvar_199 = ObjFromName("CryptDoor2")
	Gvar_179 = ObjFromName("W5Villager1")
	Gvar_180 = ObjFromName("W5Villager2")
	Gvar_181 = ObjFromName("W5Villager3")
	Gvar_182 = ObjFromName("W5Villager4")
	Gvar_183 = ObjFromName("W5Villager5")
	Gvar_184 = ObjFromName("W5Villager6")
	Gvar_185 = ObjFromName("W5Villager7")
	Gvar_186 = ObjFromName("W5Villager8")
	Gvar_187 = ObjFromName("W5Villager9")
	Gvar_190 = WaypointFromName("Swordsman2WayPoint")
	Gvar_189 = WaypointFromName("SwordsmanWayPoint")
	Gvar_146 = WaypointFromName("SwordsmanTrigger1")
	Gvar_147 = WaypointFromName("SwordsmanTrigger2")
	Gvar_204 = WaypointFromName("IngridWayPoint")
	Gvar_205 = WaypointFromName("IngridWayPoint2")
	Gvar_213 = WaypointFromName("HorvathWayPoint")
	Gvar_214 = WaypointFromName("HorvathWayPoint2")
	Gvar_215 = WaypointFromName("HorvathAppears")
	Gvar_209 = WaypointFromName("MaidenWayPoint")
	Gvar_191 = WaypointFromName("FarmerWayPoint")
	Gvar_192 = WaypointFromName("Farmer2WayPoint")
	Gvar_210 = WaypointFromName("FarmerWifeWayPoint")
	Gvar_211 = WaypointFromName("FarmerWife2WayPoint")
	Gvar_193 = WaypointFromName("HoundWayPoint")
	Gvar_212 = WaypointFromName("Hound2WayPoint")
	Gvar_208 = WaypointFromName("WoundedVillagerWayPoint")
	Gvar_222 = WaypointFromName("MaidenRewardWayPoint")
	Gvar_206 = WaypointFromName("SadVillagerWayPoint")
	Gvar_207 = WaypointFromName("SadVillagerWayPoint2")
	Gvar_194 = WaypointFromName("FrogWayPoint1")
	Gvar_195 = WaypointFromName("FrogWayPoint2")
	Gvar_216 = WaypointFromName("Villager1Goal")
	Gvar_217 = WaypointFromName("Villager2Goal")
	Gvar_218 = WaypointFromName("Villager3Goal")
	Gvar_219 = WaypointFromName("Villager4Goal")
	Gvar_220 = WaypointFromName("Villager5Goal")
	Gvar_223 = WaypointFromName("GypsyWayPoint")
	Gvar_224 = WaypointFromName("GypsyWayPoint2")
	Gvar_225 = WaypointFromName("ShopKeeperWayPoint")
	Gvar_226 = WaypointFromName("ShopKeeperWayPoint2")
	Gvar_227 = WaypointFromName("BartenderWayPoint")
	Gvar_228 = WaypointFromName("BartenderWayPoint2")
	Gvar_221 = WaypointFromName("PlayerStartWayPoint")
	SetupDialog(Gvar_140,"NORMAL",14,15)
	SetDialogPortrait(Gvar_140,"Townsman3Pic")
	SetupDialog(Gvar_141,"NORMAL",14,15)
	SetDialogPortrait(Gvar_141,"Townsman2Pic")
	SetupDialog(Gvar_142,"NORMAL",14,15)
	SetDialogPortrait(Gvar_142,"Townsman1Pic")
	SetDialogPortrait(Gvar_130,"ThaviusPic")
	SetupDialog(Gvar_131,"NORMAL",18,19)
	SetDialogPortrait(Gvar_131,"WolfPic")
	SetupDialog(Gvar_133,"YESNO",48,49)
	SetDialogPortrait(Gvar_133,"Townsman3Pic")
	SetupDialog(Gvar_134,"NORMAL",35,36)
	SetDialogPortrait(Gvar_134,"FrogPic")
	SetupDialog(Gvar_92,"NEXT",22,23)
	SetDialogPortrait(Gvar_92,"IngridPic")
	SetupDialog(Gvar_93,"NORMAL",24,25)
	SetDialogPortrait(Gvar_93,"AirshipCaptainPic")
	SetupDialog(Gvar_132,"NORMAL",20,21)
	SetDialogPortrait(Gvar_132,"MaidenPic")
	SetupDialog(Gvar_128,"YESNO",26,27)
	SetDialogPortrait(Gvar_128,"MaidenPic")
	ObjFreeze(Gvar_134,true)
	DisableVillagers()
	KillCorpses()
	LockDoors()
	OwnVillagers()
	HoundEnd()
	ShopKeeperGuard()
	if true then return end
end
function KeepOut()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function FrogReturned()
	if not ObjIsCaller(Gvar_134) then 
		goto l74
	end
	var_0 = GetWaypointX(Gvar_194)
	var_1 = GetWaypointY(Gvar_194)
	var_2 = GetWaypointX(Gvar_195)
	var_3 = GetWaypointY(Gvar_195)
	DisableObject(Gvar_135)
	MonsterGuardArea(Gvar_134,var_0,var_1,var_2,var_3,0)
	Gvar_74 = Gvar_15
	::l74::
	if true then return end
end
function FrogDeath()
	Gvar_86 = 2
	Gvar_74 = Gvar_18
	CancelDialog(Gvar_134)
	if true then return end
end
function AutoSave1()
	ForceAutosave()
	DisableObject(Gvar_88)
	if true then return end
end
function AutoSave2()
	ForceAutosave()
	DisableObject(Gvar_89)
	if true then return end
end
function AutoSave3()
	ForceAutosave()
	WaitFrames(1,53)
	DisableObject(Gvar_90)
	if true then return end
end
function AutoSave4()
	ForceAutosave()
	DisableObject(Gvar_91)
	if true then return end
end
function SecretFound()
	PrintToAll("War05A.scr:Secret")
	TeleportWaypoint(Gvar_39,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_39)
	PlayerGiveExp(GetHostPlayer(),250)
	if true then return end
end
function Hint()
	PrintToAll("Journal:War05Hint1")
	JournalAddEntry(GetHostPlayer(),"War05Hint1",4)
	if true then return end
end
function CrapFile()
	if true then return end
end
function OgreAttackStart()
	DisableObjectGroup(Gvar_67)
	UnfreezeAll()
	PlayMusic(26,100)
	EnableObject(Gvar_52)
	EnableObject(Gvar_53)
	ObjFreeze(Gvar_48,false)
	ObjFreeze(Gvar_49,false)
	ObjFreeze(Gvar_55,false)
	MonsterGoFight(Gvar_55,Gvar_48)
	MonsterGoFight(Gvar_48,Gvar_55)
	MonsterGoFight(Gvar_49,Gvar_55)
	if true then return end
end
function DeadGuyArrive()
	if not ObjIsCaller(Gvar_55) then 
		goto l81
	end
	DisableObject(Trigger)
	ObjFreeze(Gvar_55,true)
	ObjFreeze(Gvar_48,true)
	ObjFreeze(Gvar_49,true)
	MonsterIdle(Gvar_55)
	MonsterIdle(Gvar_48)
	MonsterIdle(Gvar_49)
	ObjLookAtObj(Gvar_48,Gvar_55)
	ObjLookAtObj(Gvar_55,Gvar_49)
	ObjLookAtObj(Gvar_49,Gvar_55)
	WaitSeconds(2,100)
	::l81::
	if true then return end
end
function OgresAttackDeadGuy()
	ObjFreeze(Gvar_55,false)
	ObjFreeze(Gvar_48,false)
	ObjFreeze(Gvar_49,false)
	ObjFreeze(Gvar_54,false)
	MonsterGoFight(Gvar_55,Gvar_49)
	MonsterGoFight(Gvar_48,Gvar_55)
	MonsterGoFight(Gvar_49,Gvar_55)
	if true then return end
end
function DeadGuyDie()
	MonsterSetAggressiveness(Gvar_48,0.83)
	MonsterSetAggressiveness(Gvar_49,0.83)
	if true then return end
end
function LunchOgreReport()
	if not GetObjHealth(Gvar_55) > 0 then 
		goto l18
	end
	MonsterGoFight(Trigger,Gvar_55)
	::l18::
	if true then return end
end
function LunchOgre1Trigger()
	if not ObjIsCaller(Gvar_48) then 
		goto l25
	end
	DisableObject(Trigger)
	Gvar_229 = Gvar_229 + 1
	MonsterSetAggressiveness(Gvar_48,0.83)
	::l25::
	if true then return end
end
function LunchOgre2Trigger()
	if not ObjIsCaller(Gvar_49) then 
		goto l25
	end
	DisableObject(Trigger)
	Gvar_229 = Gvar_229 + 1
	MonsterSetAggressiveness(Gvar_49,0.83)
	::l25::
	if true then return end
end
function UnfreezeAll()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_179,false)
	ObjFreeze(Gvar_180,false)
	ObjFreeze(Gvar_181,false)
	ObjFreeze(Gvar_182,false)
	ObjFreeze(Gvar_183,false)
	ObjFreeze(Gvar_184,false)
	ObjFreeze(Gvar_185,false)
	ObjFreeze(Gvar_186,false)
	ObjFreeze(Gvar_187,false)
	ObjFreeze(Gvar_50,false)
	ObjFreeze(Gvar_51,false)
	ObjFreeze(Gvar_130,false)
	ObjFreeze(Gvar_54,false)
	MonsterGoRoam(Gvar_130)
	MonsterFollowObj(Gvar_51,Gvar_130)
	if true then return end
end
function GoAway()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l24
	end
	if not GetObjHealth(Caller) > 0 then 
		goto l24
	end
	MonsterGotoHome(Caller)
	::l24::
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",Gvar_40)
	if true then return end
end
function KillWoundedRefugee2()
	DamageObject(Gvar_42,0,15,5)
	if true then return end
end
function WoundedRefugeeStart()
	var_2 = Gvar_234
	if var_2 == Gvar_230 then 
		goto l45
	end
	if var_2 == Gvar_231 then 
		goto l53
	end
	if var_2 == Gvar_232 then 
		goto l136
	end
	if var_2 == Gvar_233 then 
		goto l151
	end
	goto l159
	::l45::
	StartDialogWithCaller("SwordsmanHurt","War05A:WoundedRefugeeGreeting")
	goto l159
	::l53::
	if not DoesHaveObject(GetHostPlayer(),Gvar_44) then 
		goto l128
	end
	var_0 = GetWaypointX(Gvar_34)
	var_1 = GetWaypointY(Gvar_34)
	AudioEvent("CurePoisonCast",Gvar_34)
	AudioEvent("CurePoisonEffect",Gvar_34)
	DeleteObject(Gvar_42)
	Gvar_42 = Gvar_43
	TeleportObj(Gvar_42,var_0,var_1)
	Gvar_234 = Gvar_232
	WoundedRefugeeStart()
	goto l136
	::l128::
	StartDialogWithCaller("SwordsmanHurt","War05A:WoundedRefugeeWaiting")
	goto l159
	::l136::
	StartDialogWithCaller("SwordsmanHurt","War05A:WoundedRefugeeHealed")
	Gvar_234 = Gvar_232
	goto l159
	::l151::
	StartDialogWithCaller("SwordsmanHurt","War05A:WoundedRefugeeIdle")
	goto l159
	::l159::
	if true then return end
end
function WoundedRefugeeEnd()
	var_0 = Gvar_234
	if var_0 == Gvar_230 then 
		goto l45
	end
	if var_0 == Gvar_231 then 
		goto l54
	end
	if var_0 == Gvar_232 then 
		goto l56
	end
	if var_0 == Gvar_233 then 
		goto l73
	end
	goto l75
	::l45::
	Gvar_234 = Gvar_231
	goto l75
	::l54::
	goto l75
	::l56::
	Gvar_234 = Gvar_233
	MoveTo(Gvar_42,Gvar_35)
	goto l75
	::l73::
	goto l75
	::l75::
	if true then return end
end
function KillWoundedRefugee()
	WaitFrames(30,108)
	if true then return end
end