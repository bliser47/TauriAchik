function MANASZUROK(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_YELL" then
        if (arg1:lower()):find(tbl.bossStart:lower())  then
			tbl.variable = true
			CA:StartTimedAchievement(tbl,event)
        elseif (arg1:lower()):find(tbl.bossAction:lower()) then
            return tbl.variable
        end
    end
end

function MANASZUROK2(tbl,event,...)
    return (arg1:lower()):find(tbl.bossEnd:lower()) 
end

function AddNemArad()

    GLOBAL_ACHIEVEMENTS["MANASZUROK25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = "Manaszivók (10 player)",
		description = "Gyözd le Lady Deathwhispert Icecrown Citadelen belül, 10 fös nehézségen, miután elfogyasztod a manáját kevesebb mint 1 perc alatt",
		texture = "Interface\\Icons\\inv_elemental_mote_mana",
		points = 30,
		key = "MANASZUROK10",
		save = TAchik,
		requiredState = { "Icecrown Citadel" , { 1 , 3 } },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		optimizeOnInstanceChange = true,
		events = { "PLAYER_REGEN_ENABLED" , "PLAYER_ENTERING_WORLD" },
		resetOnWipe = true,
		criteria = 
		{
        	{ 
			    name = "Fogyaszd el a manáját 1 perc alatt",
        	    requiredState = "Oratory of the Damned",
			    requiredFunction = "GetSubZoneText",
			    bossStart = "What is this disturbance",
				bossAction = "Enough! I see i must take matters into my own hands!",
				timed = true,
	            startTime = 0,
	            duration = 60,
        	    variable = false,
        	    events = "CHAT_MSG_MONSTER_YELL" ,
				activate = "MANASZUROK10C2",
			    objective = MANASZUROK,
			    key = "MANASZUROK10C1",
			},
			{
			    name = "Gyözd le Lady Deathwhispert",
				bossEnd = "All part of the masters plan! Your end is... inevitable!",
                events = {},
				specialEvents = { "CHAT_MSG_MONSTER_YELL" },
				activator = "MANASZUROK10C1",
				objective = MANASZUROK2,
				key = "MANASZUROK10C2",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["MANASZUROK25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = "Manaszivók (25 player)",
		description = "Gyözd le Lady Deathwhispert Icecrown Citadelen belül, 25 fös nehézségen, miután elfogyasztod a manáját kevesebb mint 2 perc alatt",
		texture = "Interface\\Icons\\inv_elemental_mote_mana",
		points = 30,
		key = "MANASZUROK25",
		save = TAchik,
		requiredState = { "Icecrown Citadel" , { 2 , 4 } },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		optimizeOnInstanceChange = true,
		events = { "PLAYER_REGEN_ENABLED" , "PLAYER_ENTERING_WORLD" },
		resetOnWipe = true,
		criteria = 
		{
        	{ 
			    name = "Fogyaszd el a manáját 2 perc alatt",
        	    requiredState = "Oratory of the Damned",
			    requiredFunction = "GetSubZoneText",
			    bossStart = "What is this disturbance",
				bossAction = "Enough! I see i must take matters into my own hands!",
				timed = true,
	            startTime = 0,
	            duration = 120,
        	    variable = false,
        	    events = "CHAT_MSG_MONSTER_YELL" ,
				activate = "MANASZUROK25C2",
			    objective = MANASZUROK,
			    key = "MANASZUROK25C1",
			},
			{
			    name = "Gyözd le Lady Deathwhispert",
				bossEnd = "All part of the masters plan! Your end is... inevitable!",
                events = {},
				specialEvents = { "CHAT_MSG_MONSTER_YELL" },
				activator = "MANASZUROK25C1",
				objective = MANASZUROK2,
				key = "MANASZUROK25C2",
			},
		},
    });
	
end
