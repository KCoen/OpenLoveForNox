
function GLOBAL()
	if true then return end
end
function GLOBAL()
	if true then return end
end
function CreatureSetup()
	ObjSetMaster(GetHostPlayer(),Gvar_4)
	ObjSetMaster(GetHostPlayer(),Gvar_5)
	PlayMusic(22,100)
	WaitFrames(10,3)
	if true then return end
end
function BriefingBegin()
	ForceDialog(Gvar_4,GetHostPlayer())
	if true then return end
end
function JandorBriefStart()
	StartDialogWithCaller("HumanMaleEatFood","War07A.scr:JandorTalk01")
	if true then return end
end
function JandorBriefEnd()
	JournalAddEntry(GetHostPlayer(),"GetHON",2)
	PrintToAll("Con01a:NewJournalEntry")
	CancelDialog(Gvar_4)
	if true then return end
end
function LanceDialogStart()
	StartDialogWithCaller("SwordsmanHurt","War01A.scr:Guard1Talk01")
	if true then return end
end
function LanceDialogEnd()
	if true then return end
end
function MapInitialize()
	Gvar_4 = ObjFromName("Jandor")
	Gvar_5 = ObjFromName("Lance")
	Gvar_6 = ObjFromName("FacadeGate")
	SetDialogPortrait(Gvar_4,"AirshipCaptainPic")
	SetupDialog(Gvar_4,"NORMAL",4,5)
	LockDoor(Gvar_6)
	StartScreen(7)
	WaitFrames(1,2)
	if true then return end
end
function PlayerDeath()
	DeathScreen(7)
	if true then return end
end