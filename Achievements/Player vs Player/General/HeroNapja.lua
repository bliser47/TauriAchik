local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_HeroNapja()

	local function HERON(tbl,event,...)
	    return select(4,GetAchievementInfo(tbl.achievement))
    end

    TA:AddAchievement(
    {
	    category = TA_PVP,
	    name = UnitName("player").." a barbár",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\racial_orc_berserkerstrength",
	    points = 30,
	    key = "HERONAPJA",
	    save = TAchik,
		meta = true,
	    criteria =
	    {
		    {
				name = "A hideg csak erösit",
				achievement = TA.achisKeys["AVHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "HERONAPJAC1",
			},
			{
				name = "Véres medence",
				achievement = TA.achisKeys["ABHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "HERONAPJAC2",
			},
			{
				name = "A zászló a gyengéknek van",
				achievement = TA.achisKeys["WSGHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "HERONAPJAC3",
			},
			{
				name = "Mindent az ereklye érdekében",
				achievement = TA.achisKeys["SOTAHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "HERONAPJAC4",
			},
			{
				name = "Egy híján háromszáz gyáva",
				achievement = TA.achisKeys["IOCHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "HERONAPJAC5",
			},
			{
				name = "Nincs csend a vihar elött",
				achievement = TA.achisKeys["EOSHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "HERONAPJAC6",
			},
	    },
    });


	TA:AddAchievement(
    {
	    category = TA_PVP,
	    name = "Szimpatikus szakadék",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\achievement_bg_winwsg",
	    points = 30,
	    key = "WSGMETA",
	    save = TAchik,
		meta = true,
	    criteria =
	    {

			{
				name = "A zászló a gyengéknek van",
				achievement = TA.achisKeys["WSGHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "WSGMETAC1",
			},
		    {
				name = "Zászlók harca",
				achievement = TA.achisKeys["FLAGVFLAG"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "WSGMETAC2",
			},
			{
				name = "Kell a Honor!",
				achievement = TA.achisKeys["KAZH"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "WSGMETAC3",
			},
			{
				name = "Hiroshima Gulch",
				achievement = TA.achisKeys["HRSGV"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "WSGMETAC4",
			},
			{
				name = "Team Fortress",
				achievement = TA.achisKeys["TEMFORTR"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "WSGMETAC5",
			},
			{
				name = "Összpontosított campelés",
				achievement = TA.achisKeys["VARBAVISSZA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "WSGMETAC6",
			}
	    },
    });


	TA:AddAchievement(
    {
	    category = TA_PVP,
	    name = "Megkedvelt medence",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\achievement_bg_winab",
	    points = 30,
	    key = "ABMETA",
	    save = TAchik,
		meta = true,
	    criteria =
	    {
		    {
				name = "Véres medence",
				achievement = TA.achisKeys["ABHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "ABMETAC1",
			},
			{
				name = "Buffteli Basin",
				achievement = TA.achisKeys["ARATHIBUFF"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "ABMETAC2",
			},
			{
			    factionDependent = true,
	            nameAlliance = "Nézd "..UnitName("player").." lovait!",
                nameHorde = "Krumpliszedö "..UnitName("player"),
				name = "Buffteli Basin",
				achievement = TA.achisKeys["ARATHIQ"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "ABMETAC3",
			},
			{
				name = "Pihekönnyü",
				achievement = TA.achisKeys["ARATHIBOND"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "ABMETAC4",
			},
			{
				name = "Azért se legyen meg..",
				achievement = TA.achisKeys["ARATHICSICSKA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "ABMETAC5",
			},
			{
				name = "Az ugró eventek nyertese",
				achievement = TA.achisKeys["ARATHIJUMP"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "ABMETAC6",
			}
		}
	})

	TA:AddAchievement(
    {
	    category = TA_PVP,
	    name = "A vihar vadja",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\achievement_bg_wineos",
	    points = 30,
	    key = "EOSMETA",
	    save = TAchik,
		meta = true,
	    criteria =
	    {
		    {
				name = "Nincs csend a vihar elött",
				achievement = TA.achisKeys["EOSHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "EOSMETAC1",
			},
			{
				name = "Zöldlámpás a viharban",
				achievement = TA.achisKeys["EOSHONOR"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "EOSMETAC2",
			},
			{
				name = "Torony ör",
				achievement = TA.achisKeys["EOSSTAND"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "EOSMETAC3",
			},
			{
				name = "Fuss Forest Gump, Fuss !",
				achievement = TA.achisKeys["FORESFUSS"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "EOSMETAC4",
			},
			{
				name = "Vasvihar",
				achievement = TA.achisKeys["EOSALMOST"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "EOSMETAC5",
			},
			{
				name = "Áldás a viharban",
				achievement = TA.achisKeys["EOSBUFF"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "EOSMETAC6",
			},
		}
	})

	TA:AddAchievement(
    {
	    category = TA_PVP,
	    name = "Az ösök nyomában",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\achievement_bg_winsoa",
	    points = 30,
	    key = "SOTAMETA",
	    save = TAchik,
		meta = true,
	    criteria =
	    {
		    {
				name = "Mindent az ereklye érdekében",
				achievement = TA.achisKeys["SOTAHERO"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "SOTAMETAC1",
			},
			{
				name = "Baywatch",
				achievement = TA.achisKeys["BAWA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "SOTAMETAC2",
			},
			{
				name = "Húsdaráló",
				achievement = TA.achisKeys["HSDR"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "SOTAMETAC3",
			},
			{
				name = "Halálos szinek",
				achievement = TA.achisKeys["SZINEK"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "SOTAMETAC4",
			},
			{
				name = "A lélek tövább él",
				achievement = TA.achisKeys["GRAVEY"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "SOTAMETAC5",
			},
			{
				name = "Örült rakétás",
				achievement = TA.achisKeys["CARMA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "SOTAMETAC6",
			},
	    },
    });


	TA:AddAchievement(
    {
	    category = TA_PVP,
	    name = "A rettenthetetlen",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\ability_hunter_masterscall",
	    points = 30,
	    key = "PVPMAXMETA",
	    save = TAchik,
		meta = true,
	    criteria =
	    {
		    {
				name = "Szimpatikus szakadék",
				achievement = TA.achisKeys["WSGMETA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "PVPMAXMETAC1",
			},
			{
				name = "Megkedvelt medence",
				achievement = TA.achisKeys["ABMETA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "PVPMAXMETAC2",
			},
			{
				name = "A vihar vadja",
				achievement = TA.achisKeys["EOSMETA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "PVPMAXMETAC3",
			},
			{
				name = "Az ösök nyomában",
				achievement = TA.achisKeys["SOTAMETA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "PVPMAXMETAC5",
			}
		}
	})

end
