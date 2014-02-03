local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Level30()

    local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end

	-- Human / Orc-Troll

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameHorde = "Stormstout emlékére",
		descriptionHorde = "Teljesítsd az \"Chen's Empty Keg\" sorozat utolsó küldetést",
		textureHorde = "Interface\\Icons\\inv_cask_04",
		nameAlliance = "Abercrombie az aljas",
		descriptionAlliance = "Teljesítsd a \"Bride of the Embalmer\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_shadow_corpseexplode",
		key = "QMED",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 253,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMEDC1",
			},
			{
			    factionExistent = "Horde",
				quest = 822,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMEDC2",
			}
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameAlliance = "Ladimore fájdalma",
		descriptionAlliance = "Teljesítsd a \"A Daughter's Love\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_holy_excorcism_02",
		nameHorde = "A függöség csökkentése",
		descriptionHorde = "Teljesítsd a \"Testing the Tonic\" küldetést",
		textureHorde = "Interface\\Icons\\inv_enchant_dustarcane",
		points = 10,
		key = "QMED2",
		save = TAchik,
		racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
		unmergeable = true,
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 231,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMEC2C1",
			},
			{
			    factionExistent = "Horde",
				quest = 9434,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMEC2C2",
			}
		},
	});


	TA:AddAchievement(
    {
			category = TA_QUESTS_GENERAL_30,
			factionDependent = true,
			nameAlliance = "Stalvan tette",
			descriptionAlliance = "Teljesítsd a \"The Legend of Stalvan\" sorozat utolsó küldetését",
			textureAlliance = "Interface\\Icons\\spell_shadow_lastingafflictions",
			nameHorde = "Az erök felszabadítása",
			descriptionHorde = "Teljesítsd a \"The Den\" küldetést",
			textureHorde = "Interface\\Icons\\spell_nature_abolishmagic",
			key = "QMED3",
			save = TAchik,
			points = 10,
			racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
			unmergeable = true,
			criteria =
			{
				{
				    factionExistent = "Alliance",
					quest = 98,
					events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
					objective = QDO,
					key = "QMED3C1",
				},
				{
				    factionExistent = "Horde",
					quest = 1089,
					events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
					objective = QDO,
					key = "QMED3C2",
				}
			}
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameAlliance = "A sötét lovagok nyomában",
		descriptionAlliance = "Teljesítsd a \"Morbent Fel\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_deathknight_summondeathcharger",
		nameHorde = "Vissza Silithusba!",
		descriptionHorde = "Teljesítsd a \"The Swarm Grows\" küldetést",
		textureHorde = "Interface\\Icons\\ability_hunter_pet_scorpid",
		key = "QMED4",
		points = 10,
		save = TAchik,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 55,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED4C1",
			},
			{
			    factionExistent = "Horde",
				quest = 1147,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED4C2",
			},
		}
	});

	-- Undead/NightElf --

    TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameAlliance = "Relara megmentöje",
		descriptionAlliance = "Teljesítsd a \"Fallen Sky Lake\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_holy_blessedlife",
		nameHorde = "A keresztnevem Veszély!",
		descriptionHorde = "Teljesítsd a \"Dangerous!\" küldetést",
		textureHorde = "Interface\\Icons\\spell_nature_strength",
		key = "QMED6",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 567,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED6C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 1035,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED6C2",
			},
		},
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameAlliance = "Dartos titkos ügynöke",
		descriptionAlliance = "Teljesítsd a \"Raene's Cleansing\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_wand_01",
		nameHorde = "Elixír mulatság",
		descriptionHorde = "Teljesítsd az alábbi küldetés-sorozatok utolsó küldetését",
		textureHorde = "Interface\\Icons\\inv_potion_06",
		key = "QMED7",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    name = "Elixir of Suffering",
			    factionExistent = "Horde",
				quest = 499,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED7C1",
			},
			{
			    name = "Elixir of Pain",
			    factionExistent = "Horde",
				quest = 502,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED7C2",
			},
			{
			    name = "Elixir of Agony",
			    factionExistent = "Horde",
				quest = 524,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED7C3",
			},
			{
			    factionExistent = "Alliance",
				quest = 1046,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED7C4",
			},
		},
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameAlliance = "Csintalan boszorkányok",
		descriptionAlliance = "Teljesítsd a \"The Tower of Althalaxx\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\spell_fire_soulburn",
		nameHorde = "Hívatlan vendégek",
		descriptionHorde = "Teljesítsd a \"Battle of Hillsbrad\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\inv_misc_bone_humanskull_01",
		key = "QMED8",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 550,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED8C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 981,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED8C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameAlliance = "Velinde sorsa",
		descriptionAlliance = "Teljesítsd az \"Answered Questions\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_holy_restoration",
		nameHorde = "A romok körül",
		descriptionHorde = "Teljesítsd az alábbi küldetéseket",
		textureHorde = "Interface\\Icons\\achievement_dungeon_theviolethold_heroic",
		key = "QMED9",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Night Elf" , "Undead" },
		criteria =
		{
			{
			    name = "Dalaran Patrols",
			    factionExistent = "Horde",
				quest = 545,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED9C1",
			},
			{
			    name = "Bracers of Binding",
			    factionExistent = "Horde",
				quest = 557,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED9C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 1044,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED9C3",
			},
		},
	});

	-- Tauren / Dwarf-Gnome

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameHorde = "A riporter",
		nameAlliance = "A Wetlands gondjai",
		descriptionHorde = "Teljesítsd a \"The Warsong Reports\" küldetést",
		descriptionAlliance = "Teljesítsd a \"Blisters on The Land\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_herb_06",
		textureHorde = "Interface\\Icons\\inv_letter_12",
		key = "QMED12",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Gnome" , "Dwarf" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 6543,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED12C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 275,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED12C2",
			},
		},
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameHorde = "A Grimtotem klán feloszlatása",
		nameAlliance = "Hátramaradt Dragonmaw",
		descriptionHorde = "Teljesítsd az alábbi küldetéseket",
		descriptionAlliance = "Teljesítsd a \"Defeat Nek'rosh\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_mace_38",
		textureHorde = "Interface\\Icons\\spell_nature_nullward",
		key = "QMED13",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Gnome" , "Dwarf" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    name = "Grimtotem Spying",
			    factionExistent = "Horde",
				quest = 5064,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED13C1",
			},
			{
			    name = "Wanted - Arnak Grimtotem",
			    factionExistent = "Horde",
				quest = 5147,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED13C2",
			},
			{
			    factionExistent = "Alliance",
				quest = 474,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED13C3",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameHorde = "Született vadász",
		nameAlliance = "Szobrot vagy életet, Murloc!",
		descriptionHorde = "Teljesítsd a \"Isha Awak\" küldetést",
		descriptionAlliance = "Teljesítsd a \"Return the Statuette\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_monsterhead_01",
		textureHorde = "Interface\\Icons\\ability_eyeoftheowl",
		key = "QMED14",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Gnome" , "Dwarf" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 873,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED14C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 286,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED14C2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_30,
		factionDependent = true,
		nameHorde = "Az önismerés útja",
		nameAlliance = "A legénység átka",
		descriptionHorde = "Teljesítsd a \"Final Passage\" küldetést",
		descriptionAlliance = "Teljesítsd a \"Cleansing the Eye\" küldetést",
		textureAlliance = "Interface\\Icons\\ability_creature_cursed_03",
		textureHorde = "Interface\\Icons\\ability_druid_empoweredtouch",
		key = "QMED15",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Gnome" , "Dwarf" , "Orc" , "Troll" , "Tauren" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 1394,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED15C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 293,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QMED15C2",
			},
		},
	});

	local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS_GENERAL,
		name = "Érett kalandozó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_03",
		points = 25,
		save = TAchik,
		key = "QMEDS",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    factionDependent = true,
		        nameHorde = "Stormstout emlékére",
		        nameAlliance = "Abercrombie az aljas",
				achievement = TA.achisKeys["QMED"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC1",
			},
			{
			    factionDependent = true,
		        nameHorde = "A függöség csökkentése",
		        nameAlliance = "Ladimore fájdalma",
				achievement = TA.achisKeys["QMED2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC2",
			},
			{
			    factionDependent = true,
		        nameHorde = "Az erök felszabadítása",
		        nameAlliance = "Stalvan tette",
				achievement = TA.achisKeys["QMED3"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC3",
			},
			{
			    factionDependent = true,
		        nameHorde = "Vissza Silithusba!",
		        nameAlliance = "A sötét lovagok nyomában",
				achievement = TA.achisKeys["QMED4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC4",
			},
			{
			    factionDependent = true,
		        nameHorde = "A keresztnevem Veszély!",
		        nameAlliance = "Relara megmentöje",
				achievement = TA.achisKeys["QMED6"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC5",
			},
			{
			    factionDependent = true,
		        nameHorde = "Elixír mulatság",
		        nameAlliance = "Dartos titkos ügynöke",
				achievement = TA.achisKeys["QMED7"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC6",
			},
			{
			    factionDependent = true,
		        nameHorde = "Hívatlan vendégek",
		        nameAlliance = "Csíntalan boszorkányok",
				achievement = TA.achisKeys["QMED8"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC7",
			},
			{
			    factionDependent = true,
		        nameHorde = "A romok körül",
		        nameAlliance = "Velinde sorsa",
				achievement = TA.achisKeys["QMED9"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC8",
			},
			{
			    factionDependent = true,
		        nameHorde = "A riporter",
		        nameAlliance = "A Wetlands gondjai",
				achievement = TA.achisKeys["QMED12"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC9",
			},
			{
			    factionDependent = true,
		        nameHorde = "A Grimtotem kláln feloszlatása",
		        nameAlliance = "Hátramaradt Dragonmaw",
				achievement = TA.achisKeys["QMED13"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC10",
			},
			{
			    factionDependent = true,
		        nameHorde = "Született vadász",
		        nameAlliance = "Szobrot vagy életet, Murloc!",
				achievement = TA.achisKeys["QMED14"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC11",
			},
			{
			    factionDependent = true,
		        nameHorde = "Az önismerés útja",
		        nameAlliance = "A legénység átka",
				achievement = TA.achisKeys["QMED15"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QMEDSC12",
			},
		}
	})

end
