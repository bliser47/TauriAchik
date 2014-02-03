local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_PostasAchik()

	local function CAPITALPOSTA(tbl,event,...)
	    local x,y = GetPlayerMapPosition("player")
		x = x*100
		y = y*100
		local gridString = (x-1).."-"..(x+1).."/"..(y-1).."-"..(y+1)
		local foundInDb = false
		for k,v in pairs(tbl.coords[UnitFactionGroup("player")]) do
			if TAchik_InMapGrid(v) and TAchik_InMapGrid(gridString) then
				foundInDb = k
            end
        end
		if foundInDb then
            TA:StartTimedAchievement(tbl)
		    if not tContains(tbl.variable,foundInDb) then
			    tinsert(tbl.variable,foundInDb)
			    return tbl.value(tbl) >= tbl.required
		    end
		end
	end

	local function CAPITALPOSTAV(tbl)
	    return #tbl.variable
	end

	TA:AddAchievement(
	{
		category = TA_FUN_MAILBOX,
		nameHorde = "Orgrimmar Postakarbantartás",
		nameAlliance = "Stormwind City Postakarbantartás",
		descriptionHorde = "Használd Orgrimmar összes postaládáját 2 perc és 30 másodperc alatt",
		descriptionAlliance = "Használd Stormwind City összes postaládáját 5 perc alatt",
		texture = "Interface\\Icons\\inv_letter_02",
		points = 20,
		key = "CAPITAL1POSTA",
		factionDependent = true,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		save = TAchik,
		accountWide = true,
		criteria =
		{
			{
			    requiredStateHorde = "Orgrimmar",
				requiredStateAlliance = { "Stormwind City" , "Stormwind Harbor" },
		        requiredFunction = "GetZoneText",
		        requiredEvents = "ZONE_CHANGED",
				factionDependent = true,
				variable = {},
				requiredHorde = 11,
				requiredAlliance = 21,
				coords =
				{
				    ["Horde"] =
					{
				        "48.72-50.72/70.40-72.40",
					    "49.95-51.95/69.46-71.46",
					    "52.42-54.42/65.21-67.21",
					    "50.66-52.66/58.07-60.07",
					    "59.69-61.69/54.58-56.58",
					    "61.13-63.13/39.63-41.63",
					    "47.70-49.70/36.67-38.67",
					    "80.44-82.44/20.18-22.18",
					    "50.81-52.81/45.52-47.52",
					    "44.32-46.32/52.94-54.94",
					    "37.31-39.31/73.53-75.53"
					},
					["Alliance"] =
					{
					    "60.71-62.72/75.10-77.10",
						"61.46-63.45/73.69-75.69",
						"60.60-62.60/69.79-71.79",
						"73.48-75.48/54.33-56.33",
						"71.80-73.80/47.64-49.64",
						"66.38-68.38/48.72-50.72",
						"63.64-65.65/36.03-38.03",
						"60.46-62.46/42.42-44.42",
						"59.70-61.70/49.57-51.57",
						"53.64-55.64/56.53-58.53",
						"44.65-46.65/53.04-55.04",
						"36.89-38.89/33.40-35.40",
						"29.30-31.30/24.59-26.59",
						"29.30-31.30/48.17-50.17",
						"35.80-37.80/68.08-70.08",
						"49.54-51.54/88.85-90.85",
						"48.65-50.68/86.01-88.01",
						"56.36-58.36/70.74-72.74",
						"49.95-51.95/69.46-71.46",
						"53.65-55.65/61.97-63.97",
						"65.66-67.66/64.32-66.32"
					}
				},
				value = CAPITALPOSTAV,
				events = "MAIL_SHOW",
				timed = true,
				startTime = 0,
				durationHorde = 150,
				durationAlliance = 300,
				objective = CAPITALPOSTA,
				key = "CAPITAL1POSTAC1",
			}

		},
	})

	TA:AddAchievement(
	{
		category = TA_FUN_MAILBOX,
		nameHorde = "Undercity Postakarbantartás",
		nameAlliance = "Darnassus Postakarbantartás",
		descriptionHorde = "Használd Undercity összes postaládáját 55 másodperc alatt",
		descriptionAlliance = "Használd Darnassus összes postaládáját 1 perc alatt",
		textureHorde = "Interface\\Icons\\inv_letter_17",
		textureAlliance = "Interface\\Icons\\inv_letter_08",
		points = 10,
		key = "CAPITAL2POSTA",
		save = TAchik,
		factionDependent = true,
		requiredStateAlliance = 1,
		requiredStateHorde = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		accountWide = true,
		criteria =
		{
			{
			    factionDependent = true,
			    requiredStateHorde = "Undercity",
				requiredStateAlliance = "Darnassus",
		        requiredFunction = "GetZoneText",
		        requiredEvents = "ZONE_CHANGED",
				variable = {},
				requiredHorde = 7,
				requiredAlliance = 5,
				coords =
				{
				    ["Horde"] =
					{
				        "69.17-71.17/50.49-52.49",
				        "68.98-70.98/35.50-37.50",
					    "61.25-63.25/35.16-37.16",
					    "61.08-63.08/50.66-52.66",
					    "70.51-72.51/60.57-62.57",
					    "67.03-69.03/37.25-39.25",
					    "65.50-67.50/49.33-51.33"
					},
					["Alliance"] =
					{
					    "40.74-42.74/40.88-42.88",
						"54.77-56.77/44.48-46.48",
						"58.74-60.74/53.88-55.88",
						"63.66-65.66/70.44-72.44",
						"66.09-68.09/15.55-17.55",
					}
				},
				value = CAPITALPOSTAV,
				events = "MAIL_SHOW",
				timed = true,
				startTime = 0,
				durationAlliance = 60,
				durationHorde = 55,
				objective = CAPITALPOSTA,
				key = "CAPITAL2POSTAC1",
			}

		},
	})

	TA:AddAchievement(
	{
		category = TA_FUN_MAILBOX,
		nameHorde = "Thunder Bluff Postakarbantartás",
		nameAlliance = "Ironforge Postakarbantartás",
		descriptionAlliance = "Használd Ironforge összes postaládáját 50 másodperc alatt",
		descriptionHorde = "Használd Thunder Bluff egyetlen postaládáját 100 alkalommal 10 másodperc alatt",
		texture = "Interface\\Icons\\inv_letter_05",
		points = 5,
		key = "CAPITAL3POSTA",
		save = TAchik,
		factionDependent = true,
		requiredStateHorde = 1,
		requiredStateAlliance = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		accountWide = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
			    requiredState = "Thunder Bluff",
		        requiredFunction = "GetZoneText",
		        requiredEvents = "ZONE_CHANGED",
				variable = 0,
				required = 100,
				value = function(tbl) return tbl.variable end,
				events = "MAIL_SHOW",
				timed = true,
				startTime = 0,
				duration = 10,
				objective =
				function(tbl,event,...)
				    TA:StartTimedAchievement(tbl)
				    tbl.variable = tbl.variable +1
					return tbl.value(tbl) >= tbl.required
				end,
				key = "CAPITAL3POSTAC1",
			},
			{
			    factionExistent = "Alliance",
			    requiredState = "City of Ironforge",
		        requiredFunction = "GetZoneText",
		        requiredEvents = "ZONE_CHANGED",
				variable = {},
				required = 4,
				value = CAPITALPOSTAV,
				events = "MAIL_SHOW",
				coords =
				{
					["Alliance"] =
					{
					    "20.01-22.01/51.25-53.25",
						"32.19-34.19/63.83-65.83",
						"70.18-72.18/71.16-73.16",
						"71.24-73.24/47.98-49.98"
					}
				},
				timed = true,
				startTime = 0,
				duration = 50,
				objective = CAPITALPOSTA,
				key = "CAPITAL3POSTAC2",
			}

		},
	})

	TA:AddAchievement(
	{
		category = TA_FUN_MAILBOX,
		nameHorde = "Silvermoon City Postakarbantartás",
		nameAlliance = "The Exodar Postakarbantartás",
		descriptionHorde = "Használd Silvermoon City összes postaládáját 2 perc alatt",
		descriptionAlliance = "Használd The Exodar összes postaládáját 50 másodperc alatt",
		texture = "Interface\\Icons\\inv_letter_13",
		points = 10,
		key = "CAPITAL4POSTA",
		save = TAchik,
		factionDependent = true,
		requiredStateAlliance = 1,
		requiredStateHorde = 2,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		accountWide = true,
		criteria =
		{
			{
			    factionDependent = true,
			    requiredStateAlliance = "The Exodar",
			    requiredStateHorde = "Silvermoon City",
		        requiredFunction = "GetZoneText",
		        requiredEvents = "ZONE_CHANGED",
				variable = {},
				requiredAlliance = 4,
				requiredHorde = 11,
				coords =
				{
				    ["Horde"] =
					{
				        "66.92-68.92/28.37-30.37",
					    "81.26-83.26/41.96-43.96",
					    "86.86-88.86/49.96-51.96",
					    "81.89-83.89/60.79-62.79",
					    "81.92-83.92/64.75-66.75",
						"70.25-72.25/78.24-80.24",
						"70.27-72.27/73.89-75.89",
					    "63.35-65.35/73.49-75.49",
					    "57.85-59.85/60.56-62.56",
					    "64.78-66.78/52.85-54.85",
					    "73.96-75.96/53.93-55.93"
					},
					["Alliance"] =
					{
                        "50.03-52.03/42.15-44.15",
						"58.94-60.94/50.75-52.75",
						"57.94-59.94/26.57-28.57",
						"78.29-80.29/62.14-64.14"
					}
				},
				value = CAPITALPOSTAV,
				events = "MAIL_SHOW",
				timed = true,
				startTime = 0,
				durationAlliance = 50,
				durationHorde = 120,
				objective = CAPITALPOSTA,
				key = "CAPITAL4POSTAC1",
			}

		},
	})

	local function POSTAM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_FUN_MAILBOX,
		name = "Postakarbantartó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\inv_letter_03",
		points = 10,
		save = TAchik,
		key = "POSTAS",
		accountWide = true,
		criteria =
		{
			{
			    factionDependent = true,
		        nameHorde = "Orgrimmar Postakarbantartás",
		        nameAlliance = "Stormwind City Postakarbantartás",
				achievement = TA.achisKeys["CAPITAL1POSTA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = POSTAM,
				key = "POSTASC1",
			},
			{
			    factionDependent = true,
		        nameHorde = "Undercity Postakarbantartás",
		        nameAlliance = "Darnassus City Postakarbantartás",
				achievement = TA.achisKeys["CAPITAL2POSTA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = POSTAM,
				key = "POSTASC2",
			},
			{
			    factionDependent = true,
		        nameHorde = "Thunder Bluff Postakarbantartás",
		        nameAlliance = "Exodar Postakarbantartás",
				achievement = TA.achisKeys["CAPITAL3POSTA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = POSTAM,
				key = "POSTASC3",
			},
			{
			    factionDependent = true,
		        nameHorde = "Silvermoon City Postakarbantartás",
		        nameAlliance = "Ironforge Postakarbantartás",
				achievement = TA.achisKeys["CAPITAL4POSTA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = POSTAM,
				key = "POSTASC4",
			},
		}
    });

end
