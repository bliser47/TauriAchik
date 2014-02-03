function VERFOLT(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_YELL" then
        if arg1 == tbl.bossStart then
            tbl.variable = true
            CA:RegisterEvent(tbl,tbl.specialEvents)
        elseif tbl.variable and arg1 == tbl.bossEnd then
            return true
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        if tbl.variable and arg7 == UnitName("player") then
            if arg2 == "SWING_DAMAGE" and arg4 == "Blood Beast" then
                tbl.variable = false
                CA:UnRegisterEvent(tbl,tbl.specialEvents)
            end
        end
    elseif event == "PLAYER_DEAD" or event == "PLAYER_REGEN_ENABLED" then 
        if UnitAffectingCombat("player") == nil then
            tbl.variable = false
            CA:UnRegisterEvent(tbl,tbl.specialEvents)
        end
    elseif tbl.variable then
        CA:RegisterEvent(tbl,tbl.specialEvents)
    end
end

function AddVerfolt()
    
    GLOBAL_ACHIEVEMENTS["VERFOLT10"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = "Vérfolt mentes (10 player)",
		description = "Gyözd le Deathbringer Saurfangot Icecrown Citadelen belül, 10 fös nehézségen anélkül, hogy meghalnál és a harc alatt megsebezne akár egy Blood Beast is",
		texture = "Interface\\Icons\\spell_shadow_lifedrain",
		points = 30,
		key = "VERFOLT10",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { { "Deathbringer's Rise" , "Rampart of Skulls" } , { 1 , 3 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    bossStart = "BY THE MIGHT OF THE LICH KING!",
			    bossEnd = "I... Am... Released...",
			    resetTemplate = false,
			    variable = false,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "PLAYER_DEAD" , "PLAYER_REGEN_ENABLED", "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = VERFOLT,
			    key = "VERFOLT10C1",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["VERFOLT25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = "Vérfolt mentes (25 player)",
		description = "Gyözd le Deathbringer Saurfangot Icecrown Citadelen belül, 25 fös nehézségen anélkül, hogy meghalnál és a harc alatt megsebezne akár egy Blood Beast is",
		texture = "Interface\\Icons\\spell_shadow_lifedrain",
		points = 30,
		key = "VERFOLT25",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { { "Deathbringer's Rise" , "Rampart of Skulls" } , { 2 , 4 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    bossStart = "BY THE MIGHT OF THE LICH KING!",
			    bossEnd = "I... Am... Released...",
			    resetTemplate = false,
			    variable = false,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "PLAYER_DEAD" , "PLAYER_REGEN_ENABLED", "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = VERFOLT,
			    key = "VERFOLT25C1",
			},
		},
    });
	
end
