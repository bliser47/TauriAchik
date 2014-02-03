local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_LoremasterMeta()

    local function TLOREM(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_QUESTS,
		name = "Föváros Küldetések",
		description = "Teljesitsd az alábbi TauriAchikat",
		textureAlliance = "Interface\\Icons\\inv_scroll_12",
		textureHorde = "Interface\\Icons\\inv_scroll_16",
		points = 25,
		save = TAchik,
		key = "TLOREMCITY",
		factionDependent = true,
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    factionDependent = true,
		        nameHorde = "Orgrimmar Küldetések",
		        nameAlliance = "Stormwind City Küldetések",
				achievement = TA.achisKeys["CAPITALQUEST1"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMCITYC1",
			},
			{
			    factionDependent = true,
		        nameHorde = "Undercity Küldetések",
		        nameAlliance = "Darnassus Küldetések",
				achievement = TA.achisKeys["CAPITALQUEST2"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMCITYC2",
			},
			{
			    factionDependent = true,
		        nameHorde = "Thunder Bluff Küldetések",
		        nameAlliance = "Ironforge Küldetések",
				achievement = TA.achisKeys["CAPITALQUEST3"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMCITYC3",
			},
			{
			    factionDependent = true,
		        nameHorde = "Silvermoon City Küldetések",
		        nameAlliance = "The Exodar Küldetések",
				achievement = TA.achisKeys["CAPITALQUEST4"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMCITYC4",
			}
		}
	});

	TA:AddAchievement(
    {
        category = TA_QUESTS,
		name = "Eastern Kingdoms Küldetések",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_zone_easternkingdoms_01",
		points = 50,
		save = TAchik,
		key = "TLOREMEK",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    factionDependent = true,
				nameHorde = "Tirisfal Glades Küldetések",
				nameAlliance = "Teldrassil Küldetések",
				achievement = TA.achisKeys["KEZDO1QUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC1",
			},
			{
			    factionDependent = true,
				nameHorde = "Eversong Woods Küldetések",
				nameAlliance = "Azuremyst Isle Küldetések",
				achievement = TA.achisKeys["KEZDO2QUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC2",
			},
			{
			    factionExistent = "Alliance",
				name = "Westfall Küldetések",
				achievement = TA.achisKeys["WESTFALLQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC3",
			},
			{
			    factionExistent = "Alliance",
				name = "Loch Modan Küldetések",
				achievement = TA.achisKeys["LOCHQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC4",
			},
			{
			    factionExistent = "Alliance",
				name = "Redridge Mountains Küldetések",
				achievement = TA.achisKeys["REDRIQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC5",
			},
			{
			    factionExistent = "Alliance",
				name = "Duskwood Küldetések",
				achievement = TA.achisKeys["DUSKWOODQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC6",
			},
			{
				name = "Hillsbrad Foothills Küldetések",
				achievement = TA.achisKeys["HILLSBRADQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC7",
			},
			{
			    factionExistent = "Alliance",
				name = "Wetlands Küldetések",
				achievement = TA.achisKeys["WETLANDSQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC8",
			},
			{
				name = "Arathi Highlands Küldetések",
				achievement = TA.achisKeys["ARATHIQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC9",
			},
			{
			    factionExistent = "Alliance",
				name = "Alterac Mountains Küldetések",
				achievement = TA.achisKeys["ALTERACQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC10",
			},
			{
				name = "Stranglethorn Vale Küldetések",
				achievement = TA.achisKeys["STVQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC11",
			},
			{
				name = "Swamp of Sorrows Küldetések",
				achievement = TA.achisKeys["SWAMPQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC12",
			},
			{
				name = "Badlands Küldetések",
				achievement = TA.achisKeys["BADLANDSQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC13",
			},
			{
				name = "The Hinterlands Küldetések",
				achievement = TA.achisKeys["HINTERLANDSQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC14",
			},
			{
				name = "Searing Gorge Küldetések",
				achievement = TA.achisKeys["GORGEQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC15",
			},
			{
				name = "Blasted Lands Küldetések",
				achievement = TA.achisKeys["BLASTEDQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC16",
			},
			{
				name = "Burning Steppes Küldetések",
				achievement = TA.achisKeys["STEPSQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC17",
			},
			{
				name = "Western Plaguelands Küldetések",
				achievement = TA.achisKeys["WESTERNPQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC18",
			},
			{
				name = "Eastern Plaguelands Küldetések",
				achievement = TA.achisKeys["EASTERNPQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMEKC19",
			},
		}
	});

	TA:AddAchievement(
    {
        category = TA_QUESTS,
		name = "Kalimdor Küldetések",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_zone_kalimdor_01",
		points = 50,
		save = TAchik,
		key = "TLOREMK",
		unmergeable = true,
		meta = true,
		criteria =
		{
			{
			    factionDependent = true,
				nameHorde = "Durotar Küldetések",
				nameAlliance = "Elwynn Forest Küldetések",
				achievement = TA.achisKeys["KEZDO5QUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC1",
			},
			{
			    factionDependent = true,
				nameHorde = "Mulgore Küldetések",
				nameAlliance = "Dun Morogh Küldetések",
				achievement = TA.achisKeys["KEZDO6QUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC2",
			},
			{
			    factionDependent = true,
				nameAlliance = "Darkshore Küldetések",
				nameHorde = "Silverpine Forest Küldetések",
				achievement = TA.achisKeys["KEZDO3QUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC3",
			},
			{
			    factionDependent = true,
				nameAlliance = "Bloodmyst Isle Küldetések",
				nameHorde = "The Ghostlands",
				achievement = TA.achisKeys["KEZDO4QUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC4",
			},
			{
				name = "The Barrens Küldetések",
				achievement = TA.achisKeys["BARRENSQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC5",
			},
			{
				name = "Stonetalon Mountains Küldetések",
				achievement = TA.achisKeys["STONEQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC6",
			},
			{
				name = "Ashenvale Küldetések",
				achievement = TA.achisKeys["ASHENVALEQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC7",
			},
			{
				name = "Thousand Needles Küldetések",
				achievement = TA.achisKeys["NEEDLESQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC8",
			},
			{
				name = "Desolace Küldetések",
				achievement = TA.achisKeys["DESOLACEQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC9",
			},
			{
				name = "Dustwallow Marsh Küldetések",
				achievement = TA.achisKeys["DUSTWALLQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC10",
			},
			{
				name = "Tanaris Küldetések",
				achievement = TA.achisKeys["TANARISQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC11",
			},
			{
				name = "Feralas Küldetések",
				achievement = TA.achisKeys["FERALASQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC12",
			},
			{
				name = "Azshara Küldetések",
				achievement = TA.achisKeys["AZSHARAQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC13",
			},
			{
				name = "Un'goro Crater Küldetések",
				achievement = TA.achisKeys["UNGOROQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC14",
			},
			{
				name = "Felwood Küldetések",
				achievement = TA.achisKeys["FELWOODQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC15",
			},
			{
				name = "Winterspring Küldetések",
				achievement = TA.achisKeys["WINTERSPRINGQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC16",
			},
			{
				name = "Silithus Küldetések",
				achievement = TA.achisKeys["SILITHUSQUEST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREMKC17",
			},
		}
	});

	TA:AddAchievement(
    {
        category = TA_QUESTS,
		name = "Történet vezérelt játékos",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\inv_misc_book_07",
		points = 50,
		save = TAchik,
		key = "TLOREQUESTS",
		unmergeable = true,
		meta = true,
		criteria =
		{
		    {
			    name = "Fiatal kalandozó",
				achievement = TA.achisKeys["QSTARTS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREQUESTSC1",
			},
			{
			    name = "Kamasz kalandozó",
				achievement = TA.achisKeys["QMIDS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREQUESTSC2",
			},
			{
			    name = "Érett kalandozó",
				achievement = TA.achisKeys["QMEDS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREQUESTSC3",
			},
			{
			    name = "Felnött kalandozó",
				achievement = TA.achisKeys["QHIGHS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREQUESTSC4",
			},
			{
			    name = "Idös kalandozó",
				achievement = TA.achisKeys["QSUPS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREQUESTSC5",
			},
			{
			    name = "Öreg kalandozó",
				achievement = TA.achisKeys["QMAXS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TLOREQUESTSC6",
			},
		}
	})


	TA:AddAchievement(
    {
        category = TA_QUESTS,
		name = "Küldetések királya",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_quests_completed_08",
		points = 50,
		save = TAchik,
		key = "TMEGALORE",
		unmergeable = true,
		meta = true,
		criteria =
		{
		    {
			    name = "Föváros Küldetések",
				achievement = TA.achisKeys["TLOREMCITY"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TMEGALOREC1",
			},
			{
			    name = "Történet vezérelt játékos",
				achievement = TA.achisKeys["TLOREQUESTS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TMEGALOREC4",
			},
			{
			    name = "Eastern Kingdoms Küldetések",
				achievement = TA.achisKeys["TLOREMEK"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TMEGALOREC2",
			},
			{
			    name = "Eastern Kingdoms Küldetések",
				achievement = TA.achisKeys["TLOREMK"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = TLOREM,
				key = "TMEGALOREC3",
			}
		}
	})

end
