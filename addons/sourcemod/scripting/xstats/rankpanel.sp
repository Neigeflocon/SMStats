Action RankPanel(int client, int args=-1) {
	if(!SQL) {
		CPrintToChat(client, "%s The database connection is unavailable, please contact the server author.", Global.Prefix);
		XStats_DebugText(false, "Player %s tried catching a database connection for rank panel but failed.", Player[client].Playername);
		return Plugin_Handled;
	}
	
	SQL.Lock();
	DBResultSet results = SQL.Query2("select PlayTime, Kills, Assists, Deaths, Suicides, DamageDone from `%s` where SteamID='%s' and ServerID='%i'",
	Global.playerlist, Player[client].SteamID, Cvars.ServerID.IntValue);
	
	if(!results) {
		char error[256];
		SQL.GetError(error, sizeof(error));
		
		CPrintToChat(client, "%s Player stats were unable to be retrieved from the database, please contact the server author.", Global.Prefix);
		//CPrintToChat(client, "%s You don't seem to be on the database, you may try rejoin or contact the server author.", Global.Prefix);
		XStats_DebugText(false, "Player %s tried using rank panel but was unable to retrieve the player on the database table. (%s)", Player[client].Playername, error);
		return Plugin_Handled;
	}
	
	if(!results.FetchRow())	{
		CPrintToChat(client, "%s Player stats were unable to be fetched from the database, please contact the server author.", Global.Prefix);
		XStats_DebugText(false, "Player %s tried fetching rows from the database table for the rank panel but failed.", Player[client].Playername);
		return Plugin_Handled;
	}
	
	SQL.Unlock();
	
	int list[2];
	GetClientPosition(Player[client].SteamID, list);
	Player[client].Position = list[0];
	int players = GetTablePlayerCount();
	int points = list[1];
	int playtime = results.FetchInt(0);
	int kills = results.FetchInt(1);
	int assists = results.FetchInt(2);
	int deaths = results.FetchInt(3);
	int suicides = results.FetchInt(4);
	int damagedone = results.FetchInt(5);
	float kdr = GetRatio(kills, deaths);
	
	delete results;	
	Player[client].StatsPanel.Main = true;
	
	PanelEx panel = new PanelEx();
	panel.DrawItem("XStats Panel");
	panel.DrawText("Playername: %s", Player[client].Playername);
	panel.DrawText("Positioned #%i out of %i players", Player[client].Position, players);
	panel.DrawSpace();
	panel.DrawItem("Current Session");
	panel.DrawText("%i Points", Player[client].Session.Points);
	panel.DrawText("%i Minutes played", Player[client].Session.PlayTime);
	panel.DrawText("%i Kills", Player[client].Session.Kills);
	panel.DrawText("%i Assists", Player[client].Session.Assists);
	panel.DrawText("%i Deaths", Player[client].Session.Deaths);
	panel.DrawText("%i Suicides", Player[client].Session.Suicides);
	panel.DrawText("%i Damage dealt", Player[client].Session.DamageDone);
	panel.DrawText("KDR: %.2f", GetRatio(Player[client].Session.Kills, Player[client].Session.Deaths));
	panel.DrawSpace();
	panel.DrawItem("Total Statistics");
	panel.DrawText("%i Points", points);
	panel.DrawText("%i Total minutes played", playtime);
	panel.DrawText("%i Kills", kills);
	panel.DrawText("%i Assists", assists);
	panel.DrawText("%i Deaths", deaths);
	panel.DrawText("%i Suicides", suicides);
	panel.DrawText("%i Damage dealt", damagedone);
	panel.DrawText("KDR: %.2f", kdr);
	panel.DrawSpace();
	panel.DrawItem("Exit");
	panel.Send(client, RankPanelCallback, MENU_TIME_FOREVER);
	
	if(args != -1) {
		CPrintToChat(client, "%s %s is positioned #%i out of %i players with %.2f KDR and %i total minutes in playtime",
		Global.Prefix, Player[client].Name, Player[client].Position, players, kdr, playtime);
	}
	
	return Plugin_Handled;
}

/**
 *	Rank panel callback.
 */
stock void RankPanelCallback(MenuEx panel, MenuAction action, int client, int selection) {
	switch(selection)	{
		/**
		 * 1: Panel info.
		 * 2: Session.
		 * 3: Stats.
		 * 4. Exit.
		 */
		case 1: XStatsCmd(client);
		case 2:	{
			RankPanel_CurrentSession(client);
			Player[client].StatsPanel.Main = false;
			Player[client].StatsPanel.Session = false;
			Player[client].StatsPanel.TotalPage = 0;
		}
		case 3:	{
			RankPanel_TotalStatistics(client);
			Player[client].StatsPanel.Main = false;
			Player[client].StatsPanel.Session = false;
			Player[client].StatsPanel.TotalPage = 0;
		}
		case 4:	{
			Player[client].StatsPanel.Main = false;
			Player[client].StatsPanel.Session = false;
			Player[client].StatsPanel.TotalPage = 0;
		}
	}
}

/* Current Session */
stock void RankPanel_CurrentSession(int client)	{
	PanelEx panel = new PanelEx();
	panel.DrawItem("XStats Panel: Current Session");
	
	/* Insert the generic ones first */
	panel.DrawText("%i Points", Player[client].Session.Points);
	panel.DrawText("%i Minutes played", Player[client].Session.PlayTime);
	panel.DrawText("%i Kills", Player[client].Session.Kills);
	panel.DrawText("%i Assists", Player[client].Session.Assists);
	panel.DrawText("%i Deaths", Player[client].Session.Deaths);
	panel.DrawText("%i Suicides", Player[client].Session.Suicides);
	panel.DrawText("%i Mid-air kills", Player[client].Session.MidAirKills);
	panel.DrawText("%i Damage dealt", Player[client].Session.DamageDone);
	panel.DrawText("KDR: %.2f", GetRatio(Player[client].Session.Kills, Player[client].Session.Deaths));
	panel.DrawSpace();
	
	switch(Global.Game)	{
		case Game_TF2, Game_TF2V: {
			panel.DrawItem("TF Stats");
			panel.DrawText("%i Dominations", Player[client].Session.Dominations);
			panel.DrawText("%i Revenges", Player[client].Session.Revenges);
			panel.DrawText("%i Headshots", Player[client].Session.Headshots);
			panel.DrawText("%i Noscopes", Player[client].Session.Noscopes);
			panel.DrawText("%i Backstabs", Player[client].Session.Backstabs);
			panel.DrawText("%i Airshots", Player[client].Session.Airshots);
			panel.DrawText("%i Deflects", Player[client].Session.Deflects);
			panel.DrawText("%i Gibs", Player[client].Session.Gibs);
			panel.DrawText("%i Critkills", Player[client].Session.Critkills);
			panel.DrawText("%i Tauntkills", Player[client].Session.Tauntkills);
			panel.DrawText("%i Telefrags", Player[client].Session.Telefrags);
			panel.DrawText("%i Buildings built", Player[client].Session.BuildingsBuilt);
			panel.DrawText("%i Buildings destroyed", Player[client].Session.BuildingsDestroyed);
			panel.DrawText("%i Sappers placed", Player[client].Session.SappersPlaced);
			panel.DrawText("%i Sappers destroyed", Player[client].Session.SappersDestroyed);
			panel.DrawText("%i Coated with milk", Player[client].Session.MadMilked);
			panel.DrawText("%i Coated with jar", Player[client].Session.Jarated);
			panel.DrawText("%i Extinguished", Player[client].Session.Extinguished);
			panel.DrawText("%i Ignited", Player[client].Session.Ignited);
			if(TF2_IsMvMGameMode())	{
				panel.DrawText("%i Sentry busters killed", Player[client].Session.SentryBustersKilled);
				panel.DrawText("%i Times you've resetted the bomb.", Player[client].Session.BombsResetted);
				panel.DrawText("%i Tanks destroyed", Player[client].Session.TanksDestroyed);
			}
		}
		case Game_TF2C:	{
			panel.DrawItem("TF Stats");
			panel.DrawText("%i Dominations", Player[client].Session.Dominations);
			panel.DrawText("%i Revenges", Player[client].Session.Revenges);
			panel.DrawText("%i Headshots", Player[client].Session.Headshots);
			panel.DrawText("%i Noscopes", Player[client].Session.Noscopes);
			panel.DrawText("%i Backstabs", Player[client].Session.Backstabs);
			panel.DrawText("%i Airshots", Player[client].Session.Airshots);
			panel.DrawText("%i Deflects", Player[client].Session.Deflects);
			panel.DrawText("%i Gibs", Player[client].Session.Gibs);
			panel.DrawText("%i Critkills", Player[client].Session.Critkills);
			panel.DrawText("%i Tauntkills", Player[client].Session.Tauntkills);
			panel.DrawText("%i Telefrags", Player[client].Session.Telefrags);
			panel.DrawText("%i Buildings built", Player[client].Session.BuildingsBuilt);
			panel.DrawText("%i Buildings destroyed", Player[client].Session.BuildingsDestroyed);
			panel.DrawText("%i Sappers placed", Player[client].Session.SappersPlaced);
			panel.DrawText("%i Sappers destroyed", Player[client].Session.SappersDestroyed);
			panel.DrawText("%i Extinguished", Player[client].Session.Extinguished);
			panel.DrawText("%i Ignited", Player[client].Session.Ignited);
		}
		case Game_TF2OP:	{
			panel.DrawItem("TF Stats");
			panel.DrawText("%i Dominations", Player[client].Session.Dominations);
			panel.DrawText("%i Revenges", Player[client].Session.Revenges);
			panel.DrawText("%i Headshots", Player[client].Session.Headshots);
			panel.DrawText("%i Noscopes", Player[client].Session.Noscopes);
			panel.DrawText("%i Backstabs", Player[client].Session.Backstabs);
			panel.DrawText("%i Airshots", Player[client].Session.Airshots);
			panel.DrawText("%i Deflects", Player[client].Session.Deflects);
			panel.DrawText("%i Gibs", Player[client].Session.Gibs);
			panel.DrawText("%i Critkills", Player[client].Session.Critkills);
			panel.DrawText("%i Tauntkills", Player[client].Session.Tauntkills);
			panel.DrawText("%i Telefrags", Player[client].Session.Telefrags);
			panel.DrawText("%i Buildings built", Player[client].Session.BuildingsBuilt);
			panel.DrawText("%i Buildings destroyed", Player[client].Session.BuildingsDestroyed);
			panel.DrawText("%i Sappers placed", Player[client].Session.SappersPlaced);
			panel.DrawText("%i Sappers destroyed", Player[client].Session.SappersDestroyed);
			panel.DrawText("%i Extinguished", Player[client].Session.Extinguished);
			panel.DrawText("%i Ignited", Player[client].Session.Ignited);
		}
		case Game_CSS, Game_CSPromod, Game_CSGO, Game_CSCO:	{
			panel.DrawItem("CS Stats");
			panel.DrawText("%i Dominations", Player[client].Session.Dominations);
			panel.DrawText("%i Revenges", Player[client].Session.Revenges);
			panel.DrawText("%i Headshots", Player[client].Session.Headshots);
			panel.DrawText("%i Noscopes", Player[client].Session.Noscopes);
			panel.DrawText("%i Through smoke kills", Player[client].Session.SmokeKills);
			panel.DrawText("%i Blinded kills", Player[client].Session.BlindKills);
			panel.DrawText("%i Grenade kills", Player[client].Session.GrenadeKills);
			panel.DrawText("%i Money spent", Player[client].Session.MoneySpent);
		}
	}
	
	panel.DrawSpace();
	panel.DrawItem("Back");
	panel.DrawItem("Exit");
	panel.Send(client, RankPanelCallback2, MENU_TIME_FOREVER);
	
	Player[client].StatsPanel.Session = true;
}

/* Total Statistics */
stock void RankPanel_TotalStatistics(int client) {
	if(!SQL) {
		CPrintToChat(client, "%s The threaded database connection is unavailable, please contact the server author.", Global.Prefix);
		return;
	}
	
	switch(Global.Game)	{
		case Game_TF2: TotalStatistics_TF2(client);
	}
}

#include "xstats/rankpanel/tf.sp"

/**
 *	Rank panel callback.
 */
stock void RankPanelCallback2(MenuEx panel, MenuAction action, int client, int selection) {
	switch(selection) {
		/**
		 * 1: Session.
		 * 2: Stats.
		 * 3: Back.
		 * 4. Exit.
		 */
		case 3:	RankPanel(client);
		case 4: Player[client].StatsPanel.Session = false;
	}
}

stock void OnDeathRankPanel(int client) {
	if(Player[client].StatsPanel.Main)
		RankPanel(client);
	else if(Player[client].StatsPanel.Session)
		RankPanel_CurrentSession(client);
	else if(Player[client].StatsPanel.TotalPage > 0)
		RankPanel_TotalPage(client, Player[client].StatsPanel.TotalPage);
}

stock void RankPanel_TotalPage(int client, int page) {
	switch(Global.Game) {
		case Game_TF2: RankPanel_Total_TF2(client, page);
	}
}

stock void Panel_TotalStatisticsCallback(MenuEx menu, MenuAction action, int client, int selection) {
	int page;
	switch((page = Player[client].StatsPanel.TotalPage)) {
		case 1:	{
			/**
			 * 1: Panel info.
			 * 2: Total statistics.
			 * 3: Back.
			 * 4: Next.
			 * 5: Exit.
			 */
			switch(selection) {
				case 1: RankPanel_TotalPage(client, page);
				case 2: RankPanel_TotalPage(client, page);
				case 3:	RankPanel(client);
				case 4: RankPanel_TotalPage(client, page+1);
				case 5:	{
					Player[client].StatsPanel.Main = false;
					Player[client].StatsPanel.Session = false;
					Player[client].StatsPanel.TotalPage = 0;
				}
			}
		}
		
		case 2:	{
			/**
			 * 1: Panel info.
			 * 2: Back.
			 * 3: Next.
			 * 4: Exit.
			 */
			switch(selection) {
				case 1: RankPanel_TotalPage(client, page);
				case 2: RankPanel_TotalPage(client, page-1);
				case 3:	RankPanel_TotalPage(client, page+1);
				case 4:	{
					Player[client].StatsPanel.Main = false;
					Player[client].StatsPanel.Session = false;
					Player[client].StatsPanel.TotalPage = 0;
				}
			}
		}
		
		case 3:	{
			/**
			 * 1: Panel info.
			 * 2: Back.
			 * 3: Next.
			 * 4: Exit.
			 */
			switch(selection) {
				case 1: RankPanel_TotalPage(client, page);
				case 2: RankPanel_TotalPage(client, page-1);
				case 3:	RankPanel_TotalPage(client, page+1);
				case 4:	{
					Player[client].StatsPanel.Main = false;
					Player[client].StatsPanel.Session = false;
					Player[client].StatsPanel.TotalPage = 0;
				}
			}
		}
		
		case 4:	{
			/**
			 * 1: Panel info.
			 * 2: Back.
			 * 3: Exit.
			 */
			switch(selection) {
				case 1: RankPanel_Total_TF2(client, page);
				case 2:	RankPanel_Total_TF2(client, page-1);
				case 3: {
					Player[client].StatsPanel.Main = false;
					Player[client].StatsPanel.Session = false;
					Player[client].StatsPanel.TotalPage = 0;
				}
			}
		}
	}
}