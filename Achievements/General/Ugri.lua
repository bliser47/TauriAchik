local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_UgriBugri()

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Ugri Bugri",
	    description = "Ugrándozz Northrend valamelyik füves területén 60 alkalommal egy perc leforgása alatt",
	    texture = "Interface\\Icons\\inv_misc_rabbit",
	    points = 5,
	    key = "UGRIBUGRI",
     	save = TAchik,
		accountWide = true,
		requiredState = 4,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
		        requiredState = { {"Borean Tundra" , "Sholazar Basin" , "Grizzly Hills" , "Howling Fjord" } , { "Ruby Dragonshrine" , "Emerald Dragonshrine" } },
			    requiredFunction = { "GetZoneText" , "GetSubZoneText" },
				requiredEvents = "ZONE_CHANGED",
			    requiredFunctionCount = 1,
		        timed = true,
	            duration = 60,
	            required = 60,
		        variable = 0,
		        value = function(tbl) return tbl.variable end,
			    events = "PLAYER_JUMP",
			    objective =
				function(tbl,event,...)
					TA:StartTimedAchievement(tbl)
                    tbl.variable = tbl.variable + 1
                    return tbl.value(tbl) >= tbl.required
			    end,
			    key = "UGRIBUGRIC1",
		    },
	    },
    });

end
