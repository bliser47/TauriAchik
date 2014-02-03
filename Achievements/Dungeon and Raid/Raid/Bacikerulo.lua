function BACIKERULO(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_YELL" then
        if arg1 == tbl.bossStart then
            tbl.variable = true
            CA:RegisterEvent(tbl,tbl.specialEvents)
        elseif tbl.variable and arg1 == tbl.bossEnd then
            return true
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        if tbl.variable and arg7 == UnitName("player") then
            if arg2 == "SPELL_DAMAGE" and arg10 == "Slime Spray" then
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

function AddBacikerulo()
	
	GLOBAL_ACHIEVEMENTS["BACIKERULO10"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = "Bacikerülö (10 player)",
		description = "Gyözd le Rotfacet Icecrown Citadelen belül, 10 fös nehézségen anélkül, hogy meghalnál és a harc alatt megsebezne Rotface köpése",
		texture = "Interface\\Icons\\inv_misc_slime_01",
		points = 30,
		key = "BACIKERULO10",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { "The Plagueworks" , { 1 , 3 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    bossStart = "WEEEEEE!",
			    bossEnd = "Bad news daddy...",
			    resetTemplate = false,
			    variable = false,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "PLAYER_DEAD" , "PLAYER_REGEN_ENABLED", "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = BACIKERULO,
			    key = "BACIKERULO10C1",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["BACIKERULO25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = "Bacikerülö (25 player)",
		description = "Gyözd le Rotfacet Icecrown Citadelen belül, 25 fös nehézségen anélkül, hogy meghalnál és a harc alatt megsebezne Rotface köpése",
		texture = "Interface\\Icons\\inv_misc_slime_01",
		points = 30,
		key = "BACIKERULO25",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { "The Plagueworks" , { 2 , 4 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    bossStart = "WEEEEEE!",
			    bossEnd = "Bad news daddy...",
			    resetTemplate = false,
			    variable = false,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "PLAYER_DEAD" , "PLAYER_REGEN_ENABLED", "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = BACIKERULO,
			    key = "BACIKERULO25C1",
			},
		},
    });
    
end
