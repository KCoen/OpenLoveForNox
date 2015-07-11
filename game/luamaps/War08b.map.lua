
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_15 = 0
	Gvar_16 = 1
	Gvar_17 = 2
	Gvar_18 = 3
	Gvar_19 = Gvar_15
	Gvar_20 = false
	Gvar_21 = false
	if true then return end
end
function PlayerDeath()
	DeathScreen(8)
	if true then return end
end
function GoToIxSEG2()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_4,false)
	ObjFreeze(Gvar_5,false)
	ObjFreeze(Gvar_6,false)
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_8),GetWaypointY(Gvar_8))
	if true then return end
end
function GoToIx()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l45
	end
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_4,true)
	ObjFreeze(Gvar_5,true)
	ObjFreeze(Gvar_6,true)
	CinematicFade()
	WaitFrames(60,3)
	::l45::
	if true then return end
end
function GoToTempleSEG2()
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_9),GetWaypointY(Gvar_9))
	if true then return end
end
function GoToTemple()
	ObjFreeze(GetHostPlayer(),true)
	CancelDialog(Gvar_7)
	CinematicFade()
	WaitFrames(60,5)
	if true then return end
end
function OwnObjects()
	ObjSetMaster(GetHostPlayer(),Gvar_7)
	if true then return end
end
function MapInitialize()
	Gvar_4 = ObjFromName("Bear01")
	Gvar_5 = ObjFromName("Bear02")
	Gvar_6 = ObjFromName("Bear03")
	Gvar_7 = ObjFromName("IxPriest")
	Gvar_10 = ObjGroupFromName("Fish")
	Gvar_8 = WaypointFromName("IxExitWP")
	Gvar_11 = WaypointFromName("TempleExtWP")
	Gvar_12 = WaypointFromName("TempleIntWP")
	Gvar_9 = WaypointFromName("TempleExitWP")
	Gvar_13 = WaypointFromName("PriestWP")
	Gvar_14 = WaypointFromName("PriestLookWP")
	GroupMonsterGoRoam(Gvar_10)
	WaitFrames(1,7)
	if true then return end
end
function MapEntry()
	CinematicFadeout()
	PlayMusic(22,100)
	if true then return end
end
function EnterTempleSEG2()
	ObjFreeze(GetHostPlayer(),false)
	ObjFreeze(Gvar_4,false)
	ObjFreeze(Gvar_5,false)
	ObjFreeze(Gvar_6,false)
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_12),GetWaypointY(Gvar_12))
	CinematicFadeout()
	if true then return end
end
function EnterTemple()
	ObjFreeze(GetHostPlayer(),true)
	ObjFreeze(Gvar_4,true)
	ObjFreeze(Gvar_5,true)
	ObjFreeze(Gvar_6,true)
	CinematicFade()
	WaitFrames(60,10)
	if true then return end
end
function LeaveTempleSEG2()
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),GetWaypointX(Gvar_11),GetWaypointY(Gvar_11))
	CinematicFadeout()
	if true then return end
end
function LeaveTemple()
	ObjFreeze(GetHostPlayer(),true)
	CinematicFade()
	WaitFrames(60,12)
	if true then return end
end
function StayAway()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function NoMonsters()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) then 
		goto l14
	end
	MonsterGotoHome(Caller)
	::l14::
	if true then return end
end
function BearAttack()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l22
	end
	MonsterFollowObj(Gvar_5,Gvar_4)
	MonsterFollowObj(Gvar_6,Gvar_4)
	::l22::
	if true then return end
end
function BearIdle()
	MonsterGotoHome(Trigger)
	if true then return end
end
function PriestSetPieceSEG2()
	MonsterFollowObj(Gvar_7,GetHostPlayer())
	WaitFrames(75,19)
	if true then return end
end
function PriestSetPieceSEG3()
	SetDialogPortrait(Gvar_7,"IxPriestPic")
	SetupDialog(Gvar_7,"NEXT",20,21)
	ForceDialog(Gvar_7,GetHostPlayer())
	ObjLookAtObj(GetHostPlayer(),Gvar_7)
	if true then return end
end
function PriestDialogStart()
	var_0 = Gvar_19
	if var_0 == Gvar_15 then 
		goto l45
	end
	if var_0 == Gvar_16 then 
		goto l53
	end
	if var_0 == Gvar_17 then 
		goto l61
	end
	if var_0 == Gvar_18 then 
		goto l69
	end
	goto l88
	::l45::
	StartDialogWithCaller("SwordsmanHurt","Con08a:PriestGreet")
	goto l88
	::l53::
	StartDialogWithCaller("SwordsmanHurt","Con08a:PriestProd")
	goto l88
	::l61::
	StartDialogWithCaller("SwordsmanHurt","Con08a:PriestProd2")
	goto l88
	::l69::
	SetupDialog(Gvar_7,"NORMAL",20,21)
	StartDialogWithCaller("SwordsmanHurt","Con08a:PriestProd3")
	goto l88
	::l88::
	if true then return end
end
function PriestDialogEnd()
	var_0 = Gvar_19
	if var_0 == Gvar_15 then 
		goto l45
	end
	if var_0 == Gvar_16 then 
		goto l56
	end
	if var_0 == Gvar_17 then 
		goto l67
	end
	if var_0 == Gvar_18 then 
		goto l78
	end
	goto l155
	::l45::
	Gvar_19 = Gvar_16
	PriestDialogStart()
	goto l155
	::l56::
	Gvar_19 = Gvar_17
	PriestDialogStart()
	goto l155
	::l67::
	Gvar_19 = Gvar_18
	PriestDialogStart()
	goto l155
	::l78::
	if not Gvar_21 == 0 then 
		goto l153
	end
	Gvar_21 = true
	JournalUpdateEntry(GetHostPlayer(),"Chapter8IxPriest",4)
	PrintToAll("Con02a:ObjectiveComplete")
	JournalAddEntry(GetHostPlayer(),"Chapter8Wierdling",2)
	PrintToAll("Con01a:NewJournalEntry")
	CinematicBorders(false)
	MonsterGuardArea(Gvar_7,GetWaypointX(Gvar_13),GetWaypointY(Gvar_13),GetWaypointX(Gvar_14),GetWaypointY(Gvar_14),0)
	WaitFrames(60,22)
	::l153::
	goto l155
	::l155::
	if true then return end
end
function ReleasePlayer()
	PopMusicStack()
	ObjFreeze(GetHostPlayer(),false)
	if true then return end
end
function StartPriestSetPiece()
	if not Gvar_20 == 0 then 
		goto l52
	end
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l52
	end
	PushMusicStack()
	PlayMusic(10,100)
	Gvar_20 = true
	AudioEvent("BigGong",Gvar_12)
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	WaitFrames(60,18)
	::l52::
	if true then return end
end