
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_4 = true
	Gvar_5 = false
	Gvar_6 = false
	Gvar_23 = 0
	Gvar_24 = 0
	Gvar_35 = 0
	Gvar_36 = true
	Gvar_82 = false
	Gvar_8 = false
	Gvar_83 = true
	Gvar_84 = true
	Gvar_85 = false
	Gvar_86 = false
	Gvar_87 = false
	Gvar_26 = false
	Gvar_89 = 1
	Gvar_90 = 1
	Gvar_37 = false
	Gvar_7 = false
	Gvar_88 = false
	Gvar_38 = false
	Gvar_27 = false
	Gvar_93 = true
	Gvar_25 = 1
	Gvar_126 = 0
	Gvar_127 = 1
	Gvar_128 = 2
	Gvar_129 = 3
	Gvar_130 = 4
	Gvar_131 = 5
	Gvar_132 = 6
	Gvar_133 = Gvar_126
	Gvar_134 = 0
	Gvar_135 = false
	if true then return end
end
function GHStart6()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk06")
	if true then return end
end
function GHEnd6()
	SetupDialog(Gvar_16,"NORMAL",2,3)
	if true then return end
end
function GHStart7()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk07")
	if true then return end
end
function GHEnd7()
	JournalUpdateEntry(GetHostPlayer(),"ReturnToGearhart",4)
	PrintToAll("GeneralPrint:GainedItem")
	PlayerGiveExp(GetHostPlayer(),500)
	InvPutObj(GetHostPlayer(),Gvar_52)
	CancelDialog(Gvar_16)
	Gvar_25 = 0
	SetupDialog(Gvar_17,"NORMAL",75,76)
	if true then return end
end
function StartFleePiece()
	DisableObjectGroup(Gvar_20)
	SetupDialog(Gvar_16,"NORMAL",2,3)
	Gvar_25 = 3
	Gvar_7 = true
	EnableObjectGroup(Gvar_18)
	EnableObjectGroup(Gvar_19)
	WaitFrames(1,7)
	if true then return end
end
function StartBatAttack()
	MonsterGoRoam(Gvar_14)
	MonsterGoRoam(Gvar_15)
	MonsterGoFight(Gvar_10,Gvar_14)
	MonsterGoFight(Gvar_11,Gvar_14)
	MonsterGoFight(Gvar_12,Gvar_15)
	MonsterGoFight(Gvar_13,Gvar_15)
	WaitSeconds(2,23)
	if true then return end
end
function BatGroup1Die()
	Gvar_23 = Gvar_23 + 1
	var_0 = Gvar_23
	if var_0 == 1 then 
		goto l31
	end
	if var_0 == 2 then 
		goto l47
	end
	goto l55
	::l31::
	MonsterSetAggressiveness(Gvar_11,0.83)
	MonsterGoFight(Gvar_11,GetHostPlayer())
	goto l55
	::l47::
	WaitFrames(1,12)
	goto l55
	::l55::
	if true then return end
end
function BatGroup2Die()
	Gvar_24 = Gvar_24 + 1
	var_0 = Gvar_24
	if var_0 == 1 then 
		goto l31
	end
	if var_0 == 2 then 
		goto l47
	end
	goto l55
	::l31::
	MonsterSetAggressiveness(Gvar_13,0.83)
	MonsterGoFight(Gvar_13,GetHostPlayer())
	goto l55
	::l47::
	WaitFrames(1,13)
	goto l55
	::l55::
	if true then return end
end
function batToOrchard()
	if not ObjIsHostileTo(GetHostPlayer(),Caller) then 
		goto l26
	end
	MonsterGotoHome(Caller)
	Gvar_9 = ScriptCaller()
	WaitFrames(90,26)
	::l26::
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l44
	end
	if not Gvar_8 then 
		goto l44
	end
	MonsterFollowObj(Gvar_17,GetHostPlayer())
	::l44::
	if true then return end
end
function stopEscorting()
	if not ObjIsCaller(Gvar_17) then 
		goto l33
	end
	Gvar_8 = true
	MonsterGuardArea(Gvar_17,1291,4108,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l33::
	if true then return end
end
function IdleMaiden1()
	MonsterIdle(Gvar_14)
	Gvar_5 = true
	SetupDialog(Gvar_14,"NORMAL",16,17)
	MonsterGuardArea(Gvar_14,GetObjX(Gvar_14),GetObjY(Gvar_14),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	if true then return end
end
function IdleMaiden2()
	MonsterIdle(Gvar_15)
	Gvar_6 = true
	SetupDialog(Gvar_15,"NORMAL",18,19)
	MonsterGuardArea(Gvar_15,GetObjX(Gvar_15),GetObjY(Gvar_15),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	if true then return end
end
function Maiden1See()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l43
	end
	if not Gvar_4 == true then 
		goto l43
	end
	if not Gvar_23 < 2 then 
		goto l43
	end
	SayChat(Gvar_14,"War01A.scr:Maiden1Talk03")
	Gvar_4 = false
	WaitSeconds(3,20)
	::l43::
	if true then return end
end
function Maiden2See()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l43
	end
	if not Gvar_4 == true then 
		goto l43
	end
	if not Gvar_24 < 2 then 
		goto l43
	end
	SayChat(Gvar_15,"War01A.scr:Maiden2Talk02")
	Gvar_4 = false
	WaitSeconds(3,20)
	::l43::
	if true then return end
end
function Maiden1Start()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Maiden1Talk04")
	if true then return end
end
function Maiden1End()
	SetupDialog(Gvar_14,"NORMAL",16,17)
	if true then return end
end
function Maiden2Start()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Maiden2Talk03")
	if true then return end
end
function Maiden2End()
	SetupDialog(Gvar_15,"NORMAL",18,19)
	if true then return end
end
function ResetMaiden()
	Gvar_4 = true
	if true then return end
end
function Maiden1Contact()
	if not Gvar_5 then 
		goto l38
	end
	if not ObjIsHostileTo(Gvar_14,Caller) then 
		goto l38
	end
	MonsterGoRoam(Gvar_14)
	Gvar_5 = false
	CancelDialog(Gvar_14)
	WaitFrames(90,12)
	::l38::
	if true then return end
end
function Maiden2Contact()
	if not Gvar_6 then 
		goto l38
	end
	if not ObjIsHostileTo(Gvar_15,Caller) then 
		goto l38
	end
	MonsterGoRoam(Gvar_15)
	Gvar_6 = false
	CancelDialog(Gvar_15)
	WaitFrames(90,13)
	::l38::
	if true then return end
end
function BatGroup1Peel()
	MonsterGoFight(Gvar_10,GetHostPlayer())
	WaitSeconds(2,24)
	if true then return end
end
function BatGroup2Peel()
	MonsterGoFight(Gvar_12,GetHostPlayer())
	if true then return end
end
function CaveEntranceCheck()
	MonsterSetAggressiveness(Caller,0.16)
	MonsterGotoHome(Caller)
	if true then return end
end
function BatReport()
	MonsterSetAggressiveness(Gvar_9,0.83)
	if true then return end
end
function UrchinDead()
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FlagCapture",Gvar_22)
	JournalUpdateEntry(GetHostPlayer(),"OrchardQuest",4)
	JournalAddEntry(GetHostPlayer(),"ReturnToGearhart",2)
	PrintToAll("Con01a:NewJournalEntry")
	SetupDialog(Gvar_16,"NORMAL",4,5)
	Gvar_25 = 4
	DisableObjectGroup(Gvar_21)
	PlayMusic(16,100)
	if true then return end
end
function ShortDelay()
	DisableObject(Gvar_32)
	TeleportObj(Gvar_17,2288,2840)
	JournalSetObjective(1,"PlayerInSewers")
	Gvar_27 = true
	WaitFrames(20,29)
	if true then return end
end
function ElevatorExplode()
	var_0 = Gvar_35
	if var_0 == 3 then 
		goto l17
	end
	goto l45
	::l17::
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("MechGolemDie",Gvar_22)
	WaitFrames(30,30)
	goto l207
	::l45::
	if not Gvar_35 == 0 then 
		goto l65
	end
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	::l65::
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("HammerMissing",Gvar_22)
	AudioEvent("WallDestroyed",Gvar_22)
	PlayFX("JIGGLE",GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),10,0)
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_28),GetObjY(Gvar_28),0,0)
	PlayFX("SMOKE_BLAST",GetObjX(Gvar_29),GetObjY(Gvar_29),0,0)
	DisableObject(Gvar_28)
	DisableObject(Gvar_29)
	DisableObject(Gvar_32)
	Gvar_35 = Gvar_35 + 1
	if not Gvar_35 == 1 then 
		goto l182
	end
	TeleportObj(Gvar_30,4507,4426)
	::l182::
	if not Gvar_35 == 2 then 
		goto l199
	end
	TeleportObj(Gvar_31,4507,4426)
	::l199::
	WaitFrames(10,29)
	goto l207
	::l207::
	if true then return end
end
function QMTalkStart()
	SetupDialog(Gvar_17,"NORMAL",31,32)
	ForceDialog(Gvar_17,GetHostPlayer())
	if true then return end
end
function QMBlastStart()
	StartDialogWithCaller("HumanMaleEatFood","War02:QuarterMaster11")
	if true then return end
end
function QMBlastEnd()
	CancelDialog(Gvar_17)
	ObjFreeze(GetHostPlayer(),false)
	WaitFrames(2,33)
	if true then return end
end
function BackToNormal()
	CinematicBorders(false)
	if true then return end
end
function TurnOffLights()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	ToggleObjectGroup(Gvar_75)
	ToggleObjectGroup(Gvar_76)
	ToggleObjectGroup(Gvar_77)
	ToggleObjectGroup(Gvar_78)
	ToggleObject(Gvar_53)
	ToggleObject(Gvar_54)
	ToggleObject(Gvar_55)
	if not Gvar_84 == true then 
		goto l159
	end
	Gvar_84 = false
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("Gear2",Gvar_22)
	SetupDialog(Gvar_41,"NORMAL",39,40)
	SetupDialog(Gvar_42,"NORMAL",43,44)
	SetupDialog(Gvar_44,"NORMAL",47,48)
	SetupDialog(Gvar_16,"NORMAL",98,99)
	SetupDialog(Gvar_45,"NORMAL",53,54)
	if not JournalSetQuest("EnteredGauntlet") ~= 1 then 
		goto l157
	end
	if not ObjCanInteractWith(Gvar_16,GetHostPlayer()) then 
		goto l157
	end
	WaitFrames(2,87)
	::l157::
	goto l230
	::l159::
	Gvar_84 = true
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("Gear3",Gvar_22)
	SetupDialog(Gvar_41,"NORMAL",37,38)
	SetupDialog(Gvar_42,"NORMAL",41,42)
	SetupDialog(Gvar_44,"NORMAL",45,46)
	SetupDialog(Gvar_45,"NORMAL",51,52)
	::l230::
	if true then return end
end
function TurnOnLights()
	EnableObjectGroup(Gvar_75)
	EnableObjectGroup(Gvar_76)
	EnableObjectGroup(Gvar_77)
	EnableObject(Gvar_53)
	EnableObject(Gvar_54)
	EnableObject(Gvar_55)
	SetupDialog(Gvar_41,"NORMAL",37,38)
	SetupDialog(Gvar_42,"NORMAL",41,42)
	SetupDialog(Gvar_44,"NORMAL",45,46)
	SetupDialog(Gvar_45,"NORMAL",51,52)
	if true then return end
end
function MoveToFacade()
	TeleportObj(GetHostPlayer(),3473,1234)
	ObjFreeze(Gvar_16,false)
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(Gvar_16,2215,3389)
	MonsterGuardArea(Gvar_16,2215,3389,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	CinematicFadeout()
	SetupDialog(Gvar_50,"NORMAL",104,105)
	StartScreen(3)
	if true then return end
end
function DanStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_41,true)
	MonsterIdle(Gvar_41)
	ObjLookAtObj(Gvar_41,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman2Talk01")
	if true then return end
end
function DanEnd1()
	ObjFreeze(Gvar_41,false)
	MonsterGoRoam(Gvar_41)
	SetupDialog(Gvar_41,"NORMAL",37,38)
	if true then return end
end
function DanStart2()
	RemoveAllChat()
	ObjFreeze(Gvar_41,true)
	MonsterIdle(Gvar_41)
	ObjLookAtObj(Gvar_41,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman2Talk02")
	if true then return end
end
function DanEnd2()
	ObjFreeze(Gvar_41,false)
	MonsterGoRoam(Gvar_41)
	SetupDialog(Gvar_41,"NORMAL",39,40)
	if true then return end
end
function JesseStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_42,true)
	MonsterIdle(Gvar_42)
	ObjLookAtObj(Gvar_42,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman1Talk01")
	if true then return end
end
function JesseEnd1()
	ObjFreeze(Gvar_42,false)
	MonsterGoRoam(Gvar_42)
	SetupDialog(Gvar_42,"NORMAL",41,42)
	if true then return end
end
function JesseStart2()
	RemoveAllChat()
	ObjFreeze(Gvar_42,true)
	MonsterIdle(Gvar_42)
	ObjLookAtObj(Gvar_42,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman1Talk02")
	if true then return end
end
function JesseEnd2()
	ObjFreeze(Gvar_42,false)
	MonsterGoRoam(Gvar_42)
	SetupDialog(Gvar_42,"NORMAL",43,44)
	if true then return end
end
function EricStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_44,true)
	MonsterIdle(Gvar_44)
	ObjLookAtObj(Gvar_44,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman3Talk01")
	if true then return end
end
function EricEnd1()
	ObjFreeze(Gvar_44,false)
	MonsterGoRoam(Gvar_44)
	SetupDialog(Gvar_44,"NORMAL",45,46)
	if true then return end
end
function EricStart2()
	RemoveAllChat()
	ObjFreeze(Gvar_44,true)
	MonsterIdle(Gvar_44)
	ObjLookAtObj(Gvar_44,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman3Talk02")
	if true then return end
end
function EricEnd2()
	ObjFreeze(Gvar_44,false)
	MonsterGoRoam(Gvar_44)
	SetupDialog(Gvar_44,"NORMAL",47,48)
	if true then return end
end
function TylerStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_46,true)
	MonsterIdle(Gvar_46)
	ObjLookAtObj(Gvar_46,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman4Talk01")
	if true then return end
end
function TylerEnd1()
	ObjFreeze(Gvar_46,false)
	ObjLookAtObj(Gvar_46,Gvar_43)
	MonsterGuardArea(Gvar_46,GetObjX(Gvar_46),GetObjY(Gvar_46),GetObjX(Gvar_43),GetObjY(Gvar_43),0)
	SetupDialog(Gvar_46,"NORMAL",49,50)
	if true then return end
end
function JacobStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_45,true)
	MonsterIdle(Gvar_45)
	ObjLookAtObj(Gvar_45,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman5Talk01")
	if true then return end
end
function JacobEnd1()
	ObjFreeze(Gvar_45,false)
	MonsterGoRoam(Gvar_45)
	SetupDialog(Gvar_45,"NORMAL",51,52)
	if true then return end
end
function JacobStart2()
	RemoveAllChat()
	ObjFreeze(Gvar_45,true)
	MonsterIdle(Gvar_45)
	ObjLookAtObj(Gvar_45,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Townsman5Talk02")
	if true then return end
end
function JacobEnd2()
	ObjFreeze(Gvar_45,false)
	MonsterGoRoam(Gvar_45)
	SetupDialog(Gvar_45,"NORMAL",53,54)
	if true then return end
end
function BingStart1()
	RemoveAllChat()
	var_0 = RandomInteger(1,6)
	var_1 = var_0
	if var_1 == 1 then 
		goto l69
	end
	if var_1 == 2 then 
		goto l77
	end
	if var_1 == 3 then 
		goto l85
	end
	if var_1 == 4 then 
		goto l93
	end
	if var_1 == 5 then 
		goto l101
	end
	if var_1 == 6 then 
		goto l109
	end
	goto l117
	::l69::
	StartDialogWithCaller("HumanMaleEatFood","War02A:BartenderTalk1aStart")
	goto l117
	::l77::
	StartDialogWithCaller("HumanMaleEatFood","War02A:BartenderTalk1bStart")
	goto l117
	::l85::
	StartDialogWithCaller("HumanMaleEatFood","War02A:BartenderTalk1cStart")
	goto l117
	::l93::
	StartDialogWithCaller("HumanMaleEatFood","War02:BartenderTalk1dStart")
	goto l117
	::l101::
	StartDialogWithCaller("HumanMaleEatFood","War02A:BartenderTalk1eStart")
	goto l117
	::l109::
	StartDialogWithCaller("HumanMaleEatFood","War02A:BartenderTalk1fStart")
	goto l117
	::l117::
	if true then return end
end
function BingEnd1()
	SetupDialog(Gvar_43,"NORMAL",55,56)
	if true then return end
end
function BingStart2()
	StartDialogWithCaller("HumanMaleEatFood","War02B.scr:BarTalk1")
	if true then return end
end
function BingEnd2()
	SetupDialog(Gvar_43,"NORMAL",57,58)
	if true then return end
end
function LydiaStart1()
	RemoveAllChat()
	ObjLookAtObj(Gvar_49,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:LydiaTalk02")
	if true then return end
end
function LydiaEnd1()
	SetupDialog(Gvar_49,"NORMAL",59,60)
	if true then return end
end
function LydiaStart2()
	RemoveAllChat()
	ObjLookAtObj(Gvar_49,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:LydiaTalk01")
	if true then return end
end
function LydiaEnd2()
	SetupDialog(Gvar_49,"NORMAL",63,64)
	if true then return end
end
function LydiaStart3()
	var_0 = RandomInteger(1,2)
	var_1 = var_0
	if var_1 == 1 then 
		goto l35
	end
	if var_1 == 2 then 
		goto l43
	end
	goto l51
	::l35::
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:LydiaTalk01")
	goto l51
	::l43::
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:LydiaTalk03")
	goto l51
	::l51::
	if true then return end
end
function LydiaEnd3()
	SetupDialog(Gvar_49,"NORMAL",63,64)
	if true then return end
end
function MelStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_47,true)
	MonsterIdle(Gvar_47)
	ObjLookAtObj(Gvar_47,GetHostPlayer())
	Gvar_90 = RandomInteger(1,2)
	var_0 = Gvar_90
	if var_0 == 1 then 
		goto l57
	end
	if var_0 == 2 then 
		goto l65
	end
	goto l73
	::l57::
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Maiden1Talk01")
	goto l73
	::l65::
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Maiden1Talk02")
	goto l73
	::l73::
	if true then return end
end
function MelEnd1()
	ObjFreeze(Gvar_47,false)
	ObjLookAtObj(Gvar_47,Gvar_43)
	MonsterGuardArea(Gvar_47,GetObjX(Gvar_47),GetObjY(Gvar_47),GetObjX(Gvar_43),GetObjY(Gvar_43),0)
	SetupDialog(Gvar_47,"NORMAL",65,66)
	if true then return end
end
function EvelynStart1()
	RemoveAllChat()
	ObjFreeze(Gvar_48,true)
	MonsterIdle(Gvar_48)
	ObjLookAtObj(Gvar_48,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Maiden2Talk01")
	if true then return end
end
function EvelynEnd1()
	ObjFreeze(Gvar_48,false)
	MonsterGoRoam(Gvar_48)
	SetupDialog(Gvar_48,"NORMAL",67,68)
	if true then return end
end
function QMProd()
	var_0 = GetDistance(GetObjX(Gvar_17),GetObjY(Gvar_17),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	if not var_0 > 300 then 
		goto l60
	end
	if not Gvar_89 == 1 then 
		goto l60
	end
	MonsterFollowObj(Gvar_17,GetHostPlayer())
	Gvar_8 = true
	Gvar_89 = 2
	::l60::
	if not var_0 < 150 then 
		goto l113
	end
	if not Gvar_89 == 2 then 
		goto l113
	end
	if not HostPlayerIsTalking() == false and HostPlayerIsTrading() == false then 
		goto l113
	end
	if not ObjCanInteractWith(Gvar_17,GetHostPlayer()) then 
		goto l113
	end
	Gvar_89 = 1
	ForceDialog(Gvar_17,GetHostPlayer())
	::l113::
	if not Gvar_26 == false then 
		goto l128
	end
	WaitSeconds(3,69)
	::l128::
	if true then return end
end
function QMGearTrigger()
	if not ObjIsCaller(Gvar_17) then 
		goto l36
	end
	DisableObject(Trigger)
	MonsterGoRoam(Gvar_17)
	MonsterGuardArea(Gvar_17,2280,3101,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l36::
	if true then return end
end
function QMStart1()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:QuaterMasterTalk01")
	JournalUpdateEntry(GetHostPlayer(),"FirstQuest",4)
	if true then return end
end
function QMEnd1()
	if not Gvar_85 == false then 
		goto l43
	end
	TeleportObj(Gvar_16,1720,3432)
	MonsterFollowObj(Gvar_16,GetHostPlayer())
	Gvar_37 = true
	SetupDialog(Gvar_16,"YESNO",88,89)
	::l43::
	SetupDialog(Gvar_17,"NORMAL",73,74)
	if not Gvar_88 == true then 
		goto l71
	end
	JournalUpdateEntry(GetHostPlayer(),"FirstQuest",4)
	::l71::
	JournalAddEntry(GetHostPlayer(),"SponsorQuest",2)
	PrintToAll("Con01a:NewJournalEntry")
	if true then return end
end
function QMStart2()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:QuarterMasterTalk02")
	if true then return end
end
function QMEnd2()
	SetupDialog(Gvar_17,"NORMAL",73,74)
	if true then return end
end
function QMStart3()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:QuarterMasterTalk03")
	if true then return end
end
function QMEnd3()
	CancelDialog(Gvar_17)
	PlayerGiveExp(GetHostPlayer(),1000)
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FlagCapture",Gvar_22)
	CinematicFade()
	JournalSetObjective(1,"EnteredGauntlet")
	Gvar_38 = true
	WaitFrames(45,113)
	if true then return end
end
function QMStart4()
	StartDialogWithCaller("HumanMaleEatFood","War02a:QuarterMasterTalk03")
	if true then return end
end
function QMEnd4()
	JournalAddEntry(GetHostPlayer(),"SaveGearhart",2)
	PrintToAll("Con01a:NewJournalEntry")
	MonsterFollowObj(Gvar_17,GetHostPlayer())
	Gvar_8 = true
	SetupDialog(Gvar_17,"NORMAL",79,80)
	ForceDialog(Gvar_17,GetHostPlayer())
	if true then return end
end
function QMStart5()
	StartDialogWithCaller("HumanMaleEatFood","War02a:QuarterMasterTalk04")
	if true then return end
end
function QMEnd5()
	SetupDialog(Gvar_17,"NORMAL",81,82)
	if true then return end
end
function QMStart5a()
	StartDialogWithCaller("HumanMaleEatFood","War02a:QuarterMasterTalk05")
	if true then return end
end
function QMEnd5a()
	SetupDialog(Gvar_17,"NORMAL",81,82)
	if true then return end
end
function QMStart6()
	StartDialogWithCaller("HumanMaleEatFood","War02:QuarterMaster10")
	if true then return end
end
function QMEnd6()
	CancelDialog(Gvar_17)
	MonsterGuardArea(Gvar_17,2280,3101,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	if not Gvar_26 == false then 
		goto l42
	end
	MonsterGoto(Gvar_17,2276,3120)
	::l42::
	if true then return end
end
function QMStart7()
	SetupDialog(Gvar_39,"NORMAL",102,103)
	StartDialogWithCaller("HumanMaleEatFood","War02:QuarterMaster12")
	if true then return end
end
function QMEnd7()
	if not Gvar_40 then 
		goto l10
	end
	DeleteObject(Gvar_40)
	::l10::
	if not Gvar_73 then 
		goto l20
	end
	DeleteObject(Gvar_73)
	::l20::
	DisableObject(Gvar_58)
	EnableObject(Gvar_72)
	PlayerGiveExp(GetHostPlayer(),1500)
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("FlagCapture",Gvar_22)
	JournalUpdateEntry(GetHostPlayer(),"SaveGearhart",4)
	CancelDialog(Gvar_17)
	SetupDialog(Gvar_16,"NORMAL",100,101)
	ForceDialog(Gvar_16,GetHostPlayer())
	if true then return end
end
function TalkToGearhart()
	ForceDialog(Gvar_16,GetHostPlayer())
	if true then return end
end
function GHStart1()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk01")
	if true then return end
end
function GHEnd1()
	if not DialogGetResult(Gvar_16) == 1 then 
		goto l25
	end
	SetupDialog(Gvar_16,"NORMAL",90,91)
	GHStart2()
	goto l38
	::l25::
	SetupDialog(Gvar_16,"NORMAL",92,93)
	GHStart3()
	::l38::
	Gvar_85 = true
	if true then return end
end
function GHStart2()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk02")
	if true then return end
end
function GHEnd2()
	ObjFreeze(Gvar_16,false)
	Gvar_86 = true
	Gvar_25 = 2
	CancelDialog(Gvar_16)
	InvPutObj(GetHostPlayer(),Gvar_51)
	JournalUpdateEntry(GetHostPlayer(),"SponsorQuest",4)
	JournalAddEntry(GetHostPlayer(),"OrchardQuest",2)
	PrintToAll("GeneralPrint:GainedKey")
	PrintToAll("Con01a:NewJournalEntry")
	if not Gvar_87 == false then 
		goto l86
	end
	EnableObject(Gvar_71)
	Gvar_37 = false
	MoveTo(Gvar_16,Gvar_91)
	::l86::
	if true then return end
end
function GHStart3()
	ObjFreeze(Gvar_16,true)
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk03")
	if true then return end
end
function GHEnd3()
	ObjFreeze(Gvar_16,false)
	SetupDialog(Gvar_16,"YESNO",96,97)
	Gvar_25 = 1
	if not Gvar_87 == false then 
		goto l54
	end
	EnableObject(Gvar_71)
	Gvar_37 = false
	MoveTo(Gvar_16,Gvar_91)
	::l54::
	if true then return end
end
function GHStart4()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk05")
	if true then return end
end
function GHEnd4()
	SetupDialog(Gvar_16,"NORMAL",94,95)
	if true then return end
end
function GHStart5()
	ObjFreeze(Gvar_16,true)
	MonsterIdle(Gvar_16)
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GearhartTalk04")
	if true then return end
end
function GHEnd5()
	if not DialogGetResult(Gvar_16) == 1 then 
		goto l25
	end
	SetupDialog(Gvar_16,"NORMAL",90,91)
	GHStart2()
	goto l38
	::l25::
	SetupDialog(Gvar_16,"NORMAL",92,93)
	GHStart3()
	::l38::
	Gvar_85 = true
	if true then return end
end
function GHStart8()
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	SayChat(Gvar_16,"War01A.scr:GearhartTalk08")
	WaitFrames(60,99)
	if true then return end
end
function GHEnd8()
	var_0 = Gvar_25
	if var_0 == 0 then 
		goto l49
	end
	if var_0 == 1 then 
		goto l56
	end
	if var_0 == 2 then 
		goto l69
	end
	if var_0 == 3 then 
		goto l82
	end
	if var_0 == 4 then 
		goto l95
	end
	goto l108
	::l49::
	CancelDialog(Gvar_16)
	goto l108
	::l56::
	SetupDialog(Gvar_16,"YESNO",96,97)
	goto l108
	::l69::
	SetupDialog(Gvar_16,"NORMAL",94,95)
	goto l108
	::l82::
	SetupDialog(Gvar_16,"NORMAL",2,3)
	goto l108
	::l95::
	SetupDialog(Gvar_16,"NORMAL",4,5)
	goto l108
	::l108::
	if true then return end
end
function GHStart9()
	ObjLookAtObj(GetHostPlayer(),Gvar_16)
	StartDialogWithCaller("HumanMaleEatFood","War02a:GearhartTalk07")
	if true then return end
end
function GHEnd9()
	CancelDialog(Gvar_16)
	CinematicFade()
	ObjSetMaster(GetHostPlayer(),Gvar_50)
	WaitFrames(45,36)
	if true then return end
end
function KirikStart2()
	StartDialogWithCaller("HumanMaleEatFood","War03a:Guard1Talk02")
	if true then return end
end
function KirikEnd2()
	SetupDialog(Gvar_39,"NORMAL",102,103)
	if true then return end
end
function HorStart1()
	Gvar_36 = false
	ObjLookAtObj(Gvar_50,GetHostPlayer())
	StartDialogWithCaller("HumanMaleEatFood","War02B.scr:HorrendousTalk1Start")
	if true then return end
end
function HorEnd1()
	UnlockDoor(Gvar_56)
	UnlockDoor(Gvar_57)
	JournalAddEntry(GetHostPlayer(),"War03aIxQuest",2)
	PrintToAll("Con02a:ItemsAddedToInventory")
	InvPutObj(GetHostPlayer(),Gvar_62)
	InvPutObj(GetHostPlayer(),Gvar_63)
	InvPutObj(GetHostPlayer(),Gvar_64)
	InvPutObj(GetHostPlayer(),Gvar_70)
	SetupDialog(Gvar_50,"NORMAL",106,107)
	if true then return end
end
function HorStart2()
	StartDialogWithCaller("HumanMaleEatFood","War02A.scr:RealTalk2Start")
	if true then return end
end
function HorEnd2()
	SetupDialog(Gvar_50,"NORMAL",106,107)
	if true then return end
end
function HorTalkStart()
	if not Gvar_36 then 
		goto l19
	end
	Gvar_36 = false
	ForceDialog(Gvar_50,GetHostPlayer())
	::l19::
	if true then return end
end
function GHInRoom()
	if not ObjIsCaller(Gvar_16) then 
		goto l77
	end
	DisableObject(Trigger)
	Gvar_87 = true
	MonsterGuardArea(Gvar_16,GetObjX(Gvar_16),GetObjY(Gvar_16),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	if not Gvar_86 == true then 
		goto l66
	end
	SetupDialog(Gvar_16,"NORMAL",94,95)
	goto l77
	::l66::
	SetupDialog(Gvar_16,"YESNO",96,97)
	::l77::
	if true then return end
end
function PlayerInGearRoom()
	if not ObjCanInteractWith(Gvar_17,GetHostPlayer()) then 
		goto l32
	end
	DisableObjectGroup(Gvar_81)
	SetupDialog(Gvar_17,"NORMAL",83,84)
	ForceDialog(Gvar_17,GetHostPlayer())
	::l32::
	if true then return end
end
function PlayerExitSewers()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l215
	end
	DisableObject(Trigger)
	TeleportObj(Gvar_17,2392,3545)
	TeleportObj(Gvar_16,2457,3476)
	TeleportObj(Gvar_50,3395,1224)
	TeleportObj(Gvar_59,3348,1195)
	TeleportObj(Gvar_60,3371,1278)
	ObjLookAtObj(Gvar_16,GetHostPlayer())
	ObjLookAtObj(Gvar_17,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_17)
	ObjFreeze(GetHostPlayer(),true)
	MonsterGuardArea(Gvar_17,GetObjX(Gvar_17),GetObjY(Gvar_17),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_16,GetObjX(Gvar_16),GetObjY(Gvar_16),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_50,GetObjX(Gvar_50),GetObjY(Gvar_50),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_59,GetObjX(Gvar_59),GetObjY(Gvar_59),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	MonsterGuardArea(Gvar_60,GetObjX(Gvar_60),GetObjY(Gvar_60),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	WaitFrames(30,112)
	::l215::
	if true then return end
end
function Congrats()
	SetupDialog(Gvar_17,"NEXT",85,86)
	ForceDialog(Gvar_17,GetHostPlayer())
	if true then return end
end
function DropLetter()
	DeleteObject(Gvar_52)
	WaitFrames(1,114)
	if true then return end
end
function MovePlayer()
	TeleportObj(GetHostPlayer(),2586,5309)
	if true then return end
end
function SecretTrainingRoom()
	DisableObjectGroup(Gvar_79)
	secretSound()
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function SecretRoom()
	DisableObjectGroup(Gvar_80)
	PlayerGiveExp(GetHostPlayer(),100)
	secretSound()
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function GeneralSecret()
	PlayerGiveExp(GetHostPlayer(),100)
	secretSound()
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function secretSound()
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	AudioEvent("SecretFound",Gvar_22)
	if true then return end
end
function QMEndTrigger()
	if not ObjIsCaller(Gvar_17) then 
		goto l44
	end
	DisableObject(Trigger)
	Gvar_26 = true
	MonsterGuardArea(Gvar_17,GetObjX(Gvar_17),GetObjY(Gvar_17),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l44::
	if true then return end
end
function FKG1Start()
	StartDialogWithCaller("SwordsmanRecognize","War01A.scr:Guard2Talk1aStart")
	if true then return end
end
function FKG1End()
	SetupDialog(Gvar_117,"NORMAL",120,121)
	if true then return end
end
function SecretSurprise()
	EnableObject(Gvar_73)
	TeleportObj(Gvar_73,4416,1000)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	secretSound()
	if true then return end
end
function SecretSword()
	secretSound()
	PlayerGiveExp(GetHostPlayer(),150)
	PrintToAll("GeneralPrint:SecretFound")
	WaitFrames(15,124)
	if true then return end
end
function FlamesOut()
	DeleteObjectGroup(Gvar_122)
	AudioEvent("FireExtinguish",Gvar_124)
	if true then return end
end
function gauntletQuest()
	PlayMusic(1,100)
	JournalAddEntry(GetHostPlayer(),"FirstQuest",2)
	PrintToAll("Con01a:NewJournalEntry")
	if true then return end
end
function MakeAWish()
	var_0 = GetObjMaxHealth(Caller)
	ObjAddHealth(Caller,var_0 - GetObjHealth(Caller))
	TeleportWaypoint(Gvar_22,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	PrintToAll("GeneralPrint:WellSignRefresh")
	AudioEvent("RestoreHealth",Gvar_22)
	if true then return end
end
function CaveMusic()
	DisableObject(Gvar_113)
	EnableObjectGroup(Gvar_21)
	PlayMusic(19,100)
	if true then return end
end
function TownMusic()
	DisableObjectGroup(Gvar_21)
	if not Gvar_118 then 
		goto l15
	end
	EnableObject(Gvar_113)
	::l15::
	PlayMusic(16,100)
	if true then return end
end
function runFromPain()
	MonsterFleeFrom(Trigger,GetHostPlayer(),60)
	Gvar_94 = Trigger
	ObjAddHealth(Gvar_94,1000)
	if not Gvar_37 then 
		goto l34
	end
	WaitFrames(63,130)
	::l34::
	if not Trigger == Gvar_17 then 
		goto l49
	end
	WaitFrames(63,130)
	::l49::
	if true then return end
end
function followPlayer()
	MonsterFollowObj(Gvar_94,GetHostPlayer())
	if true then return end
end
function InitializeWizardSetpiece()
	Gvar_136 = ObjFromName("Wizard")
	Gvar_137 = ObjFromName("Wizard2")
	Gvar_138 = ObjFromName("Jerry")
	Gvar_139 = ObjFromName("Bryan")
	Gvar_140 = ObjFromName("FireKnightGuard1")
	Gvar_141 = ObjFromName("Staff")
	Gvar_142 = WaypointFromName("WizardMark")
	Gvar_143 = WaypointFromName("BryanMark")
	Gvar_144 = WaypointFromName("AudioOrigin")
	Gvar_145 = WaypointFromName("WizardStorage")
	Gvar_146 = WaypointFromName("WizardExitPath")
	InvPutObj(Gvar_136,Gvar_141)
	ObjSetMaster(GetHostPlayer(),Gvar_139)
	ObjSetMaster(GetHostPlayer(),Gvar_138)
	ApplySpellObjObj("SPELL_SHIELD",Gvar_136,Gvar_136)
	ApplyEnchant(Gvar_136,"ENCHANT_INVISIBLE",0)
	if true then return end
end
function CreatureSetup()
	ObjSetMaster(GetHostPlayer(),Gvar_115)
	ObjSetMaster(GetHostPlayer(),Gvar_116)
	ObjSetMaster(GetHostPlayer(),Gvar_39)
	ObjSetMaster(GetHostPlayer(),Gvar_43)
	ObjSetMaster(GetHostPlayer(),Gvar_44)
	ObjSetMaster(GetHostPlayer(),Gvar_45)
	ObjSetMaster(GetHostPlayer(),Gvar_41)
	ObjSetMaster(GetHostPlayer(),Gvar_42)
	ObjSetMaster(GetHostPlayer(),Gvar_46)
	ObjSetMaster(GetHostPlayer(),Gvar_47)
	ObjSetMaster(GetHostPlayer(),Gvar_48)
	ObjSetMaster(GetHostPlayer(),Gvar_49)
	ObjSetMaster(GetHostPlayer(),Gvar_16)
	ObjSetMaster(GetHostPlayer(),Gvar_17)
	ObjSetMaster(GetHostPlayer(),Gvar_14)
	ObjSetMaster(GetHostPlayer(),Gvar_15)
	ObjSetMaster(GetHostPlayer(),Gvar_117)
	ObjSetMaster(GetHostPlayer(),Gvar_59)
	ObjSetMaster(GetHostPlayer(),Gvar_60)
	ObjSetMaster(GetHostPlayer(),Gvar_39)
	if not JournalSetQuest("War02A:EnteredGauntlet") == 1 then 
		goto l441
	end
	if not Gvar_38 then 
		goto l441
	end
	Gvar_38 = false
	DeleteObject(Gvar_14)
	DeleteObject(Gvar_15)
	UnlockDoor(Gvar_34)
	UnlockDoor(Gvar_120)
	UnlockDoor(Gvar_119)
	CancelDialog(Gvar_115)
	CancelDialog(Gvar_116)
	TeleportObj(Gvar_42,2724,3161)
	MonsterGuardArea(Gvar_42,2724,3161,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	SetupDialog(Gvar_49,"NORMAL",61,62)
	SetupDialog(Gvar_17,"NEXT",77,78)
	SetupDialog(Gvar_41,"NORMAL",37,38)
	SetupDialog(Gvar_42,"NORMAL",43,44)
	SetupDialog(Gvar_44,"NORMAL",45,46)
	SetupDialog(Gvar_45,"NORMAL",51,52)
	TeleportObj(Gvar_16,2590,3279)
	MonsterGuardArea(Gvar_16,GetObjX(Gvar_16),GetObjY(Gvar_16),GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	if not JournalSetQuest("PlayerInSewers") ~= 1 then 
		goto l349
	end
	MonsterFollowObj(Gvar_17,GetHostPlayer())
	ForceDialog(Gvar_17,GetHostPlayer())
	goto l377
	::l349::
	TeleportObj(Gvar_17,2296,3099)
	MonsterGuardArea(Gvar_17,2296,3099,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()),0)
	::l377::
	SetShopkeeperGreet(Gvar_43,"War02B.scr:BarTalk1")
	SetShopkeeperGreet(Gvar_114,"War03b:Shopkeeper")
	EnableObjectGroup(Gvar_74)
	EnableObjectGroup(Gvar_75)
	EnableObjectGroup(Gvar_76)
	EnableObjectGroup(Gvar_77)
	EnableObject(Gvar_53)
	EnableObject(Gvar_54)
	EnableObject(Gvar_55)
	TeleportObj(Gvar_41,3829,3524)
	WaitFrames(1,150)
	::l441::
	if not JournalSetQuest("War02A:EnteredGauntlet") == 2 then 
		goto l595
	end
	if not Gvar_27 then 
		goto l595
	end
	Gvar_27 = false
	LockDoor(Gvar_33)
	LockDoor(Gvar_34)
	SetupDialog(Gvar_41,"NORMAL",37,38)
	SetupDialog(Gvar_42,"NORMAL",43,44)
	SetupDialog(Gvar_44,"NORMAL",45,46)
	SetupDialog(Gvar_45,"NORMAL",51,52)
	EnableObjectGroup(Gvar_74)
	EnableObjectGroup(Gvar_75)
	EnableObjectGroup(Gvar_76)
	EnableObjectGroup(Gvar_77)
	EnableObject(Gvar_53)
	EnableObject(Gvar_54)
	EnableObject(Gvar_55)
	LockDoor(Gvar_34)
	LockDoor(Gvar_33)
	UnlockDoor(Gvar_57)
	UnlockDoor(Gvar_56)
	SetShopkeeperGreet(Gvar_114,"War03b:Shopkeeper")
	CancelDialog(Gvar_115)
	CancelDialog(Gvar_116)
	EnableObjectGroup(Gvar_74)
	PlayerExitSewers()
	::l595::
	if true then return end
end
function GateGuard1AStart()
	ObjLookAtObj(Gvar_115,GetHostPlayer())
	ObjFreeze(Gvar_115,true)
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GateGuard1Talk01")
	if true then return end
end
function GateGuard1AEnd()
	ObjFreeze(Gvar_115,false)
	SetupDialog(Gvar_115,"NORMAL",135,136)
	if true then return end
end
function GateGuard1BStart()
	ObjLookAtObj(Gvar_115,GetHostPlayer())
	ObjFreeze(Gvar_115,true)
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GateGuard1Talk02")
	if true then return end
end
function GateGuard1BEnd()
	ObjFreeze(Gvar_115,false)
	SetupDialog(Gvar_115,"NORMAL",135,136)
	if true then return end
end
function GateGuard2AStart()
	ObjLookAtObj(Gvar_116,GetHostPlayer())
	ObjFreeze(Gvar_116,true)
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GateGuard2Talk01")
	if true then return end
end
function GateGuard2AEnd()
	ObjFreeze(Gvar_116,false)
	SetupDialog(Gvar_116,"NORMAL",139,140)
	if true then return end
end
function GateGuard2BStart()
	ObjLookAtObj(Gvar_116,GetHostPlayer())
	ObjFreeze(Gvar_116,true)
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:GateGuard2Talk02")
	if true then return end
end
function GateGuard2BEnd()
	ObjFreeze(Gvar_116,false)
	SetupDialog(Gvar_116,"NORMAL",137,138)
	if true then return end
end
function OpenGearDoor()
	if not ObjIsCaller(Gvar_16) then 
		goto l22
	end
	UnlockDoor(Gvar_119)
	UnlockDoor(Gvar_120)
	DisableObject(Trigger)
	::l22::
	if true then return end
end
function CaptainStartTalk()
	ForceDialog(Gvar_95,GetHostPlayer())
	if true then return end
end
function CaptainStart1()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:CaptainTalkStart")
	if true then return end
end
function CaptainEnd1()
	Gvar_88 = true
	SetupDialog(Gvar_95,"NORMAL",145,146)
	if true then return end
end
function CaptainStart2()
	var_0 = RandomInteger(1,4)
	var_1 = var_0
	if var_1 == 1 then 
		goto l51
	end
	if var_1 == 2 then 
		goto l59
	end
	if var_1 == 3 then 
		goto l67
	end
	if var_1 == 4 then 
		goto l75
	end
	goto l83
	::l51::
	StartDialogWithCaller("HumanMaleEatFood","War01a:CaptainTalk2aStart")
	goto l83
	::l59::
	StartDialogWithCaller("HumanMaleEatFood","War01a:CaptainTalk2bStart")
	goto l83
	::l67::
	StartDialogWithCaller("HumanMaleEatFood","War01a:CaptainTalk2cStart")
	goto l83
	::l75::
	StartDialogWithCaller("HumanMaleEatFood","War01a:CaptainTalk2eStart")
	goto l83
	::l83::
	if true then return end
end
function CaptainEnd2()
	SetupDialog(Gvar_95,"NORMAL",145,146)
	if true then return end
end
function KirikStart1()
	StartDialogWithCaller("HumanMaleEatFood","War01A.scr:Guard1Talk01")
	if true then return end
end
function KirikEnd1()
	SetupDialog(Gvar_39,"NORMAL",147,148)
	if true then return end
end
function GiveXP()
	DisableObjectGroup(Gvar_121)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),50)
	if true then return end
end
function DisableDudes()
	DisableObject(Gvar_41)
	if true then return end
end
function IntroBatAttack()
	if not Gvar_93 then 
		goto l29
	end
	if not HostPlayerIsTrading() then 
		goto l23
	end
	ObjFreeze(Gvar_40,true)
	WaitFrames(10,152)
	::l23::
	WaitFrames(10,151)
	::l29::
	if true then return end
end
function ResetBat()
	if not Gvar_93 then 
		goto l13
	end
	ObjFreeze(Gvar_40,false)
	::l13::
	if true then return end
end
function IntroBatDies()
	Gvar_93 = false
	if true then return end
end
function DestroyIntroBat()
	DeleteObject(Gvar_40)
	if true then return end
end
function MapInitialize()
	Gvar_95 = ObjFromName("AirshipCaptain")
	Gvar_96 = ObjFromName("Basket")
	Gvar_97 = ObjFromName("BasketShadow")
	Gvar_106 = ObjFromName("BarrelSign")
	Gvar_107 = ObjFromName("WallSign")
	Gvar_108 = ObjFromName("ChestSign")
	Gvar_109 = ObjFromName("JumpSign")
	Gvar_110 = ObjFromName("WellSign")
	Gvar_111 = ObjFromName("AppleSign")
	Gvar_100 = ObjFromName("DownGear")
	Gvar_101 = ObjFromName("UpGear")
	Gvar_98 = ObjFromName("UpToSurface")
	Gvar_99 = ObjFromName("ElevatorDoor")
	Gvar_16 = ObjFromName("F2Gearhart")
	Gvar_50 = ObjFromName("Horrendous")
	Gvar_102 = ObjFromName("MidCityGate1")
	Gvar_103 = ObjFromName("MidCityGate2")
	Gvar_104 = ObjFromName("GauntletDoorL")
	Gvar_105 = ObjFromName("GauntletDoorR")
	Gvar_73 = ObjFromName("SecretSpider")
	DisableObject(Gvar_73)
	Gvar_71 = ObjFromName("MachRoomTrigger")
	DisableObject(Gvar_71)
	Gvar_72 = ObjFromName("TalkWithHorTrigger")
	DisableObject(Gvar_72)
	Gvar_113 = ObjFromName("CaveMusicTrigger")
	Gvar_21 = ObjGroupFromName("TownMusicTriggers")
	DisableObjectGroup(Gvar_21)
	Gvar_39 = ObjFromName("Kirik")
	Gvar_40 = ObjFromName("IntroBat")
	Gvar_114 = ObjFromName("F2Bull")
	Gvar_115 = ObjFromName("Bruce")
	Gvar_116 = ObjFromName("F6FireGuard10")
	Gvar_41 = ObjFromName("Daniel")
	Gvar_42 = ObjFromName("Jesse")
	Gvar_45 = ObjFromName("Jacob")
	Gvar_44 = ObjFromName("Eric")
	Gvar_46 = ObjFromName("Tyler")
	Gvar_43 = ObjFromName("Bing")
	Gvar_47 = ObjFromName("Melissa")
	Gvar_48 = ObjFromName("Evelyn")
	Gvar_49 = ObjFromName("Lydia")
	Gvar_117 = ObjFromName("F1Rogan")
	Gvar_59 = ObjFromName("FireKnightGuard3")
	Gvar_60 = ObjFromName("FireKnightGuard4")
	Gvar_17 = ObjFromName("QuarterMaster")
	Gvar_10 = ObjFromName("AppleBat1")
	Gvar_12 = ObjFromName("AppleBat1A")
	Gvar_13 = ObjFromName("AppleBat1B")
	Gvar_11 = ObjFromName("AppleBat2")
	Gvar_14 = ObjFromName("Kristine")
	Gvar_15 = ObjFromName("Jennifer")
	Gvar_118 = ObjFromName("MasterUrchin")
	Gvar_53 = ObjFromName("GearLight1")
	Gvar_54 = ObjFromName("GearLight2")
	Gvar_55 = ObjFromName("GearLight3")
	Gvar_119 = ObjFromName("GearDoorR")
	Gvar_120 = ObjFromName("GearDoorL")
	Gvar_51 = ObjFromName("OrchardKey")
	Gvar_52 = ObjFromName("SponsorshipLetter")
	Gvar_28 = ObjFromName("SewerGear1")
	Gvar_29 = ObjFromName("SewerGear2")
	Gvar_30 = ObjFromName("Brick1")
	Gvar_31 = ObjFromName("Brick2")
	Gvar_32 = ObjFromName("SewerBottom")
	Gvar_33 = ObjFromName("ExpressDoor")
	Gvar_34 = ObjFromName("ServiceDoor")
	Gvar_57 = ObjFromName("IxDoorR")
	Gvar_56 = ObjFromName("IxDoorL")
	Gvar_58 = ObjFromName("SewerExitTrigger")
	Gvar_61 = ObjFromName("Goodies")
	Gvar_62 = ObjFromName("HorGold")
	Gvar_63 = ObjFromName("SturdyBoots")
	Gvar_64 = ObjFromName("NiceCloak")
	Gvar_65 = ObjFromName("BatScroll")
	Gvar_66 = ObjFromName("LeechScroll")
	Gvar_67 = ObjFromName("SpiderScroll")
	Gvar_68 = ObjFromName("LargeSpiderScroll")
	Gvar_69 = ObjFromName("TrollScroll")
	Gvar_70 = ObjFromName("UrchinScroll")
	Gvar_112 = ObjFromName("LightTrigger")
	Gvar_74 = ObjGroupFromName("Peds")
	Gvar_18 = ObjGroupFromName("FleePiece")
	Gvar_19 = ObjGroupFromName("FleePiece2")
	Gvar_75 = ObjGroupFromName("StreetLamps")
	Gvar_76 = ObjGroupFromName("StreetLamps2")
	Gvar_77 = ObjGroupFromName("LightGears")
	Gvar_78 = ObjGroupFromName("LightGears2")
	Gvar_20 = ObjGroupFromName("FleeTriggers")
	Gvar_121 = ObjGroupFromName("SecretAreaWow")
	Gvar_79 = ObjGroupFromName("SecretTrainingTriggers")
	Gvar_80 = ObjGroupFromName("SecretRoom2Triggers")
	Gvar_81 = ObjGroupFromName("PlayerGearTriggers")
	Gvar_122 = ObjGroupFromName("FireSwordFlames")
	Gvar_123 = WallGroupFromName("SetPieceWalls")
	Gvar_22 = WaypointFromName("PlayerSounds")
	Gvar_91 = WaypointFromName("GearhartWP")
	Gvar_92 = WaypointFromName("QMStartWP")
	Gvar_124 = WaypointFromName("FireSnufWay")
	Gvar_125 = WaypointGroupFromName("CaveWP")
	SetDialogPortrait(Gvar_117,"WarriorPic")
	SetDialogPortrait(Gvar_41,"MalePic5")
	SetDialogPortrait(Gvar_42,"Townsman1Pic")
	SetDialogPortrait(Gvar_44,"Townsman3Pic")
	SetDialogPortrait(Gvar_17,"QuarterMasterPic")
	SetDialogPortrait(Gvar_46,"IxGuard1Pic")
	SetDialogPortrait(Gvar_49,"MaidenPic3")
	SetDialogPortrait(Gvar_47,"MaidenPic2")
	SetDialogPortrait(Gvar_48,"MaidenPic")
	SetDialogPortrait(Gvar_45,"DrunkPic")
	SetDialogPortrait(Gvar_16,"GearhartPic")
	SetDialogPortrait(Gvar_95,"AirshipCaptainPic")
	SetDialogPortrait(Gvar_39,"Warrior4Pic")
	SetDialogPortrait(Gvar_14,"MaidenPic2")
	SetDialogPortrait(Gvar_15,"MaidenPic")
	SetupDialog(Gvar_117,"NORMAL",120,121)
	SetupDialog(Gvar_115,"NORMAL",133,134)
	SetupDialog(Gvar_116,"NORMAL",137,138)
	SetupDialog(Gvar_41,"NORMAL",37,38)
	SetupDialog(Gvar_42,"NORMAL",41,42)
	SetupDialog(Gvar_44,"NORMAL",45,46)
	SetupDialog(Gvar_46,"NORMAL",49,50)
	SetupDialog(Gvar_45,"NORMAL",51,52)
	SetupDialog(Gvar_49,"NORMAL",59,60)
	SetupDialog(Gvar_47,"NORMAL",65,66)
	SetupDialog(Gvar_48,"NORMAL",67,68)
	SetupDialog(Gvar_17,"NORMAL",71,72)
	SetupDialog(Gvar_95,"NORMAL",143,144)
	SetupDialog(Gvar_39,"NORMAL",147,148)
	DisableObjectGroup(Gvar_18)
	DisableObjectGroup(Gvar_19)
	DisableWaypointGroup(Gvar_125)
	DisableObjectGroup(Gvar_74)
	LockDoor(Gvar_33)
	LockDoor(Gvar_34)
	LockDoor(Gvar_119)
	LockDoor(Gvar_120)
	LockDoor(Gvar_56)
	LockDoor(Gvar_57)
	LockDoor(Gvar_102)
	LockDoor(Gvar_103)
	LockDoor(Gvar_104)
	LockDoor(Gvar_105)
	SetDialogPortrait(Gvar_50,"HorrendousPic")
	SetDialogPortrait(Gvar_115,"Warrior5Pic")
	SetDialogPortrait(Gvar_116,"Warrior3Pic")
	InitializeWizardSetpiece()
	StartScreen(1)
	WaitFrames(3,125)
	WaitFrames(1,142)
	if true then return end
end
function MapEntry()
	if not JournalSetQuest("War02A:EnteredGauntlet") == 1 then 
		goto l15
	end
	PlayMusic(16,100)
	::l15::
	if not JournalSetQuest("War02A:EnteredGauntlet") == 2 then 
		goto l30
	end
	PlayMusic(16,100)
	::l30::
	WaitFrames(1,132)
	if true then return end
end
function PlayerDeath()
	if not JournalSetQuest("War02A:EnteredGauntlet") == 1 then 
		goto l15
	end
	DeathScreen(2)
	goto l34
	::l15::
	if not JournalSetQuest("War02A:EnteredGauntlet") == 2 then 
		goto l30
	end
	DeathScreen(3)
	goto l34
	::l30::
	DeathScreen(1)
	::l34::
	if true then return end
end
function WizardEnter()
	Gvar_133 = Gvar_127
	MoveTo(Gvar_136,Gvar_142)
	MoveTo(Gvar_139,Gvar_143)
	if true then return end
end
function JerrySpeaks()
	ObjLookAtObj(Gvar_138,Gvar_136)
	SayChat(Gvar_138,"War01A.scr:SetpieceGuard1Talk01")
	WaitFrames(60,160)
	if true then return end
end
function WizardAttackJerry()
	Gvar_133 = Gvar_129
	ObjLookAtObj(Gvar_136,Gvar_138)
	ObjLookAtObj(Gvar_138,Gvar_136)
	SayChat(Gvar_138,"War01A.scr:SetpieceGuard2Talk01")
	ApplySpellObjXY("SPELL_LIGHTNING",Gvar_136,GetObjX(Gvar_138),GetObjY(Gvar_138))
	WaitFrames(15,171)
	if true then return end
end
function BryanAttackWizardAgain()
	MonsterGoFight(Gvar_139,Gvar_136)
	if true then return end
end
function BryanSpeaks()
	ObjLookAtObj(Gvar_139,Gvar_137)
	ObjLookAtObj(Gvar_138,Gvar_137)
	SayChat(Gvar_139,"War01A.scr:SetpieceGuard2Talk02")
	WaitFrames(80,163)
	if true then return end
end
function WizardExit()
	RemoveAllChat()
	MoveTo(Gvar_139,Gvar_146)
	MonsterFollowObj(Gvar_137,Gvar_139)
	MonsterFollowObj(Gvar_138,Gvar_137)
	Gvar_133 = Gvar_131
	WaitFrames(120,164)
	if true then return end
end
function ReleasePlayer()
	PlayMusic(16,100)
	CinematicBorders(false)
	TeleportObj(Gvar_138,GetWaypointX(Gvar_145),GetWaypointY(Gvar_145))
	TeleportObj(Gvar_139,GetWaypointX(Gvar_145),GetWaypointY(Gvar_145))
	TeleportObj(Gvar_137,GetWaypointX(Gvar_145),GetWaypointY(Gvar_145))
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_74)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_123)
	WallMakeSilent(false)
	WaitFrames(1,165)
	if true then return end
end
function DisableGuys()
	DisableObject(Gvar_138)
	DisableObject(Gvar_139)
	DisableObject(Gvar_137)
	if true then return end
end
function WizardReport()
	var_0 = Gvar_133
	if var_0 == Gvar_127 then 
		goto l18
	end
	goto l48
	::l18::
	CancelEnchant(Gvar_136,"ENCHANT_INVISIBLE")
	ObjLookAtObj(Gvar_136,Gvar_138)
	Gvar_133 = Gvar_128
	WaitFrames(15,159)
	goto l48
	::l48::
	if true then return end
end
function StopBryan()
	MonsterIdle(Gvar_139)
	if true then return end
end
function SwapWizards()
	InvDropObj(Gvar_136,Gvar_141)
	AudioEvent("WoodenWeaponDrop",Gvar_144)
	TeleportObj(Gvar_137,GetObjX(Gvar_136),GetObjY(Gvar_136))
	TeleportObj(Gvar_136,GetWaypointX(Gvar_145),GetWaypointY(Gvar_145))
	if true then return end
end
function WizardInjured()
	Gvar_134 = Gvar_134 + 1
	if not Gvar_134 > 1 then 
		goto l102
	end
	var_0 = Gvar_133
	if var_0 == Gvar_129 then 
		goto l41
	end
	if var_0 == Gvar_131 then 
		goto l82
	end
	goto l102
	::l41::
	RemoveAllChat()
	WaitFrames(5,168)
	AudioEvent("NPCHurt",Gvar_144)
	Gvar_133 = Gvar_130
	MonsterIdle(Gvar_136)
	WaitFrames(10,167)
	WaitFrames(20,162)
	goto l102
	::l82::
	if not ObjIsCaller(Gvar_140) then 
		goto l100
	end
	DamageObject(Trigger,0,1000,0)
	::l100::
	goto l102
	::l102::
	if true then return end
end
function StartWizardSetpiece()
	if not Gvar_135 == 0 and ObjIsCaller(GetHostPlayer()) then 
		goto l96
	end
	if not Gvar_40 then 
		goto l33
	end
	DamageObject(Gvar_40,0,100,0)
	WaitFrames(30,154)
	::l33::
	PlayMusic(4,100)
	Gvar_135 = true
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	CinematicBorders(true)
	TeleportWaypoint(Gvar_144,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	DeleteObject(Gvar_95)
	DeleteObject(Gvar_96)
	DeleteObject(Gvar_97)
	WaitFrames(45,158)
	::l96::
	if true then return end
end
function BryanAttackWizard()
	AudioEvent("SwordsmanRecognize",Gvar_144)
	MonsterGoFight(Gvar_139,Gvar_136)
	WaitFrames(7,161)
	if true then return end
end
function Clear()
	CinematicBorders(false)
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end