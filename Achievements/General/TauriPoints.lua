local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_TauriPoints()

	local function EARNPOINTS(tbl,event,...)
	    if tbl.value(tbl) >= tbl.required then
		    return true
		elseif tbl.parent.complete then
            TA:UnCompleteAchievement(tbl.parent.id)
		end
    end

    local function EARNPOINTSV(tbl)
        return TA:GetTotalAchievementPoints(true)
    end

	TA:AddAchievement(
    {
		category = TA_FUN,
		name = "Kezdö Achizó",
		description = "Szerezz 100 TauriAchi pontot",
		textureHorde = "Interface\\Icons\\achievement_pvp_h_01",
		textureAlliance = "Interface\\Icons\\achievement_pvp_a_01",
		points = 10,
		save = TAchik,
		factionDependent = true,
		lateCheck = true,
		key = "TPOINTS",
		unmergeable = true,
		meta = true,
		criteria =
	    {
			{
			    name = "100 pont",
			    value = EARNPOINTSV,
			    required = 100,
				events = { "TA_ACHIEVEMENT_EARNED" , "TA_ACHIEVEMENT_UNEARNED" , "PLAYER_ENTERING_WORLD" },
				objective = EARNPOINTS,
				key = "TPOINTSC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN,
		previous = TA.achisKeys["TPOINTS"],
		name = "Haladó Achizó",
		description = "Szerezz 250 TauriAchi pontot",
		textureHorde = "Interface\\Icons\\achievement_pvp_h_02",
		textureAlliance = "Interface\\Icons\\achievement_pvp_a_02",
		points = 10,
		save = TAchik,
		factionDependent = true,
		lateCheck = true,
		key = "TPOINTS2",
		meta = true,
		unmergeable = true,
		criteria =
	    {
			{
			    name = "250 pont",
			    value = EARNPOINTSV,
			    required = 250,
				events = { "TA_ACHIEVEMENT_EARNED" , "TA_ACHIEVEMENT_UNEARNED" , "PLAYER_ENTERING_WORLD" },
				objective = EARNPOINTS,
				key = "TPOINTS2C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN,
		previous = TA.achisKeys["TPOINTS2"],
		name = "Vérbeli Achizó",
		description = "Szerezz 500 TauriAchi pontot",
		textureHorde = "Interface\\Icons\\achievement_pvp_h_03",
		textureAlliance = "Interface\\Icons\\achievement_pvp_a_03",
		points = 10,
		save = TAchik,
		factionDependent = true,
		lateCheck = true,
		key = "TPOINTS3",
		meta = true,
		unmergeable = true,
		criteria =
	    {
			{
			    name = "500 pont",
			    value = EARNPOINTSV,
			    required = 500,
				events = { "TA_ACHIEVEMENT_EARNED" , "TA_ACHIEVEMENT_UNEARNED" , "PLAYER_ENTERING_WORLD" },
				objective = EARNPOINTS,
				key = "TPOINTS3C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN,
		previous = TA.achisKeys["TPOINTS3"],
		name = "Hites Achizó",
		description = "Szerezz 1000 TauriAchi pontot",
		textureHorde = "Interface\\Icons\\achievement_pvp_h_04",
		textureAlliance = "Interface\\Icons\\achievement_pvp_a_04",
		points = 10,
		save = TAchik,
		factionDependent = true,
		lateCheck = true,
		key = "TPOINTS4",
		meta = true,
		unmergeable = true,
		criteria =
	    {
			{
			    name = "1000 pont",
			    value = EARNPOINTSV,
			    required = 1000,
				events = { "TA_ACHIEVEMENT_EARNED" , "TA_ACHIEVEMENT_UNEARNED" , "PLAYER_ENTERING_WORLD" },
				objective = EARNPOINTS,
				key = "TPOINTS4C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN,
		previous = TA.achisKeys["TPOINTS4"],
		name = "Örült Achizó",
		description = "Szerezz 2000 TauriAchi pontot",
		textureHorde = "Interface\\Icons\\achievement_pvp_h_04",
		textureAlliance = "Interface\\Icons\\achievement_pvp_a_04",
		points = 10,
		save = TAchik,
		factionDependent = true,
		lateCheck = true,
		key = "TPOINTS5",
		meta = true,
		unmergeable = true,
		criteria =
	    {
			{
			    name = "2000 pont",
			    value = EARNPOINTSV,
			    required = 2000,
				events = { "TA_ACHIEVEMENT_EARNED" , "TA_ACHIEVEMENT_UNEARNED" , "PLAYER_ENTERING_WORLD" },
				objective = EARNPOINTS,
				key = "TPOINTS5C1",
			},
		},
	});

    local function HERON(tbl,event,...)
	    return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
	    category = TA_FUN,
	    name = "Tauri teljesítmények",
	    description = "Teljesítsd az alábbi Tauri Achievementeket!",
	    texture = "Interface\\Icons\\inv_mace_51",
	    points = 30,
	    key = "TAURIACHIKMETAV2",
	    save = TAchik,
		meta = true,
	    criteria =
	    {
		    {
				name = "Küldetések királya",
				achievement = TA.achisKeys["TMEGALORE"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "TAURIACHIKMETAV2C1",
			},
			{
				name = "A rettenthetetlen",
				achievement = TA.achisKeys["PVPMAXMETA"],
				events = "TA_ACHIEVEMENT_EARNED",
				objective = HERON,
				key = "TAURIACHIKMETAV2C2",
			},
		}
	})

end
