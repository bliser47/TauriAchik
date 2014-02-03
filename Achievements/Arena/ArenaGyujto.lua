local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ArenaGyujto()

	local function ARENADICS(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

	TA:AddAchievement(
    {
        category = TA_ARENA,
		name = "Arénások dicsösége",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\achievement_arena_2v2_7",
		points = 50,
		save = TAchik,
		key = "ARENADICS",
		criteria =
		{
			{
				name = "Nem megy a Sap Blind",
				achievement = TA.achisKeys["AAAA"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC1",
			},
			{
				name = "Nemadja a Charge Bladestorm",
				achievement = TA.achisKeys["AAAB"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC2",
			},
			{
				name = "CD-n a Grounding",
				achievement = TA.achisKeys["AAAC"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC3",
			},
			{
				name = "Kevés volt a Poli",
				achievement = TA.achisKeys["AAAD"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC4",
			},
			{
				name = "Nyaralt a Gargoyle",
				achievement = TA.achisKeys["AAAE"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC5",
			},
			{
				name = "Elégtelen Lövedék",
				achievement = TA.achisKeys["AAAG"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC6",
			},
			{
				name = "Lejárt a Sacred",
				achievement = TA.achisKeys["AAAR"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC7",
			},
			{
				name = "Mindegy melyik Form",
				achievement = TA.achisKeys["AAAT"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC8",
			},
			{
				name = "Kéne még Absorb",
				achievement = TA.achisKeys["AAAP"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC9",
			},
			{
				name = "Elfogyott a Fear",
				achievement = TA.achisKeys["AAAL"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = ARENADICS,
				key = "ARENADICSC10",
			},
	    }
    });

end
