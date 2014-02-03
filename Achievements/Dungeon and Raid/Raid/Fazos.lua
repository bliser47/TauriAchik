function FAZOS(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_YELL" then
        if (arg1:lower()):find((tbl.bossStart):lower()) then
            tbl.variable = true
            CA:RegisterEvent(tbl,tbl.specialEvents)
        else
            return tbl.variable and (arg1:lower()):find((tbl.bossEnd):lower())
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        if arg7 == UnitName("player") then
            if arg2 == "SPELL_PERIODIC_DAMAGE" and arg4 == "Coldflame" then
                tbl.variable = false
                CA:UnRegisterEvent(tbl,tbl.specialEvents)
            end
        end
    end
end

function AddFazos()

	GLOBAL_ACHIEVEMENTS["FAZOS10"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = "Fázós (10 player)",
		description = "Gyözd le Lord Marrowgart Icecrown Citadelen belül, 10 fös nehézségen anélkül, hogy meghalnál és a harc alatt megsebezne a Coldflame képessége",
		texture = "Interface\\Icons\\spell_fire_bluehellfire",
		points = 30,
		key = "FAZOS10",
		save = TAchik,
		requiredState = { "Icecrown Citadel" , { 1 , 3 } },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		optimizeOnInstanceChange = true,
		criteria = 
		{
        	{ 
        	    requiredState = "The Spire", 
			    requiredFunction = "GetSubZoneText", 
			    bossStart = "The Scourge will wash over this world as a swarm of death and destruction!",
			    bossEnd = "I see... Only darkness.",
			    resetTemplate = false,
        	    variable = false,
				resetOnWipe = true,
				resetOnDeath = true,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				registerOnLogonIf = { ["state"] = "variable" , ["table"] = "specialEvents" },
			    objective = FAZOS,
			    key = "FAZOS10C1",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["FAZOS25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = "Fázós (25 player)",
		description = "Gyözd le Lord Marrowgart Icecrown Citadelen belül, 25 fös nehézségen anélkül, hogy meghalnál és a harc alatt megsebezne a Coldflame képessége",
		texture = "Interface\\Icons\\spell_fire_bluehellfire",
		points = 30,
		key = "FAZOS25",
		save = TAchik,
		requiredState = { "Icecrown Citadel" , { 2 , 4 } },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		optimizeOnInstanceChange = true,
		criteria = 
		{
        	{ 
        	    requiredState = "The Spire",
			    requiredFunction = "GetSubZoneText",
			    bossStart = "The Scourge will wash over this world as a swarm of death and destruction!",
			    bossEnd = "I see... Only darkness.",
			    resetTemplate = false,
        	    variable = false,
				resetOnWipe = true,
				resetOnDeath = true,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				registerOnLogonIf = { ["state"] = "variable" , ["table"] = "specialEvents" },
			    objective = FAZOS,
			    key = "FAZOS25C1",
			},
		},
    });
	
end