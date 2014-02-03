local CA = LibStub:GetLibrary("TauriAchikLib")
function CA:AddAchievement_DungeonGyujto()

	local function INSTADICS(tbl,event,...)
        return select(4,GetAchievementInfo(tbl.achievement))
    end

    GLOBAL_ACHIEVEMENTS["INSTADICS"] = CA:AddAchievement(
    {
        category = TA_PVE,
		name = "Instázók dicsösége",
		description = "Teljesitsd az alábbi TauriAchikat",
		texture = "Interface\\Icons\\inv_helmet_01",
		points = 50,
		key = "INSTADICS",
		achievementception = true,
		save = TAchik,
		criteria =
		{

			{
				name = "Rovaros tériszony",
				achievement = GLOBAL_ACHIEVEMENTS["ANUBJUMP"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC1",
			},

			{
				name = "Irányított dekonstrukció",
				achievement = GLOBAL_ACHIEVEMENTS["SPEARHALAL"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC2",
			},
			{
				name = "Halálos ajándék",
				achievement = GLOBAL_ACHIEVEMENTS["THARANJAGIFT"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC3",
			},
			{
				name = "Supermassive Gauntlet",
				achievement = GLOBAL_ACHIEVEMENTS["SUPERGAUNTLET"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC4",
			},
			{
				name = "Szent Csapás",
				achievement = GLOBAL_ACHIEVEMENTS["HOLYSMITE"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC5",
			},
			{
				name = "Vissza ahonnan jöttél",
				achievement = GLOBAL_ACHIEVEMENTS["ELEMENTALBACK"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC6",
			},
			{
				name = "Takard el a szemed",
				achievement = GLOBAL_ACHIEVEMENTS["NOREFLECT"],
				events = "CA_ACHIEVEMENT_EARNED",
				objective = INSTADICS,
				key = "INSTADICSC7",
			}

	    }
    });

end
