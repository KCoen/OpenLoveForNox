
function GLOBAL()
	if true then return end
end
function GLOBAL()
	Gvar_99 = true
	Gvar_100 = 22
	Gvar_101 = Gvar_100
	Gvar_104 = 0
	Gvar_98 = true
	if true then return end
end
function ToggleSpikes1()
	ToggleObjectGroup(Gvar_61)
	AudioEvent("FloorSpikesUp",WaypointFromName("SpikeWP01"))
	AudioEvent("FloorSpikesDown",WaypointFromName("SpikeWP06"))
	AudioEvent("FloorSpikesUp",WaypointFromName("SpikeWP09"))
	WaitFrames(60,3)
	if true then return end
end
function ToggleSpikes2()
	ToggleObjectGroup(Gvar_62)
	AudioEvent("FloorSpikesDown",WaypointFromName("SpikeWP04"))
	AudioEvent("FloorSpikesUp",WaypointFromName("SpikeWP07"))
	AudioEvent("FloorSpikesDown",WaypointFromName("SpikeWP12"))
	WaitFrames(60,2)
	if true then return end
end
function GoToPost()
	var_0 = GetWaypointX(Gvar_94)
	var_1 = GetWaypointY(Gvar_94)
	var_2 = GetWaypointX(Gvar_95)
	var_3 = GetWaypointY(Gvar_95)
	MonsterGuardArea(Gvar_28,var_0,var_1,var_2,var_3,100)
	if true then return end
end
function SwitchSpikeState()
	DisableObjectGroup(Gvar_66[Gvar_104])
	if not Gvar_99 == true then 
		goto l62
	end
	Gvar_104 = Gvar_104 + 1
	if not Gvar_104 > 5 then 
		goto l38
	end
	Gvar_104 = 0
	::l38::
	EnableObjectGroup(Gvar_66[Gvar_104])
	AudioEvent("FloorSpikesUp",Gvar_97)
	WaitFrames(30,5)
	goto l63
	::l62::
	if true then return end
	::l63::
	if true then return end
end
function CloseWalls()
	CloseSecretWallGroup(Gvar_69)
	CloseSecretWallGroup(Gvar_70)
	if true then return end
end
function PlayCaves()
	PlayMusic(18,100)
	if true then return end
end
function PlayAction()
	PushMusicStack()
	PlayMusic(26,100)
	if true then return end
end
function MapEntry()
	PlayCaves()
	WallMakeSilent(false)
	if true then return end
end
function Secret01Declare()
	PrintToAll("GeneralPrint:SecretFound")
	TeleportWaypoint(Gvar_96,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_96)
	PlayerGiveExp(GetHostPlayer(),500)
	if true then return end
end
function Secret01Exit()
	OpenSecretWallGroup(Gvar_71)
	if true then return end
end
function Secret02Declare()
	DisableObjectGroup(Gvar_68)
	TeleportWaypoint(Gvar_96,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_96)
	PrintToAll("GeneralPrint:SecretFound")
	PlayerGiveExp(GetHostPlayer(),250)
	if true then return end
end
function Secret03Declare()
	PrintToAll("GeneralPrint:SecretFound")
	TeleportWaypoint(Gvar_96,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_96)
	PlayerGiveExp(GetHostPlayer(),50)
	if true then return end
end
function Secret04Declare()
	PrintToAll("GeneralPrint:SecretFound")
	TeleportWaypoint(Gvar_96,GetObjX(Trigger),GetObjY(Trigger))
	AudioEvent("SecretFound",Gvar_96)
	PlayerGiveExp(GetHostPlayer(),100)
	if true then return end
end
function SpikeTimerAudioLoop()
	if not Gvar_98 == false then 
		goto l31
	end
	AudioEvent("Gear1",Gvar_75)
	WaitFrames(Gvar_101,15)
	Gvar_101 = Gvar_101 - 1
	goto l38
	::l31::
	AudioEvent("TriggerPressed",Gvar_75)
	::l38::
	if true then return end
end
function ResetOgreSpikeDoor01()
	EnableObject(Gvar_4)
	EnableObject(Gvar_5)
	EnableObjectGroup(Gvar_55)
	LockDoor(Gvar_6)
	Gvar_98 = true
	Gvar_101 = Gvar_100
	if true then return end
end
function ToggleOgreTrapSpikes01()
	DisableObject(Gvar_4)
	DisableObject(Gvar_5)
	DisableObjectGroup(Gvar_55)
	if not Gvar_98 then 
		goto l42
	end
	UnlockDoor(Gvar_6)
	Gvar_98 = false
	SpikeTimerAudioLoop()
	WaitFrames(150,16)
	goto l54
	::l42::
	LockDoor(Gvar_6)
	Gvar_98 = true
	::l54::
	if true then return end
end
function MoveBlocks01()
	DisableObjectGroup(Gvar_57)
	DisableObjectGroup(Gvar_58)
	PlayAction()
	MoveTo(Gvar_7,Gvar_76)
	MoveTo(Gvar_8,Gvar_77)
	MoveTo(Gvar_9,Gvar_78)
	MoveTo(Gvar_10,Gvar_79)
	MoveTo(Gvar_11,Gvar_80)
	MoveTo(Gvar_12,Gvar_81)
	MoveTo(Gvar_13,Gvar_82)
	MoveTo(Gvar_14,Gvar_83)
	MoveTo(Gvar_15,Gvar_84)
	MoveTo(Gvar_16,Gvar_85)
	MoveTo(Gvar_17,Gvar_86)
	MoveTo(Gvar_18,Gvar_87)
	OpenSecretWallGroup(Gvar_69)
	EnableObject(Gvar_21)
	MonsterGoRoam(Gvar_21)
	if true then return end
end
function CallNextOgre()
	OpenSecretWallGroup(Gvar_70)
	EnableObject(Gvar_22)
	MonsterGoRoam(Gvar_22)
	if true then return end
end
function MoveBlocks02()
	var_0 = GetWaypointX(Gvar_90)
	var_1 = GetWaypointY(Gvar_90)
	TeleportObj(Gvar_19,var_0,var_1)
	PlayFX("BLUE_SPARKS",var_0,var_1,0,0)
	AudioEvent("KeyDrop",Gvar_90)
	EnableObject(Gvar_20)
	MoveTo(Gvar_9,Gvar_88)
	MoveTo(Gvar_10,Gvar_89)
	MoveTo(Gvar_7,Gvar_78)
	MoveTo(Gvar_8,Gvar_79)
	WaitFrames(45,6)
	PopMusicStack()
	if true then return end
end
function OpenWayOut()
	OpenSecretWallGroup(Gvar_74)
	if true then return end
end
function GetBuddy()
	MonsterSetRetreatRatio(Gvar_23,0)
	MoveTo(Gvar_23,Gvar_91)
	if true then return end
end
function FollowOgrePatrol01()
	if not ObjIsCaller(Gvar_23) then 
		goto l42
	end
	MonsterFollowObj(Trigger,Gvar_23)
	MonsterSetAggressiveness(Gvar_26,0.83)
	MonsterSetAggressiveness(Gvar_27,0.83)
	MonsterGoto(Gvar_23,GetObjX(GetHostPlayer()),GetObjY(GetHostPlayer()))
	::l42::
	if true then return end
end
function WaitASec()
	MonsterWait(Trigger,30)
	if true then return end
end
function Patrol()
	MonsterGoRoam(Trigger)
	if true then return end
end
function GoMedieval()
	if not ObjIsCaller(GetHostPlayer()) then 
		goto l13
	end
	MonsterSetAggressiveness(Trigger,0.83)
	::l13::
	if true then return end
end
function GoNormal()
	MonsterSetAggressiveness(Trigger,0.5)
	if true then return end
end
function StopAndListen()
	var_0 = RandomInteger(1,3)
	if not ObjIsCaller(GetHostPlayer()) and var_0 == 1 then 
		goto l62
	end
	MonsterWait(Trigger,45)
	ObjLookAtObj(Trigger,Caller)
	if not ObjCanInteractWith(Trigger,Caller) then 
		goto l57
	end
	MonsterSetAggressiveness(Trigger,0.5)
	goto l62
	::l57::
	MonsterIdle(Trigger)
	::l62::
	if true then return end
end
function ReturnHome()
	MonsterSetAggressiveness(Trigger,0.5)
	MonsterGotoHome(Trigger)
	if true then return end
end
function SpikeHall()
	DisableObjectGroup(Gvar_59)
	EnableObjectGroup(Gvar_60)
	ToggleSpikes1()
	if true then return end
end
function PressButton()
	AudioEvent("GruntRecognize",Gvar_93)
	MoveTo(Gvar_28,Gvar_92)
	MonsterSetAggressiveness(Gvar_29,0.83)
	MonsterSetAggressiveness(Gvar_30,0.83)
	MonsterSetAggressiveness(Gvar_31,0.83)
	WaitFrames(60,4)
	if true then return end
end
function OgrePressButton()
	WaitFrames(10,31)
	if true then return end
end
function LockCageDoor()
	if not DoorIsLocked(Gvar_32) == 0 then 
		goto l15
	end
	LockDoor(Gvar_32)
	goto l20
	::l15::
	UnlockDoor(Gvar_32)
	::l20::
	if true then return end
end
function FoundTreasureTrove()
	PrintToAll("War09c:FoundTrove")
	PlayerGiveExp(GetHostPlayer(),1000)
	if true then return end
end
function ToggleElevatorGroup3()
	ToggleObjectGroup(Gvar_65)
	if true then return end
end
function ToggleElevatorGroup1()
	ToggleObjectGroup(Gvar_63)
	if true then return end
end
function StartSpikes()
	DisableObjectGroup(Gvar_67)
	LockDoor(Gvar_33)
	WaitFrames(60,5)
	if true then return end
end
function UnlockSpikeSegRoomDoor()
	UnlockDoor(Gvar_33)
	Gvar_99 = false
	if true then return end
end
function CallSpitter1()
	MonsterGoRoam(Gvar_35)
	if true then return end
end
function SetSpitter1PathColor()
	MonsterSetWayFlag(Gvar_35,1 | 128)
	if true then return end
end
function LockPitDoor()
	LockDoor(Gvar_34)
	if true then return end
end
function UnlockPitDoor()
	UnlockDoor(Gvar_34)
	if true then return end
end
function ReleaseA()
	UnlockDoor(Gvar_36)
	UnlockDoor(Gvar_37)
	MonsterGoHunt(Gvar_48)
	if true then return end
end
function ReleaseB()
	UnlockDoor(Gvar_38)
	UnlockDoor(Gvar_39)
	MonsterGoHunt(Gvar_49)
	if true then return end
end
function ReleaseC()
	UnlockDoor(Gvar_40)
	UnlockDoor(Gvar_41)
	MonsterGoHunt(Gvar_50)
	if true then return end
end
function ReleaseD()
	UnlockDoor(Gvar_42)
	UnlockDoor(Gvar_43)
	MonsterGoHunt(Gvar_51)
	if true then return end
end
function ReleaseE()
	UnlockDoor(Gvar_44)
	UnlockDoor(Gvar_45)
	MonsterGoHunt(Gvar_52)
	if true then return end
end
function ReleaseF()
	UnlockDoor(Gvar_46)
	UnlockDoor(Gvar_47)
	MonsterGoHunt(Gvar_53)
	if true then return end
end
function ToggleElevatorGroup2()
	DisableObject(Gvar_54)
	ToggleObjectGroup(Gvar_64)
	PlayerGiveExp(GetHostPlayer(),2500)
	if true then return end
end
function PlayerDeath()
	DeathScreen(9)
	if true then return end
end
function MapInitialize()
	Gvar_6 = ObjFromName("OgreSpikeDoor01")
	Gvar_4 = ObjFromName("OgreTrapSpikePlate01")
	Gvar_5 = ObjFromName("OgreTrapSpikeSwitch01")
	Gvar_7 = ObjFromName("Block01")
	Gvar_8 = ObjFromName("Block02")
	Gvar_9 = ObjFromName("Block03")
	Gvar_10 = ObjFromName("Block04")
	Gvar_11 = ObjFromName("Block05")
	Gvar_12 = ObjFromName("Block06")
	Gvar_13 = ObjFromName("Block07")
	Gvar_14 = ObjFromName("Block08")
	Gvar_15 = ObjFromName("Block09")
	Gvar_16 = ObjFromName("Block10")
	Gvar_17 = ObjFromName("Block11")
	Gvar_18 = ObjFromName("Block12")
	Gvar_19 = ObjFromName("SilverKey")
	Gvar_20 = ObjFromName("SilverKeyLight")
	Gvar_21 = ObjFromName("OgreFighter01")
	Gvar_22 = ObjFromName("OgreFighter02")
	Gvar_23 = ObjFromName("OgrePatrol01")
	Gvar_24 = ObjFromName("OgrePatrol02")
	Gvar_25 = ObjFromName("OgrePatrol03")
	Gvar_26 = ObjFromName("OgrePatrolBuddy01")
	Gvar_27 = ObjFromName("OgrePatrolBuddy02")
	Gvar_28 = ObjFromName("ButtonPresser")
	Gvar_29 = ObjFromName("OgrePsycho01")
	Gvar_30 = ObjFromName("OgrePsycho02")
	Gvar_31 = ObjFromName("OgrePsycho03")
	Gvar_32 = ObjFromName("CageDoor")
	Gvar_33 = ObjFromName("SpikeSegRoomDoor")
	Gvar_34 = ObjFromName("CrumblingPitDoor")
	Gvar_36 = ObjFromName("CreaturePitDoorA1")
	Gvar_37 = ObjFromName("CreaturePitDoorA2")
	Gvar_38 = ObjFromName("CreaturePitDoorB1")
	Gvar_39 = ObjFromName("CreaturePitDoorB2")
	Gvar_40 = ObjFromName("CreaturePitDoorC1")
	Gvar_41 = ObjFromName("CreaturePitDoorC2")
	Gvar_42 = ObjFromName("CreaturePitDoorD1")
	Gvar_43 = ObjFromName("CreaturePitDoorD2")
	Gvar_44 = ObjFromName("CreaturePitDoorE1")
	Gvar_45 = ObjFromName("CreaturePitDoorE2")
	Gvar_46 = ObjFromName("CreaturePitDoorF1")
	Gvar_47 = ObjFromName("CreaturePitDoorF2")
	Gvar_48 = ObjFromName("CreatureA")
	Gvar_49 = ObjFromName("CreatureB")
	Gvar_50 = ObjFromName("CreatureC")
	Gvar_51 = ObjFromName("CreatureD")
	Gvar_52 = ObjFromName("CreatureE")
	Gvar_53 = ObjFromName("CreatureF")
	Gvar_105 = ObjFromName("CreaturePitElev")
	Gvar_54 = ObjFromName("CreaturePitSwitch")
	Gvar_55 = ObjGroupFromName("OgreTrapSpikes01")
	Gvar_57 = ObjGroupFromName("BlockTrigger01")
	Gvar_56 = ObjGroupFromName("BlockMoverGroup01")
	Gvar_58 = ObjGroupFromName("SecretLight01")
	Gvar_59 = ObjGroupFromName("SpikeHallTriggers")
	Gvar_60 = ObjGroupFromName("SpikeMoverGroup")
	Gvar_61 = ObjGroupFromName("HallSpikes1")
	Gvar_62 = ObjGroupFromName("HallSpikes2")
	Gvar_66[0] = ObjGroupFromName("SpikeSeg01")
	Gvar_66[1] = ObjGroupFromName("SpikeSeg02")
	Gvar_66[2] = ObjGroupFromName("SpikeSeg03")
	Gvar_66[3] = ObjGroupFromName("SpikeSeg04")
	Gvar_66[4] = ObjGroupFromName("SpikeSeg05")
	Gvar_66[5] = ObjGroupFromName("SpikeSeg06")
	Gvar_67 = ObjGroupFromName("SpikeSegTriggers")
	Gvar_68 = ObjGroupFromName("Secret02Triggers")
	Gvar_63 = ObjGroupFromName("ElevatorGroup1")
	Gvar_64 = ObjGroupFromName("ElevatorGroup2")
	Gvar_65 = ObjGroupFromName("ElevatorGroup3")
	Gvar_69 = WallGroupFromName("SecretWallGroup01")
	Gvar_70 = WallGroupFromName("SecretWallGroup02")
	Gvar_71 = WallGroupFromName("Secret01Wall")
	Gvar_72 = WallGroupFromName("SecretHallWalls01")
	Gvar_73 = WallGroupFromName("CreaturePitWalls")
	Gvar_74 = WallGroupFromName("WayOut")
	Gvar_75 = WaypointFromName("SpikeTimerAudioOrigin")
	Gvar_76 = WaypointFromName("BlockWP01")
	Gvar_77 = WaypointFromName("BlockWP02")
	Gvar_78 = WaypointFromName("BlockWP03")
	Gvar_79 = WaypointFromName("BlockWP04")
	Gvar_80 = WaypointFromName("BlockWP05")
	Gvar_81 = WaypointFromName("BlockWP06")
	Gvar_82 = WaypointFromName("BlockWP07")
	Gvar_83 = WaypointFromName("BlockWP08")
	Gvar_84 = WaypointFromName("BlockWP09")
	Gvar_85 = WaypointFromName("BlockWP10")
	Gvar_86 = WaypointFromName("BlockWP11")
	Gvar_87 = WaypointFromName("BlockWP12")
	Gvar_88 = WaypointFromName("BlockWP13")
	Gvar_89 = WaypointFromName("BlockWP14")
	Gvar_90 = WaypointFromName("SilverKeySpot")
	Gvar_91 = WaypointFromName("BuddyWP")
	Gvar_92 = WaypointFromName("ButtonLocationWP")
	Gvar_93 = WaypointFromName("OgreAudioOrigin")
	Gvar_94 = WaypointFromName("PostWP")
	Gvar_95 = WaypointFromName("FacingWP")
	Gvar_96 = WaypointFromName("PlayerSounds")
	Gvar_97 = WaypointFromName("RoomSounds")
	LockDoor(Gvar_36)
	LockDoor(Gvar_37)
	LockDoor(Gvar_38)
	LockDoor(Gvar_39)
	LockDoor(Gvar_40)
	LockDoor(Gvar_41)
	LockDoor(Gvar_42)
	LockDoor(Gvar_43)
	LockDoor(Gvar_44)
	LockDoor(Gvar_45)
	LockDoor(Gvar_46)
	LockDoor(Gvar_47)
	CinematicFadeout()
	if true then return end
end