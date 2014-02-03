local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Level60()

    local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end



	-- Ungoro --



	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Elbüvölü oszlopok",
		description = "Teljesítsd az alábbi küldetéseket",
		texture = "Interface\\Icons\\inv_misc_apexis_crystal",
		key = "QMAX2",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "Crystal Restore",
				quest = 4381,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX2C1",
			},
			{
			    name = "Crystal Force",
				quest = 4382,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX2C2",
			},
			{
			    name = "Crystal Ward",
				quest = 4383,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX2C3",
			},
			{
			    name = "Crystal Yield",
				quest = 4384,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX2C4",
			},
			{
			    name = "Crystal Charge",
				quest = 4385,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX2C5",
			},
			{
			    name = "Crystal Spire",
				quest = 4386,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX2C6",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Elfeledt feladatok",
		description = "Teljesítsd a \"It's Dangerous to Go Alone\" küldetést",
		texture = "Interface\\Icons\\inv_misc_bag_20",
		key = "QMAX1",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 3962,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX1C1",
			}
		}
	})

    TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		factionDependent = true,
		nameAlliance = "Mario hibája",
		descriptionAlliance = "Teljesítsd a \"Bloodpetal Sprouts\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_shirt_red_01",
		nameHorde = "Luigi hibája",
		descriptionHorde = "Teljesítsd a \"Bloodpetal Zapper\" küldetést",
		textureHorde = "Interface\\Icons\\inv_shirt_green_01",
		key = "QMAX3",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 4148,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX3C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 4144,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX3C2"
			}
		}
	})

	-- Felwood --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		factionDependent = true,
		nameAlliance = "A tisztulás irányába",
		descriptionAlliance = "Teljesítsd a \"Ancient Spirit\" küldetést",
		textureAlliance = "Interface\\Icons\\ability_shaman_cleansespirit",
		nameHorde = "Owlvadász",
		descriptionHorde = "Teljesítsd a \"Wild Guardians\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\spell_nature_forceofnature",
		key = "QMAX4",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 4721,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX4C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 4261,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX4C2"
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Csodanö megmentöje",
		description = "Teljesítsd a \"Rescue From Jaedenar\" küldetést",
		texture = "Interface\\Icons\\inv_helmet_164",
		key = "QMAX5",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = { 5203 , 5204 ,  5385 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX5C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Összeesküvés a légióval",
		description = "Teljesítsd a \"A Final Blow\" küldetést",
		texture = "Interface\\Icons\\spell_fire_felimmolation",
		key = "QMAX6",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 5242,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX6C1",
			}
		}
	})



	-- Blasted lands --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Bestiák áldása",
		description = "Teljesítsd az alábbi küldetéseket",
		texture = "Interface\\Icons\\ability_physical_taunt",
		key = "QMAX24",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "A Boar's Vitality",
				quest = { 2583 , 2584 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX24C1",
			},
			{
			    name = "The Basilisk's Bite",
				quest = { 2601 , 2602 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX24C2",
			},
			{
			    name = "Snickerfang Jowls",
				quest = { 2581 , 2582 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX24C3",
			},
			{
			    name = "Vulture's Vigor",
				quest = { 2603 , 2584 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX24C4",
			},
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Egy epikus kaland",
		description = "Teljesítsd a \"You Are Rakh'likh, Demon\" küldetést",
		texture = "Interface\\Icons\\ability_warrior_swordandboard",
		key = "QMAX25",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 3628,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX25C1",
			}
		}
	})

	-- Azshara --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Kim'jael tudatlansága",
		description = "Teljesítsd a \"Kim'jael's \"Missing\" Equipment\" küldetést",
		texture = "Interface\\Icons\\inv_misc_rune_05",
		key = "QMAX26",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 5534,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX26C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Xylem kutatásai",
		description = "Teljesítsd a \"Destroy Morphaz\" küldetést",
		texture = "Interface\\Icons\\inv_wand_06",
		key = "QMAX27",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 8253,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX27C1",
			}
		}
	})

	-- Winterspring --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Az érintetlenek bizalma",
		description = "Teljesítsd a \"Beads for Salfa\" küldetést",
		texture = "Interface\\Icons\\inv_misc_monsterclaw_04",
		key = "QMAX7",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 8469,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX7C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Nesze Yeti, fogd meg jól!",
		description = "Teljesítsd a \"A Yeti of Your Own\" küldetést",
		texture = "Interface\\Icons\\ability_hunter_pet_gorilla",
		key = "QMAX8",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 8798,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX8C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Firewater kereskedelem",
		description = "Teljesítsd a \"High Chief Winterfall\" küldetést",
		texture = "Interface\\Icons\\inv_potion_92",
		key = "QMAX9",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 5121,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX9C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "A régi módon",
		description = "Teljesítsd az alábbi küldetéseket",
		texture = "Interface\\Icons\\inv_stone_01",
		key = "QMAX10",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "Frostsaber E'ko",
				quest = 4801,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C1",
			},
			{
			    name = "Winterfall E'ko",
				quest = 4802,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C2",
			},
			{
			    name = "Shardtooth E'ko",
				quest = 4803,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C3",
			},
			{
			    name = "Chillwind E'ko",
				quest = 4804,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C4",
			},
			{
			    name = "Ice Thistle E'ko",
				quest = 4805,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C5",
			},
			{
			    name = "Frostmaul E'ko",
				quest = 4806,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C6",
			},
			{
			    name = "Wildkin E'ko",
				quest = 4807,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX10C7",
			},
		}
	})

	-- Western Plaguelands

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		factionDependent = true,
		name = "Az elsö paladin",
		descriptionAlliance = "Teljesítsd a \"Tomb of the Lightbringer\" küldetést",
		descriptionHorde = "Teljesítsd a \"Defiling Uther's Tomb\" küldetést",
		texture = "Interface\\Icons\\spell_holy_healingaura",
		key = "QMAX14",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 9446,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX14C1",
			},
			{
			    factionExistent = "Horde",
				quest = 9444,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX14C2",
			}
		}
	})


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Családok a pestis után",
		description = "Teljesítsd a \"Two Halves Become One\" küldetést",
		texture = "Interface\\Icons\\inv_jewelry_talisman_11",
		key = "QMAX15",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 5051,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX15C1",
			}
		}
	})


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		factionDependent = true,
		name = "A dögvész forrásai",
		description = "Teljesítsd a \"Mission Accomplished!\" küldetést",
		texture = "Interface\\Icons\\inv_misc_cauldron_nature",
		key = "QMAX16",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 5226,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX16C1",
			},
			{
			    factionExistent = "Horde",
				quest = 5237,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX16C2",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Elsö nap a halottak iskolájában",
		description = "Teljesítsd a \"The Key to Scholomance\" küldetést",
		texture = "Interface\\Icons\\inv_misc_book_01",
		key = "QMAX17",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 5505,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX17C1",
			},
			{
			    factionExistent = "Horde",
				quest = 5511,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX17C2",
			}
		}
	})

	-- Eastern Plaguelands --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Rettenetes termeszek",
		description = "Teljesítsd a \"A Plague Upon Thee\" sorozat utolsó küldetését",
		texture = "Interface\\Icons\\inv_misc_monsterspidercarapace_01",
		key = "QMAX20",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 6389,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX20C1",
			},
			{
			    factionExistent = "Horde",
				quest = 6390,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX20C2",
			}
		}
	})


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Taelan megváltása",
		description = "Teljesítsd az alábbi küldetéseket",
		texture = "Interface\\Icons\\inv_hammer_01",
		key = "QMAX19",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "Of Forgotten Memories",
				quest = { 5781 , 5845 , 5846 , 5848 , 5861 , 5862 , 5844 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX19C1",
			},
			{
			    name = "Of Lost Honor",
				quest = { 5845 , 5846 , 5848 , 5861 , 5862 , 5844 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX19C2",
			},
			{
			    name = "Of Love and Family",
				quest = { 5846 , 5848 , 5861 , 5862 , 5844 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX19C3",
			},
			{
			    name = "Of Love and Family",
				quest = { 5848 , 5861 , 5862 , 5844 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX19C4",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "A Redpath család újraegyesítése",
		description = "Teljesítsd a \"The Battle of Darrowshire\" küldetést",
		texture = "Interface\\Icons\\spell_holy_divinepurpose",
		key = "QMAX18",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = { 5721 , 5942 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX18C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Keanu küldetése",
		description = "Teljesítsd a \"The Argent Hold\" küldetést",
		texture = "Interface\\Icons\\spell_shaman_spectraltransformation",
		key = "QMAX21",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 5265,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX21C1",
			}
		}
	})


	-- Silithus --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Noggle bajai",
		description = "Teljesítsd a \"Noggle's Lost Satchel\" küldetést",
		texture = "Interface\\Icons\\inv_misc_head_gnome_01",
		key = "QMAX29",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 8282,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX29C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "C'thun tette",
		description = "Teljesítsd a \"Into The Maw of Madness\" küldetést",
		texture = "Interface\\Icons\\achievement_boss_cthun",
		key = "QMAX30",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 8306,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX30C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Goldleaf ötlete",
		description = "Teljesítsd a \"Scepter of the Council\" küldetést",
		texture = "Interface\\Icons\\inv_staff_13",
		key = "QMAX31",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 8352,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX31C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_60,
		name = "Földalatti veszély",
		description = "Teljesítsd az alábbi küldetéseket",
		texture = "Interface\\Icons\\inv_shield_23",
		key = "QMAX32",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "Target: Hive'Ashi Defender",
				quest = 8770,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C1",
			},
			{
			    name = "Target: Hive'Ashi Sandstalkers",
				quest = 8771,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C2",
			},
			{
			    name = "Target: Hive'Zora Waywatchers",
				quest = 8772,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C3",
			},
			{
			    name = "Target: Hive'Zora Reavers",
				quest = 8773,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C4",
			},
			{
			    name = "Target: Hive'Regal Ambushers",
				quest = 8774,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C5",
			},
			{
			    name = "Target: Hive'Regal Spitfires",
				quest = 8775,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C6",
			},
			{
			    name = "Target: Hive'Regal Slavemakers",
				quest = 8776,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C7",
			},
			{
			    name = "Target: Hive'Regal Burrowers",
				quest = 8777,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QMAX32C8",
			},
		}
	})


	local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS_GENERAL,
		name = "Öreg kalandozó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_06",
		points = 25,
		save = TAchik,
		key = "QMAXS",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    name = "Elbüvölü oszlopok",
				achievement = TA.achisKeys["QMAX2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC1"
			},
			{
			    name = "Elfeledt feladatok",
				achievement = TA.achisKeys["QMAX1"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC2"
			},
			{
			    factionDependent = true,
		        nameAlliance = "Mario hibája",
		        nameHorde = "Luigi hibája",
				achievement = TA.achisKeys["QMAX3"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC3"
			},
			{
			    factionDependent = true,
		        nameAlliance = "A tisztulás irányába",
		        nameHorde = "Owlvadász",
				achievement = TA.achisKeys["QMAX4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC4"
			},
			{
			    name = "Csodanö megmentöje",
				achievement = TA.achisKeys["QMAX5"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC5"
			},
			{
			    name = "Összeesküvés a légióval",
				achievement = TA.achisKeys["QMAX6"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC6"
			},
			{
			    name = "Bestiák áldása",
				achievement = TA.achisKeys["QMAX24"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC7"
			},
			{
			    name = "Egy epikus kaland",
				achievement = TA.achisKeys["QMAX25"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC8"
			},
			{
			    name = "Kim'jael tudatlansága",
				achievement = TA.achisKeys["QMAX26"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC9"
			},
			{
			    name = "Xylem kutatásai",
				achievement = TA.achisKeys["QMAX27"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC10"
			},
			{
			    name = "Az érintetlenek bizalma",
				achievement = TA.achisKeys["QMAX7"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC11"
			},
			{
			    name = "Nesze Yeti, fogd meg jól!",
				achievement = TA.achisKeys["QMAX8"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC12"
			},
			{
			    name = "Firewater kereskedelem",
				achievement = TA.achisKeys["QMAX9"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC13"
			},
			{
			    name = "A régi módon",
				achievement = TA.achisKeys["QMAX10"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC14"
			},
			{
			    name = "Az elsö paladin",
				achievement = TA.achisKeys["QMAX14"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC15"
			},
			{
			    name = "Családok a pestis után",
				achievement = TA.achisKeys["QMAX15"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC16"
			},
			{
			    name = "A dögvész forrásai",
				achievement = TA.achisKeys["QMAX16"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC17"
			},
			{
			    name = "Elsö nap a halottak iskolájában",
				achievement = TA.achisKeys["QMAX17"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC18"
			},
			{
			    name = "Rettenetes termeszek",
				achievement = TA.achisKeys["QMAX20"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC19"
			},
			{
			    name = "Taelan megváltása",
				achievement = TA.achisKeys["QMAX19"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC20"
			},
			{
			    name = "A Redpath család újraegyesítése",
				achievement = TA.achisKeys["QMAX18"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC21"
			},
			{
			    name = "Keanu küldetése",
				achievement = TA.achisKeys["QMAX21"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC22"
			},
			{
			    name = "Noggle bajai",
				achievement = TA.achisKeys["QMAX29"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC23"
			},
			{
			    name = "C'thun tette",
				achievement = TA.achisKeys["QMAX30"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC24"
			},
			{
			    name = "Goldleaf ötlete",
				achievement = TA.achisKeys["QMAX31"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC25"
			},
			{
			    name = "Földalatti veszély",
				achievement = TA.achisKeys["QMAX32"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMAXSC26"
			},
		}
	})



end
