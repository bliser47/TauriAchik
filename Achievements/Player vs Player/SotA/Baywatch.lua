local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Baywatch()

	TA:AddAchievement(
	{
		category = TA_PVP_SOTA,
		name = "Baywatch",
		description = "Egy Strand of the Ancients alatt ölj meg 20 ellenséget a parton",
		texture = "Interface\\Icons\\Spell_shaman_tidalwaves",
		points = 10,
		key = "BAWA",
		save = TAchik,
		requiredState = "Strand of the Ancients",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
			{
				requiredState = "Landing Beach",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    variable = 0,
				required = 20,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function(tbl,event,...)
				    tbl.variable = tbl.variable + 1
                    return tbl.value(tbl) >= tbl.required
                end,
				key = "BAWA",
			},

		},
	});

end
