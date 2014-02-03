local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Level20()

    local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end

    -- Human - Orc/Troll
	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameHorde = "Samophlange 101",
		nameAlliance = "Junior Kincskeresö",
		descriptionHorde = "Teljesítsd a \"Samophlange Manual\" küldetést",
		descriptionAlliance = "Teljesítsd a \"Captain Sanders' Hidden Treasure\" sorozat utolsó küldetését megtalálva Captain Sanders kincsét",
		textureHorde = "Interface\\Icons\\inv_gizmo_01",
		textureAlliance = "Interface\\Icons\\inv_misc_map_01",
		key = "QMID2",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 3924,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID2C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 140,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID2C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameAlliance = "Redridgeböl jöttem",
		textureAlliance = "Interface\\Icons\\inv_letter_05",
		nameHorde = "Kalózok kiírtása",
		description = "Teljesítsd az alábbi küldetéseket",
		textureHorde = "Interface\\Icons\\inv_helmet_66",
		key = "QMID1",
		points = 10,
		save = TAchik,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    name = "Messenger to Stormwind",
			    factionExistent = "Alliance",
				quest = 121,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID1C1",
			},
			{
			    name = "Messenger to Darkshire",
			    factionExistent = "Alliance",
				quest = 146,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID1C2",
			},
			{
			    name = "Messenger to Westfall",
			    factionExistent = "Alliance",
				quest = 144,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID1C3",
			},
			{
			    name = "WANTED: Baron Longshore",
			    factionExistent = "Horde",
			    quest = 895,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID1C4",
			},
			{
			    name = "Stolen Booty",
			    factionExistent = "Horde",
				quest = 888,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID1C5",
			}
		},
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameHorde = "A Kolkárok kiüzése",
		descriptionHorde = "Teljesítsd a \"Counterattack!\" küldetést",
		textureHorde = "Interface\\Icons\\inv_misc_head_centaur_01",
		nameAlliance = "Az áruló örje",
		descriptionAlliance = "Teljesítsd a \"The Defias Brotherhood\" sorozat utolsó elötti küldetését",
		textureAlliance = "Interface\\Icons\\ability_warrior_stalwartprotector.",
		key = "QMID3",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 4021,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID3C1",
			},
			{
			    factionExistent = "Alliance",
				quest = { 155 , 166 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID3C2",
			},
		},
	});

	-- Undead/Night Elf

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameAlliance = "A szerelö",
		descriptionAlliance = "Teljesítsd a \"Buzzbox\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_misc_wrench_01",
		nameHorde = "Csintalanok szigete",
		descriptionHorde = "Teljesítsd a \"Assault on Fenris Isle\" küldetést",
		textureHorde = "Interface\\Icons\\ability_creature_disease_05",
		key = "QMID7",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 442,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMIDC1",
			},
			{
			    factionExistent = "Alliance",
				quest = 1003,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID7C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameHorde = "A Kirin Tor terve",
		descriptionHorde = "Teljesítsd a \"The Weaver\" küldetést",
		textureHorde = "Interface\\Icons\\achievement_reputation_kirintor",
		nameAlliance = "Könnyen befolyásolható Furbolgok...",
		descriptionAlliance = "Teljesítsd a \"The Blackwood Corrupted\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_shadow_abominationexplosion",
		key = "QMID8",
		points = 10,
		save = TAchik,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 4763,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID8C1",
			},
			{
			    factionExistent = "Horde",
				quest = 480,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID8C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameAlliance = "Titokzatos Twilight",
		descriptionAlliance = "Teljesítsd a \"Mathystra Relics\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_shadow_twilight",
		nameHorde = "Arugal fövarázsló bukása",
		descriptionHorde = "Teljesítsd az \"Arugal Must Die\" küldetést",
		textureHorde = "Interface\\Icons\\inv_chest_cloth_31",
		key = "QMID9",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 951,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID9C1",
			},
			{
			    factionExistent = "Horde",
				quest = 1014,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID9C2",
			}
		},
	});

	-- Tauren / Dwarf - Gnome

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameAlliance = "Eltünt puskapór",
		descriptionAlliance = "Teljesítsd a \"Protecting the Shipment\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_ammo_gunpowder_01",
		nameHorde = "Mangletooth mágia",
		descriptionHorde = "Teljesítsd Mangletooth összes küldetését",
		textureHorde = "Interface\\Icons\\inv_misc_gem_ruby_01",
		key = "QMID11",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Dwarf" ,"Gnome" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 309,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C1",
			},
			{
			    name = "Spirit of the Wind",
			    factionExistent = "Horde",
				quest = 889,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C2",
			},
			{
			    name = "Agamaggan's Strength",
			    factionExistent = "Horde",
				quest = 5042,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C3",
			},
			{
			    name = "Agamaggan's Agility",
			    factionExistent = "Horde",
				quest = 5043,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C4",
			},
			{
			    name = "Wisdom of Agamaggan",
			    factionExistent = "Horde",
				quest = 5044,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C5",
			},
			{
			    name = "Rising Spirit",
			    factionExistent = "Horde",
				quest = 5045,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C6",
			},
			{
			    name = "Razorhide",
			    factionExistent = "Horde",
				quest = 5046,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID11C7",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameAlliance = "Bronzebeard nevében",
		descriptionAlliance = "Teljesítsd a \"In Defense of the King's Lands\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\achievement_leader_king_magni_bronzebeard",
		nameHorde = "Razormanek félelme",
		descriptionHorde = "Teljesítsd a \"The Disruption Ends\" küldetést",
		textureHorde = "Interface\\Icons\\inv_staff_02",
		key = "QMID10",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Dwarf" ,"Gnome" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 217,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID10C1",
			},
			{
			    factionExistent = "Horde",
				quest = 872,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID10C2",
			}
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameAlliance = "Hatástalanítás",
		descriptionAlliance = "Teljesítsd a \"A Dark Threat Looms\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_misc_bomb_01",
		nameHorde = "A Barrens rejtelmei",
		descriptionHorde = "Teljesítsd a \"Leaders of the Fang\" sorozat utolsó küldetést",
		textureHorde = "Interface\\Icons\\spell_nature_sleep",
		key = "QMID12",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Dwarf" ,"Gnome" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 283,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID12C1",
			},
			{
			    factionExistent = "Horde",
				quest = 914,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID12C2",
			}
		},
	});

	-- BloodElf / Draneei

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameHorde = "Kezed a napkútról!",
		nameAlliance = "Outlandi szivárgás",
		descriptionHorde = "Teljesítsd a \"The Traitor's Destruction\" küldetést",
		descriptionAlliance = "Teljesítsd a \"I Shoot Magic Into the Darkness\" küldetést",
		textureHorde = "Interface\\Icons\\spell_holy_excorcism",
		textureAlliance = "Interface\\Icons\\spell_nature_astralrecal",
		key = "QMID4",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Draenei" , "Blood Elf" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 9167,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID4C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 9700,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID4C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameHorde = "Theron nevében!",
		nameAlliance = "Argus emlékére!",
		descriptionHorde = "Teljesítsd a \"Windrunner Village\" küldetést",
		descriptionAlliance = "Teljesítsd a \"Blood Watch\" küldetést",
		textureHorde = "Interface\\Icons\\spell_holy_senseundead",
		textureAlliance = "Interface\\Icons\\inv_misc_gem_pearl_06",
		key = "QMID5",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Blood Elf" , "Draenei" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 9140,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID5C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 9694,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID5C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		factionDependent = true,
		nameHorde = "Kristáylok rombolója",
		nameAlliance = "Kristályok kutatója",
		descriptionHorde = "Teljesítsd a \"Deactivate An'owyn\" küldetést",
		descriptionAlliance = "Teljesítsd a \"The Final Sample\" küldetést",
		texture = "Interface\\Icons\\inv_datacrystal10",
		key = "QMID6",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Blood Elf" , "Draenei" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 9169,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID6C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 9585,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMID6C2",
			},
		},
	});

	local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS_GENERAL,
		name = "Kamasz kalandozó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_02",
		points = 25,
		save = TAchik,
		key = "QMIDS",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    factionDependent = true,
		        nameHorde = "Samophlange 101",
		        nameAlliance = "Junior kincskeresö",
				achievement = TA.achisKeys["QMID2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC1",
			},
			{
			    factionDependent = true,
		        nameHorde = "Kalózok kiírtása",
		        nameAlliance = "Redridgeböl jöttem",
				achievement = TA.achisKeys["QMID1"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC2",
			},
			{
			    factionDependent = true,
		        nameHorde = "A Tauren bosszúja",
		        nameAlliance = "Az áruló örje",
				achievement = TA.achisKeys["QMID3"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC3",
			},
			{
			    factionDependent = true,
		        nameHorde = "Csintalanok szigete",
		        nameAlliance = "A szerelö",
				achievement = TA.achisKeys["QMID7"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC4",
			},
			{
			    factionDependent = true,
		        nameHorde = "A Kirin Tor terve",
		        nameAlliance = "Könnyen befolyásolható Furbolgok...",
				achievement = TA.achisKeys["QMID8"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC5",
			},
			{
			    factionDependent = true,
		        nameHorde = "Arugal fövarázsló bukása",
		        nameAlliance = "Titokzatos Twilight",
				achievement = TA.achisKeys["QMID9"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC6",
			},
			{
			    factionDependent = true,
		        nameHorde = "Mangletooth mágia",
		        nameAlliance = "Eltünt puskapór",
				achievement = TA.achisKeys["QMID11"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC7",
			},
			{
			    factionDependent = true,
		        nameHorde = "A Razormanek félelme",
		        nameAlliance = "Bronzebeard nevében",
				achievement = TA.achisKeys["QMID10"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC8",
			},
			{
			    factionDependent = true,
		        nameHorde = "A Barrens rejtelmei",
		        nameAlliance = "Hatástalanítás",
				achievement = TA.achisKeys["QMID12"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC9",
			},
			{
			    factionDependent = true,
		        nameHorde = "Kezed a napkútról",
		        nameAlliance = "Outlandi szivárgás",
				achievement = TA.achisKeys["QMID4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC10",
			},
			{
			    factionDependent = true,
		        nameHorde = "Theron nevében!",
		        nameAlliance = "Argus emlékére!",
				achievement = TA.achisKeys["QMID5"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC11",
			},
			{
			    factionDependent = true,
		        nameHorde = "Kristályok rombolója",
		        nameAlliance = "Kristályok kutatója",
				achievement = TA.achisKeys["QMID6"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMIDSC12",
			},
		}
	})

end
