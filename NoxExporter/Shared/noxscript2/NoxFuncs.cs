/*
 * MapEditor
 * Пользователь: AngryKirC
 * Дата: 10.04.2015
 */
using System;
using System.Collections.Generic;
using TVarType = MapEditor.noxscript2.ScriptObjContainer.VarType;

namespace MapEditor.noxscript2
{
	/// <summary>
	/// Class containing descriptors for Nox exported functions
	/// </summary>
	public static class NoxFuncs
	{
		public static FunctionInfo[] AllFunctions;
        public static List<string> FunctionNames;

		public struct FunctionInfo
		{
			public string Name;
			public TVarType[] Arguments;
			public int ArgsCount
			{
				get
				{
					if (Arguments == null) return 0;
					return Arguments.Length;
				}
			}
			public TVarType ReturnType;
			
			public FunctionInfo(string name, TVarType returnType, params TVarType[] arguments)
			{
				Name = name;
				Arguments = arguments;
				ReturnType = returnType;
			}

            public override string ToString()
            {
                return Name;
            }
		}
	
		static NoxFuncs()
		{
			List<FunctionInfo> allFunctions = new List<FunctionInfo>();
			allFunctions.Add(new FunctionInfo("GetWallAt", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
			allFunctions.Add(new FunctionInfo("OpenSecretWall", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("OpenSecretWallGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("CloseSecretWall", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("CloseSecretWallGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ToggleSecretWall", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ToggleSecretWallGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("BreakWall", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("BreakWallGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WaitSeconds", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WaitFrames", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MoveTo", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GroupMoveTo", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterFaceObj", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GroupFaceObj", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("EnableObject", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("EnableObjectGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("EnableWaypoint", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("EnableWaypointGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DisableObject", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DisableObjectGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DisableWaypoint", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DisableWaypointGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ToggleObject", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ToggleObjectGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ToggleWaypoint", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ToggleWaypointGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DeleteObject", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DeleteObjectGroup", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGoRoam", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GroupMonsterGoRoam", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown1", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown2", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGotoHome", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("AudioEvent", TVarType.GENERIC, TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Print", TVarType.GENERIC, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("PrintToAll", TVarType.GENERIC, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("SayChat", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("ExitFunction", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("UnlockDoor", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("LockDoor", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjIsEnabled", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WaypointIsEnabled", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DoorIsLocked", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("RandomFloat", TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("RandomInteger", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WaitSecondsSpecial", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WaitSpecial", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("IntToString", TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("FloatToString", TVarType.STRING, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("SpawnObject", TVarType.INTEGER, TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DamageObject", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DamageObjectGroup", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown3", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown4", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("AwardSpell", TVarType.INTEGER, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("AwardSpellGroup", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("ApplyEnchant", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("GroupApplyEnchant", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("GetHostPlayer", TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjFromName", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("GetObjX", TVarType.FLOAT, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetWaypointX", TVarType.FLOAT, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetObjY", TVarType.FLOAT, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetWaypointY", TVarType.FLOAT, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetObjHeight", TVarType.FLOAT, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetObjFacing", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("TeleportObj", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("TeleportWaypoint", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("SetObjHeight", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("SetObjFacing", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PushObjectVector", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("PushObject", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("InvGetTopObj", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("InvGetNextObj", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DoesHaveObject", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetInvHolder", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("InvPutObj", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("InvDropObj", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("CheckObjClass", TVarType.INTEGER, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("Unknown5", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("IsEnchantActive", TVarType.INTEGER, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("CancelEnchant", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("GetObjHealth", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetObjMaxHealth", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjAddHealth", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetDistance", TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("ObjCanInteractWith", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown6", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown7", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown8", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown9", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown10", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown11", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown12", TVarType.STRING, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("GetServerInfo", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjLookAtObj", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGoto", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupGoto", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("CancelWait", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PlayFX", TVarType.GENERIC, TVarType.STRING, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("ObjSetMaster", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjGroupSetMaster", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjSetMasterGroup", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjGroupSetMasterObjGroup", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjIsMasterTo", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjIsMasteredByGroup", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("UnknownMasterCheck", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GroupIsMasteredByObj", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjResetMaster", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WaypointFromName", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("WaypointGroupFromName", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("ObjGroupFromName", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("WallGroupFromName", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("SayForSeconds", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("SayForFrames", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("Unknown13", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("CancelChat", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("RemoveAllChat", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("JournalSetObjective", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("JournalSetObjectiveBool", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("JournalSetQuest", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("JournalSetQuestBool", TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("JournalRestoreQuestStatus", TVarType.GENERIC, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("ObjIsTrigger", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjIsCaller", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("SetupDialog", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("CancelDialog", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("SetDialogPortrait", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("StartDialogWithCaller", TVarType.GENERIC, TVarType.STRING, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("ForceDialog", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ApplySpellObjObj", TVarType.GENERIC, TVarType.STRING, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ApplySpellObjXY", TVarType.GENERIC, TVarType.STRING, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("ApplySpellXYObj", TVarType.GENERIC, TVarType.STRING, TVarType.FLOAT, TVarType.FLOAT, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ApplySpellXYXY", TVarType.GENERIC, TVarType.STRING, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("CinematicFadeout", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("CinematicFade", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("CinematicBorders", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("GetElevatorState", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGuardArea", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupGuardArea", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGoHunt", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGroupGoHunt", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterIdle", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGroupIdle", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterFollowObj", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGroupFollowObj", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterSetAggressiveness", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupSetAggressiveness", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterAttackMelee", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupAttackMelee", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterAttackRanged", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupAttackRanged", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterSetWayFlag", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGroupSetWayFlag", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGoFight", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGroupGoFight", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("JournalAddEntry", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("JournalRemoveEntry", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("JournalUpdateEntry", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterSetRetreatRatio", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupSetRetreatRatio", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterSetResumeRatio", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupSetResumeRatio", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterFleeFrom", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterGroupFleeFrom", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("MonsterWait", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterGroupWait", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjIsHostileTo", TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PlayerGetGold", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PlayerAddGold", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DialogGetResult", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PlayerGiveExp", TVarType.GENERIC, TVarType.INTEGER, TVarType.FLOAT));
		    allFunctions.Add(new FunctionInfo("CheckInvObjNamed", TVarType.INTEGER, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("ForceAutosave", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("PlayMusic", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("StartScreen", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("HostPlayerIsTalking", TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ScriptTrigger", TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ScriptCaller", TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjSetMasterByHost", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjClearMaster", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterMakeFriendly", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterMakeHostile", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("UnkSubclassCheck1", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("UnkSubclassCheck2", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("SetOblivionStatus", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("DeathScreen", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjFreeze", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("WallMakeSilent", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterEventScript", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjSetDecayTime", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("MonsterTrapSpells", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING, TVarType.STRING, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("HostPlayerIsTrading", TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("RemovePrintMessages", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("SetShopkeeperGreet", TVarType.GENERIC, TVarType.INTEGER, TVarType.STRING));
		    allFunctions.Add(new FunctionInfo("Unknown14", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("Unknown15", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ZombieStayDead", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ZombieGroupStayDead", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ZombieStandUp", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ZombieGroupStandUp", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PushMusicStack", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("PopMusicStack", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("ResetMusic", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("ObjIsGameBall", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ObjIsCrown", TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("ExitLevel", TVarType.GENERIC, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("BlackScreen", TVarType.GENERIC));
		    allFunctions.Add(new FunctionInfo("PlayerAddLessons", TVarType.GENERIC, TVarType.INTEGER, TVarType.INTEGER));
		    allFunctions.Add(new FunctionInfo("PlayerGetLessons", TVarType.INTEGER, TVarType.INTEGER));
		    AllFunctions = allFunctions.ToArray();
            FunctionNames = new List<string>();
            foreach (FunctionInfo fi in allFunctions) FunctionNames.Add(fi.Name);
		    allFunctions.Clear();
		}
	}
}
