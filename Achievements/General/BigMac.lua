local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_BigMac()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Hatékony Hentes",
		description = "Ölj meg 10 tehenet vagy tarka vaddisznót 1 perc alatt",
		texture = "Interface\\Icons\\inv_misc_food_13",
		points = 20,
		key = "BIGMAC",
		save = TAchik,
		accountWide = true,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    requiredState = { "Elwynn Forest" , "Durotar" },
		        requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				required = 10,
				timed = true,
	            duration = 60,
				value = function(tbl) return tbl.variable end,
				variable = 0,
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective =
				function(tbl,event,...)
					if arg2 == "PARTY_KILL" then
					    if arg7 == "Cow" or arg7:find("Mottled Boar") then
							TA:StartTimedAchievement(tbl)
							tbl.variable = tbl.variable + 1
							return tbl.value(tbl) >= tbl.required
						end
		            end
				end,
				key = "BIGMACC1",
			},
		},
	});

end
