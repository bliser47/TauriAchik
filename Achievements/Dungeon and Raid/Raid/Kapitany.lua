function CAPTAIN(tbl,event,...)
    if event == "CHAT_MSG_MONSTER_YELL" then
        if arg1 == tbl.yellAlliance or arg1 == tbl.yellHorde then
            return UnitBuff("player",GetSpellInfo(tbl.needAura))
        end
    end
end

function AddKapitany()

    GLOBAL_ACHIEVEMENTS["CAPTAIN10"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID10,
		name = UnitName("player").." Sparrow kapitány (10 player)",
		description = "Arass gyözelmet a Gunship Battle csatába Icecrown Citadelen belül, 10 fös nehézségen úgy, hogy kalóznak vagy álcázva",
		texture = "Interface\\Icons\\inv_helmet_66",
		points = 30,
		key = "CAPTAIN10",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { "Rampart of Skulls" , { 1 , 3 } },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    yellAlliance = "Don't say I didn't warn ya, scoundrels! Onward, brothers and sisters!",
			    yellHorde = "The Alliance falter. Onward to the Lich King!",
			    needAura = 8222,
        	    events = "CHAT_MSG_MONSTER_YELL",
			    objective = CAPTAIN,
			    key = "CAPTAIN10C1",
			},
		},
    });
    
    GLOBAL_ACHIEVEMENTS["CAPTAIN25"] = CA:AddAchievement(
    {
		category = TA_PVE_RAID25,
		name = UnitName("player").." Sparrow kapitány (25 player)",
		description = "Arass gyözelmet a Gunship Battle csatába Icecrown Citadelen belül, 25 fös nehézségen úgy, hogy kalóznak vagy álcázva",
		texture = "Interface\\Icons\\inv_helmet_66",
		points = 30,
		key = "CAPTAIN25",
		save = TAchik,
		criteria = 
		{
        	{ 
        	    requiredState = { "Rampart of Skulls" , { 2 , 4 } , 1 },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
			    yellAlliance = "Don't say I didn't warn ya, scoundrels! Onward, brothers and sisters!",
			    yellHorde = "The Alliance falter. Onward to the Lich King!",
			    needAura = 8222,
        	    events = "CHAT_MSG_MONSTER_YELL",
			    objective = CAPTAIN,
			    key = "CAPTAIN25C1",
			},
		},
    });
	
end
