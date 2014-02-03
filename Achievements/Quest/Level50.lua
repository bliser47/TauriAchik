local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Level50()

    local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end

	-- Strenglethorn --

	 TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Napozó óriások",
		description = "Teljesítsd a \"Facing Negolash\" küldetést",
		texture = "Interface\\Icons\\ability_racial_avatar",
		key = "QSUP01",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 8554,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP01C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 618,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP01C2",
			}
		}
	})

    TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Az uzsorás embere",
		description = "Teljesítsd a \"Cracking Maury's Foot\" küldetést",
		texture = "Interface\\Icons\\inv_misc_coin_06",
		key = "QSUP1",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 628,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP1C1",
			}
		}
	})

	 TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		nameAlliance = "Blizzard hibás küldetése",
		descriptionAlliance = "Teljesítsd a \"The Curse of the Tides\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_orb_01",
		nameHorde = "Vol'jin elveszett fia",
		descriptionHorde = "Teljesítsd a \"Saving Yenniku\" küldetést",
		textureHorde = "Interface\\Icons\\achievement_character_troll_male",
		key = "QSUP3",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 592,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP3C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 611,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP3C2"
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Robocsirke",
		description = "Teljesítsd a \"An OOX of Your Own\" küldetést",
		texture = "Interface\\Icons\\spell_magic_polymorphchicken",
		key = "QSUP21",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{

				quest = 3721,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP21C1"
			}
		}
	})


	-- STV/Shimmering
	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Megrendezett verseny",
		description = "Teljesítsd a \"Report Back to Fizzlebub\" küldetést",
		texture = "Interface\\Icons\\inv_potion_19",
		key = "QSUP2",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{

				quest = 1122,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP2C1"
			}
		}
	})

	-- Tanaris --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "A Silithid",
		description = "Teljesítsd a \"Rise of the Silithid\" küldetést",
		texture = "Interface\\Icons\\inv_sword_83",
		key = "QSUP4",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
                factionExistent = "Horde",
				quest = 32,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP4C1"
			},
			{
				factionExistent = "Alliance",
				quest = 162,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP4C2"
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Vállalkozó vegyész",
		description = "Teljesítsd a \"Noggenfogger Elixir\" küldetést",
		texture = "Interface\\Icons\\inv_potion_83",
		key = "QSUP5",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{

				quest = 2662,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP5C1"
			}
		}
	})

	-- Feralas --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		nameAlliance = "Nemes nagák",
		nameHorde = "Gordunni mágusok",
		descriptionAlliance = "Teljesítsd a \"Delivering the Relic\" küldetést",
		descriptionHorde = "Teljesítsd a \"The Gordunni Orb\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\achievement_boss_ladyvashj",
		textureHorde = "Interface\\Icons\\inv_misc_gem_pearl_01",
		key = "QSUP8",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 2871,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP8C1",
			},
			{
				factionExistent = "Horde",
				quest = 3002,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP8C2",
			},
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		sexDependent = true,
		nameAllianceMale = "Sárkányok apja",
		nameAllianceFemale = "Sárkányok anyja",
		nameHorde = "Gnoll írtás",
		descriptionAlliance = "Teljesítsd a \"A Short Incubation\" küldetést",
		descriptionHorde = "Teljesítsd a \"The Battle Plans\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_egg_02",
		textureHorde = "Interface\\Icons\\inv_misc_monsterclaw_04",
		key = "QSUP6",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 3842,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP6C1",
			},
			{
				factionExistent = "Horde",
				quest = 2903,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP6C2",
			},
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		nameAlliance = "Titokzatos bot",
		nameHorde = "Troll edény",
		descriptionAlliance = "Teljesítsd a \"The Morrow Stone\" küldetést",
		descriptionHorde = "Teljesítsd a \"Weapons of Spirit\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_staff_20",
		textureHorde = "Interface\\Icons\\inv_misc_drum_01",
		key = "QSUP7",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 2942,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP7C1",
			},
			{
				factionExistent = "Horde",
				quest = 3129,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP7C2",
			},
		}
	})

	-- The Hinterlands --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		nameAlliance = "Brohann és Rhapsody kalandjai",
		nameHorde = "A trollok komolyan gondolják",
		descriptionAlliance = "Teljesítsd a \"Rhapsody's Tale\" küldetést",
		descriptionHorde = "Teljesítsd a \"The Final Message to the Wildhammer\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_cape_08",
		textureHorde = "Interface\\Icons\\inv_spear_02",
		key = "QSUP10",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = { 1469 ,  1475 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP10C1",
			},
			{
				factionExistent = "Horde",
				quest = 7843,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP10C2",
			},
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		nameAlliance = "Sharpbeak megmentése",
		nameHorde = "Hinterlands mérge",
		descriptionAlliance = "Teljesítsd a \"Saving Sharpbeak\" küldetést",
		descriptionHorde = "Teljesítsd a \"Venom to the Undercity\" küldetést",
		textureAlliance = "Interface\\Icons\\ability_mount_snowygryphon",
		textureHorde = "Interface\\Icons\\inv_potion_78",
		key = "QSUP9",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 2938,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP9C1",
			},
			{
				factionExistent = "Horde",
				quest = 3129,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP9C2",
			},
		}
	})


	-- Badlands --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Mérnöki alkémia",
		description = "Teljesítsd a \"This Is Going to Be Hard\" sorozat utolsó küldetését",
		texture = "Interface\\Icons\\inv_potion_20",
		key = "QSUP11",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{

				quest = 778,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP11C1"
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		factionDependent = true,
		nameAlliance = "Ragnaros küldöttjei",
		nameHorde = "Deathwing hadnagyjai",
		descriptionAlliance = "Teljesítsd a \"An Ambassador of Evil\" küldetést",
		descriptionHorde = "Teljesítsd a \"Broken Alliances\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_holy_sealofwrath",
		textureHorde = "Interface\\Icons\\inv_misc_monsterscales_07",
		key = "QSUP12",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 762,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP12C1",
			},
			{
				factionExistent = "Horde",
				quest = 793,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP12C2",
			},
		}
	})


	-- Searing Gorge --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Szürkület a szurdokban",
		description = "Teljesítsd a \"Set Them Ablaze!\" küldetést",
		texture = "Interface\\Icons\\inv_misc_stonetablet_05",
		key = "QSUP14",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{

				quest = 3463,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP14C1"
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_50,
		name = "Torkosborz kérései",
		description = "Teljesítsd az alábbi küldetéseket",
		texture = "Interface\\Icons\\inv_weapon_hand_31",
		key = "QSUP15",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
                name = "Curse These Fat Fingers",
				quest = 7723,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP15C1"
			},
			{
                name = "Fiery Menace!",
				quest = 7724,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP15C2"
			},
			{
                name = "Incendosaurs? Whateverosaur is More Like It",
				quest = 7727,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSUP15C3"
			}
		}
	})

	local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS_GENERAL,
		name = "Idös kalandozó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_05",
		points = 25,
		save = TAchik,
		key = "QSUPS",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    name = "Napozó óriások",
				achievement = TA.achisKeys["QSUP01"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC1"
			},
			{
			    name = "Az uzsorás embere",
				achievement = TA.achisKeys["QSUP1"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC2"
			},
			{
			    factionDependent = true,
			    nameAlliance = "Blizzard hibás küldetése",
				nameHorde = "Vol'jin elveszett fia",
				achievement = TA.achisKeys["QSUP3"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC3"
			},
			{
			    name = "Robocsirke",
				achievement = TA.achisKeys["QSUP21"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC4"
			},
			{
			    name = "Megrendezett verseny",
				achievement = TA.achisKeys["QSUP2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC5"
			},
			{
			    name = "Sivatagi veszély",
				achievement = TA.achisKeys["QSUP4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC6"
			},
			{
			    name = "Vállalkozó vegyész",
				achievement = TA.achisKeys["QSUP5"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC7"
			},
			{
			    factionDependent = true,
		        nameAlliance = "Nemes nagák",
		        nameHorde = "Gordunni mágusok",
				achievement = TA.achisKeys["QSUP8"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC8"
			},
			{
			    factionDependent = true,
		        sexDependent = true,
		        nameAllianceMale = "Sárkányok apja",
		        nameAllianceFemale = "Sárkányok anyja",
		        nameHorde = "Gnoll írtás",
				achievement = TA.achisKeys["QSUP6"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC9"
			},
			{
			    factionDependent = true,
		        nameAlliance = "Titokzatos bot",
		        nameHorde = "Troll edény",
				achievement = TA.achisKeys["QSUP7"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC10"
			},
			{
			    factionDependent = true,
		        nameAlliance = "Brohann és Rhapsody kalandjai",
		        nameHorde = "A trollok komolyan gondolják",
				achievement = TA.achisKeys["QSUP10"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC11"
			},
			{
			    factionDependent = true,
		        nameAlliance = "Sharpbeak megmentése",
		        nameHorde = "Hinterlands mérge",
				achievement = TA.achisKeys["QSUP9"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC12"
			},
			{
		        name = "Mérnöki alkémia",
				achievement = TA.achisKeys["QSUP11"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC13"
			},
			{
			    factionDependent = true,
		        nameAlliance = "Ragnaros küldöttjei",
		        nameHorde = "Deathwing hadnagyjai",
				achievement = TA.achisKeys["QSUP12"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC14"
			},
			{
		        name = "Szürkület a szurdokban",
				achievement = TA.achisKeys["QSUP14"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC15"
			},
			{
		        name = "Torkosborz kérései",
				achievement = TA.achisKeys["QSUP15"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSUPSC16"
			}
		}
	})



end
