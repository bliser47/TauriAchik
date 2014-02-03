local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Level10()

    local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end


	-- Human - Orc/Troll --

   TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Tiltott szerelem",
		descriptionAlliance = "Teljesítsd a \"The Escape\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_brokenheart",
		nameHorde = "Proudmore partraszálása",
		descriptionHorde = "Teljesítsd a \"The Admiral's Orders\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\inv_letter_15",
		key = "QSTART1",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 114,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART1C1",
			},
            {
				factionExistent = "Horde",
				quest = 831,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART1C2",
			}
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Koboldok kincse",
		descriptionAlliance = "Teljesítsd a \"Goldtooth\" küldetést visszajuttatva Bernice nyakláncát",
		textureAlliance = "Interface\\Icons\\inv_jewelry_amulet_04",
		nameHorde = "A légió hívei",
		descriptionHorde = "Teljesítsd a \"The Demon Seed\" küldetést",
		textureHorde = "Interface\\Icons\\spell_shaman_stormearthfire",
		key = "QSTART2",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 87,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART2C1",
			},
			{
				factionExistent = "Horde",
				quest = 924,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART2C2",
			}
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Remy megmondta",
		descriptionAlliance = "Teljesítsd a \"Deliver Thomas' Report\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_head_murloc_01",
		nameHorde = "Ork árulók",
		descriptionHorde = "Teljesítsd a \"Hidden Enemies\" sorozat utolsó küldetését",
        textureHorde = "Interface\\Icons\\ability_warrior_cleave",
		key = "QSTART3",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Human" , "Orc" , "Troll" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = { 39 , 59 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART3C1",
			},
			{
				factionExistent = "Horde",
				quest = 5730,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART3C2",
			}
		},
	});




	-- Undead / Night Elf

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Furbolgok hatás alatt",
        descriptionAlliance = "Teljesítsd a \"Ursal the Mauler\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_monsterclaw_04",
		nameHorde = "Háború a hadjárat ellen",
		descriptionHorde = "Teljesítsd a \"At War With The Scarlet Crusade\" sorozat utolsó küldetést",
		textureHorde = "Interface\\Icons\\inv_sword_35",
		key = "QSTART8",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Undead" , "Night Elf" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 486,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART8C1",
			},
			{
			    factionExistent = "Horde",
				quest = 372,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART8C1",
			}
		},
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Elemi daganatok",
		descriptionAlliance = "Teljesítsd a \"Oakenscowl\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_organ_06",
		nameHorde = "Az Agamandék",
		descriptionHorde = "Teljesítsd a \"The Haunted Mills\" küldetést",
		textureHorde = "Interface\\Icons\\spell_shadow_deadofnight",
		key = "QSTART9",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Undead" , "Night Elf" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 2499,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART9C1",
			},
			{
			    factionExistent = "Horde",
				quest = 362,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART9C2",
			}
		},
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Teldrassil története",
		descriptionAlliance = "Teljesítsd a \"Crown of the Earth\" sorozat utolsó küldetését",
		textureAlliance = "Interface\\Icons\\ability_druid_giftoftheearthmother",
		nameHorde = "Veszélyes keverék",
		descriptionHorde = "Teljesítsd a \"A New Plague\" sorozat utolsó küldetését",
		textureHorde = "Interface\\Icons\\inv_misc_cauldron_nature",
		key = "QSTART7",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Undead" , "Night Elf" },
		criteria =
		{
			{
			    factionExistent = "Alliance",
				quest = 935,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QLORE7C3",
			},
			{
			    factionExistent = "Horde",
				quest = 492,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART7C2",
			}
		},
	});

	-- Dwarf/Gnome - Tauren --


	TA:AddAchievement(
    {
			category = TA_QUESTS_GENERAL_10,
			factionDependent = true,
		    nameAlliance = "Szomjas törpök",
			descriptionAlliance = "Teljesítsd a \"Return to Bellowfiz\" küldetést",
			textureAlliance = "Interface\\Icons\\inv_cask_01",
			nameHorde = "A karaván kiírtása",
		    textureHorde = "Interface\\Icons\\ability_kick",
		    descriptionHorde = "Teljesítsd az alábbi küldetéseket",
		 	key = "QSTART11",
			save = TAchik,
			points = 10,
			unmergeable = true,
			racePriority = { "Tauren" , "Dwarf" , "Gnome" },
			criteria =
			{
				{
				    factionExistent = "Alliance",
					quest = 320,
					events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
					objective = QDO,
					key = "QSTART11C1",
				},
				{
			        name = "The Venture Co.",
			        factionExistent = "Horde",
				    quest = 764,
				    events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				    objective = QDO,
			        key = "QSTART11C2",
			    },
			    {
			        name = "Supervisor Fizsprocket",
			        factionExistent = "Horde",
				    quest = 765,
				    events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				    objective = QDO,
			        key = "QSTART11C3",
			    },
			}
	});


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameHorde = "Kút tisztitó",
		nameAlliance = "Whitebeard biztosa",
		descriptionHorde = "Teljesítsd a \"Wildmane Cleansing\" küldetést",
		descriptionAlliance = "Teljesítsd a \"The Reports\" küldetést",
		textureHorde = "Interface\\Icons\\ability_shaman_cleansespirit",
		textureAlliance = "Interface\\Icons\\spell_ice_lament",
		key = "QSTART12",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { "Tauren" , "Dwarf", "Gnome" },
		criteria =
		{
			{
			    factionExistent = "Horde",
				quest = 760,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART11C1",
			},
			{
			    factionExistent = "Alliance",
				quest = 291,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QSTART11C2",
			},
		},
	});


	TA:AddAchievement(
    {
			category = TA_QUESTS_GENERAL_10,
			factionDependent = true,
			nameAlliance = "Egy új sör",
			descriptionAlliance = "Teljesítsd a \"Stout to Kadrell\" küldetést",
		    textureAlliance = "Interface\\Icons\\inv_drink_05",
            nameHorde = "A tisztelet elnyerése",
		    descriptionHorde = "Teljesítsd a \"Rites of the Earthmother\" küldetést",
		    textureHorde = "Interface\\Icons\\inv_shield_43",
			key = "QSTART10",
			points = 10,
			save = TAchik,
			unmergeable = true,
			racePriority = { "Tauren" , "Dwarf" , "Gnome" },
			criteria =
			{
				{
				    factionExistent = "Alliance",
					quest = 414,
					events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
					objective = QDO,
					key = "QSTARTC1",
				},
				{
				    factionExistent = "Horde",
				    quest = 776,
				    events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				    objective = QDO,
			        key = "QLORE8C1",
			    }
			}
	});

	-- Blod Elf / Draenei --

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "Beilleszkedés a természetbe",
		nameHorde = "A hazug elfet hamar utolérik",
		descriptionAlliance = "Teljesítsd a \"Tree's Company\" küldetést",
		descriptionHorde = "Teljesítsd a \"Swift Discipline\" küldetést",
		textureAlliance = "Interface\\Icons\\trade_herbalism",
		textureHorde = "Interface\\Icons\\spell_holy_power",
		key = "QSTART4",
		points = 10,
		save = TAchik,
		unmergeable = true,
		racePriority = { "Draenei" , "Blood Elf" },
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = { 9531 , 9537 ,  9602 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART4C1",
			},
			{
				factionExistent = "Horde",
				quest = 9066,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART4C2",
			}
		}
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		nameAlliance = "A Furbolg nyelv megfejtése",
		nameHorde = "Misztikus küldetések",
		descriptionAlliance = "Teljesítsd a \"The Prophecy of Akida\" küldetést",
		descriptionHorde = "Teljesítsd a \"Arcane Instability\" küldetést",
		textureAlliance = "Interface\\Icons\\spell_nature_dryaddispelmagic",
		textureHorde = "Interface\\Icons\\spell_nature_wispsplode",
		key = "QSTART5",
		points = 10,
		save = TAchik,
		unmergeable = true,
		racePriority = { "Draenei" , "Blood Elf" },
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = { 9544 , 9559  , 9560 , 9562 , 9565 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART5C1",
			},
			{
				factionExistent = "Horde",
				quest = 8486,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART5C2",
			}
		}
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		factionDependent = true,
		name = "Murloc mánia",
		descriptionAlliance = "Teljesítsd a \"Gurf's Dignity\" küldetést",
		descriptionHorde = "Teljesítsd a \"The Ring of Mmmrrrggglll\" küldetést",
		texture = "Interface\\Icons\\inv_misc_monsterhead_02",
		key = "QSTART6",
		points = 10,
		save = TAchik,
		unmergeable = true,
		racePriority = { "Draenei" , "Blood Elf" },
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = 9564,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART6C1",
			},
			{
				factionExistent = "Horde",
				quest = 8885,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
				key = "QSTART6C2",
			}
		}
	});


	 -- All End --


	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		raceDependent = true,
		-- Tauren --
		nameTauren = "A Wyvern hátán",
		descriptionTauren = "Teljesítsd a \"Return to Jahan\" küldetést",
		-- Orc --
		nameOrc = "A Wyvern hátán",
		descriptionOrc = "Teljesítsd a \"Return to the Crossroads\" küldetést",
		-- Troll --
		nameTroll = "A Wyvern hátán",
		descriptionTroll = "Teljesítsd a \"Return to the Crossroads\" küldetést",
        -- Gnome --
        nameGnome = "Griffmadár hátán",
		descriptionGnome = "Teljesítsd a \"Return to Brock\" küldetést",
        -- Dwarf --
		nameDwarf = "Griffmadár hátán",
		descriptionDwarf = "Teljesítsd a \"Return to Brock\" küldetést",
        -- Night Elf --
        nameNightElf = "Hippogriff hátán",
		descriptionNightElf = "Teljesítsd a \"Return to Nessa\" küldetést",
        -- Human --
		nameHuman = "Griffmadár hátán",
		descriptionHuman = "Teljesítsd a \"Return to Lewis\" küldetést",
		-- Draenei --
		nameDraenei = "Hippogriff hátán",
		descriptionDraenei = "Teljesítsd a \"Return to Topher Loaal\" küldetést",
		-- Undead --
		nameUndead = "Denevér hátán",
		descriptionUndead = "Teljesítsd a \"Return to Podrig\" küldetést",
		-- Blood Elf --
		nameBloodElf = "Dragonhawk hátán",
		descriptionBloodElf = "Teljesítsd a \"Return to Quartermaster Lymel\" küldetést",
		key = "QFLY1",
		save = TAchik,
		points = 10,
		unmergeable = true,
		racePriority = { UnitRace("player") },
		criteria =
		{
			{
			    raceExistent = "Tauren",
				quest = 6364,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C1",
			},
			{
			    raceExistent = "Night Elf",
				quest = 6343,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C2",
			},
			{
			    raceExistent = { "Orc" , "Troll" },
				quest = 6386,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C3",
			},
			{
			    raceExistent = { "Dwarf" , "Gnome" },
				quest = 6392,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C4",
			},
			{
			    raceExistent = "Undead",
				quest = 6324,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C5",
			},
			{
			    raceExistent = "Human",
				quest = 6285,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C6",
			},

			{
			    raceExistent = "Blood Elf",
				quest = 9135,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C7",
			},
			{
			    raceExistent = "Draenei",
				quest = 9606,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QFLY1C8",
			},
		},
	});


	local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS_GENERAL,
		name = "Fiatal kalandozó",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_01",
		points = 25,
		save = TAchik,
		key = "QSTARTS",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    factionDependent = true,
		        nameHorde = "Proudmore partraszálása",
		        nameAlliance = "Tiltott szerelem",
				achievement = TA.achisKeys["QSTART1"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC1",
			},
			{
			    factionDependent = true,
		        nameHorde = "A légió hívei",
		        nameAlliance = "Koboldok kincse",
				achievement = TA.achisKeys["QSTART2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC2",
			},
			{
			    factionDependent = true,
		        nameHorde = "Ork árulók",
		        nameAlliance = "Remy megmondta",
				achievement = TA.achisKeys["QSTART3"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC3",
			},
			{
			    factionDependent = true,
		        nameHorde = "Háború a hadjárat ellen",
		        nameAlliance = "Furbolgok hatás alatt",
				achievement = TA.achisKeys["QSTART8"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC4",
			},
			{
			    factionDependent = true,
		        nameHorde = "Az agamandék",
		        nameAlliance = "Elemi daganatok",
				achievement = TA.achisKeys["QSTART9"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC5",
			},
			{
			    factionDependent = true,
		        nameHorde = "Veszélyes keverék",
		        nameAlliance = "Teldrassil története",
				achievement = TA.achisKeys["QSTART7"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC6",
			},
			{
			    factionDependent = true,
		        nameHorde = "A karaván kiírtása",
		        nameAlliance = "Szomjas törpök",
				achievement = TA.achisKeys["QSTART11"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC7",
			},
			{
			    factionDependent = true,
		        nameHorde = "Kút tisztító",
		        nameAlliance = "Whitebeard biztosa",
				achievement = TA.achisKeys["QSTART12"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC8",
			},
			{
			    factionDependent = true,
		        nameHorde = "A tisztelet elnyerése",
		        nameAlliance = "Egy új sör",
				achievement = TA.achisKeys["QSTART10"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC9",
			},
			{
			    factionDependent = true,
		        nameHorde = "A hazug elfet hamar utolérik",
		        nameAlliance = "Beilleszkedés a természetbe",
				achievement = TA.achisKeys["QSTART4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC10",
			},
			{
			    factionDependent = true,
		        nameHorde = "Misztikus küldetések",
		        nameAlliance = "A Furbolg nyelv megfejtése",
				achievement = TA.achisKeys["QSTART5"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC11",
			},
			{
		        name = "Murloc mánia",
				achievement = TA.achisKeys["QSTART6"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "QSTARTSC12",
			},
		}
    })

end
