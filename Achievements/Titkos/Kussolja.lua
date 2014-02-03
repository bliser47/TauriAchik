local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Kussolja()

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Kussoljá'",
		description = "TsOpbWl0c29uIGxlIGEgVGF1cmk=",
		texture = "Interface\\Icons\\Spell_holy_auramastery",
		points = 5,
		key = "KSLJ",
		save = TAchik,
		hidden = true,
		criteria =
		{
			{
				events = "UI_ERROR_MESSAGE",
				objective =
				function(tbl,event,...)
				    return arg1:find("kell")
				end,
				key = "KSLJ",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Azt mondtam NEM!",
		description = "VXRhc8OtdHMgdmlzc3phIDUgZHVlbHQgMTAgcGVyY2VuIGJlbMO8bA==",
		texture = "Interface\\Icons\\ability_rogue_cheatdeath",
		points = 10,
		key = "NOD",
		save = TAchik,
		hidden = true,
		accountWide = true,
		criteria =
		{
			{
				events = "UI_INFO_MESSAGE",
				variable = 0,
				timed = true,
				duration = 600,
				objective =
				function(tbl,event,...)
				    if arg1 == "Duel cancelled." then
					    TA:StartTimedAchievement(tbl)
						tbl.variable = tbl.variable + 1
						return tbl.variable >= 5
					end
				end,
				key = "NODC1",
			},
		},
	});

end


