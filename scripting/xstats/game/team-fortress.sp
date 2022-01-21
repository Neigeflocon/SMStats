/**
 *	Functions.
 */
ConVar TF2_SentryKill;
ConVar TF2_MiniSentryKill;

/* Capture Point */
ConVar TF2_PointCaptured;
ConVar TF2_PointBlocked;

/* Capture-The-Flag */
ConVar TF2_FlagEvent[6];
ConVar TF2_FlagStolen;

/* Player */
ConVar TF2_BuiltObject[6];
ConVar TF2_DestroyedObject[6];
ConVar TF2_Ubercharged, TF2_Ubercharged_Spy;
ConVar TF2_Teleported;
ConVar TF2_SandvichStolen;
ConVar TF2_Jarated, TF2_MadMilked;
ConVar TF2_Extinguished;

/* Classes */
ConVar TF2_DeathClass[11];

/* Pass Ball Mode */
ConVar TF2_PassBall[6];

/* Bosses */
ConVar TF2_BossKilled[5];
ConVar TF2_BossStunned[2];

/* Other */
ConVar TF2_TeleFrag;
ConVar TF2_Stunned;

void PrepareGame_TeamFortress()	{
	/* Buildings */
	TF2_SentryKill		= CreateConVar("xstats_points_sentrykill",		"5",	"Xstats: TF2 - Points given when killing with Sentry gun.", _, true);
	TF2_MiniSentryKill	= CreateConVar("xstats_points_minisentrykill",	"5",	"Xstats: TF2 - Points given when killing with Mini-Sentry gun.", _, true);
	
	/* Capture Point */
	TF2_PointCaptured	= CreateConVar("xstats_points_point_captured",	"5",	"Xstats: TF2 - Points given when capturing a point.", _, true);
	TF2_PointBlocked	= CreateConVar("xstats_points_point_blocked",	"5",	"Xstats: TF2 - Points given when blocking a point from being captured.", _, true);
	
	/* Capture-The-Flag */
	TF2_FlagEvent[1]	= CreateConVar("xstats_points_flag_pickedup",	"5",	"Xstats: TF2 - Points given when picking up the flag.", _, true);
	TF2_FlagEvent[2]	= CreateConVar("xstats_points_flag_captured",	"5",	"Xstats: TF2 - Points given when capturing the flag.", _, true);
	TF2_FlagEvent[3]	= CreateConVar("xstats_points_flag_defended",	"5",	"Xstats: TF2 - Points given when defending the flag.", _, true);
	TF2_FlagEvent[4]	= CreateConVar("xstats_points_flag_dropping",	"5",	"Xstats: TF2 - Points taken when dropping the flag.", _, true);
	TF2_FlagStolen		= CreateConVar("xstats_points_flag_stealing",	"5",	"Xstats: TF2 - Points given when stealing the flag. Paired with picking up.", _, true);
	
	/* Player */
	TF2_BuiltObject[0]		= CreateConVar("xstats_points_place_sentrygun",				"2", "Xstats: TF2 - Points given when placing a Sentrygun.", _, true);
	TF2_BuiltObject[1]		= CreateConVar("xstats_points_place_dispenser",				"2", "Xstats: TF2 - Points given when placing a Dispenser.", _, true);
	TF2_BuiltObject[2]		= CreateConVar("xstats_points_place_teleporter_entrance",	"2", "Xstats: TF2 - Points given when placing a Teleporter Entrance.", _, true);
	TF2_BuiltObject[3]		= CreateConVar("xstats_points_place_teleporter_exit",		"2", "Xstats: TF2 - Points given when placing a Teleporter Exit.", _, true);
	TF2_BuiltObject[4]		= CreateConVar("xstats_points_place_minisentrygun",			"2", "Xstats: TF2 - Points given when placing a Mini-Sentrygun.", _, true);
	TF2_BuiltObject[5]		= CreateConVar("xstats_points_place_sapper",				"2", "Xstats: TF2 - Points given when placing a Sapper.", _, true);
	TF2_DestroyedObject[0]	= CreateConVar("xstats_points_destroyed_sentrygun",			"2", "Xstats: TF2 - Points given when destroying a Sentrygun.", _, true);
	TF2_DestroyedObject[1]	= CreateConVar("xstats_points_destroyed_dispenser",			"2", "Xstats: TF2 - Points given when destroying a Dispenser.", _, true);
	TF2_DestroyedObject[2]	= CreateConVar("xstats_points_destroyed_teleporter_entrance","2", "Xstats: TF2 - Points given when destroying a Teleporter Entrance.", _, true);
	TF2_DestroyedObject[3]	= CreateConVar("xstats_points_destroyed_teleporter_exit",	"2", "Xstats: TF2 - Points given when destroying a Teleporter Exit.", _, true);
	TF2_DestroyedObject[4]	= CreateConVar("xstats_points_destroyed_minisentrygun",		"2", "Xstats: TF2 - Points given when destroying a Mini-Sentry Gun.", _, true);
	TF2_DestroyedObject[5]	= CreateConVar("xstats_points_destroyed_sapper",			"2", "Xstats: TF2 - Points given when destroying a Sapper.", _, true);
	TF2_Ubercharged			= CreateConVar("xstats_points_ubercharged",					"5", "Xstats: TF2 - Points given when ubercharging.", _, true);
	TF2_Ubercharged_Spy		= CreateConVar("xstats_ubercharged_count_spy",				"1", "Xstats: TF2 - Should an enemy spy be counted as valid?.", _, true, _, true, 1.0);
	TF2_Teleported			= CreateConVar("xstats_points_teleported",					"2", "Xstats: TF2 - Points given to the builder when teleporter was used.", _, true);
	TF2_SandvichStolen		= CreateConVar("xstats_points_sandvichesstolen",			"2", "Xstats: TF2 - Points given when stealing a sandvich.", _, true);
	TF2_Jarated				= CreateConVar("xstats_points_jarated",						"3", "Xstats: TF2 - Points given when coating opponent with a jar.", _, true);
	TF2_MadMilked			= CreateConVar("xstats_points_madmilked",					"2", "Xstats: TF2 - Points given when coating opponent with a milk jar.", _, true);
	TF2_Extinguished		= CreateConVar("xstats_points_extinguished",				"3", "Xstats: TF2 - Points given when extinguishing a teammate.", _, true);
	
	/* Classes */
	TF2_DeathClass[1]	= CreateConVar("xstats_points_death_scout",		"5",	"Xstats: TF2 - Points taken when dying as Scout.", _, true);
	TF2_DeathClass[2]	= CreateConVar("xstats_points_death_sniper",	"5",	"Xstats: TF2 - Points taken when dying as Sniper.", _, true);
	TF2_DeathClass[3]	= CreateConVar("xstats_points_death_soldier",	"5",	"Xstats: TF2 - Points taken when dying as Soldier.", _, true);
	TF2_DeathClass[4]	= CreateConVar("xstats_points_death_demoman",	"5",	"Xstats: TF2 - Points taken when dying as Demoman.", _, true);
	TF2_DeathClass[5]	= CreateConVar("xstats_points_death_medic",		"5",	"Xstats: TF2 - Points taken when dying as Medic.", _, true);
	TF2_DeathClass[6]	= CreateConVar("xstats_points_death_heavy",		"5",	"Xstats: TF2 - Points taken when dying as Heavy.", _, true);
	TF2_DeathClass[7]	= CreateConVar("xstats_points_death_pyro",		"5",	"Xstats: TF2 - Points taken when dying as Pyro.", _, true);
	TF2_DeathClass[8]	= CreateConVar("xstats_points_death_spy",		"5",	"Xstats: TF2 - Points given when dying as Spy.", _, true);
	TF2_DeathClass[9]	= CreateConVar("xstats_points_death_engineer",	"5",	"Xstats: TF2 - Points given when dying as Engineer.", _, true);
	if(IsCurrentGame(Game_TF2C))
		TF2_DeathClass[10] = CreateConVar("xstats_points_death_civilan", "5",	"Xstats: TF2C - Points given when dying as Civilian.", _, true);
	
	/* Pass Ball Mode */
	TF2_PassBall[0] = CreateConVar("xstats_points_pass_get",		"1",	"Xstats: TF2 - Points given when grabbing neutral ball.", _, true);
	TF2_PassBall[1] = CreateConVar("xstats_points_pass_score",		"2",	"Xstats: TF2 - Points given when scoring the ball.", _, true);
	TF2_PassBall[2] = CreateConVar("xstats_points_pass_dropball",	"1",	"Xstats: TF2 - Points given when dropping the ball.", _, true);
	TF2_PassBall[3] = CreateConVar("xstats_points_pass_caught",		"1",	"Xstats: TF2 - Points given when catching the ball.", _, true);
	TF2_PassBall[4] = CreateConVar("xstats_points_pass_steal",		"2",	"Xstats: TF2 - Points given when stealing the ball.", _, true);
	TF2_PassBall[5] = CreateConVar("xstats_points_pass_blocked",	"1",	"Xstats: TF2 - Points given when blocking the ball.", _, true);
	
	/* Bosses */
	TF2_BossKilled[1] = CreateConVar("xstats_points_boss_hhh",					"5",	"Xstats: TF2 - Points given when killing Headless Horseless Headmann.", _, true);
	TF2_BossKilled[2] = CreateConVar("xstats_points_boss_monoculus",			"5",	"Xstats: TF2 - Points given when killing Monoculus.", _, true);
	TF2_BossKilled[3] = CreateConVar("xstats_points_boss_merasmus",				"5",	"Xstats: TF2 - Points given when killing Merasmus.", _, true);
	TF2_BossKilled[4] = CreateConVar("xstats_points_boss_skeleton",				"5",	"Xstats: TF2 - Points given when killing Skeleton King.", _, true);
	TF2_BossStunned[0] = CreateConVar("xstats_points_boss_stunned_monoculus",	"5",	"Xstats: TF2 - Points given when stunning Monoculus.", _, true);
	TF2_BossStunned[1] = CreateConVar("xstats_points_boss_stunned_merasmus",	"5",	"Xstats: TF2 - Points given when stunning Merasmus.", _, true);
	
	/* Other */
	TF2_TeleFrag	= CreateConVar("xstats_points_telefrag",	"5",	"Xstats: TF2 - Points given when telefragging an opponent.", _, true);
	TF2_Stunned		= CreateConVar("xstats_points_stunned",		"2",	"Xstats: TF2 - Points given when stunning an opponent.", _, true);
	
	/* Capture Point */
	HookEventEx(EVENT_TEAMPLAY_POINT_CAPTURED,	Teamplay_Point_Captured,	EventHookMode_Pre);
	HookEventEx(EVENT_TEAMPLAY_CAPTURE_BLOCKED,	Teamplay_Capture_Blocked,	EventHookMode_Pre);
	
	/* Capture-The-Flag */
	HookEventEx(EVENT_TEAMPLAY_FLAG_EVENT,		Teamplay_Flag_Event,		EventHookMode_Pre);

	/* Objects | Buildings */
	HookEventEx(EVENT_PLAYER_BUILTOBJECT,		Player_BuiltObject,	EventHookMode_Pre);
	HookEventEx(EVENT_OBJECT_DESTROYED,			Object_Destroyed,	EventHookMode_Pre);
	
	/* Player */
	HookEventEx(EVENT_PLAYER_INVULNED,			Player_Invulned,		EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_TELEPORTED,		Player_Teleported,		EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_STEALSANDVICH,		Player_StealSandvich,	EventHookMode_Pre);
	HookEventEx(EVENT_PLAYER_STUNNED,			Player_Stunned,			EventHookMode_Pre);
	
	/* Bosses */
	HookEventEx(EVENT_HALLOWEEN_BOSS_KILLED,		Halloween_Boss_Killed,		EventHookMode_Pre);
	HookEventEx(EVENT_HALLOWEEN_SKELETON_KILLED,	Halloween_Skeleton_Killed,	EventHookMode_Pre);
	HookEventEx(EVENT_EYEBALL_BOSS_STUNNED,			Eyeball_Boss_Stunned,		EventHookMode_Pre);
	HookEventEx(EVENT_MERASMUS_STUNNED,				Merasmus_Stunned,			EventHookMode_Pre);
	
	/* Pass Ball Mode */
	HookEventEx(EVENT_PASS_GET,				PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_SCORE,			PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_FREE,			PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_PASS_CAUGHT,		PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_BALL_STOLEN,		PassBall, EventHookMode_Pre);
	HookEventEx(EVENT_PASS_BALL_BLOCKED,	PassBall, EventHookMode_Pre);
	
	/* User Messages */
	HookUserMessageEx(GetUserMessageId("PlayerJarated"), PlayerJarated);
	HookUserMessageEx(GetUserMessageId("PlayerExtinguished"), PlayerExtinguished);
	HookUserMessageEx(GetUserMessageId("PlayerIgnited"), PlayerIgnited);
	
	/* For some arrays as they use multi-arrays (ArrayExample[MAXPLAYERS][10] for example) */
	ResetAntiAbuseArrays();
	
	/* Waiting For Players - Just to make all TF2 versions compatible. */
	/* Not working it seems. (Maybe works in TF2C? untested there yet) */
	//HookEventEx(EVENT_TEAMPLAY_WAITING_BEGINS,	WaitingForPlayers, EventHookMode_Pre);
	//HookEventEx(EVENT_TEAMPLAY_WAITING_ENDS,	WaitingForPlayers, EventHookMode_Pre);
}

/* Capture Point */
stock void Teamplay_Point_Captured(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_PointCaptured.IntValue < 1)
		return;
	
	char query[256], cpname[64], cappers[MAXPLAYERS];
	event.GetString(EVENT_STR_CPNAME, cpname, sizeof(cpname));
	event.GetString(EVENT_STR_CAPPERS, cappers, MAXPLAYERS);
	int points = TF2_PointCaptured.IntValue;
	
	char captured_point[64];
	Format(captured_point, sizeof(captured_point), "%t{default}", "Capture Event Type 0");
	
	for(int i = 0; i < strlen(cappers); i++)	{
		int client = cappers[i];
		
		if(Tklib_IsValidClient(client, true) && !IsValidAbuse(client))	{
			AddSessionPoints(client, points);			
			int points_client = GetClientPoints(SteamID[client]);
			CPrintToChat(client, "%s %t", Prefix, "Capture Point Event", Name[client], points_client, points, captured_point, cpname);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, PointsCaptured = PointsCaptured+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
}

stock void Teamplay_Capture_Blocked(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_PointBlocked.IntValue < 1)
		return;
	
	/* Make sure it's a valid capture point map */
	if(!(TF2_GetGameType() == TFGameType_CP || TF2_GetGameType() == TFGameType_Arena))
		return;
	
	int client = event.GetInt(EVENT_STR_BLOCKER);
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int victim = event.GetInt(EVENT_STR_VICTIM);
	if(!Tklib_IsValidClient(victim))
		return;
	
	if(IsFakeClient(victim) && !AllowBots.BoolValue)
		return;
	
	char query[256], cpname[64];
	event.GetString(EVENT_STR_CPNAME, cpname, sizeof(cpname));
	int points = TF2_PointBlocked.IntValue;
	
	char defended_point[64];
	Format(defended_point, sizeof(defended_point), "%t{default}", "Capture Event Type 1");
	
	AddSessionPoints(client, points);
	int points_client = GetClientPoints(SteamID[client]);
	CPrintToChat(client, "%s %t", Prefix, Name[client], points_client, points, defended_point, cpname, Name[victim]);
	
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, PointsDefended = PointsDefended+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}

/* Capture-The-Flag */
stock void Teamplay_Flag_Event(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_GetGameType() != TFGameType_CTF || TF2_IsMvMGameMode())
		return;
	
	int client = event.GetInt(EVENT_STR_PLAYER);
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int carrier = event.GetInt(EVENT_STR_CARRIER);
	int eventtype = event.GetInt(EVENT_STR_EVENTTYPE);
	bool home = event.GetBool(EVENT_STR_HOME);
	TFTeam team = TFTeam(event.GetInt(EVENT_STR_TEAM));
	TFFlag flag = TFFlag(eventtype);
	
	if(Debug.BoolValue)	{
		char teamname[][] = {
			/* 0 */ "Unassigned",
			/* 1 */ "SPEC",
			/* 2 */ "BLU",
			/* 3 */ "RED"
		};
		
		PrintToServer("//===== Teamplay_Flag_Event =====//");
		PrintToServer("player %N (%i)", client, client);
		PrintToServer("carrier %N (%i)", carrier, carrier);
		PrintToServer("eventtype %s", TF2_GetFlagTypeName[eventtype]);
		PrintToServer("home %s", Bool[home]);
		PrintToServer("teamname %s", teamname[team]);
		PrintToServer(" ");
	}
	
	if(TF2_FlagEvent[eventtype] == null || TF2_FlagEvent[eventtype].IntValue < 1)
		return;
	
	char query[1024];
	int points = TF2_FlagEvent[eventtype].IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	
	/* Translation */
	char flag_event[][] = {
		"Flag Event Type 0", /* Picked up */
		"Flag Event Type 1", /* Stolen */
		"Flag Event Type 2", /* Capturing */
		"Flag Event Type 3", /* Defending */
		"Flag Event Type 4" /* Dropping */
	};
	
	char flag_event_type[64];
	switch(flag)	{
		case	TFFlag_PickedUp:	Format(flag_event_type, sizeof(flag_event_type), "%t{default}", home ? flag_event[1] : flag_event[0]);
		case	TFFlag_Captured:	Format(flag_event_type, sizeof(flag_event_type), "%t{default}", flag_event[2]);
		case	TFFlag_Defended:	Format(flag_event_type, sizeof(flag_event_type), "%t{default}", flag_event[3]);
		case	TFFlag_Dropped:		Format(flag_event_type, sizeof(flag_event_type), "%t{default}", flag_event[4]);
	}
	
	switch(flag)	{
		/* Flag was picked up */
		case	TFFlag_PickedUp:	{
			switch(home)	{
				/* Flag was stolen */
				case	true:	{
					points += TF2_FlagStolen.IntValue;
					Session[client].FlagsStolen++;
					Session[client].FlagsPickedUp++;
					AddSessionPoints(client, points);
					CPrintToChat(client, "%s %t", Prefix, "Flag Event 1", Name[client], points_client, points, flag_event_type);
					
					Format(query, sizeof(query), "update `%s` set Points = Points+%i, FlagsPickedUp = FlagsPickedUp+1, FlagsStolen = FlagsStolen+1 where SteamID='%s' and ServerID='%i'",
					playerlist, points, SteamID[client], ServerID.IntValue); 
					db.Query(DBQuery_Callback, query);
				}
				/* Flag was not stolen (phew, that was close *heavy voice*) */
				case	false:	{
					Session[client].FlagsPickedUp++;
					AddSessionPoints(client, points);
					CPrintToChat(client, "%s %t", Prefix, "Flag Event 0", Name[client], points_client, points, flag_event_type);
					
					Format(query, sizeof(query), "update `%s` set Points = Points+%i, FlagsPickedUp = FlagsPickedUp+1 where SteamID='%s' and ServerID='%i'",
					playerlist, points, SteamID[client], ServerID.IntValue); 
					db.Query(DBQuery_Callback, query);
				}
			}
		}
		/* Flag was captured */
		case	TFFlag_Captured:	{
			Session[client].FlagsCaptured++;
			AddSessionPoints(client, points);
			CPrintToChat(client, "%s %t", Prefix, "Flag Event 0", Name[client], points_client, points, flag_event_type);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, FlagsCaptured = FlagsCaptured+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		/* Flag was defended */
		case	TFFlag_Defended:	{
			Session[client].FlagsDefended++;
			AddSessionPoints(client, points);
			CPrintToChat(client, "%s %t", Prefix, "Flag Event 0", Name[client], points_client, points, flag_event_type);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, FlagsDefended = FlagsCaptured+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		/* Flag was dropped */
		case	TFFlag_Dropped:	{
			Session[client].FlagsDropped++;
			AddSessionPoints(client, points);
			CPrintToChat(client, "%s %t", Prefix, "Flag Event 1", Name[client], points_client, points, flag_event_type);
			
			Format(query, sizeof(query), "update `%s` set Points = Points-%i where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
	
	PrepareTF2FlagEventForward(client, carrier, flag, home);
}

/* Objects | Buildings */
float BuiltObject_Timer[6] = {40.0, ...};
bool BuiltObject[MAXPLAYERS][6];
stock void Player_BuiltObject(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats())
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	TFBuilding building = TF2_GetBuildingType(event.GetInt(EVENT_STR_INDEX));
	int type = int(building);
	
	char building_name[][] = {
		"Object Type 0", /* Sentrygun */
		"Object Type 1", /* Dispenser */
		"Object Type 2", /* Teleporter Entrance */
		"Object Type 3", /* Teleporter Exit */
		"Object Type 4", /* Mini-Sentrygun */
		"Object Type 5", /* Sapper */
	};
	
	char object_name[64];
	Format(object_name, sizeof(object_name), "%t{default}", building_name[type]);
	
	char query[256];
	switch(building)	{
		case	TFBuilding_Sentrygun:	{
			Session[client].SentryGunsBuilt++;
			Session[client].BuildingsBuilt++;
			Format(query, sizeof(query), "update `%s` set SentryGunsBuilt = SentryGunsBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Dispenser:	{
			Session[client].DispensersBuilt++;
			Session[client].BuildingsBuilt++;
			Format(query, sizeof(query), "update `%s` set DispensersBuilt = DispensersBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_MiniSentry:	{
			Session[client].MiniSentryGunsBuilt++;
			Session[client].BuildingsBuilt++;
			Format(query, sizeof(query), "update `%s` set MiniSentryGunsBuilt = MiniSentryGunsBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Entrance:	{
			Session[client].TeleporterEntrancesBuilt++;
			Session[client].BuildingsBuilt++;
			Format(query, sizeof(query), "update `%s` set TeleporterEntrancesBuilt = TeleporterEntrancesBuilt+1, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Exit:	{
			Session[client].TeleporterExitsBuilt++;
			Session[client].BuildingsBuilt++;
			Format(query, sizeof(query), "update `%s` set TeleporterExitsBuilt = TeleporterExitsBuilt, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Sapper:	{
			Session[client].SappersPlaced++;
			Format(query, sizeof(query), "update `%s` set SappersPlaced = SappersPlaced, TotalBuildingsBuilt = TotalBuildingsBuilt+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
	
	/* Ensure the player cannot abuse the points */
	if(!BuiltObject[client][type])	{
		if(TF2_BuiltObject[type].IntValue > 0)	{
			int points = TF2_BuiltObject[type].IntValue;
			int points_client = GetClientPoints(SteamID[client]);
			AddSessionPoints(client, points);
			
			CPrintToChat(client, "%s %t",
			Prefix, building == TFBuilding_Sapper ? "Object Event Type 1" : "Object Event Type 0", Name[client], points_client, points, object_name);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
			
		BuiltObject[client][type] = true;
		DataPack pack = new DataPack();
		pack.WriteCell(client);
		pack.WriteCell(type);
		CreateTimer(BuiltObject_Timer[type], Timer_Player_BuiltObject, pack);
	}
}

float DestroyedObject_Timer[6] = {40.0, ...};
bool DestroyedObject[MAXPLAYERS][6];
stock void Object_Destroyed(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats())
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_ATTACKER));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	TFBuilding building = TF2_GetBuildingType(event.GetInt(EVENT_STR_INDEX));
	int type = int(building);
	
	char building_name[][] = {
		"Object Type 0", /* Sentrygun */
		"Object Type 1", /* Dispenser */
		"Object Type 2", /* Teleporter Entrance */
		"Object Type 3", /* Teleporter Exit */
		"Object Type 4", /* Mini-Sentrygun */
		"Object Type 5", /* Sapper */
	};
	
	char object_name[64];
	Format(object_name, sizeof(object_name), "%t{default}", building_name[type]);
	
	char query[512];
	switch(building)	{
		case	TFBuilding_Sentrygun:	{
			Session[client].SentryGunsDestroyed++;
			Session[client].BuildingsDestroyed++;
			Format(query, sizeof(query), "update `%s` set SentryGunsDestroyed = SentryGunsDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Dispenser:	{
			Session[client].DispensersDestroyed++;
			Session[client].BuildingsDestroyed++;
			Format(query, sizeof(query), "update `%s` set DispensersDestroyed = DispensersDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_MiniSentry:	{
			Session[client].MiniSentryGunsDestroyed++;
			Session[client].BuildingsDestroyed++;
			Format(query, sizeof(query), "update `%s` set MiniSentryGunsDestroyed = MiniSentryGunsDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Entrance:	{
			Session[client].TeleporterEntrancesDestroyed++;
			Session[client].BuildingsDestroyed++;
			Format(query, sizeof(query), "update `%s` set TeleporterEntrancesDestroyed = TeleporterEntrancesDestroyed+1, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Teleporter_Exit:	{
			Session[client].TeleporterExitsDestroyed++;
			Session[client].BuildingsDestroyed++;
			Format(query, sizeof(query), "update `%s` set TeleporterExitsDestroyed = TeleporterExitsDestroyed, TotalBuildingsDestroyed = TotalBuildingsDestroyed+1 where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
		case	TFBuilding_Sapper:	{
			Session[client].SappersDestroyed++;
			Format(query, sizeof(query), "update `%s` set SappersDestroyed = SappersDestroyed where SteamID='%s' and ServerID='%i'",
			playerlist, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
	}
	
	/* Ensure the player cannot abuse the points */
	if(!DestroyedObject[client][type])	{
		if(TF2_DestroyedObject[type].IntValue > 0)	{
			int points = TF2_DestroyedObject[type].IntValue;
			int points_client = GetClientPoints(SteamID[client]);
			AddSessionPoints(client, points);
			
			CPrintToChat(client, "%s %t",
			Prefix, building == TFBuilding_Sapper ? "Object Event Type 1" : "Object Event Type 0", Name[client], points_client, points, object_name);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
		}
			
		DestroyedObject[client][type] = true;
		DataPack pack = new DataPack();
		pack.WriteCell(client);
		pack.WriteCell(type);
		CreateTimer(DestroyedObject_Timer[type], Timer_Player_DestroyedObject, pack);
	}
}

/* Player */
float Ubercharged_Timer = 30.0;
bool Ubercharged[MAXPLAYERS] = {false, ...};
stock void Player_Invulned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_Ubercharged.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_MEDIC_USERID));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	if(!Tklib_IsValidClient(victim))
		return;
	
	if(IsFakeClient(victim) && !AllowBots.BoolValue)
		return;
	
	if(!IsSameTeam(victim, client) && TF2_GetPlayerClass(victim) == TFClass_Spy && !TF2_Ubercharged_Spy.BoolValue)
		return;
	
	if(Ubercharged[client])
		return;
	
	int points = TF2_Ubercharged.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	CPrintToChat(client, "%s %t", Prefix, "Player Ubercharged", Name[client], points_client, Name[victim]);
	
	char query[256];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, Ubercharged = Ubercharged+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
	
	Ubercharged[client] = true;
	CreateTimer(Ubercharged_Timer, Timer_Player_Invulned, client);
}

float Teleported_Timer = 15.0;
bool Teleported[MAXPLAYERS] = {false, ...};
stock void Player_Teleported(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_Teleported.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_BUILDERID));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_USERID));
	if(!Tklib_IsValidClient(victim))
		return;
	
	if(IsFakeClient(victim) && !AllowBots.BoolValue)
		return;
	
	if(Teleported[victim])
		return;
	
	int points = TF2_Teleported.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	CPrintToChat(client, "%s %t", Prefix, "Player Used Teleporter", Name[client], points_client, points, Name[victim]);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set PlayerTeleported = PlayerTeleported+1 where SteamID='%s' and ServerID='%i'",
	playerlist, SteamID[victim], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
	
	Format(query, sizeof(query), "update `%s` set TotalPlayersTeleported = TotalPlayersTeleported+1, Points = Points+%i where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
	
	Teleported[victim] = true;
	CreateTimer(Teleported_Timer, Timer_Player_Teleported, victim);
}

stock void Player_StealSandvich(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_SandvichStolen.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_TARGET));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int points = TF2_SandvichStolen.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_OWNER));
	/* Incase the sandvich owner left */
	switch(Tklib_IsValidClient(victim))	{
		case	true:	CPrintToChat(client, "%s %t", Prefix, "Player Steal Sandvich Scenario 1", Name[client], points_client, points, Name[victim]);
		case	false:	CPrintToChat(client, "%s %t", Prefix, "Player Steal Sandvich Scenario 2", Name[client], points_client, points);
	}
	
	char query[256];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, SandvichesStolen = SandvichesStolen+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}

stock void Player_Stunned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue || !RankActive || TF2_Stunned.IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_STUNNER));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int victim = GetClientOfUserId(event.GetInt(EVENT_STR_VICTIM));
	if(!Tklib_IsValidClient(victim))
		return;
	
	if(IsFakeClient(victim) && !AllowBots.BoolValue)
		return;
	
	AddSessionPoints(client, TF2_Stunned.IntValue);
	bool big_stun = event.GetBool(EVENT_STR_BIG_STUN);
	int points = TF2_Stunned.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	
	char query[512];
	switch(big_stun)	{
		case	true:	{
			CPrintToChat(client, "%s %t", Prefix, "Player Stun Scenario 1", Name[client], points_client, client, Name[victim]);
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, MoonShotStunnedPlayers = MoonShotStunnedPlayers+1 where SteamID='%i' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
		}
		case	false:	{
			CPrintToChat(client, "%s %t", Prefix, "Player Stun Scenario 2", Name[client], points_client, client, Name[victim]);
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, StunnedPlayers = StunnedPlayers+1 where SteamID='%i' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
		}
	}
}

/* Pass Ball Mode */
stock void PassBall(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_GetGameType() != TFGameType_PassBall)
		return;
	
	char query[512];
	int client, points = 0;
	
	if(StrEqual(event_name, EVENT_PASS_GET) && (client = event.GetInt(EVENT_STR_OWNER)) > 0 && (points = TF2_PassBall[0].IntValue) > 0)
	{
		if(!Tklib_IsValidClient(client, true))
			return;
		
		if(IsValidAbuse(client))
			return;
		
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		CPrintToChat(client, "%s %t", Prefix, "PassBall Grab Neutral Ball", Name[client], points_client, points);
		
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, PassBallsGotten = PassBallsGotten+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
	
	if(StrEqual(event_name, EVENT_PASS_SCORE) && (client = event.GetInt(EVENT_STR_SCORER)) > 0 && (points = TF2_PassBall[1].IntValue) > 0)
	{
		if(!Tklib_IsValidClient(client, true))
			return;
		
		if(IsValidAbuse(client))
			return;
		
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		CPrintToChat(client, "%s %t", Prefix, "PasBall Score Ball", Name[client], points_client, points);
		
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, PassBallsScored = PassBallsScored+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
	
	if(StrEqual(event_name, EVENT_PASS_FREE) && (client = event.GetInt(EVENT_STR_OWNER)) > 0 && (points = TF2_PassBall[2].IntValue) > 0)
	{
		if(!Tklib_IsValidClient(client, true))
			return;
		
		if(IsValidAbuse(client))
			return;
		
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		CPrintToChat(client, "%t", Prefix, "PassBall Drop Ball", Name[client], points_client, points);
		
		Format(query, sizeof(query), "update `%s` set Points = Points-%i, PassBallsDropped = PassBallsDropped+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
	
	if(StrEqual(event_name, EVENT_PASS_PASS_CAUGHT) && (client = event.GetInt(EVENT_STR_CATCHER)) > 0 && (points = TF2_PassBall[3].IntValue) > 0)
	{
		if(!Tklib_IsValidClient(client, true))
			return;
		
		if(IsValidAbuse(client))
			return;
		
		int passer = GetClientOfUserId(event.GetInt(EVENT_STR_PASSER));
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		
		switch(Tklib_IsValidClient(passer, !(IsFakeClient(passer) && !AllowBots.BoolValue)))	{
			case	true:	CPrintToChat(client, "%s %t", Prefix, "PassBall Scenario 1", Name[client], points_client, points, Name[passer]);
			case	false:	CPrintToChat(client, "%s %t", Prefix, "PassBall Scenario 2", Name[client], points_client, points);
		}
		
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, PassBallsCatched = PassBallsCatched+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
	
	if(StrEqual(event_name, EVENT_PASS_BALL_STOLEN) && (client = event.GetInt(EVENT_STR_ATTACKER)) > 0 && (points = TF2_PassBall[4].IntValue) > 0)
	{
		if(!Tklib_IsValidClient(client, true))
			return;
		
		if(IsValidAbuse(client))
			return;
		
		int victim = GetClientOfUserId(event.GetInt(EVENT_STR_VICTIM));
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		
		switch(Tklib_IsValidClient(victim, !(IsFakeClient(victim) && !AllowBots.BoolValue)))	{
			case	true:	CPrintToChat(client, "%s %t", Prefix, "PassBall Steal Ball Scenario 1", Name[client], points_client, points, Name[victim]);
			case	false:	CPrintToChat(client, "%s %t", Prefix, "PassBall Steal Ball Scenario 2", Name[client], points_client, points);
		}
		
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, PassBallsStolen = PassBallsStolen+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
	
	if(StrEqual(event_name, EVENT_PASS_BALL_BLOCKED) && (client = event.GetInt(EVENT_STR_BLOCKER)) > 0 && TF2_PassBall[5].IntValue > 0)
	{
		if(!Tklib_IsValidClient(client, true))
			return;
		
		if(IsValidAbuse(client))
			return;
		
		int victim = GetClientOfUserId(event.GetInt(EVENT_STR_OWNER));
		int points_client = GetClientPoints(SteamID[client]);
		AddSessionPoints(client, points);
		
		switch(Tklib_IsValidClient(victim, !(IsFakeClient(victim) && !AllowBots.BoolValue)))	{
			case	true:	CPrintToChat(client, "%s %t", Prefix, "PassBall Block Ball Scenario 1", Name[client], points_client, points, Name[victim]);
			case	false:	CPrintToChat(client, "%s %t", Prefix, "PassBall Block Ball Scenario 2", Name[client], points_client, points);
		}
		
		Format(query, sizeof(query), "update `%s` set Points = Points+%i, PassBallsBlocked = PassBallBlocked+1 where SteamID='%s' and ServerID='%i'",
		playerlist, points, SteamID[client], ServerID.IntValue);
		db.Query(DBQuery_Callback, query);
	}
}

/* Bosses */
stock void Halloween_Boss_Killed(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats())
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_KILLER));
	if(!Tklib_IsValidClient(client, true))
		return;
		
	if(IsValidAbuse(client))
		return;
	
	/*	Halloween bosses.
		1 - Horseless Headless Horsemann.
		2 - Monoculus.
		3 - Merasmus.
	*/
	int boss = event.GetInt(EVENT_STR_BOSS);
	int points = TF2_BossKilled[boss].IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	
	if(Debug.BoolValue)	{
		char boss_name[][] = {
			"Unused / Invalid Boss (id 0)",
			"Horseless Headless Horsemann.",
			"Monoculus",
			"Merasmus",
		};
		
		PrintToServer("//===== Halloween_Boss_Killed =====//");
		PrintToServer("killer %N", client);
		PrintToServer("boss id %i", boss);
		PrintToServer("boss \"%s\"", boss_name[boss]);
		PrintToServer(" ");
		PrintToServer("Points %i", points);
		PrintToServer(" ");
	}
	
	char halloween_type[][] = {
		"Halloween Boss Type 1", /* Horseless Headless Horsemann. */
		"Halloween Boss Type 2", /* Monoculus */
		"Halloween Boss Type 3", /* Merasmus */
	}, boss_name[64];
	
	Format(boss_name, sizeof(boss_name), "%s{default}", halloween_type[boss]);
	
	if(points > 0)	{
		char query[512];
		AddSessionPoints(client, points);
		CPrintToChat(client, "%s %t", Prefix, "Halloween Kill Event", Name[client], points_client, points, boss_name);
		
		switch(boss)	{
			case	TFBoss_Killed_HHH:	{
				Session[client].KilledHHH++;
				
				Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalKilledHHH = TotalKilledHHH+1 where SteamID='%s' and ServerID='%i'",
				playerlist, points, SteamID[client], ServerID.IntValue);
				db.Query(DBQuery_Callback, query);
			}
			case	TFBoss_Killed_Monoculus:	{
				Session[client].KilledMonoculus++;	
				
				Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalKilledMonoculus = TotalKilledMonoculus+1 where SteamID='%s' and ServerID='%i'",
				playerlist, points, SteamID[client], ServerID.IntValue);
				db.Query(DBQuery_Callback, query);
			}
			case	TFBoss_Killed_Merasmus:	{
				Session[client].KilledMerasmus++;
				
				Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalKilledMerasmus = TotalKilledMerasmus+1 where SteamID='%s' and ServerID='%i'",
				playerlist, points, SteamID[client], ServerID.IntValue);
				db.Query(DBQuery_Callback, query);
			}
		}
	}
}

/* Skeleton King */
stock void Halloween_Skeleton_Killed(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_BossKilled[4].IntValue < 1)
		return;
	
	int client = GetClientOfUserId(event.GetInt(EVENT_STR_PLAYER));
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int points = TF2_BossKilled[4].IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	Session[client].KilledSkeletonKing++;
	
	char boss_name[64];
	Format(boss_name, sizeof(boss_name), "%t{default}", "Halloween Boss Type 4");
	CPrintToChat(client, "%s %t", Prefix, "Halloween Kill Event", Name[client], points_client, points, boss_name);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalKilledSkeletonKing = TotalKilledSkeletonKing+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}

stock void Eyeball_Boss_Stunned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_BossStunned[0].IntValue < 1)
		return;
	
	int client = event.GetInt(EVENT_STR_PLAYER_ENTINDEX);
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int points = TF2_BossStunned[0].IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	Session[client].StunnedMonoculus++;
	
	char boss_name[64];
	Format(boss_name, sizeof(boss_name), "%t{default}", "Halloween Boss Type 2");
	CPrintToChat(client, "%s %t", Prefix, "Halloween Stun Event", Name[client], points_client, points, boss_name);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalMonoculusStunned = TotalMonoculusStunned+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}

stock void Merasmus_Stunned(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!IsValidStats() || TF2_BossStunned[1].IntValue < 1)
		return;
	
	int client = event.GetInt(EVENT_STR_PLAYER_ENTINDEX);
	if(!Tklib_IsValidClient(client, true))
		return;
	
	if(IsValidAbuse(client))
		return;
	
	int points = TF2_BossStunned[1].IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	Session[client].StunnedMonoculus++;
	
	char boss_name[64];
	Format(boss_name, sizeof(boss_name), "%t{default}", "Halloween Boss Type 3");
	CPrintToChat(client, "%s %t", Prefix, "Halloween Stun Event", Name[client], points_client, points, boss_name);
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, TotalMerasmusStunned = TotalMerasmusStunned+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}

/* User Messages */
float Jarated_Timer = 25.0;
float MadMilked_Timer = 25.0;
bool Jarated[MAXPLAYERS] = {false, ...};
bool MadMilked[MAXPLAYERS] = {false, ...};
Action PlayerJarated(UserMsg msg_id, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)	{
	if(!IsValidStats() || TF2_Jarated.IntValue < 1)
		return Plugin_Handled; /* Should do no harm to the usermessage event */
	
	int client = bf.ReadByte();
	if(!Tklib_IsValidClient(client, true))
		return Plugin_Handled;
	
	if(IsValidAbuse(client))
		return Plugin_Handled;
	
	int victim = bf.ReadByte();
	if(!Tklib_IsValidClient(victim))
		return Plugin_Handled;
	
	if(IsFakeClient(victim) && !AllowBots.BoolValue)
		return Plugin_Handled;
	
	int defindex = Ent(TF2_GetPlayerWeaponSlot(client, TFSlot_Secondary)).DefinitionIndex;
	
	DataPack pack = new DataPack();
	pack.WriteCell(client);
	pack.WriteCell(victim);
	pack.WriteCell(defindex);
	
	CreateTimer(0.0, TimerPlayerJarated, pack);
	
	return Plugin_Continue;
}

Action TimerPlayerJarated(Handle timer, DataPack pack)	{
	pack.Reset();
	int client = pack.ReadCell();
	int victim = pack.ReadCell();
	int defindex = pack.ReadCell();
	delete pack;
	
	int points = 0;
	int points_client = GetClientPoints(SteamID[client]);
	Session[client].Coated++;
		
	char query[512];
	switch(defindex)	{
		/* Madmilk & Mutated Milk */
		case	222, 1121:	{
			if(MadMilked[client])
				return Plugin_Handled;
			
			points = TF2_MadMilked.IntValue;
			Session[client].MadMilked++;
			AddSessionPoints(client, points);
			CPrintToChat(client, "%s %t", Prefix, "Player Coated Milk", Name[client], points_client, points, Name[victim]);
			
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, MadMilked = MadMilked+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
			
			MadMilked[client] = true;
			CreateTimer(MadMilked_Timer, Timer_PlayerMadMilked, client);
		}
		/* Jarate & The Self-Aware Beauty Mark */
		case	58, 1105:	{
			if(Jarated[client])
				return Plugin_Handled;
			
			points = TF2_Jarated.IntValue;
			Session[client].Jarated++;
			AddSessionPoints(client, points);
			CPrintToChat(client, "%s %t", Prefix, "Player Coated Jar", Name[client], points_client, points, Name[victim]);
				
			Format(query, sizeof(query), "update `%s` set Points = Points+%i, Jarated = Jarated+1 where SteamID='%s' and ServerID='%i'",
			playerlist, points, SteamID[client], ServerID.IntValue);
			db.Query(DBQuery_Callback, query);
			
			Jarated[client] = true;
			CreateTimer(Jarated_Timer, Timer_PlayerJarated, client);
		}
		/* Incase the player was coated with piss via Sydney Sleeper. */
		default:	{
			if(Ent(TF2_GetPlayerWeaponSlot(client, TFSlot_Primary)).DefinitionIndex == 230 && !Jarated[client])	{
				points = TF2_Jarated.IntValue;
				Session[client].Jarated++;
				AddSessionPoints(client, points);
				CPrintToChat(client, "%s %t", Prefix, "Player Coated Jar", Name[client], points_client, points, Name[victim]);
				
				Format(query, sizeof(query), "update `%s` set Points = Points+%i, Jarated = Jarated+1 where SteamID='%s' and ServerID='%i'",
				playerlist, points, SteamID[client], ServerID.IntValue);
				db.Query(DBQuery_Callback, query);
				
				Jarated[client] = true;
				CreateTimer(Jarated_Timer, Timer_PlayerJarated, client);
			}
		}
	}
	
	if(Debug.BoolValue)	{
		PrintToServer("//===== PlayerJarated =====//");
		PrintToServer("client: %N (index %i)", client, client);
		PrintToServer("victim: %N (index %i)", victim, victim);
		PrintToServer("defindex: %i", defindex);
		PrintToServer(" ");
	}
	
	return Plugin_Handled;
}

float Extinguished_Timer = 10.0;
bool Extinguished[MAXPLAYERS] = {false, ...};
Action PlayerExtinguished(UserMsg msg_id, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)	{
	if(!IsValidStats() || TF2_Extinguished.IntValue < 1)
		return Plugin_Handled;
	
	int client = bf.ReadByte();
	if(!Tklib_IsValidClient(client, true))
		return Plugin_Handled;
	
	if(IsValidAbuse(client))
		return Plugin_Handled;
	
	int victim = bf.ReadByte();
	if(!Tklib_IsValidClient(victim))
		return Plugin_Handled;
	
	if(Debug.BoolValue)	{
		PrintToServer("//===== PlayerExtinguished =====//");
		PrintToServer("client: %N (index %i)", client, client);
		PrintToServer("victim: %N (index %i)", victim, victim);
		PrintToServer(" ");
	}
	
	if(Extinguished[client])
		return Plugin_Handled;
	
	DataPack pack = new DataPack();
	pack.WriteCell(client);
	pack.WriteCell(victim);
	
	CreateTimer(0.0, TimerPlayerExtinguished, pack);
	
	return Plugin_Continue;
}

Action TimerPlayerExtinguished(Handle timer, DataPack pack)	{
	pack.Reset();
	int client = pack.ReadCell();
	int victim = pack.ReadCell();
	delete pack;
	
	int points = TF2_Extinguished.IntValue;
	int points_client = GetClientPoints(SteamID[client]);
	AddSessionPoints(client, points);
	
	CPrintToChat(client, "%s %s (%i) earned %i points for Extinguishing %s.",
	Prefix, Name[client], points_client, points, Name[victim]);
	
	char query[512];			
	Format(query, sizeof(query), "update `%s` set Points = Points+%i, Extinguished = Extinguished+1 where SteamID='%s' and ServerID='%i'",
	playerlist, points, SteamID[client], ServerID.IntValue);
		
	Extinguished[client] = true;
	CreateTimer(Extinguished_Timer, Timer_PlayerExtinguished, client);
}

Action PlayerIgnited(UserMsg msg_id, BfRead bf, const int[] players, int playersNum, bool reliable, bool init)	{
	if(!IsValidStats())
		return Plugin_Handled;
	
	int client = bf.ReadByte();
	if(!Tklib_IsValidClient(client, true))
		return Plugin_Handled;
	
	if(IsValidAbuse(client))
		return Plugin_Handled;
	
	int victim = bf.ReadByte();
	if(!Tklib_IsValidClient(victim))
		return Plugin_Handled;
	
	Session[client].Ignited++;
	
	if(Debug.BoolValue)	{
		PrintToServer("//===== PlayerIginted =====//");
		PrintToServer("client: %N (index %i)", client, client);
		PrintToServer("victim: %N (index %i)", victim, victim);
		PrintToServer(" ");
	}
	
	return Plugin_Continue;
}

/* Callbacks & Forwards */
stock Action Timer_Player_BuiltObject(Handle timer, DataPack pack)	{
	pack.Reset();
	int client = pack.ReadCell();
	int type = pack.ReadCell();
	delete pack; /* Prevent handle leak */
	
	BuiltObject[client][type] = false;
}
stock Action Timer_Player_DestroyedObject(Handle timer, DataPack pack)	{
	pack.Reset();
	int client = pack.ReadCell();
	int type = pack.ReadCell();
	delete pack;
	
	DestroyedObject[client][type] = false;
}

stock Action Timer_Player_Invulned(Handle timer, int client)	{	Ubercharged[client] = false;	}
stock Action Timer_Player_Teleported(Handle timer, int client)	{	Teleported[client] = false;		}
stock Action Timer_PlayerJarated(Handle timer, int client)		{	Jarated[client] = false;		}
stock Action Timer_PlayerMadMilked(Handle timer, int client)	{	MadMilked[client] = false;		}
stock Action Timer_PlayerExtinguished(Handle timer, int client)	{	Extinguished[client] = false;	}

stock void ResetAntiAbuseArrays()	{
	if(!PluginActive.BoolValue)
		return;
	
	for(int i = 0; i < MaxClients; i++)	{
		for(int type = 0; type < 6; type++)	{
			BuiltObject[i][type] = false;
		}
	}
}

/* Waiting For Players */

/*
Seems to not work in TF2. (Maybe TF2C?)
stock void WaitingForPlayers(Event event, const char[] event_name, bool dontBroadcast)	{
	if(!PluginActive.BoolValue)
		return;
	
	WarmupActive = StrEqual(event_name, EVENT_TEAMPLAY_WAITING_BEGINS);
	
	PrintToServer("WaitingForPlayers: %s", Bool[WarmupActive]);
}
*/

/* Disabled because these particularily doesn't wanna work properly on TF2 Classic.
public void TF2_OnWaitingForPlayersStart()	{	WarmupActive = true;	}
public void TF2_OnWaitingForPlayersEnd()	{	WarmupActive = false;	}
*/

/**
 *	When player killed a class.
 *
 *	@param	client	The user index who killed.
 *	@param	victim	The user index who got killed.
 */
stock void TF2_ClientKillVictim(int client, int victim)	{
	if(IsValidAbuse(client))
		return;
	
	TFClassType type = TF2_GetPlayerClass(victim);
	if(type < TFClass_Scout)
		return; /* Make sure it's a valid class. */
	
	char class[][] = {
		"Error like actually",
		"ScoutsKilled",
		"SoldiersKilled",
		"PyrosKilled",
		"DemosKilled",
		"HeaviesKilled",
		"EngiesKilled",
		"MedicsKilled",
		"SnipersKilled",
		"SpiesKilled",
		"CiviliansKilled"
	};
	
	switch(type)	{
		case	TFClass_Scout:		Session[client].ScoutsKilled++;
		case	TFClass_Soldier:	Session[client].SoldiersKilled++;
		case	TFClass_Pyro:		Session[client].PyrosKilled++;
		case	TFClass_DemoMan:	Session[client].DemosKilled++;
		case	TFClass_Heavy:		Session[client].HeaviesKilled++;
		case	TFClass_Engineer:	Session[client].EngiesKilled++;
		case	TFClass_Medic:		Session[client].MedicsKilled++;
		case	TFClass_Sniper:		Session[client].SnipersKilled++;
		case	TFClass_Spy:		Session[client].SpiesKilled++;
		case	TFClass_Civilian:	Session[client].CiviliansKilled++; /* TF2 Classic */
	}
	
	char query[512];
	Format(query, sizeof(query), "update `%s` set %s = %s+1 where SteamID='%s' and ServerID='%s'",
	playerlist, class[type], class[type], SteamID[client], ServerID.IntValue);
	db.Query(DBQuery_Callback, query);
}