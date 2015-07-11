
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_40 = 0
	Gvar_41 = 1
	Gvar_42 = 2
	Gvar_43 = 3
	Gvar_44 = 4
	Gvar_45 = Gvar_40
	Gvar_46 = 50
	Gvar_56 = false
	Gvar_57 = false
	Gvar_58 = false
	Gvar_59 = false
	if true then return end
end
function PlayerDeath()
	DeathScreen(3)
	if true then return end
end
function KalenTalkStart()
	StartDialogWithCaller("SwordsmanHurt","War03c:KalenSpeech")
	DisableObjectGroup(Gvar_20)
	if true then return end
end
function KalenTalkEnd()
	var_0 = GetWaypointX(Gvar_16)
	var_1 = GetWaypointY(Gvar_16)
	AudioEvent("NPCDie",Gvar_16)
	AudioEvent("MetalArmorDrop",Gvar_17)
	AudioEvent("LeatherArmorDrop",Gvar_18)
	TeleportObj(Gvar_15,var_0,var_1)
	TeleportObj(Gvar_13,GetWaypointX(Gvar_17),GetWaypointY(Gvar_17))
	TeleportObj(Gvar_14,GetWaypointX(Gvar_18),GetWaypointY(Gvar_18))
	DamageObject(Gvar_15,0,200,12)
	EnableObjectGroup(Gvar_20)
	ZombieAttack()
	DamageObject(Gvar_19,0,200,12)
	if true then return end
end
function ZombieAttack()
	BreakWallGroup(Gvar_10)
	MonsterGroupSetAggressiveness(Gvar_11,0.83)
	EnableObjectGroup(Gvar_21)
	TeleportObj(Gvar_22,1848,2581)
	TeleportObj(Gvar_23,1848,2581)
	TeleportObj(Gvar_24,1904,2710)
	TeleportObj(Gvar_25,1904,2710)
	TeleportObj(Gvar_26,1988,2624)
	TeleportObj(Gvar_27,1988,2624)
	TeleportObj(Gvar_28,1976,2534)
	TeleportObj(Gvar_29,1793,2708)
	if true then return end
end
function UrchinGoHome()
	GroupMonsterGoRoam(Gvar_8)
	if true then return end
end
function InitializeUrchinSetpiece()
	Gvar_47 = ObjFromName("Urchin01")
	Gvar_48 = ObjFromName("Urchin02")
	Gvar_49 = ObjFromName("Urchin03")
	Gvar_50 = ObjFromName("Urchin04")
	Gvar_51 = ObjFromName("ShamanDoor1")
	Gvar_52 = ObjFromName("ShamanDoor2")
	Gvar_55 = ObjGroupFromName("OtherUrchins")
	Gvar_60 = WaypointFromName("Urchin01SetpieceWP")
	Gvar_61 = WaypointFromName("Urchin02SetpieceWP")
	Gvar_62 = WaypointFromName("Urchin03SetpieceWP")
	Gvar_63 = WaypointFromName("Urchin04SetpieceWP")
	Gvar_64 = WaypointFromName("ShamanSetpieceWP")
	Gvar_65 = WaypointFromName("UrchinSetpieceAudioOrigin")
	Gvar_66 = WaypointFromName("ShamanExitWP")
	Gvar_67 = WaypointFromName("ShamanFaceWP")
	Gvar_53 = ObjFromName("ShamanBuddy1")
	Gvar_54 = ObjFromName("ShamanBuddy2")
	Gvar_68 = WaypointFromName("ShamanBuddy1WP")
	Gvar_69 = WaypointFromName("ShamanBuddy2WP")
	if true then return end
end
function PlaySubMusic()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l12
	end
	PlayMusic(18,100)
	::l12::
	if true then return end
end
function MapInitialize()
	Gvar_8 = ObjGroupFromName("UrchinEntryGroup")
	Gvar_4 = ObjFromName("ChamberDoor1")
	Gvar_5 = ObjFromName("ChamberDoor2")
	Gvar_6 = ObjFromName("ChamberDoor3")
	Gvar_7 = ObjFromName("ZombieJailDoor")
	LockDoor(Gvar_7)
	LockDoor(Gvar_4)
	LockDoor(Gvar_5)
	LockDoor(Gvar_6)
	Gvar_9 = ObjFromName("MayorScepter")
	Gvar_13 = ObjFromName("KalenArmor")
	Gvar_14 = ObjFromName("KalenBoots")
	Gvar_17 = WaypointFromName("KalenArmorWP")
	Gvar_18 = WaypointFromName("KalenBootsWP")
	Gvar_15 = ObjFromName("KalenDead")
	DamageObject(Gvar_15,0,200,12)
	Gvar_19 = ObjFromName("Kalen")
	Gvar_20 = ObjGroupFromName("KalenMonsterGroup")
	Gvar_16 = WaypointFromName("KalenWP")
	ObjSetMaster(GetHostPlayer(),Gvar_19)
	SetDialogPortrait(Gvar_19,"WoundedWarriorPic")
	SetupDialog(Gvar_19,"NORMAL",3,4)
	Gvar_10 = WallGroupFromName("ZombieWallGroup")
	Gvar_12 = WaypointFromName("ZombieSound")
	Gvar_11 = ObjGroupFromName("ZombieAmbushGroup")
	Gvar_21 = ObjGroupFromName("MonsterGroup1")
	Gvar_22 = ObjFromName("Monster1")
	Gvar_23 = ObjFromName("Monster2")
	Gvar_24 = ObjFromName("Monster3")
	Gvar_25 = ObjFromName("Monster4")
	Gvar_26 = ObjFromName("Monster5")
	Gvar_27 = ObjFromName("Monster6")
	Gvar_26 = ObjFromName("Monster7")
	Gvar_27 = ObjFromName("Monster8")
	Gvar_30 = ObjFromName("Shaman")
	Gvar_31[0] = WaypointFromName("ShamanWP1")
	Gvar_31[1] = WaypointFromName("ShamanWP2")
	Gvar_31[2] = WaypointFromName("ShamanWP3")
	Gvar_31[3] = WaypointFromName("ShamanWP4")
	Gvar_31[4] = WaypointFromName("ShamanWP5")
	Gvar_31[5] = WaypointFromName("ShamanWP6")
	Gvar_32 = ObjFromName("ShamanElevator")
	InitializeUrchinSetpiece()
	Gvar_33 = WaypointFromName("Secret01WP")
	Gvar_34 = WaypointFromName("Secret02WP")
	Gvar_35 = WaypointFromName("Secret03WP")
	Gvar_36 = WaypointFromName("Secret04WP")
	Gvar_37 = WaypointFromName("Secret05WP")
	Gvar_38 = WaypointFromName("Secret06WP")
	Gvar_39 = WaypointFromName("QuestAudioWP")
	if true then return end
end
function MapEntry()
	CinematicFadeout()
	if true then return end
end
function ShamanMove()
	var_0 = RandomInteger(0,5)
	var_1 = GetWaypointX(Gvar_31[var_0])
	var_2 = GetWaypointY(Gvar_31[var_0])
	TeleportObj(Gvar_30,var_1,var_2)
	ObjLookAtObj(Gvar_30,Gvar_32)
	if true then return end
end
function UnlockChamberDoors()
	UnlockDoor(Gvar_4)
	UnlockDoor(Gvar_5)
	UnlockDoor(Gvar_6)
	if true then return end
end
function MonsterGoHomeLobo()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) == true then 
		goto l25
	end
	MonsterSetAggressiveness(Caller,0)
	MonsterGotoHome(Caller)
	::l25::
	if true then return end
end
function MonsterGoHome()
	PlaySubMusic()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) == true then 
		goto l20
	end
	MonsterGotoHome(Caller)
	::l20::
	if true then return end
end
function MonsterHostile()
	PlaySubMusic()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) == true then 
		goto l22
	end
	MonsterSetAggressiveness(Caller,0.83)
	::l22::
	if true then return end
end
function MonsterGoHomePassive()
	if not ObjIsHostileTo(Caller,GetHostPlayer()) == true then 
		goto l18
	end
	MonsterGotoHome(Caller)
	::l18::
	if true then return end
end
function MonsterGoHomeUrchin()
	if not CheckObjClass(Caller,"MONSTER") == true and CheckInvObjNamed(Caller,"SMALL_MONSTER") == true then 
		goto l30
	end
	MonsterGotoHome(Caller)
	::l30::
	if true then return end
end
function HostilizeMe()
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function PlayWanderMusic()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l12
	end
	PlayMusic(17,100)
	::l12::
	if true then return end
end
function AwardQuestXP()
	AudioEvent("SecretFound",Gvar_39)
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function Secret01XP()
	AudioEvent("SecretFound",Gvar_33)
	PlayerGiveExp(GetHostPlayer(),25)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function Secret02XP()
	AudioEvent("SecretFound",Gvar_34)
	PlayerGiveExp(GetHostPlayer(),50)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function Secret03XP()
	AudioEvent("SecretFound",Gvar_35)
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function Secret04XP()
	AudioEvent("SecretFound",Gvar_36)
	PlayerGiveExp(GetHostPlayer(),50)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function Secret05XP()
	AudioEvent("SecretFound",Gvar_37)
	PlayerGiveExp(GetHostPlayer(),25)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function Secret06XP()
	AudioEvent("SecretFound",Gvar_38)
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	if true then return end
end
function FreezePlayer()
	ObjFreeze(ObjFromName("War03b:Wolf1"),true)
	ObjFreeze(ObjFromName("War03b:Wolf2"),true)
	ObjFreeze(GetHostPlayer(),true)
	MonsterIdle(GetHostPlayer())
	CinematicBorders(true)
	WaitFrames(15,28)
	if true then return end
end
function UrchinsEnter()
	Gvar_45 = Gvar_41
	MoveTo(Gvar_47,Gvar_60)
	MoveTo(Gvar_48,Gvar_61)
	MoveTo(Gvar_49,Gvar_62)
	MoveTo(Gvar_50,Gvar_63)
	if true then return end
end
function CheckUrchins()
	if not Gvar_45 ~= Gvar_41 then 
		goto l10
	end
	if true then return end
	::l10::
	if not Gvar_56 and Gvar_57 and Gvar_58 and Gvar_59 then 
		goto l40
	end
	Gvar_45 = Gvar_42
	WaitFrames(30,30)
	::l40::
	if true then return end
end
function ShamanEnter()
	AudioEvent("BigGong",Gvar_65)
	MoveTo(Gvar_30,Gvar_64)
	if true then return end
end
function ShamanCommand()
	AudioEvent("UrchinShamanRecognize",Gvar_65)
	CinematicBorders(false)
	ObjFreeze(ObjFromName("War03b:Wolf1"),false)
	ObjFreeze(ObjFromName("War03b:Wolf2"),false)
	ObjFreeze(GetHostPlayer(),false)
	Gvar_45 = Gvar_44
	WaitFrames(10,32)
	WaitFrames(30,33)
	if true then return end
end
function UrchinsAttack()
	MonsterSetAggressiveness(Gvar_47,0.83)
	MonsterGoFight(Gvar_47,GetHostPlayer())
	MonsterSetAggressiveness(Gvar_48,0.83)
	MonsterGoFight(Gvar_48,GetHostPlayer())
	MonsterSetAggressiveness(Gvar_49,0.83)
	MonsterGoFight(Gvar_49,GetHostPlayer())
	MonsterSetAggressiveness(Gvar_50,0.83)
	MonsterGoFight(Gvar_50,GetHostPlayer())
	MonsterSetAggressiveness(Gvar_30,0.5)
	EnableObjectGroup(Gvar_55)
	if true then return end
end
function ShamanGuard()
	var_0 = GetWaypointX(Gvar_66)
	var_1 = GetWaypointY(Gvar_66)
	var_2 = GetWaypointX(Gvar_67)
	var_3 = GetWaypointY(Gvar_67)
	MonsterGuardArea(Gvar_30,var_0,var_1,var_2,var_3,400)
	if true then return end
end
function StartUrchinSetpiece()
	DisableObject(Trigger)
	WaitFrames(1,27)
	if true then return end
end
function Urchin01Report()
	if not Gvar_45 ~= Gvar_41 then 
		goto l10
	end
	if true then return end
	::l10::
	AudioEvent("UrchinRecognize",Gvar_65)
	Gvar_56 = true
	CheckUrchins()
	if true then return end
end
function Urchin02Report()
	if not Gvar_45 ~= Gvar_41 then 
		goto l10
	end
	if true then return end
	::l10::
	Gvar_57 = true
	AudioEvent("UrchinRecognize",Gvar_65)
	CheckUrchins()
	if true then return end
end
function Urchin03Report()
	if not Gvar_45 ~= Gvar_41 then 
		goto l10
	end
	if true then return end
	::l10::
	Gvar_58 = true
	AudioEvent("UrchinRecognize",Gvar_65)
	CheckUrchins()
	if true then return end
end
function Urchin04Report()
	if not Gvar_45 ~= Gvar_41 then 
		goto l10
	end
	if true then return end
	::l10::
	Gvar_59 = true
	AudioEvent("UrchinRecognize",Gvar_65)
	CheckUrchins()
	if true then return end
end
function ShamanReport()
	if not Gvar_45 ~= Gvar_42 then 
		goto l10
	end
	if true then return end
	::l10::
	Gvar_45 = Gvar_43
	WaitFrames(20,31)
	LockDoor(Gvar_51)
	LockDoor(Gvar_52)
	if true then return end
end
function ReleaseShamans()
	AudioEvent("BigGong",Gvar_65)
	UnlockDoor(Gvar_51)
	UnlockDoor(Gvar_52)
	MoveTo(Gvar_53,Gvar_68)
	MoveTo(Gvar_54,Gvar_69)
	if true then return end
end