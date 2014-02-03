local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_KockaProblem()

    local function JUNIORKOCKA(tbl,event, ...)
        return tbl.day == date("%w")
    end

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Kocka, problem?",
		description = "Lépjél fel a hét minden napján",
		texture = "Interface\\Icons\\ability_rogue_bloodyeye",
		points = 10,
		key = "EVAV",
		save = TAchik,
		accountWide = true,
		criteria =
		{
			{
				name = "Hétfö",
				day = "1",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV1",
			},
			{
				name = "Kedd",
				day = "2",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV2",
			},
			{
				name = "Szerda",
				day = "3",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV3",
			},
			{
				name = "Csütörtök",
				day = "4",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV4",
			},
			{
				name = "Péntek",
				day = "5",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV5",
			},
			{
				name = "Szombat",
				day = "6",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV6",
			},
			{
				name = "Vasárnap",
				day = "0",
				events = "PLAYER_ENTERING_WORLD",
				objective = JUNIORKOCKA,
				key = "EVAV7",
			},
		},
	});

end
