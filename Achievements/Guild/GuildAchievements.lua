local CA = LibStub:GetLibrary("TauriAchikLib")
function CA:AddAchievement_GuildAchievements()


    local function GUILDDATA(tbl,event,...)
       if event == "CHAT_MSG_ADDON" then
           if arg1:find("GuildDataSend"..tbl.functionString) then
               CA:GuildUpdateData(tbl,arg2,arg4)
           end
       else
           CA:GuildRemoveOffline(tbl)
           CA:GuildRequestData(tbl)
           CA:GuildUpdateData(tbl,CA:GetFunctionData(tbl.functionString),UnitName("player"))
       end
       return tbl.value(tbl) >= tbl.required
    end

    local function GUILDDATAV(tbl)
        return CA:GetGuildData(tbl)
    end

	GLOBAL_ACHIEVEMENTS["LEVA"] = CA:AddAchievement(
	{
		category = TA_HIDDEN,
		name = "Guild különc",
		description = "w41yaiByw6EgZWd5IGd1aWxkdMOhcnNhZHJhIGFraSBtZWxsw7Z6IHTDqWdlZA==",
		texture = "Interface\\Icons\\Ability_rogue_disguise",
		points = 10,
		key = "LEVA",
		save = TAchik,
		hidden = true,
		criteria =
		{
			{
				events = "CHAT_MSG_IGNORED",
				objective =
				function(tbl,event,...)
                    return UnitIsInMyGuild(arg1)
				end,
				key = "LEVAC1",
			},
		},
	});

	GLOBAL_ACHIEVEMENTS["GADD"] = CA:AddAchievement(
	{
		category = TA_GUILD,
		name = "Üzletemberek",
		description = "Legyetek fent annyian a guildben, hogy aranyotok összege 300.000 vagy több legyen",
		texture = "Interface\\Icons\\Inv_ingot_03",
		points = 10,
		key = "GADD",
		save = TAchik,
		criteria =
		{
			{
				name = "300000 arany",
				value = GUILDDATAV,
				divide = 10000,
				variable = {},
				functionString = "GetMoney",
				required = 300000,
				events = { "PLAYER_ENTERING_WORLD" , "PLAYER_MONEY" , "GUILD_ROSTER_UPDATE" , "CHAT_MSG_ADDON" , "TACHIK_GMEMBER_CAME_ONLINE" },
				objective = GUILDDATA,
				key = "GADDC1",
			},
		},
	});

	GLOBAL_ACHIEVEMENTS["GHKK"] = CA:AddAchievement(
	{
		category = TA_GUILD,
		name = "Bérgyilkosok",
		description = "Legyetek fent annyian a guildben, hogy Honorable Kill-etek összege 250.000 vagy több legyen",
		texture = "Interface\\Icons\\ability_rogue_bloodsplatter",
		points = 10,
		key = "GHKK",
		save = TAchik,
		criteria =
		{
			{
				name = "250000 Honorable Kill",
				value = GUILDDATAV,
				variable = {},
				functionString = "GetPVPLifetimeStats",
				required = 250000,
				events = { "PLAYER_ENTERING_WORLD" , "PLAYER_PVP_KILLS_CHANGED" , "GUILD_ROSTER_UPDATE" , "CHAT_MSG_ADDON" , "TACHIK_GMEMBER_CAME_ONLINE" },
				objective = GUILDDATA,
				key = "GHKK1",
			},
		},
	});

	GLOBAL_ACHIEVEMENTS["GNACHI"] = CA:AddAchievement(
	{
		category = TA_GUILD,
		name = "Teljesítök",
		description = "Legyetek fent annyian a guildben, hogy Achievement pontjaitok összege 20.000 vagy több legyen",
		texture = "Interface\\Icons\\spell_arcane_mindmastery",
		points = 10,
		key = "GNACHI",
		save = TAchik,
		criteria =
		{
			{
				name = "20000 pont",
				value = GUILDDATAV,
				variable = {},
				functionString = "GetTotalAchievementPoints",
				required = 20000,
				events = { "PLAYER_ENTERING_WORLD" , "ACHIEVEMENT_EARNED"  ,  "CHAT_MSG_GUILD_ACHIEVEMENT" , "GUILD_ROSTER_UPDATE" , "CHAT_MSG_ADDON" , "TACHIK_GMEMBER_CAME_ONLINE" },
				objective = GUILDDATA,
				key = "GNACHI",
			},
		},
	});

	GLOBAL_ACHIEVEMENTS["GNFPATH"] = CA:AddAchievement(
	{
		category = TA_GUILD,
		name = "Taxizunk ha kell, ha nem",
		description = "Legyetek fent annyian a guildben, hogy 1.000 vagy több repülési útvonalat tettetek meg",
		texture = "Interface\\Icons\\ability_hunter_pet_dragonhawk",
		points = 10,
		key = "GNFPATH",
		save = TAchik,
		criteria =
		{
			{
				name = "1000 repülési útvonal",
				value = GUILDDATAV,
				variable = {},
				functionString = "GetStatistic,349",
				required = 1000,
				events = { "PLAYER_ENTERING_WORLD" , "TAXIMAP_CLOSED" , "GUILD_ROSTER_UPDATE" , "CHAT_MSG_ADDON" , "TACHIK_GMEMBER_CAME_ONLINE" },
				objective = GUILDDATA,
				key = "GNFPATH",
			},
		},
	});

	GLOBAL_ACHIEVEMENTS["GNDUEL"] = CA:AddAchievement(
	{
		category = TA_GUILD,
		name = "Párbaj Mesterek",
		description = "Legyetek fent annyian a guildben, hogy 1.000 vagy több megnyert párbajotok legyen",
		texture = "Interface\\Icons\\inv_inscription_tarotdeath",
		points = 10,
		key = "GNDUEL",
		save = TAchik,
		criteria =
		{
			{
				name = "1000 párbaj",
				value = GUILDDATAV,
				variable = {},
				functionString = "GetStatistic,319",
				required = 1000,
				events = { "PLAYER_ENTERING_WORLD" , "DUEL_FINISHED" , "GUILD_ROSTER_UPDATE" , "CHAT_MSG_ADDON" , "TACHIK_GMEMBER_CAME_ONLINE" },
				objective = GUILDDATA,
				key = "GNDUEL",
			},
		},
	});

end


