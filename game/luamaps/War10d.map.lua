
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_63 = 0
	Gvar_64 = 1
	Gvar_65 = 2
	Gvar_66 = 3
	Gvar_67 = 4
	Gvar_68 = 5
	Gvar_69 = Gvar_63
	Gvar_73 = 0
	Gvar_74 = 1
	Gvar_75 = Gvar_73
	Gvar_37 = false
	Gvar_38 = false
	Gvar_115 = false
	Gvar_116 = false
	Gvar_117 = false
	Gvar_118 = false
	if true then return end
end
function PlayerDeath()
	DeathScreen(10)
	if true then return end
end
function ActivateSmokePuffs()
	var_0 = 0
	::l6::
	if not (var_0 < 32) then 
		goto l48
	end
	PlayFX("SMOKE_BLAST",GetWaypointX(Gvar_23[var_0]),GetWaypointY(Gvar_23[var_0]),0,0)
	var_0 = var_0 + 2
	goto l6
	::l48::
	if true then return end
end
function FilterHecubah()
	if not (ObjIsCaller(Gvar_5)) then 
		goto l13
	end
	if true then return true end
	goto l17
	::l13::
	if true then return false end
	::l17::
	if true then return end
end
function HecubahGuard()
	var_0 = GetWaypointX(Gvar_13)
	var_1 = GetWaypointY(Gvar_13)
	var_2 = GetWaypointX(Gvar_14)
	var_3 = GetWaypointY(Gvar_14)
	MonsterGuardArea(Gvar_5,var_0,var_1,var_2,var_3,0)
	WallMakeSilent(true)
	CloseSecretWallGroup(Gvar_25)
	WallMakeSilent(false)
	if true then return end
end
function EnableOrbMonsterGroup()
	EnableObjectGroup(Gvar_7)
	ObjFreeze(GetHostPlayer(),false)
	OpenSecretWallGroup(Gvar_6)
	WaitFrames(2,3)
	CloseSecretWallGroup(Gvar_10)
	if true then return end
end
function HecubahExit()
	ApplyEnchant(Gvar_5,"ENCHANT_HASTED",100)
	MoveTo(Gvar_5,Gvar_13)
	CinematicBorders(false)
	WaitFrames(60,6)
	if true then return end
end
function HecubahDialogEnd()
	WaitFrames(30,7)
	CancelDialog(Gvar_5)
	if true then return end
end
function HecubahDialogStart()
	StartDialogWithCaller("DemonRecognize","Con07H.scr:HecubahTalk02")
	if true then return end
end
function HecubahTrigger()
	ObjLookAtObj(Gvar_5,GetHostPlayer())
	SetDialogPortrait(Gvar_5,"HecubahPic")
	SetupDialog(Gvar_5,"NEXT",9,8)
	ForceDialog(Gvar_5,GetHostPlayer())
	if true then return end
end
function HecubahEnter()
	MoveTo(Gvar_5,Gvar_12)
	if true then return end
end
function HecubahWallsDown()
	OpenSecretWallGroup(Gvar_15)
	WaitFrames(1,11)
	if true then return end
end
function GetOrb()
	DisableObject(Gvar_4)
	DisableObjectGroup(Gvar_17)
	SetOblivionStatus(3)
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	WaitFrames(60,12)
	DisableObjectGroup(Gvar_16)
	JournalAddEntry(GetHostPlayer(),"War11Hecubah",1)
	JournalUpdateEntry(GetHostPlayer(),"War10aOrbQuest",4)
	if true then return end
end
function EnableAllMonsters()
	ObjFreeze(GetHostPlayer(),false)
	EnableObjectGroup(Gvar_7)
	EnableObjectGroup(Gvar_8)
	EnableObjectGroup(Gvar_9)
	if true then return end
end
function HecubahVanish1()
	EnableObject(Gvar_22)
	DisableObjectGroup(Gvar_18)
	MoveTo(Gvar_5,Gvar_19)
	AudioEvent("HecubahTaunt",Gvar_13)
	CinematicBorders(false)
	WaitFrames(60,14)
	if true then return end
end
function HecubahTakesOff()
	ObjFreeze(GetHostPlayer(),true)
	CinematicBorders(true)
	WaitFrames(60,15)
	DisableObjectGroup(Gvar_7)
	DisableObjectGroup(Gvar_8)
	DisableObjectGroup(Gvar_9)
	WallMakeSilent(true)
	OpenSecretWallGroup(Gvar_25)
	WallMakeSilent(false)
	if true then return end
end
function HecubahVanish2()
	var_0 = GetWaypointX(Gvar_20)
	var_1 = GetWaypointY(Gvar_20)
	var_2 = GetWaypointX(Gvar_19)
	var_3 = GetWaypointY(Gvar_19)
	PlayFX("SMOKE_BLAST",var_2,var_3,0,0)
	AudioEvent("TeleportOut",Gvar_19)
	TeleportObj(Gvar_5,var_0,var_1)
	EnableObject(Gvar_24)
	if true then return end
end
function MapSwitch()
	var_0 = GetWaypointX(Gvar_21)
	var_1 = GetWaypointY(Gvar_21)
	ObjFreeze(GetHostPlayer(),false)
	TeleportObj(GetHostPlayer(),var_0,var_1)
	if true then return end
end
function DestroyMe()
	DeleteObject(Caller)
	if true then return end
end
function PlayerFadeOut()
	ObjFreeze(GetHostPlayer(),true)
	CinematicFade()
	WaitFrames(60,18)
	if true then return end
end
function TeleportPlayer()
	CinematicFade()
	ObjFreeze(GetHostPlayer(),true)
	if true then return end
end
function EnableMonsterGroup2()
	MonsterSetAggressiveness(Trigger,0.83)
	EnableObjectGroup(Gvar_8)
	if true then return end
end
function EnableMonsterGroup3()
	MonsterSetAggressiveness(Trigger,0.83)
	EnableObjectGroup(Gvar_9)
	if true then return end
end
function LichWallsDown2()
	var_0 = GetWaypointX(Gvar_47)
	var_1 = GetWaypointY(Gvar_47)
	var_2 = GetWaypointX(Gvar_48)
	var_3 = GetWaypointY(Gvar_48)
	var_4 = GetWaypointX(Gvar_49)
	var_5 = GetWaypointY(Gvar_49)
	var_6 = GetWaypointX(Gvar_50)
	var_7 = GetWaypointY(Gvar_50)
	var_8 = GetWaypointX(Gvar_51)
	var_9 = GetWaypointY(Gvar_51)
	var_10 = GetWaypointX(Gvar_52)
	var_11 = GetWaypointY(Gvar_52)
	var_12 = GetWaypointX(Gvar_53)
	var_13 = GetWaypointY(Gvar_53)
	var_14 = GetWaypointX(Gvar_54)
	var_15 = GetWaypointY(Gvar_54)
	OpenSecretWallGroup(Gvar_33)
	EnableObjectGroup(Gvar_34)
	EnableObjectGroup(Gvar_31)
	WaitFrames(1,28)
	PlayFX("SMOKE_BLAST",var_0,var_1,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_2,var_3,var_2,var_3)
	PlayFX("SMOKE_BLAST",var_4,var_5,var_4,var_5)
	PlayFX("SMOKE_BLAST",var_6,var_7,var_6,var_7)
	PlayFX("SMOKE_BLAST",var_8,var_9,var_8,var_9)
	PlayFX("SMOKE_BLAST",var_10,var_11,var_10,var_11)
	PlayFX("SMOKE_BLAST",var_12,var_13,var_12,var_13)
	PlayFX("SMOKE_BLAST",var_14,var_15,var_14,var_15)
	if true then return end
end
function LichDieCheck()
	if not (Gvar_37 and Gvar_38) then 
		goto l11
	end
	LichWallsDown2()
	::l11::
	if true then return end
end
function LichDie1()
	Gvar_37 = true
	LichDieCheck()
	if true then return end
end
function LichDie2()
	Gvar_38 = true
	LichDieCheck()
	if true then return end
end
function LichMove()
	MoveTo(Gvar_35,Gvar_55)
	MoveTo(Gvar_36,Gvar_56)
	if true then return end
end
function LichWallsDown()
	var_0 = GetWaypointX(Gvar_39)
	var_1 = GetWaypointY(Gvar_39)
	var_2 = GetWaypointX(Gvar_40)
	var_3 = GetWaypointY(Gvar_40)
	var_4 = GetWaypointX(Gvar_41)
	var_5 = GetWaypointY(Gvar_41)
	var_6 = GetWaypointX(Gvar_42)
	var_7 = GetWaypointY(Gvar_42)
	var_8 = GetWaypointX(Gvar_43)
	var_9 = GetWaypointY(Gvar_43)
	var_10 = GetWaypointX(Gvar_44)
	var_11 = GetWaypointY(Gvar_44)
	var_12 = GetWaypointX(Gvar_45)
	var_13 = GetWaypointY(Gvar_45)
	var_14 = GetWaypointX(Gvar_46)
	var_15 = GetWaypointY(Gvar_46)
	OpenSecretWallGroup(Gvar_32)
	EnableObjectGroup(Gvar_30)
	PlayFX("SMOKE_BLAST",var_0,var_1,var_0,var_1)
	PlayFX("SMOKE_BLAST",var_2,var_3,var_2,var_3)
	PlayFX("SMOKE_BLAST",var_4,var_5,var_4,var_5)
	PlayFX("SMOKE_BLAST",var_6,var_7,var_6,var_7)
	PlayFX("SMOKE_BLAST",var_8,var_9,var_8,var_9)
	PlayFX("SMOKE_BLAST",var_10,var_11,var_10,var_11)
	PlayFX("SMOKE_BLAST",var_12,var_13,var_12,var_13)
	PlayFX("SMOKE_BLAST",var_14,var_15,var_14,var_15)
	if true then return end
end
function SentryRun()
	var_0 = Gvar_69
	if (var_0 == Gvar_63) then 
		goto l63
	end
	if (var_0 == Gvar_64) then 
		goto l108
	end
	if (var_0 == Gvar_65) then 
		goto l153
	end
	if (var_0 == Gvar_66) then 
		goto l198
	end
	if (var_0 == Gvar_67) then 
		goto l243
	end
	if (var_0 == Gvar_68) then 
		goto l288
	end
	goto l333
	::l63::
	DisableObject(Gvar_57)
	EnableObject(Gvar_58)
	EnableObject(Gvar_59)
	EnableObject(Gvar_60)
	EnableObject(Gvar_61)
	DisableObject(Gvar_62)
	WaitFrames(25,30)
	Gvar_69 = Gvar_64
	goto l333
	::l108::
	EnableObject(Gvar_57)
	EnableObject(Gvar_58)
	EnableObject(Gvar_59)
	EnableObject(Gvar_60)
	DisableObject(Gvar_61)
	EnableObject(Gvar_62)
	WaitFrames(25,30)
	Gvar_69 = Gvar_65
	goto l333
	::l153::
	EnableObject(Gvar_57)
	EnableObject(Gvar_58)
	EnableObject(Gvar_59)
	DisableObject(Gvar_60)
	EnableObject(Gvar_61)
	EnableObject(Gvar_62)
	WaitFrames(25,30)
	Gvar_69 = Gvar_66
	goto l333
	::l198::
	EnableObject(Gvar_57)
	EnableObject(Gvar_58)
	DisableObject(Gvar_59)
	EnableObject(Gvar_60)
	EnableObject(Gvar_61)
	EnableObject(Gvar_62)
	WaitFrames(25,30)
	Gvar_69 = Gvar_67
	goto l333
	::l243::
	EnableObject(Gvar_57)
	DisableObject(Gvar_58)
	EnableObject(Gvar_59)
	EnableObject(Gvar_60)
	EnableObject(Gvar_61)
	EnableObject(Gvar_62)
	WaitFrames(25,30)
	Gvar_69 = Gvar_68
	goto l333
	::l288::
	EnableObject(Gvar_57)
	EnableObject(Gvar_58)
	EnableObject(Gvar_59)
	EnableObject(Gvar_60)
	EnableObject(Gvar_61)
	EnableObject(Gvar_62)
	WaitFrames(25,30)
	Gvar_69 = Gvar_63
	goto l333
	::l333::
	if true then return end
end
function LLDies()
	Gvar_75 = Gvar_74
	if true then return end
end
function OpenLLWallGroup()
	OpenSecretWallGroup(Gvar_72)
	if true then return end
end
function Ghost1Face()
	ObjLookAtObj(Gvar_70,GetHostPlayer())
	if true then return end
end
function Ghost2Face()
	ObjLookAtObj(Gvar_70,GetHostPlayer())
	if true then return end
end
function PlayAction2Music()
	PlayMusic(27,100)
	if true then return end
end
function MapInitialize()
	Gvar_30 = ObjGroupFromName("LichGroup")
	Gvar_31 = ObjGroupFromName("LichGroup2")
	Gvar_32 = WallGroupFromName("LichWallGroup")
	Gvar_33 = WallGroupFromName("LichWallGroup2")
	Gvar_34 = ObjGroupFromName("LichElevatorGroup")
	Gvar_35 = ObjFromName("Lich1")
	Gvar_36 = ObjFromName("Lich2")
	Gvar_39 = WaypointFromName("DestroyWP1")
	Gvar_40 = WaypointFromName("DestroyWP2")
	Gvar_41 = WaypointFromName("DestroyWP3")
	Gvar_42 = WaypointFromName("DestroyWP4")
	Gvar_43 = WaypointFromName("DestroyWP5")
	Gvar_44 = WaypointFromName("DestroyWP6")
	Gvar_45 = WaypointFromName("DestroyWP7")
	Gvar_46 = WaypointFromName("DestroyWP8")
	Gvar_47 = WaypointFromName("DestroyWP1a")
	Gvar_48 = WaypointFromName("DestroyWP2a")
	Gvar_49 = WaypointFromName("DestroyWP3a")
	Gvar_50 = WaypointFromName("DestroyWP4a")
	Gvar_51 = WaypointFromName("DestroyWP5a")
	Gvar_52 = WaypointFromName("DestroyWP6a")
	Gvar_53 = WaypointFromName("DestroyWP7a")
	Gvar_54 = WaypointFromName("DestroyWP8a")
	Gvar_55 = WaypointFromName("LichWP1")
	Gvar_56 = WaypointFromName("LichWP2")
	Gvar_57 = ObjFromName("Sentry1")
	Gvar_58 = ObjFromName("Sentry2")
	Gvar_59 = ObjFromName("Sentry3")
	Gvar_60 = ObjFromName("Sentry4")
	Gvar_61 = ObjFromName("Sentry5")
	Gvar_62 = ObjFromName("Sentry6")
	SentryRun()
	Gvar_70 = ObjFromName("LLGhost")
	Gvar_71[0] = WaypointFromName("LLGhostWP1")
	Gvar_71[1] = WaypointFromName("LLGhostWP2")
	Gvar_71[2] = WaypointFromName("LLGhostWP3")
	Gvar_71[3] = WaypointFromName("LLGhostWP4")
	Gvar_71[4] = WaypointFromName("LLGhostWP5")
	Gvar_71[5] = WaypointFromName("LLGhostWP6")
	Gvar_72 = WallGroupFromName("LLWallGroup")
	Gvar_76 = ObjFromName("Spike1")
	Gvar_77 = ObjFromName("Spike2")
	Gvar_78 = ObjFromName("Spike3")
	Gvar_79 = ObjFromName("Spike4")
	Gvar_80 = WaypointFromName("Spike1WP")
	Gvar_81 = WaypointFromName("Spike2WP")
	Gvar_82 = WaypointFromName("Spike3WP")
	Gvar_83 = WaypointFromName("Spike4WP")
	Gvar_84 = WallGroupFromName("SpikeWallGroup")
	Gvar_85 = ObjGroupFromName("SpikeWallTrigGroup")
	Gvar_86 = ObjGroupFromName("CherubGroup")
	Gvar_87 = WallGroupFromName("CherubWallGroup")
	Gvar_88 = ObjFromName("Cherub1")
	Gvar_89 = ObjFromName("Cherub2")
	Gvar_90 = ObjFromName("Cherub3")
	Gvar_91 = ObjFromName("Cherub4")
	Gvar_92 = ObjFromName("Cherub5")
	Gvar_93 = ObjFromName("Cherub6")
	Gvar_94 = ObjFromName("Cherub7")
	Gvar_95 = ObjFromName("Cherub8")
	Gvar_96 = ObjFromName("Cherub9")
	Gvar_97 = ObjFromName("Cherub10")
	Gvar_106 = ObjGroupFromName("SentryGroup1")
	Gvar_107 = ObjGroupFromName("SentryGroup2")
	Gvar_108 = ObjGroupFromName("SentryGroup3")
	Gvar_109 = ObjGroupFromName("SentryGroup4")
	Gvar_98 = ObjFromName("Sentry1L")
	Gvar_99 = ObjFromName("Sentry1R")
	Gvar_100 = ObjFromName("Sentry2L")
	Gvar_101 = ObjFromName("Sentry2R")
	Gvar_102 = ObjFromName("Sentry3L")
	Gvar_103 = ObjFromName("Sentry3R")
	Gvar_104 = ObjFromName("Sentry4L")
	Gvar_105 = ObjFromName("Sentry4R")
	Gvar_111 = ObjGroupFromName("OrbTriggerGroup")
	Gvar_110 = ObjGroupFromName("SentryMonsterGroup")
	Gvar_112 = WallGroupFromName("OrbWallGroup1")
	Gvar_113 = WallGroupFromName("OrbWallGroup2")
	Gvar_114 = WallGroupFromName("OrbWallGroup3")
	Gvar_10 = WallGroupFromName("OrbWallGroup4")
	Gvar_119 = WaypointFromName("OrbXPWP")
	Gvar_120 = ObjGroupFromName("OrbXPTrigGroup")
	Gvar_4 = ObjFromName("OrbPool1")
	Gvar_5 = ObjFromName("Hecubah")
	Gvar_7 = ObjGroupFromName("OrbMonsterGroup")
	Gvar_8 = ObjGroupFromName("OrbMonsterGroup2")
	Gvar_9 = ObjGroupFromName("OrbMonsterGroup3")
	Gvar_6 = WallGroupFromName("OrbWallGroupFinal")
	Gvar_11 = WaypointFromName("OrbAudioWP")
	Gvar_15 = WallGroupFromName("HecubahWallGroup")
	Gvar_12 = WaypointFromName("HecubahEnterWP")
	Gvar_13 = WaypointFromName("HecubahExitWP")
	Gvar_14 = WaypointFromName("HecubahLookWP")
	Gvar_16 = ObjGroupFromName("OrbSoundGroup")
	Gvar_17 = ObjGroupFromName("OrbPoolTrigGroup")
	Gvar_18 = ObjGroupFromName("HecubahVanishTrigGroup")
	Gvar_19 = WaypointFromName("HecubahVanishWP")
	Gvar_20 = WaypointFromName("HecubahEndWP")
	Gvar_21 = WaypointFromName("MapSwitchWP")
	Gvar_22 = ObjFromName("HecubahEndTrig")
	Gvar_24 = ObjFromName("ExitTeleporter")
	Gvar_121 = WaypointFromName("Secret1AudioWP")
	Gvar_122 = WaypointFromName("Secret2AudioWP")
	PlayAction2Music()
	Gvar_25 = WallGroupFromName("InvisibleWallGroup")
	OpenSecretWallGroup(Gvar_25)
	var_0 = 0
	::l857::
	if not (var_0 < 32) then 
		goto l894
	end
	Gvar_23[var_0] = WaypointFromName("SmokeWP" + IntToString(var_0 + 1))
	var_0 = var_0 + 1
	goto l857
	::l894::
	if true then return end
end
function OrbXP()
	DisableObjectGroup(Gvar_120)
	AudioEvent("FlagDrop",Gvar_119)
	PlayerGiveExp(GetHostPlayer(),2000)
	if true then return end
end
function Secret100XP()
	PlayerGiveExp(GetHostPlayer(),100)
	PrintToAll("GeneralPrint:SecretFound")
	AudioEvent("SecretFound",Gvar_121)
	if true then return end
end
function Secret200XP()
	PlayerGiveExp(GetHostPlayer(),200)
	PrintToAll("GeneralPrint:SecretFound")
	AudioEvent("SecretFound",Gvar_122)
	if true then return end
end
function HostilizeMe()
	MonsterSetAggressiveness(Trigger,0.83)
	if true then return end
end
function PlayAction3Music()
	PlayMusic(28,100)
	if true then return end
end
function PlayOrbMusic()
	PlayMusic(12,100)
	if true then return end
end
function SpikeMove()
	DisableObjectGroup(Gvar_85)
	AudioEvent("SpikeBlockMove",Gvar_83)
	OpenSecretWallGroup(Gvar_84)
	MoveTo(Gvar_76,Gvar_80)
	MoveTo(Gvar_77,Gvar_81)
	MoveTo(Gvar_78,Gvar_82)
	MoveTo(Gvar_79,Gvar_83)
	PlayAction3Music()
	if true then return end
end
function OpenOrbWallGroup1()
	if not (ObjIsEnabled(Gvar_98) == 0 and ObjIsEnabled(Gvar_99) == 0 and ObjIsEnabled(Gvar_100) == 0 and ObjIsEnabled(Gvar_101) == 0 and ObjIsEnabled(Gvar_102) == 0 and ObjIsEnabled(Gvar_103) == 0 and ObjIsEnabled(Gvar_104) == 0 and ObjIsEnabled(Gvar_105) == 0) then 
		goto l62
	end
	OpenSecretWallGroup(Gvar_112)
	::l62::
	if true then return end
end
function ToggleSG1()
	ToggleObjectGroup(Gvar_106)
	OpenOrbWallGroup1()
	if true then return end
end
function EnableSG1()
	EnableObjectGroup(Gvar_106)
	if true then return end
end
function ToggleSG2()
	ToggleObjectGroup(Gvar_107)
	OpenOrbWallGroup1()
	if true then return end
end
function EnableSG2()
	EnableObjectGroup(Gvar_107)
	if true then return end
end
function ToggleSG3()
	ToggleObjectGroup(Gvar_108)
	OpenOrbWallGroup1()
	if true then return end
end
function EnableSG3()
	EnableObjectGroup(Gvar_108)
	if true then return end
end
function ToggleSG4()
	ToggleObjectGroup(Gvar_109)
	OpenOrbWallGroup1()
	if true then return end
end
function EnableSG4()
	EnableObjectGroup(Gvar_109)
	if true then return end
end
function OpenOrbWallGroup2()
	OpenSecretWallGroup(Gvar_113)
	EnableObjectGroup(Gvar_110)
	EnableObjectGroup(Gvar_86)
	OpenSecretWallGroup(Gvar_87)
	if true then return end
end
function OpenOrbWallGroup3()
	OpenSecretWallGroup(Gvar_114)
	if true then return end
end
function OpenOrbWallGroup4()
	OpenSecretWallGroup(Gvar_10)
	DisableObjectGroup(Gvar_111)
	DisableObjectGroup(Gvar_106)
	DisableObjectGroup(Gvar_107)
	DisableObjectGroup(Gvar_108)
	DisableObjectGroup(Gvar_109)
	if true then return end
end
function BossDieCheck()
	if not (Gvar_115 and Gvar_116 and Gvar_117 and Gvar_118) then 
		goto l19
	end
	OpenOrbWallGroup3()
	::l19::
	if true then return end
end
function BossDie1()
	Gvar_115 = true
	BossDieCheck()
	if true then return end
end
function BossDie2()
	Gvar_116 = true
	BossDieCheck()
	if true then return end
end
function BossDie3()
	Gvar_117 = true
	BossDieCheck()
	if true then return end
end
function BossDie4()
	Gvar_118 = true
	BossDieCheck()
	if true then return end
end