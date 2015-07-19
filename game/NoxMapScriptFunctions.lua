mapscriptenv = {}

function mapscriptenv.GetWallAt(intArgument, intArgument)
	return
end
function mapscriptenv.OpenSecretWall(intArgument)
	return
end
function mapscriptenv.OpenSecretWallGroup(intArgument)
	return
end
function mapscriptenv.CloseSecretWall(intArgument)
	return
end
function mapscriptenv.CloseSecretWallGroup(intArgument)
	return
end
function mapscriptenv.ToggleSecretWall(intArgument)
	return
end
function mapscriptenv.ToggleSecretWallGroup(intArgument)
	return
end
function mapscriptenv.BreakWall(intArgument)
	return
end
function mapscriptenv.BreakWallGroup(intArgument)
	return
end
function mapscriptenv.WaitSeconds(intArgument, intArgument)
	return
end
function mapscriptenv.WaitFrames(intArgument, intArgument)
	return
end
function mapscriptenv.MoveTo(intArgument, intArgument)
	return
end
function mapscriptenv.GroupMoveTo(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterFaceObj(intArgument, intArgument)
	return
end
function mapscriptenv.GroupFaceObj(intArgument, intArgument)
	return
end
function mapscriptenv.EnableObject(object)
	object.isDisabled = false
	return
end
function mapscriptenv.EnableObjectGroup(objects)
	for k,v in pairs(objects) do
		v.isDisabled = false
	end
end
function mapscriptenv.EnableWaypoint(waypoint)
	waypoint.isDisabled = false
	return
end
function mapscriptenv.EnableWaypointGroup(waypoints)
	for k,v in pairs(waypoints) do
		v.isDisabled = false
	end
	return
end
function mapscriptenv.DisableObject(object)
	object.isDisabled = true
	return
end
function mapscriptenv.DisableObjectGroup(objects)
	for k,v in pairs(objects) do
		v.isDisabled = true
	end
	return
end
function mapscriptenv.DisableWaypoint(intArgument)
	waypoint.isDisabled = true
	return
end
function mapscriptenv.DisableWaypointGroup(waypoints)
	for k,v in pairs(waypoints) do
		v.isDisabled = true
	end
	return
end
function mapscriptenv.ToggleObject(intArgument)
	return
end
function mapscriptenv.ToggleObjectGroup(intArgument)
	return
end
function mapscriptenv.ToggleWaypoint(intArgument)
	return
end
function mapscriptenv.ToggleWaypointGroup(intArgument)
	return
end
function mapscriptenv.DeleteObject(intArgument)
	return
end
function mapscriptenv.DeleteObjectGroup(intArgument)
	return
end
function mapscriptenv.MonsterGoRoam(intArgument)
	return
end
function mapscriptenv.GroupMonsterGoRoam(intArgument)
	return
end
function mapscriptenv.Unknown1(intArgument)
	return
end
function mapscriptenv.Unknown2(intArgument)
	return
end
function mapscriptenv.MonsterGotoHome(intArgument)
	return
end
function mapscriptenv.AudioEvent(stringArgument, intArgument)
	return
end
function mapscriptenv.Print(stringArgument)
	return
end
function mapscriptenv.PrintToAll(stringArgument)
	return
end
function mapscriptenv.SayChat(intArgument, stringArgument)
	return
end
function mapscriptenv.ExitFunction()
	return
end
function mapscriptenv.UnlockDoor(door)
	return door.door:unlock()
end
function mapscriptenv.LockDoor(door)
	return door.door:lock()
end
function mapscriptenv.ObjIsEnabled(intArgument)
	return
end
function mapscriptenv.WaypointIsEnabled(intArgument)
	return
end
function mapscriptenv.DoorIsLocked(door)
	return door.door.isLocked
end
function mapscriptenv.RandomFloat(floatArgument, floatArgument)
	return
end
function mapscriptenv.RandomInteger(intArgument, intArgument)
	return
end
function mapscriptenv.WaitSecondsSpecial(intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.WaitSpecial(intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.IntToString(intArgument)
	return
end
function mapscriptenv.FloatToString(floatArgument)
	return
end
function mapscriptenv.SpawnObject(stringArgument, intArgument)
	return
end
function mapscriptenv.DamageObject(intArgument, intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.DamageObjectGroup(intArgument, intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.Unknown3(intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.Unknown4(intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.AwardSpell(intArgument, stringArgument)
	return
end
function mapscriptenv.AwardSpellGroup(intArgument, stringArgument)
	return
end
function mapscriptenv.ApplyEnchant(intArgument, stringArgument, floatArgument)
	return
end
function mapscriptenv.GroupApplyEnchant(intArgument, stringArgument, floatArgument)
	return
end
function mapscriptenv.GetHostPlayer()
	return localplayer
end
function mapscriptenv.ObjFromName(name)
	return NoxMap:GetByScriptName(name)
end
function mapscriptenv.GetObjX(intArgument)
	return
end
function mapscriptenv.GetWaypointX(intArgument)
	return
end
function mapscriptenv.GetObjY(intArgument)
	return
end
function mapscriptenv.GetWaypointY(intArgument)
	return
end
function mapscriptenv.GetObjHeight(intArgument)
	return
end
function mapscriptenv.GetObjFacing(intArgument)
	return
end
function mapscriptenv.TeleportObj(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.TeleportWaypoint(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.SetObjHeight(intArgument, floatArgument)
	return
end
function mapscriptenv.SetObjFacing(intArgument, intArgument)
	return
end
function mapscriptenv.PushObjectVector(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.PushObject(intArgument, floatArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.InvGetTopObj(intArgument)
	return
end
function mapscriptenv.InvGetNextObj(intArgument)
	return
end
function mapscriptenv.DoesHaveObject(intArgument, intArgument)
	return
end
function mapscriptenv.GetInvHolder(intArgument)
	return
end
function mapscriptenv.InvPutObj(intArgument, intArgument)
	return
end
function mapscriptenv.InvDropObj(intArgument, intArgument)
	return
end
function mapscriptenv.CheckObjClass(intArgument, stringArgument)
	return
end
function mapscriptenv.Unknown5()
	return
end
function mapscriptenv.IsEnchantActive(intArgument, stringArgument)
	return
end
function mapscriptenv.CancelEnchant(intArgument, stringArgument)
	return
end
function mapscriptenv.GetObjHealth(intArgument)
	return
end
function mapscriptenv.GetObjMaxHealth(intArgument)
	return
end
function mapscriptenv.ObjAddHealth(intArgument, intArgument)
	return
end
function mapscriptenv.GetDistance(floatArgument, floatArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.ObjCanInteractWith(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown6(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown7(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown8(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown9(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown10(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown11(intArgument, intArgument)
	return
end
function mapscriptenv.Unknown12(stringArgument)
	return
end
function mapscriptenv.GetServerInfo(intArgument)
	return
end
function mapscriptenv.ObjLookAtObj(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterGoto(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupGoto(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.CancelWait(intArgument)
	return
end
function mapscriptenv.PlayFX(stringArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.ObjSetMaster(intArgument, intArgument)
	return
end
function mapscriptenv.ObjGroupSetMaster(intArgument, intArgument)
	return
end
function mapscriptenv.ObjSetMasterGroup(intArgument, intArgument)
	return
end
function mapscriptenv.ObjGroupSetMasterObjGroup(intArgument, intArgument)
	return
end
function mapscriptenv.ObjIsMasterTo(intArgument, intArgument)
	return
end
function mapscriptenv.ObjIsMasteredByGroup(intArgument, intArgument)
	return
end
function mapscriptenv.UnknownMasterCheck(intArgument, intArgument)
	return
end
function mapscriptenv.GroupIsMasteredByObj(intArgument, intArgument)
	return
end
function mapscriptenv.ObjResetMaster(intArgument)
	return
end
function mapscriptenv.WaypointFromName(waypointname)
	return NoxMap:GetWaypointByName(waypointname)
end
function mapscriptenv.WaypointGroupFromName(stringArgument)
	return {}
end
function mapscriptenv.ObjGroupFromName(groupname)
	return NoxMap:GetGroupByShortName(groupname)
end
function mapscriptenv.WallGroupFromName(stringArgument)
	return
end
function mapscriptenv.SayForSeconds(intArgument, stringArgument, intArgument)
	return
end
function mapscriptenv.SayForFrames(intArgument, stringArgument, intArgument)
	return
end
function mapscriptenv.Unknown13(intArgument, intArgument)
	return
end
function mapscriptenv.CancelChat(intArgument)
	return
end
function mapscriptenv.RemoveAllChat()
	return
end
function mapscriptenv.JournalSetObjective(intArgument, stringArgument)
	return
end
function mapscriptenv.JournalSetObjectiveBool(intArgument, stringArgument)
	return
end
function mapscriptenv.JournalSetQuest(stringArgument)
	return 1
end
function mapscriptenv.JournalSetQuestBool(stringArgument)
	return
end
function mapscriptenv.JournalRestoreQuestStatus(stringArgument)
	return
end
function mapscriptenv.ObjIsTrigger(intArgument)
	return
end
function mapscriptenv.ObjIsCaller(intArgument)
	return
end
function mapscriptenv.SetupDialog(intArgument, stringArgument, intArgument, intArgument)
	return
end
function mapscriptenv.CancelDialog(intArgument)
	return
end
function mapscriptenv.SetDialogPortrait(intArgument, stringArgument)
	return
end
function mapscriptenv.StartDialogWithCaller(stringArgument, stringArgument)
	return
end
function mapscriptenv.ForceDialog(intArgument, intArgument)
	return
end
function mapscriptenv.ApplySpellObjObj(stringArgument, intArgument, intArgument)
	return
end
function mapscriptenv.ApplySpellObjXY(stringArgument, intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.ApplySpellXYObj(stringArgument, floatArgument, floatArgument, intArgument)
	return
end
function mapscriptenv.ApplySpellXYXY(stringArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.CinematicFadeout()
	return
end
function mapscriptenv.CinematicFade()
	return
end
function mapscriptenv.CinematicBorders(intArgument)
	return
end
function mapscriptenv.GetElevatorState(intArgument)
	return
end
function mapscriptenv.MonsterGuardArea(intArgument, floatArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupGuardArea(intArgument, floatArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGoHunt(intArgument)
	return
end
function mapscriptenv.MonsterGroupGoHunt(intArgument)
	return
end
function mapscriptenv.MonsterIdle(intArgument)
	return
end
function mapscriptenv.MonsterGroupIdle(intArgument)
	return
end
function mapscriptenv.MonsterFollowObj(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterGroupFollowObj(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterSetAggressiveness(intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupSetAggressiveness(intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterAttackMelee(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupAttackMelee(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterAttackRanged(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupAttackRanged(intArgument, floatArgument, floatArgument)
	return
end
function mapscriptenv.MonsterSetWayFlag(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterGroupSetWayFlag(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterGoFight(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterGroupGoFight(intArgument, intArgument)
	return
end
function mapscriptenv.JournalAddEntry(intArgument, stringArgument, intArgument)
	return
end
function mapscriptenv.JournalRemoveEntry(intArgument, stringArgument)
	return
end
function mapscriptenv.JournalUpdateEntry(intArgument, stringArgument, intArgument)
	return
end
function mapscriptenv.MonsterSetRetreatRatio(intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupSetRetreatRatio(intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterSetResumeRatio(intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupSetResumeRatio(intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterFleeFrom(intArgument, intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterGroupFleeFrom(intArgument, intArgument, floatArgument)
	return
end
function mapscriptenv.MonsterWait(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterGroupWait(intArgument, intArgument)
	return
end
function mapscriptenv.ObjIsHostileTo(intArgument, intArgument)
	return
end
function mapscriptenv.PlayerGetGold(intArgument)
	return
end
function mapscriptenv.PlayerAddGold(intArgument, intArgument)
	return
end
function mapscriptenv.DialogGetResult(intArgument)
	return
end
function mapscriptenv.PlayerGiveExp(intArgument, floatArgument)
	return
end
function mapscriptenv.CheckInvObjNamed(intArgument, stringArgument)
	return
end
function mapscriptenv.ForceAutosave()
	return
end
function mapscriptenv.PlayMusic(songnr, volume)
	return music:playByNr(songnr, volume)
end
function mapscriptenv.StartScreen(intArgument)
	return
end
function mapscriptenv.HostPlayerIsTalking()
	return
end
function mapscriptenv.ScriptTrigger()
	return
end
function mapscriptenv.ScriptCaller()
	return
end
function mapscriptenv.ObjSetMasterByHost(intArgument)
	return
end
function mapscriptenv.ObjClearMaster(intArgument)
	return
end
function mapscriptenv.MonsterMakeFriendly(intArgument)
	return
end
function mapscriptenv.MonsterMakeHostile(intArgument)
	return
end
function mapscriptenv.UnkSubclassCheck1(intArgument)
	return
end
function mapscriptenv.UnkSubclassCheck2(intArgument)
	return
end
function mapscriptenv.SetOblivionStatus(intArgument)
	return
end
function mapscriptenv.DeathScreen(intArgument)
	return
end
function mapscriptenv.ObjFreeze(intArgument, intArgument)
	return
end
function mapscriptenv.WallMakeSilent(intArgument)
	return
end
function mapscriptenv.MonsterEventScript(intArgument, intArgument, intArgument)
	return
end
function mapscriptenv.ObjSetDecayTime(intArgument, intArgument)
	return
end
function mapscriptenv.MonsterTrapSpells(intArgument, stringArgument, stringArgument, stringArgument)
	return
end
function mapscriptenv.HostPlayerIsTrading()
	return
end
function mapscriptenv.RemovePrintMessages(intArgument)
	return
end
function mapscriptenv.SetShopkeeperGreet(intArgument, stringArgument)
	return
end
function mapscriptenv.Unknown14()
	return
end
function mapscriptenv.Unknown15(intArgument)
	return
end
function mapscriptenv.ZombieStayDead(intArgument)
	return
end
function mapscriptenv.ZombieGroupStayDead(intArgument)
	return
end
function mapscriptenv.ZombieStandUp(intArgument)
	return
end
function mapscriptenv.ZombieGroupStandUp(intArgument)
	return
end
function mapscriptenv.PushMusicStack()
	return
end
function mapscriptenv.PopMusicStack()
	return
end
function mapscriptenv.ResetMusic()
	return
end
function mapscriptenv.ObjIsGameBall(intArgument)
	return
end
function mapscriptenv.ObjIsCrown(intArgument)
	return
end
function mapscriptenv.ExitLevel(intArgument)
	return
end
function mapscriptenv.BlackScreen()
	return
end
function mapscriptenv.PlayerAddLessons(intArgument, intArgument)
	return
end
function mapscriptenv.PlayerGetLessons(intArgument)
	return
end