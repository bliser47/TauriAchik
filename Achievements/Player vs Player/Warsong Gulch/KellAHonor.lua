local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_KellAHonor()

	TA:AddAchievement(
	{
		category = TA_PVP_WSG,
		name = "Kell a Honor!",
		description = "Szerezz 30 Honorable Kill-t egy Warsong Gulch alatt, miközben nállad van az ellenséges zászlaja",
		texture = "Interface\\Icons\\Inv_bannerpvp_03",
		points = 10,
		key = "KAZH",
		save = TAchik,
		requiredState = { "Warsong Lumber Mill" , "Silverwing Hold" , "Warsong Gulch" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
			{
			    variable = 0,
				required = 30,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function(tbl,event,...)
			        if UnitAura("player",GetSpellInfo(23333)) or UnitAura("player",GetSpellInfo(23335)) then
                        tbl.variable = tbl.variable + 1
		                return tbl.value(tbl) >= tbl.required
                    end
				end,
				key = "KAZHC1",
			},
		},
	});

end
