local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Level40()

    local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end

	-- Stranglethorne --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Azeroth legjobb csizmárja",
		description = "Teljesítsd a \"Excelsior\" küldetést",
		texture = "Interface\\Icons\\inv_boots_07",
		key = "QHIGH1",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 628,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH1C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "A titokzatos M",
		descriptionAlliance = "Teljesítsd a \"Report to Doren\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_helmet_31",
		nameHorde = "Üdvözlünk Grom'golban",
		descriptionHorde = "Teljesítsd a \"The Defense of Grom'gol\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\inv_helmet_113",
		key = "QHIGH",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 331,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGHC1",
			},
			{
				factionExistent = "Horde",
				quest = 1267,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGHC2",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "Kurzen vesztegetöje",
		descriptionAlliance = "Teljesítsd a \"Mai'Zoth\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_deathknight_bloodplague",
		nameHorde = "Bloodscalp bonyodalom",
		descriptionHorde = "Teljesítsd az alábbi küldetéseket",
		textureHorde = "Interface\\Icons\\spell_totem_wardofdraining",
		key = "QHIGH2",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 206,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH2C1",
			},
			{
				name = "An Unusual Patron",
				factionExistent = "Horde",
				quest = 9457,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH2C2",
			},
			{
				name = "Split Bone Necklace",
				factionExistent = "Horde",
				quest = 598,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH2C3",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Kalózok hárítása",
		description = "Teljesítsd a \"The Bloodsail Buccaneers\" sorozat utolsó küldetést",
		texture = "Interface\\Icons\\inv_banner_03",
		key = "QHIGH01",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 608,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH01C1",
			}
		}
	})

	-- Arathi Highlands

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "Stromgarde kincsei",
		descriptionAlliance = "Teljesítsd a \"Malin's Request\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_gem_ruby_02",
		nameHorde = "Arathi kardja",
		descriptionHorde = "Teljesítsd a \"Call to Arms\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\inv_sword_11",
		key = "QHIGH5",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 697,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH5C1",
			},
			{
				factionExis7tent = "Horde",
				quest = 679,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH5C2",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "A halottak becsülete",
		descriptionAlliance = "Teljesítsd a \"Stromgarde Badges\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_jewelry_amulet_06",
		nameHorde = "Doomhammer gyászolója",
		descriptionHorde = "Teljesítsd a \"Guile of the Raptor\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\spell_misc_emotionsad",
		key = "QHIGH4",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 682,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH4C1",
			},
			{
				factionExistent = "Horde",
				quest = 847,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH4C2",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Víz alatti kincsvadász",
		description = "Teljesítsd a \"Sunken Treasure\" sorozat utolsó elötti küldetést",
		texture = "Interface\\Icons\\spell_shadow_demonbreath",
		key = "QHIGH6",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 669,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH6C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Egy nö varázsa",
		description = "Teljesítsd a \"Summoning the Princess\" küldetést",
		texture = "Interface\\Icons\\spell_shadow_mindsteal",
		key = "QHIGH7",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 656,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH7C1",
			}
		}
	})

	-- Desolace

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "Desolace daliája",
		descriptionAlliance = "Teljesítsd a \"Return to Vahlarriel\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_helmet_21",
		nameHorde = "Centaur eredet",
		descriptionHorde = "Teljesítsd a \"Khan Dez'hepah\" küldetést",
		textureHorde = "Interface\\Icons\\inv_misc_head_centaur_01",
		key = "QHIGH9",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 1440,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH9C1",
			},
			{
				factionExistent = "Horde",
				quest = 1365,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH9C3",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "A beszerzö",
		descriptionAlliance = "Teljesítsd a \"Reagents for Reclaimers Inc.\" sorozat valamint a \"The Karnitol Shipwreck\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\ability_rogue_findweakness",
		nameHorde = "Katra zil shukil Azrethoc",
		descriptionHorde = "Teljesítsd a \"The Corrupter\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\spell_shadow_ragingscream",
		key = "QHIGH8",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "Reagents for Reclaimers Inc.",
				factionExistent = "Alliance",
				quest = 1467,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH8C1",
			},
			{
			    name = "The Karnitol Shipwreck",
				factionExistent = "Alliance",
				quest = 1457,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH8C2",
			},
			{
				factionExistent = "Horde",
				quest = 1488,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH8C3",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Átjáróház",
		description = "Teljesítsd mindkét \"Khan Hratha\" küldetést",
		texture = "Interface\\Icons\\spell_holy_healingfocus",
		key = "QHIGH10",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 1381,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH10C1",
			},
			{
				quest = 1380,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH10C2",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "A nagák titka",
		description = "Teljesítsd mindkét a \"Book of the Ancients\" küldetést",
		texture = "Interface\\Icons\\inv_misc_book_06",
		key = "QHIGH11",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 6027,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH11C1",
			}
		}
	})

	-- Dustwallow marsh --


    TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		name = "A Shady Rest fogadó rejtélye",
		descriptionAlliance = "Teljesítsd a \"Peace at Last\" küldetést",
		descriptionHorde = "Teljesítsd a \"Justice Dispensed\" küldetést",
		texture = "Interface\\Icons\\spell_frost_stun",
		key = "QHIGH12",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 11152,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH12C1",
			},
			{
				factionExistent = "Horde",
				quest = 11206,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH12C2",
			},
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "Dezertörök és a Defias",
		nameHorde = "Deathwing unokái",
		descriptionAlliance = "Teljesítsd a \"Return to Jaina\" küldetést",
		descriptionHorde = "Teljesítsd a \"The Brood of Onyxia\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_sword_28",
		textureHorde = "Interface\\Icons\\inv_misc_monsterscales_15",
		key = "QHIGH13",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 11223,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH13C1",
			},
			{
				factionExistent = "Horde",
				quest = 1172,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH13C2",
			},
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Népi mágia",
		description = "Teljesítsd a \"Cleansing Witch Hill\" küldetést",
		texture = "Interface\\Icons\\inv_torch_lit",
		key = "QHIGH14",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 11183,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH14C1",
			}
		}
	})

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Brogg bosszúja",
		description = "Teljesítsd a \"Challenge to the Black Flight\" küldetést",
		texture = "Interface\\Icons\\inv_axe_55",
		key = "QHIGH15",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 11162,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH15C1",
			}
		}
	})

	-- Swamp of Sorrows

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		factionDependent = true,
		nameAlliance = "Skywalker elveszett kiséröje",
		nameHorde = "A bánat partjai",
		descriptionAlliance = "Teljesítsd a \"Deliver the Shipment\" küldetést",
		descriptionHorde = "Teljesítsd a \"Threat From the Sea\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\inv_offhand_naxxramas_04",
		textureHorde = "Interface\\Icons\\inv_misc_monsterhead_03",
		key = "QHIGH16",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 1425,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH16C1",
			},
			{
				factionExistent = "Horde",
				quest = { 1427 , 1428 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH16C2",
			},
		}
	})

	-- The Shimmering Flats

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_40,
		name = "Halálos Goblin iramban",
		description = "Teljesítsd a \"Safety First\" küldetést",
		texture = "Interface\\Icons\\inv_misc_gear_01",
		key = "QHIGH17",
		save = TAchik,
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
				quest = 1189,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QHIGH17C1",
			}
		}
	})

	local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS_GENERAL,
		name = "Felnött kalandozó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_04",
		points = 25,
		save = TAchik,
		key = "QHIGHS",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    name = "Azeroth legjobb csizmárja",
				achievement = TA.achisKeys["QHIGH1"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC1"
			},
			{
			    factionDependent = true,
			    nameAlliance = "A titokzatos M",
				nameHorde = "Üdvözlünk Grom'golban",
				achievement = TA.achisKeys["QHIGH"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC2"
			},
			{
			    factionDependent = true,
			    nameAlliance = "Kurzen vesztegetöje",
				nameHorde = "Bloodscalp bonyodalom",
				achievement = TA.achisKeys["QHIGH2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC3"
			},
			{
			    name = "Kalózok hárítása",
				achievement = TA.achisKeys["QHIGH01"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC4"
			},
			{
			    factionDependent = true,
			    nameAlliance = "Stormgarde kincsei",
				nameHorde = "Arathi kardja",
				achievement = TA.achisKeys["QHIGH5"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC5"
			},
			{
			    factionDependent = true,
			    nameAlliance = "A halottak becsülete",
				nameHorde = "Doomhammer gyászolója",
				achievement = TA.achisKeys["QHIGH4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC6"
			},
			{
			    name = "Víz alatti kincsvadász",
				achievement = TA.achisKeys["QHIGH6"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC7"
			},
			{
			    name = "Egy nö varázsa",
				achievement = TA.achisKeys["QHIGH7"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC8"
			},
			{
			    factionDependent = true,
			    nameAlliance = "Desolace daliája",
				nameHorde = "Centaur eredet",
				achievement = TA.achisKeys["QHIGH9"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC9"
			},
			{
			    factionDependent = true,
			    nameAlliance = "A beszerzö",
				nameHorde = "Katra zil shukil Azrethoc",
				achievement = TA.achisKeys["QHIGH8"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC10"
			},
			{
			    name = "Atjáróház",
				achievement = TA.achisKeys["QHIGH10"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC11"
			},
			{
			    name = "A nagák titka",
				achievement = TA.achisKeys["QHIGH11"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC12"
			},
			{
			    name = "A Shady Rest fogadó rejtélye",
				achievement = TA.achisKeys["QHIGH12"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC13"
			},
			{
			    factionDependent = true,
			    nameAlliance = "Dezertörök és a Defias",
				nameHorde = "Deathwing unokái",
				achievement = TA.achisKeys["QHIGH13"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC14"
			},
			{
			    name = "Népi mágia",
				achievement = TA.achisKeys["QHIGH14"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC15"
			},
			{
			    name = "Brogg bosszúja",
				achievement = TA.achisKeys["QHIGH15"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC16"
			},
			{
			    factionDependent = true,
			    nameAlliance = "Skywalker elveszett kiséröje",
				nameHorde = "A bánat partjai",
				achievement = TA.achisKeys["QHIGH16"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC17"
			},
			{
			    name = "Halálos Goblin iramban",
				achievement = TA.achisKeys["QHIGH17"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QHIGHSC18"
			}
		}
	});


end
