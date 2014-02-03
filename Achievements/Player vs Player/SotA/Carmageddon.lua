local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Carmageddon()

    TA:AddAchievement(
    {
		category = TA_PVP_SOTA,
		name = "Örült rakétás",
		description = "Egy Strand of the Ancients csata alatt ölj meg 5 ellenséget 20 másodperc alatt miközben ágyúban ülsz",
		texture = "Interface\\Icons\\inv_misc_missilelargecluster_red",
		points = 10,
		key = "CARMA",
		save = TAchik,
		requiredState = "Strand of the Ancients",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
			{
			    timed = true,
				duration = 20,
				startTime = 0,
			    variable = 0,
				required = 5,
				requiredState = "Defender",
		        requiredFunction = "TAchik_GetBattlegroundAction",
				requiredEvents = "UNIT_ENTERED_VEHICLE",
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function(tbl,event,...)
				    if IsVehicleAimAngleAdjustable() then
					    TA:StartTimedAchievement(tbl)
                        tbl.variable = tbl.variable + 1
                        return tbl.value(tbl) >= tbl.required
                    end
				end,
				key = "CARMAC1",
			},

		},
	});

end
