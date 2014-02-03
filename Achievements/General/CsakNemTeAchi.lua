local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_CsakNemTeAchi()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Jé, csak nem TauriAchik?",
		description = "Hasonlitsd össze teljesitményeidet egy másik TauriAchik-at használó játékosával",
		texture = "Interface\\Icons\\Temp",
		points = 10,
		key = "CSAKNEMTEACHI",
		save = TAchik,
		reward = "Jutalom: '/ta compare' parancs",
		criteria =
	    {
			{
				events = "INSPECT_ACHIEVEMENT_TAURIACHIK",
				objective =
				function(tbl,event,...)
					return true
				end,
				key = "CSAKNEMTEACHIC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Kiváncsi Fáncsi",
		previous = TA.achisKeys["CSAKNEMTEACHI"],
		description = "Hasonlitsd össze teljesitményeidet 5 másik TauriAchik-at használó játékosával",
		texture = "Interface\\Icons\\Temp",
		points = 10,
		key = "CSAKNEMTEACHI2",
		save = TAchik,
		criteria =
	    {
			{
				events = "INSPECT_ACHIEVEMENT_TAURIACHIK",
				required = 5,
				variable = {},
				value = function(tbl) return #tbl.variable end,
				objective =
				function(tbl,event,...)
					local name = ...
					if not tContains(tbl.variable,name) then
					    tinsert(tbl.variable,name)
						return tbl.value(tbl) >= tbl.required
					end
				end,
				key = "CSAKNEMTEACHI2C1",
			},
		},
	});

end
