local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_AfkCity()

    local function AFKCITY(tbl,event,...)
	    if event == "TIME_UPDATE" then
		    return tbl.startTime >= tbl.duration
		else
	        local zone = GetZoneText()
	        if tContains(tbl.needZone[UnitFactionGroup("player")],zone) then
		        TA:StartTimedAchievement(tbl,"OnForward")
		    else
		        TA:PauseTimedAchievement(tbl)
		        return tbl.startTime > tbl.duration
		    end
		end
	end

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		nameHorde = "Orgrimmari Látogatás",
		nameAlliance = "Stormwind City Látogatás",
		descriptionHorde = "Tölts el legalább 1 órát Orgrimmar területén",
		descriptionAlliance = "Tölts el legalább 1 órát Stormwind City területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_orc",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_human",
		factionDependent = true,
		points = 10,
		key = "AFKCITY",
		save = TAchik,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 3599,
				needZone =
				{
				    ["Horde"] = { "Orgrimmar" },
					["Alliance"] = { "Stormwind City" , "Stormwind Harbor" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITYC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		nameHorde = "Orgrimmari Túra",
		nameAlliance = "Stormwind City Túra",
		previous = TA.achisKeys["AFKCITY"],
		descriptionHorde = "Tölts el legalább 1 napot Orgrimmar területén",
		descriptionAlliance = "Tölts el legalább 1 napot Stormwind City területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_orc",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_human",
		factionDependent = true,
		points = 10,
		key = "AFKCITY2",
		save = TAchik,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 86399,
				needZone =
				{
				    ["Horde"] = { "Orgrimmar" },
					["Alliance"] = { "Stormwind City" , "Stormwind Harbor" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY2C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		nameHorde = "Orgrimmari Kirándulás",
		nameAlliance = "Stormwind City Kirándulás",
		previous = TA.achisKeys["AFKCITY2"],
		descriptionHorde = "Tölts el legalább 1 hetet Orgrimmar területén",
		descriptionAlliance = "Tölts el legalább 1 hetet Stormwind City területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_orc",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_human",
		factionDependent = true,
		points = 10,
		key = "AFKCITY21",
		save = TAchik,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 604799,
				needZone =
				{
				    ["Horde"] = { "Orgrimmar" },
					["Alliance"] = { "Stormwind City" , "Stormwind Harbor" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY21C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		nameHorde = "Thunder Bluff Látogatás",
		nameAlliance = "Ironforge Látogatás",
		descriptionHorde = "Tölts el legalább 1 órát Thunder Bluff területén",
		descriptionAlliance = "Tölts el legalább 1 órát Ironforge területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_tauren",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_dwarf",
		factionDependent = true,
		points = 10,
		key = "AFKCITY3",
		save = TAchik,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 3599,
				needZone =
				{
				    ["Horde"] = { "Thunder Bluff" },
					["Alliance"] = { "City of Ironforge" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY3C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		previous = TA.achisKeys["AFKCITY3"],
		nameHorde = "Thunder Bluff Túra",
		nameAlliance = "Ironforge Túra",
		descriptionHorde = "Tölts el legalább 1 napot Thunder Bluff területén",
		descriptionAlliance = "Tölts el legalább 1 napot Ironforge területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_tauren",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_dwarf",
		factionDependent = true,
		points = 10,
		key = "AFKCITY4",
		save = TAchik,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 86399,
				needZone =
				{
				    ["Horde"] = { "Thunder Bluff" },
					["Alliance"] = { "City of Ironforge" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY4C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		nameHorde = "Undercity Látogatás",
		nameAlliance = "Darnassus Látogatás",
		descriptionHorde = "Tölts el legalább 1 órát Undercity területén",
		descriptionAlliance = "Tölts el legalább 1 órát Darnassus területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_scourge",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_nightelf",
		factionDependent = true,
		points = 10,
		key = "AFKCITY5",
		save = TAchik,
		requiredStateHorde = 2,
		requiredStateAlliance = 1,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 3599,
				needZone =
				{
				    ["Horde"] = { "Undercity" },
					["Alliance"] = { "Darnassus" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY5C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		previous = TA.achisKeys["AFKCITY5"],
		nameHorde = "Undercity Túra",
		nameAlliance = "Darnassus Túra",
		descriptionHorde = "Tölts el legalább 1 órát Undercity területén",
		descriptionAlliance = "Tölts el legalább 1 órát Darnassus területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_scourge",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_nightelf",
		factionDependent = true,
		points = 10,
		key = "AFKCITY6",
		save = TAchik,
		requiredStateHorde = 2,
		requiredStateAlliance = 1,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 86399,
				needZone =
				{
				    ["Horde"] = { "Undercity" },
					["Alliance"] = { "Darnassus" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY6C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		nameHorde = "Silvermoon City Túra",
		nameAlliance = "The Exodar Túra",
		descriptionHorde = "Tölts el legalább 1 órát Silvermoon City területén",
		descriptionAlliance = "Tölts el legalább 1 órát The Exodar területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_draenei",
		factionDependent = true,
		points = 10,
		key = "AFKCITY7",
		save = TAchik,
		requiredStateHorde = 2,
		requiredStateAlliance = 1,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 3599,
				needZone =
				{
				    ["Horde"] = { "Silvermoon City" },
					["Alliance"] = { "The Exodar" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY7C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_VISITOR,
		previous = TA.achisKeys["AFKCITY7"],
		nameHorde = "Silvermoon City Túra",
		nameAlliance = "The Exodar Túra",
		descriptionHorde = "Tölts el legalább 1 órát Silvermoon City területén",
		descriptionAlliance = "Tölts el legalább 1 órát The Exodar területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf",
		textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_draenei",
		factionDependent = true,
		points = 10,
		key = "AFKCITY8",
		save = TAchik,
		requiredStateHorde = 2,
		requiredStateAlliance = 1,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 86399,
				needZone =
				{
				    ["Horde"] = { "Silvermoon City" },
					["Alliance"] = { "The Exodar" }
				},
				events = { "ZONE_CHANGED" , "ZONE_CHANGED_NEW_AREA" , "PLAYER_ENTERING_WORLD" },
				value = function(tbl) return tbl.variable end,
				objective = AFKCITY,
				key = "AFKCITY8C1",
			},
		},
	});

end
