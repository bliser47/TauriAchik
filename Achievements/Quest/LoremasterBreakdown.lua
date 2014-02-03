local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_LoremasterBreakdown()

	local function COMPLETEQUEST_ZONEV(tbl)
	    local completed = 0
	    for k,v in ipairs(QuestData[tbl.continent][tbl.needZone]) do
	        if TA.compQuests.table[v.id] == true then
	            completed = completed + 1
	        end
	    end
	    return completed
    end

    local function COMPLETEQUEST_ZONE(tbl,event,...)
        return COMPLETEQUEST_ZONEV(tbl) >= tbl.required
    end

    TA:AddAchievement(
	{
		categoryHorde = TA_QUESTS_EASTERN_KINGDOMS,
		categoryAlliance = TA_QUESTS_KALIMDOR,
		nameHorde = "Tirisfal Glades Küldetések",
		descriptionHorde = "Teljesíts 40 küldetést Tirisfal Glades területén",
		nameAlliance = "Teldrassil Küldetések",
		descriptionAlliance = "Teljesíts 35 küldetést Teldrassil területén",
		textureAlliance = "Interface\\Icons\\achievement_zone_darnassus",
		textureHorde = "Interface\\Icons\\achievement_zone_tirisfalglades_01",
		points = 10,
		key = "KEZDO1QUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (1-10)",
		racePriority = { "Undead" , "Night Elf" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 85,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO1C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 35,
				needZone = 141,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO1C2",
			},
		},
	})

	TA:AddAchievement(
	{
		categoryHorde = TA_QUESTS_EASTERN_KINGDOMS,
		categoryAlliance = TA_QUESTS_KALIMDOR,
		nameHorde = "Eversong Woods Küldetések",
		descriptionHorde = "Teljesíts 50 küldetést Eversong Woods területén",
		textureHorde = "Interface\\Icons\\achievement_zone_eversongwoods",
		nameAlliance = "Azuremyst Isle Küldetések",
		descriptionAlliance = "Teljesíts 45 küldetést Azuremyst Isle területén",
		textureAlliance = "Interface\\Icons\\achievement_zone_azuremystisle_01",
		points = 10,
		key = "KEZDO2QUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (1-10)",
		racePriority = { "Draenei" , "Blood Elf" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 3430,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO2C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 45,
				needZone = 3524,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO2C2",
			},
		},
	})

	 TA:AddAchievement(
	{
		categoryHorde = TA_QUESTS_KALIMDOR,
		categoryAlliance = TA_QUESTS_EASTERN_KINGDOMS,
		nameHorde = "Durotar Küldetések",
		descriptionHorde = "Teljesíts 35 küldetést Durotar területén",
		textureHorde = "Interface\\Icons\\achievement_zone_durotar",
		nameAlliance = "Elwynn Forest Küldetések",
		descriptionAlliance = "Teljesíts 40 küldetést Elwynn Forest területén",
		textureAlliance = "Interface\\Icons\\achievement_zone_elwynnforest",
		points = 10,
		key = "KEZDO5QUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (1-10)",
		racePriority = { "Orc" , "Troll" , "Human" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 35,
				needZone = 14,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO5QUESTC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 12,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO5QUESTC2",
			},
		},
	})


	TA:AddAchievement(
    {
        category = TA_QUESTS_EASTERN_KINGDOMS,
        name = "Westfall Küldetések",
        description = "Teljesíts 25 küldetést Westfall területén",
        texture = "Interface\\Icons\\achievement_zone_westfall_01",
		points = 5,
        key = "WESTFALLQUEST",
        save = TAchik,
        factionExistent = "Alliance",
		unmergeable = true,
        info = "Level (10-20)",
		racePriority = { "Human" },
        criteria =
        {

            {
                events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
                value = COMPLETEQUEST_ZONEV,
                required = 25,
                needZone = 40,
                continent = "Eastern Kingdoms",
                objective = COMPLETEQUEST_ZONE,
                key = "WESTFALLQUESTC1",
            },
        },
    })


	TA:AddAchievement(
	{
		categoryHorde = TA_QUESTS_EASTERN_KINGDOMS,
		categoryAlliance = TA_QUESTS_KALIMDOR,
		nameHorde = "Ghostlands Küldetések",
		descriptionHorde = "Teljesíts 45 küldetést Ghostlands területén",
		textureHorde = "Interface\\Icons\\achievement_zone_ghostlands",
		nameAlliance = "Bloodmyst Isle Küldetések",
		descriptionAlliance = "Teljesíts 55 küldetést Bloodmyst Isle területén",
		textureAlliance = "Interface\\Icons\\achievement_zone_bloodmystisle_01",
		points = 10,
		key = "KEZDO4QUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (10-20)",
		racePriority = { "Blood Elf" , "Draenei" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 45,
				needZone = 3433,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO4C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 55,
				needZone = 3525,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO4C2",
			},
		},
	})

	------------------------------ Alliance only ---------------------------------------

	TA:AddAchievement(
	{
		categoryHorde = TA_QUESTS_KALIMDOR,
		categoryAlliance = TA_QUESTS_EASTERN_KINGDOMS,
		nameHorde = "Mulgore Küldetések",
		descriptionHorde = "Teljesíts 30 küldetést Mulgore területén",
		textureHorde = "Interface\\Icons\\achievement_zone_mulgore_01",
		descriptionAlliance = "Teljesíts 35 küldetést Dun Morogh területén",
		nameAlliance = "Dun Morogh Küldetések",
		textureAlliance = "Interface\\Icons\\achievement_zone_dunmorogh",
		points = 10,
		key = "KEZDO6QUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (1-10)",
		racePriority = { "Gnome" , "Dwarf" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 30,
				needZone = 215,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO6QUESTC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 35,
				needZone = 1,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO6QUESTC2",
			},
		},
	})


	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Loch Modan Küldetések",
		description = "Teljesíts 25 küldetést Loch Modan területén",
		texture = "Interface\\Icons\\achievement_zone_lochmodan",
		key = "LOCHQUEST",
		save = TAchik,
		factionExistent = "Alliance",
		info = "Level (10-20)",
		points = 5,
		unmergeable = true,
		racePriority = { "Dwarf" , "Gnome" },
		criteria =
		{
			{
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 38,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "LOCHQESTC1",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Redridge Mountains Küldetések",
		description = "Teljesíts 25 küldetést Redridge Mountains területén",
		texture = "Interface\\Icons\\achievement_zone_redridgemountains",
		key = "REDRIQUEST",
		save = TAchik,
		factionExistent = "Alliance",
		points = 5,
		unmergeable = true,
		info = "Level (15-25)",
		racePriority = { "Human" },
		criteria =
		{
			{
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 44,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "REDRIC1",
			},
		},
	})


    TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Duskwood Küldetések",
		description = "Teljesíts 55 küldetést Duskwood területén",
		texture = "Interface\\Icons\\achievement_zone_duskwood",
		key = "DUSKWOODQUEST",
		save = TAchik,
		points = 10,
		factionExistent = "Alliance",
		unmergeable = true,
		info = "Level (20-30)",
		racePriority = { "Human" },
		criteria =
		{
			{
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 55,
				needZone = 10,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "DUSKWOODC1",
			},
		},
	})

	------------------------------ Alliance only ---------------------------------------


	TA:AddAchievement(
	{
		categoryAlliance = TA_QUESTS_KALIMDOR,
		categoryHorde = TA_QUESTS_EASTERN_KINGDOMS,
		nameAlliance = "Darkshore Küldetések",
		descriptionAlliance = "Teljesíts 55 küldetést Darkshore területén",
		textureAlliance = "Interface\\Icons\\achievement_zone_darkshore_01",
        nameHorde = "Silverpine Forest Küldetések",
        descriptionHorde = "Teljesíts 35 küldetést Silverpine Forest területén",
        textureHorde = "Interface\\Icons\\achievement_zone_silverpine_01",
		key = "KEZDO3QUEST",
		save = TAchik,
		factionDependent = true,
		points = 10,
		info = "Level (10-20)",
		unmergeable = true,
		racePriority = { "Undead" , "Night Elf" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 55,
				needZone = 148,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "KEZDO3QUESTC1",
			},
	    	{
                factionExistent = "Horde",
                events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
                value = COMPLETEQUEST_ZONEV,
                required = 35,
                needZone = 130,
                continent = "Eastern Kingdoms",
                objective = COMPLETEQUEST_ZONE,
                key = "KEZDO3QUESTC2",
            },
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Hillsbrad Foothills Küldetések",
		descriptionHorde = "Teljesíts 35 küldetést Hillsbrad Foothills területén",
		descriptionAlliance = "Teljesíts 10 küldetést Hillsbrad Foothills területén",
		texture = "Interface\\Icons\\achievement_zone_hillsbradfoothills",
		pointsHorde = 10,
		pointsAlliance = 5,
		key = "HILLSBRADQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (20-30)",
		racePriority = { "Human" , "Undead" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 35,
				needZone = 267,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "HILLSBRADC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 10,
				needZone = 267,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "HILLSBRADC2",
			},
		},
	})

	------------------------------ Alliance only ---------------------------------------

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Wetlands Küldetések",
		description = "Teljesíts 25 küldetést Wetlands területén",
		texture = "Interface\\Icons\\achievement_zone_wetlands_01",
		key = "WETLANDSQUEST",
		save = TAchik,
		factionExistent = "Alliance",
		points = 5,
		unmergeable = true,
		info = "Level (20-30)",
		racePriority = { "Gnome" , "Dwarf" , "Human" },
		criteria =
		{
			{
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 11,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "WETLANDSC1",
			},
		},
	})

	------------------------------ Alliance only ---------------------------------------

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Arathi Highlands Küldetések",
		descriptionHorde = "Teljesíts 25 küldetést Arathi Highlands területén",
		descriptionAlliance = "Teljesíts 15 küldetést Arathi Highlands területén",
		texture = "Interface\\Icons\\achievement_zone_arathihighlands_01",
		pointsHorde = 10,
		pointsAlliance = 5,
		key = "ARATHIQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (30-40)",
		racePriority = { "Undead" , "Human" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 45,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "ARATHIC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 45,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "ARATHIC2",
			},
		},
	})

	------------------------------ Alliance only ---------------------------------------

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Alterac Mountains Küldetések",
		description = "Teljesíts 5 küldetést Alterac Mountains területén",
		texture = "Interface\\Icons\\achievement_zone_alteracmountains_01",
		key = "ALTERACQUEST",
		save = TAchik,
		points = 5,
		factionExistent = "Alliance",
		unmergeable = true,
		info = "Level (30-40)",
		racePriority = { "Human" , "Undead" },
		criteria =
		{
			{
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 5,
				needZone = 36,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "ALTERACC1",
			},
		},
	})

	------------------------------ Alliance only ---------------------------------------

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Stranglethorn Vale Küldetések",
		description = "Teljesíts 60 küldetést Stranglethorn Vale területén",
		texture = "Interface\\Icons\\achievement_zone_stranglethorn_01",
		points = 10,
		key = "STVQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (30-45)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 60,
				needZone = 33,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "STVC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 60,
				needZone = 33,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "STVC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Swamp of Sorrows Küldetések",
		descriptionHorde = "Teljesíts 15 küldetést Swamp of Sorrows területén",
		descriptionAlliance = "Teljesíts 10 küldetést Swamp of Sorrows területén",
		texture = "Interface\\Icons\\achievement_zone_swampsorrows_01",
		pointsHorde = 10,
		pointsAlliance = 5,
		key = "SWAMPQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (35-45)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 8,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "SWAMPC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 10,
				needZone = 8,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "SWAMPC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Badlands Küldetések",
		descriptionHorde = "Teljesíts 20 küldetést Badlands területén",
		descriptionAlliance = "Teljesíts 15 küldetést Badlands területén",
		texture = "Interface\\Icons\\achievement_zone_badlands_01",
		points = 10,
		key = "BADLANDSQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (35-45)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 20,
				needZone = 3,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "BADLANDSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 3,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "BADLANDSC2",
			},
		},
	})


	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "The Hinterlands Küldetések",
		descriptionHorde = "Teljesíts 25 küldetést The Hinterlands területén",
		descriptionAlliance = "Teljesíts 15 küldetést The Hinterlands területén",
		texture = "Interface\\Icons\\achievement_zone_hinterlands_01",
		pointsHorde = 10,
		pointsAlliance = 5,
		key = "HINTERLANDSQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (40-45)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 47,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "HINTERLANDSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 47,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "HINTERLANDSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Searing Gorge Küldetések",
		description = "Teljesíts 20 küldetést Searing Gorge területén",
		texture = "Interface\\Icons\\achievement_zone_searinggorge_01",
		points = 10,
		key = "GORGEQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (45-50)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 20,
				needZone = 51,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "GORGEC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 20,
				needZone = 51,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "GORGEC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Blasted Lands Küldetések",
		description = "Teljesíts 15 küldetést Blasted Lands területén",
		texture = "Interface\\Icons\\achievement_zone_blastedlands_01",
		points = 10,
		key = "BLASTEDQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (45-55)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 4,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "BLASTEDC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 4,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "BLASTEDC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Burning Steppes Küldetések",
		description = "Teljesíts 5 küldetést Burning Steppes területén",
		texture = "Interface\\Icons\\achievement_zone_burningsteppes_01",
		points = 10,
		key = "STEPSQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (50-55)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 5,
				needZone = 46,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "STEPSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 5,
				needZone = 46,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "STEPSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Western Plaguelands Küldetések",
		description = "Teljesíts 45 küldetést Western Plaguelands területén",
		texture = "Interface\\Icons\\achievement_zone_westernplaguelands_01",
		points = 10,
		key = "WESTERNPQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (50-55)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 45,
				needZone = 28,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "WESTERNPC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 45,
				needZone = 28,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "WESTERNPC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_EASTERN_KINGDOMS,
		name = "Eastern Plaguelands Küldetések",
		descriptionHorde = "Teljesíts 50 küldetést Eastern Plaguelands területén",
		descriptionAlliance = "Teljesíts 40 küldetést Eastern Plaguelands területén",
		texture = "Interface\\Icons\\achievement_zone_easternplaguelands",
		points = 10,
		key = "EASTERNPQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (55-60)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 139,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "EASTERNPC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 139,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "EASTERNPC2",
			},
		},
	})

    --------------------------------------- Kalimdor ----------------------------------------




	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "The Barrens Küldetések",
		descriptionHorde = "Teljesíts 80 küldetést The Barrens területén",
		descriptionAlliance = "Teljesíts 10 küldetést The Barrens területén",
		texture = "Interface\\Icons\\achievement_zone_barrens_01",
		pointsHorde = 10,
		pointsAlliance = 5,
		key = "BARRENSQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (10-20)",
		racePriority = { "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 80,
				needZone = 17,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "BARRENSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 10,
				needZone = 17,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "BARRENSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Stonetalon Mountains Küldetések",
		descriptionHorde = "Teljesíts 25 küldetést Stonetalon Mountains területén",
		descriptionAlliance = "Teljesíts 15 küldetést Stonetalon Mountains területén",
		texture = "Interface\\Icons\\achievement_zone_stonetalon_01",
		pointsHorde = 10,
		pointsAlliance = 5,
		key = "STONEQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (15-25)",
		racePriority = { "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 406,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "STONEQUESTSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 406,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "STONEQUESTSC2",
			}
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Ashenvale Küldetések",
		descriptionHorde = "Teljesíts 20 küldetést Ashenvale területén",
		descriptionAlliance = "Teljesíts 35 küldetést Ashenvale területén",
		texture = "Interface\\Icons\\achievement_zone_ashenvale_01",
		points = 10,
		key = "ASHENVALEQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (25-30)",
		racePriority = { "Orc" , "Troll" , "Tauren" , "Night Elf" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 20,
				needZone = 331,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "ASHENVALEC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 35,
				needZone = 331,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "ASHENVALEC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Thousand Needles Küldetések",
		descriptionHorde = "Teljesíts 55 küldetést Thousand Needles területén",
		descriptionAlliance = "Teljesíts 25 küldetést Thousand Needles területén",
		texture = "Interface\\Icons\\achievement_zone_thousandneedles_01",
		points = 10,
		key = "NEEDLESQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (25-35)",
		racePriority = { "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 55,
				needZone = 400,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "NEEDLESC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 400,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "NEEDLESC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Desolace Küldetések",
		descriptionHorde = "Teljesíts 30 küldetést Desolace területén",
		descriptionAlliance = "Teljesíts 20 küldetést Desolace területén",
		texture = "Interface\\Icons\\achievement_zone_desolace",
		points = 10,
		key = "DESOLACEQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (30-40)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 30,
				needZone = 405,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "DESOLACEC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 20,
				needZone = 405,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "DESOLACEC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Dustwallow Marsh Küldetések",
		descriptionHorde = "Teljesíts 45 küldetést Dustwallow Marsh területén",
		descriptionAlliance = "Teljesíts 55 küldetést Dustwallow Marsh területén",
		texture = "Interface\\Icons\\achievement_zone_dustwallowmarsh",
		points = 10,
		key = "DUSTWALLQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (35-45)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 45,
				needZone = 15,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "DUSTWALLQUESTSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 55,
				needZone = 15,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "DUSTWALLQUESTSC2",
			},
		},
	})

    TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Tanaris Küldetések",
		description = "Teljesíts 50 küldetést Tanaris területén",
		texture = "Interface\\Icons\\achievement_zone_tanaris_01",
		points = 10,
		key = "TANARISQUEST",
		save = TAchik,
		info = "Level (40-50)",
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 440,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "TANARISQUESTC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 440,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "TANARISQUESTC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Feralas Küldetések",
		descriptionHorde = "Teljesíts 40 küldetést Feralas területén",
		descriptionAlliance = "Teljesíts 25 küldetést Feralas területén",
		texture = "Interface\\Icons\\achievement_zone_feralas",
		points = 10,
		key = "FERALASQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (40-50)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 357,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "FERALASQUESTSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 357,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "FERALASQUESTSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Azshara Küldetések",
		descriptionHorde = "Teljesíts 25 küldetést Azshara területén",
		descriptionAlliance = "Teljesíts 15 questet Azshara területén",
		texture = "Interface\\Icons\\achievement_zone_azshara_01",
		points = 10,
		key = "AZSHARAQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (45-55)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 16,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "AZSHARAQUESTSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 16,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "AZSHARAQUESTSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Un'goro Crater Küldetések",
		descriptionHorde = "Teljesíts 40 küldetést Un'goro Crater területén",
		descriptionAlliance = "Teljesíts 30 küldetést Un'goro Crater területén",
		texture = "Interface\\Icons\\achievement_zone_ungorocrater_01",
		points = 10,
		key = "UNGOROQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (45-55)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 490,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "UNGORQUESTC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 30,
				needZone = 490,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "UNGORQUESTC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Felwood Küldetések",
		description = "Teljesíts 25 küldetést Felwood területén",
		texture = "Interface\\Icons\\achievement_zone_felwood",
		points = 10,
		key = "FELWOODQUEST",
		save = TAchik,
		unmergeable = true,
		info = "Level (45-55)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 361,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "FELWOODQUESTSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 361,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "FELWOODQUESTSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Winterspring Küldetések",
		descriptionHorde = "Teljesíts 30 küldetést Winterspring területén",
		descriptionAlliance = "Teljesíts 40 küldetést Winterspring területén",
		texture = "Interface\\Icons\\achievement_zone_winterspring",
		points = 10,
		key = "WINTERSPRINGQUEST",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		info = "Level (55-60)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 30,
				needZone = 618,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "WINTERSPRINGC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 618,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "WINTERSPRINGC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_KALIMDOR,
		name = "Silithus Küldetések",
		description = "Teljesíts 50 küldetést Silithus területén",
		texture = "Interface\\Icons\\achievement_zone_silithus_01",
		points = 10,
		key = "SILITHUSQUEST",
		save = TAchik,
		unmergeable = true,
		info = "Level (55-60)",
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 1377,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "SILITHUSQUESTSC1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 1377,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "SILITHUSQUESTSC2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_CAPITALS,
		nameHorde = "Orgrimmar Küldetések",
		nameAlliance = "Stormwind City Küldetések",
		descriptionAlliance = "Teljesíts 50 küldetést Stormwind City területén",
		descriptionHorde = "Teljesíts 40 küldetést Orgrimmar területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_orc",
    	textureAlliance = "Interface\\Icons\\inv_misc_tournaments_banner_human",
		points = 10,
		key = "CAPITALQUEST1",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 40,
				needZone = 1637,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST1C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 50,
				needZone = 1519,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST1C2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_CAPITALS,
		nameHorde = "Undercity Küldetések",
		nameAlliance = "Darnassus Küldetések",
		descriptionAlliance = "Teljesíts 15 küldetést Darnassus területén",
		descriptionHorde = "Teljesíts 25 küldetést Undercity területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_scourge",
    	textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_nightelf",
		points = 10,
		key = "CAPITALQUEST2",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 25,
				needZone = 1497,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST2C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 15,
				needZone = 1657,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST2C2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_CAPITALS,
		nameHorde = "Thunder Bluff Küldetések",
		nameAlliance = "Ironforge Küldetések",
		descriptionAlliance = "Teljesíts 30 küldetést Ironforge területén",
		descriptionHorde = "Teljesíts 30 küldetést Thunder Bluff területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_tauren",
    	textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_dwarf",
		points = 10,
		key = "CAPITALQUEST3",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 30,
				needZone = 1638,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST3C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 30,
				needZone = 1537,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST3C2",
			},
		},
	})

	TA:AddAchievement(
	{
		category = TA_QUESTS_CAPITALS,
		nameHorde = "Silvermoon City Küldetések",
		nameAlliance = "The Exodar Küldetések",
		descriptionAlliance = "Teljesíts 5 küldetést The Exodar területén",
		descriptionHorde = "Teljesíts 5 küldetést Silvermoon City területén",
		textureHorde = "Interface\\Icons\\inv_misc_tournaments_symbol_bloodelf",
    	textureAlliance = "Interface\\Icons\\inv_misc_tournaments_symbol_draenei",
		points = 10,
		key = "CAPITALQUEST4",
		save = TAchik,
		factionDependent = true,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 5,
				needZone = 3487,
				continent = "Eastern Kingdoms",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST4C1",
			},
			{
			    factionExistent = "Alliance",
				events = { "PLAYER_ENTERING_WORLD" , "QUESTDATA_UPDATED" },
				value = COMPLETEQUEST_ZONEV,
				required = 5,
				needZone = 3557,
				continent = "Kalimdor",
				objective = COMPLETEQUEST_ZONE,
				key = "CAPITALQUEST3C2",
			},
		},
	})


end
