local function getFuncNameById(id)
	for k,v in pairs(mapscriptenv._functions) do
		if (v-1) == id then
			return k
		end
	end
end

local function deferCall(name, time)
	local callinfo = {}
	callinfo.functionName = name
	callinfo.callTime = time

	table.insert(NoxMapScript.defferedCalls, callinfo)
end

mapscriptenv = {}
mapscriptenv.string = string
mapscriptenv.getmetatable = getmetatable

local sm = getmetatable("")

sm.__add = function(x,y)
	return x .. y
end

function mapscriptenv.GetWallAt(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.OpenSecretWall(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.OpenSecretWallGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CloseSecretWall(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CloseSecretWallGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ToggleSecretWall(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ToggleSecretWallGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.BreakWall(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.BreakWallGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.WaitSeconds(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.WaitFrames(functionid, waittime)
	deferCall(getFuncNameById(functionid), love.timer.getTime() + waittime / 30)
end
function mapscriptenv.MoveTo(moverobj, waypoint)
	if moverobj and moverobj.mapXfer then
		moverobj.mapXfer.WaypointID = waypoint.num

	end
end
function mapscriptenv.GroupMoveTo(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterFaceObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GroupFaceObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
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
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ToggleObjectGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ToggleWaypoint(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ToggleWaypointGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DeleteObject(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DeleteObjectGroup(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGoRoam(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GroupMonsterGoRoam(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown1(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown2(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGotoHome(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.AudioEvent(name, objlocation)
	audio:emitSoundByMapping(objlocation, name)	
end
function mapscriptenv.Print(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PrintToAll(str)
	print(str) -- @todo
end
function mapscriptenv.SayChat(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ExitFunction()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.UnlockDoor(door)
	if door and door.door then
		return door.door:unlock()
	end
end
function mapscriptenv.LockDoor(door)
	if door and door.door then
		return door.door:lock()
	end
end
function mapscriptenv.ObjIsEnabled(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.WaypointIsEnabled(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DoorIsLocked(door)
	return door.door.isLocked
end
function mapscriptenv.RandomFloat(floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.RandomInteger(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.WaitSecondsSpecial(intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.WaitSpecial(intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.IntToString(intArgument)
	return tostring(intArgument)
end
function mapscriptenv.FloatToString(floatArgument)
	return tostring(floatArgument)
end
function mapscriptenv.SpawnObject(stringArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DamageObject(intArgument, intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DamageObjectGroup(intArgument, intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown3(intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown4(intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.AwardSpell(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.AwardSpellGroup(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ApplyEnchant(intArgument, stringArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GroupApplyEnchant(intArgument, stringArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetHostPlayer()
	return localplayer
end
function mapscriptenv.ObjFromName(name)
	return NoxMap:GetByScriptName(name)
end
function mapscriptenv.GetObjX(obj)
	return obj.x
end
function mapscriptenv.GetWaypointX(wp)
	return wp.Point.X
end
function mapscriptenv.GetObjY(obj)
	return obj.y
end
function mapscriptenv.GetWaypointY(wp)
	return wp.Point.Y
end
function mapscriptenv.GetObjHeight(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetObjFacing(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.TeleportObj(obj, x, y)
	obj:setPositionDelayed(x,y)
end
function mapscriptenv.TeleportWaypoint(wp, x, y)
	wp.Point.X = x
	wp.Point.Y = y
end
function mapscriptenv.SetObjHeight(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SetObjFacing(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PushObjectVector(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PushObject(intArgument, floatArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.InvGetTopObj(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.InvGetNextObj(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DoesHaveObject(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetInvHolder(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.InvPutObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.InvDropObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CheckObjClass(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown5()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.IsEnchantActive(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CancelEnchant(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetObjHealth(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetObjMaxHealth(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjAddHealth(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetDistance(floatArgument, floatArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjCanInteractWith(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown6(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown7(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown8(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown9(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown10(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown11(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown12(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GetServerInfo(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjLookAtObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGoto(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupGoto(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CancelWait(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayFX(stringArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjSetMaster(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjGroupSetMaster(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjSetMasterGroup(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjGroupSetMasterObjGroup(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsMasterTo(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsMasteredByGroup(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.UnknownMasterCheck(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.GroupIsMasteredByObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjResetMaster(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.WaypointFromName(waypointname)
	return NoxMap:GetWaypointByShortName(waypointname)
end
function mapscriptenv.WaypointGroupFromName(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name); 
	return {}
end
function mapscriptenv.ObjGroupFromName(groupname)
	return NoxMap:GetGroupByShortName(groupname)
end
function mapscriptenv.WallGroupFromName(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SayForSeconds(intArgument, stringArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SayForFrames(intArgument, stringArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown13(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CancelChat(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.RemoveAllChat()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalSetObjective(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalSetObjectiveBool(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalSetQuest(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalSetQuestBool(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalRestoreQuestStatus(stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsTrigger(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsCaller(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SetupDialog(converseobj, conversarg, initiateScriptID, exitScriptID)
	converseobj.setupDialog = {}
	converseobj.setupDialog.conversarg = conversarg
	converseobj.setupDialog.initFunction = getFuncNameById(initiateScriptID)
	converseobj.setupDialog.exitFucntion = getFuncNameById(exitScriptID)
end
function mapscriptenv.CancelDialog(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SetDialogPortrait(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.StartDialogWithCaller(soundname, whattosay)
	audio:emitSoundByMapping(NoxMapScript.lastObject, soundname)
	
	local obj = NoxMapScript.lastObject or localplayer
	obj.player:dialogText(whattosay)
end
function mapscriptenv.ForceDialog(target, player)
	if target.setupDialog then
		print(target.setupDialog.initFunction)
		NoxMapScript.lastObject = player
		mapscriptenv[target.setupDialog.initFunction]()
		mapscriptenv[target.setupDialog.exitFucntion]()
	end

	
end
function mapscriptenv.ApplySpellObjObj(stringArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ApplySpellObjXY(stringArgument, intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ApplySpellXYObj(stringArgument, floatArgument, floatArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ApplySpellXYXY(stringArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CinematicFadeout()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CinematicFade()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.CinematicBorders(isEnabled)
	NoxInterface.shouldDrawCinematicBorders = isEnabled
end
function mapscriptenv.GetElevatorState(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGuardArea(intArgument, floatArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupGuardArea(intArgument, floatArgument, floatArgument, floatArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGoHunt(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupGoHunt(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterIdle(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupIdle(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterFollowObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupFollowObj(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterSetAggressiveness(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupSetAggressiveness(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterAttackMelee(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupAttackMelee(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterAttackRanged(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupAttackRanged(intArgument, floatArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterSetWayFlag(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupSetWayFlag(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGoFight(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupGoFight(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalAddEntry(intArgument, stringArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalRemoveEntry(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.JournalUpdateEntry(intArgument, stringArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterSetRetreatRatio(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupSetRetreatRatio(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterSetResumeRatio(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupSetResumeRatio(intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterFleeFrom(intArgument, intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupFleeFrom(intArgument, intArgument, floatArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterWait(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterGroupWait(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsHostileTo(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayerGetGold(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayerAddGold(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DialogGetResult(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayerGiveExp(player, amount)
	if player.player then
		player.player:givexp(amount)
	end
end
function mapscriptenv.CheckInvObjNamed(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ForceAutosave()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayMusic(songnr, volume)
	return audio:playMusicByNr(songnr, volume)
end
function mapscriptenv.StartScreen(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.HostPlayerIsTalking()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ScriptTrigger()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ScriptCaller()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjSetMasterByHost(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjClearMaster(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterMakeFriendly(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterMakeHostile(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.UnkSubclassCheck1(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.UnkSubclassCheck2(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SetOblivionStatus(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.DeathScreen(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjFreeze(obj, isfrozen)
	obj.isfrozen = isfrozen
end
function mapscriptenv.WallMakeSilent(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterEventScript(intArgument, intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjSetDecayTime(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.MonsterTrapSpells(intArgument, stringArgument, stringArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.HostPlayerIsTrading()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.RemovePrintMessages(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.SetShopkeeperGreet(intArgument, stringArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown14()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.Unknown15(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ZombieStayDead(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ZombieGroupStayDead(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ZombieStandUp(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ZombieGroupStandUp(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PushMusicStack()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PopMusicStack()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ResetMusic()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsGameBall(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ObjIsCrown(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.ExitLevel(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.BlackScreen()
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayerAddLessons(intArgument, intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end
function mapscriptenv.PlayerGetLessons(intArgument)
	print("Unimplemented map function was called: " .. debug.getinfo(1, "n").name);
end