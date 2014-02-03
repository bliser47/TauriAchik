local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievemetn_Hopuskas()

	TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Magányos hócsata",
		description = "Dobj meg 5 különbözö játékost hógolyóval Winterspring területén 10 perc alatt",
		texture = "Interface\\Icons\\inv_ammo_snowball",
		points = 25,
		key = "HOPUSKAS",
		save = TAchik,
		accountWide = true,
		requiredState = 1,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
        	{
        	    requiredState = "Winterspring",
        	    requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				timed = true,
	            duration = 600,
	            required = 5,
		        variable = {},
		        value = function(tbl) return #tbl.variable end,
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective =
				function (tbl,event,...)
                    if arg2 == "SPELL_CAST_SUCCESS" and arg4 == UnitName("player") then
	                    if arg10 == "Snowball" then
                            if UnitIsPlayer("target") then
							    TA:StartTimedAchievement(tbl)
	                            local targetName = UnitName("target")
								if not tContains(tbl.variable,targetName) then
				                    tinsert(tbl.variable,targetName)
			                        return tbl.value(tbl) >= tbl.required
								end
			                end
		                end
	                end
				end,
			    key = "HOPUSKASC1",
			},
		},
    });

end
