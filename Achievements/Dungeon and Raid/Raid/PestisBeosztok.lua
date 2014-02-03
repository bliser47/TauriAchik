function PESTISBEOSZTOK(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_YELL" then
        if arg1 == tbl.bossStart then
            tbl.variable = true
            CA:RegisterEvent(tbl,tbl.specialEvents)
        elseif tbl.variable and arg1 == tbl.bossEnd then
            return true
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
    
    end
end


function AddPestisBeosztok()
    
    
    GLOBAL_ACHIEVEMENTS["MUTIPLAGUE10"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = "Pestis Beosztók (10 player)",
		description = "Gyözd le Professor Putricide-ot Icecrown Citadelen belül, 10 fös nehézségen anélkül, hogy a Mutated Plague képessége felstackelne több mint kettesre",
		texture = "Interface\\Icons\\ability_rogue_deviouspoisons",
		points = 30,
		key = "MUTIPLAGUE10",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { "The Plagueworks" , { 1 , 3 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    bossStart = "Tastes like... Cherry! Oh! Excuse me!",
			    bossEnd = "Bad news, everyone! I don't think I'm going to make it.",
			    resetTemplate = false,
				resetOnWipe = true,
			    variable = false,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = PESTISBEOSZTOK,
			    key = "MUTIPLAGUE10C1",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["MUTIPLAGUE25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = "Pestis Beosztók (25 player)",
		description = "Gyözd le Professor Putricide-ot Icecrown Citadelen belül, 25 fös nehézségen anélkül, hogy a Mutated Plague képessége felstackelne több mint kettesre",
		texture = "Interface\\Icons\\ability_rogue_deviouspoisons",
		points = 30,
		key = "MUTIPLAGUE25",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { "The Plagueworks" , { 2 , 4 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    bossStart = "Tastes like... Cherry! Oh! Excuse me!",
			    bossEnd = "Bad news, everyone! I don't think I'm going to make it.",
			    resetTemplate = false,
				resetOnWipe = true,
			    variable = false,
        	    events = { "CHAT_MSG_MONSTER_YELL" },
        	    specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = PESTISBEOSZTOK,
			    key = "MUTIPLAGUE25C1",
			},
		},
    });
    
end
