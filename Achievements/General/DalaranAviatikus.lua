local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_DalaranAviatikus()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Korlátozott légtér",
		description = "Repülj keresztül Dalaranon, Krasus' Landingtól Violet Citadelig",
		texture = "Interface\\Icons\\Ability_mount_gyrocoptor",
		points = 5,
		key = "DALAVA",
		save = TAchik,
		requiredState =
		{
		    [4] =
			{
			    requiredState = { "Dalaran" , "Crystalsong Forest" },
		        requiredFunction = "GetZoneText" ,
				requiredEvents = { "ZONE_CHANGED_NEW_AREA" },
			}
		},
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
			    variable = false,
			    events = "ZONE_CHANGED",
				objective =
				function(tbl,event,...)
                    if GetSubZoneText() == "Krasus' Landing" then
                        tbl.variable = true
                    elseif GetZoneText() ~= "Dalaran" then
                        tbl.variable = false
                    end
                    return GetSubZoneText() == "The Violet Citadel" and tbl.variable and IsFlying()
				end,
				key = "DALAVAC1",
			},
		},
	});

end
