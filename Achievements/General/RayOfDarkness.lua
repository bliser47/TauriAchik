local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_RayOfDarkness()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "A sötétség sugara",
		description = "Használj [Shadow Crystal Focusing Lens]-t 20 különbözö játékosra Shadowmoon Valley területén",
		texture = "Interface\\Icons\\spell_shadow_painspike",
		points = 10,
		key = "RAYOFD",
		save = TAchik,
		accountWide = true,
		requiredState = 3,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
			    requiredState = "Shadowmoon Valley",
			    requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				required = 20,
				value = function(tbl) return #tbl.variable end,
				variable = {},
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective =
				function(tbl,event,...)
				    if arg2 == "SPELL_CAST_SUCCESS" and arg4 == UnitName("player") then
	                    if arg10 == "Shadow Crystal Focusing Lens" then
							if UnitIsPlayer("target") then
						        local targetName = UnitName("target")
			                    if not tContains(tbl.variable,targetName) then
				                    tinsert(tbl.variable,targetName)
			                        return tbl.value(tbl) >= tbl.required
								end
			                end
		                end
	                end
				end,
				key = "RAYOFDC1",
			},
		},
	});

end
