function GAZAK(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_EMOTE" then
        if arg1 == tbl.bossEmote and arg2 == tbl.bossName then
            tbl.variable = true
            CA:StartTimedAchievement(tbl)
        end
    elseif event == "CHAT_MSG_TEXT_EMOTE" then
        return tbl.variable and CA:TimedAchievementStillGood(tbl) and arg2 == UnitName("player") and arg1:find("fart") and UnitName("target") == tbl.bossName
    end
end

function AddGazak()
 
    GLOBAL_ACHIEVEMENTS["GAZAK10"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = "Gázak versenye (10 player)",
		description = "Fingjál rá Festergutra maximum 3 másodperc különbséggel miután ö elfingta magát",
		texture = "Interface\\Icons\\spell_holiday_tow_spicecloud",
		points = 30,
		key = "GAZAK10",
		save = TAchik,
		requiredState = { "Icecrown Citadel" , { 1 , 3 } },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		optimizeOnInstanceChange = true,
		criteria = 
		{
        	{ 
        	    requiredState = "The Plagueworks",
			    requiredFunction = "GetSubZoneText",
			    bossEmote = "%s farts.",
			    bossName = "Festergut",
			    timed = true,
	            startTime = 0,
	            duration = 2,
		        variable = false,
		        resetTemplate = false,
        	    events = { "CHAT_MSG_TEXT_EMOTE" , "CHAT_MSG_MONSTER_EMOTE" },
			    objective = GAZAK,
			    key = "GAZAK10C1",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["GAZAK25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = "Gázak versenye (25 player)",
		description = "Fingjál rá Festergutra maximum 3 másodperc különbséggel miután ö elfingta magát",
		texture = "Interface\\Icons\\spell_holiday_tow_spicecloud",
		points = 30,
		key = "GAZAK25",
		save = TAchik,
		requiredState = { "Icecrown Citadel" , { 2 , 4 } },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		optimizeOnInstanceChange = true,
		criteria = 
		{
        	{ 
        	    requiredState = "The Plagueworks",
			    requiredFunction = "GetSubZoneText",
			    bossEmote = "%s farts.",
			    bossName = "Festergut",
			    timed = true,
	            startTime = 0,
	            duration = 2,
		        variable = false,
		        resetTemplate = false,
        	    events = { "CHAT_MSG_TEXT_EMOTE" , "CHAT_MSG_MONSTER_EMOTE" },
			    objective = GAZAK,
			    key = "GAZAK25C1",
			},
		},
    });
	
end
