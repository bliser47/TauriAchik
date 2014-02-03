local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Stranglethorn()


	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Stranglethorn Bakája",
	    description = "Szerezz 50 Honorable Killt Stranglethorn Vale területén",
	    texture = "Interface\\Icons\\spell_holy_powerwordshield",
	    points = 10,
	    key = "STVDEFENDER",
	    save = TAchik,
        requiredState = "Stranglethorn Vale",
		requiredFunction = "GetZoneText",
		requiredEvents = "ZONE_CHANGED_NEW_AREA",
		accountWide = true,
	    criteria =
	    {
		    {
			    required = 50,
				variable = 0,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function (tbl,event,...)
                    tbl.variable = tbl.variable + 1
				end,
			    key = "STVDEFENDERC1",
			}
		}
	})

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
		previous = TA.achisKeys["STVDEFENDER"],
	    name = "Stranglethorn Védelmezöje",
	    description = "Szerezz 150 Honorable Killt Stranglethorn Vale területén",
	    texture = "Interface\\Icons\\spell_holy_powerwordshield",
	    points = 10,
	    key = "STVDEFENDER2",
	    save = TAchik,
        requiredState = "Stranglethorn Vale",
		requiredFunction = "GetZoneText",
		requiredEvents = "ZONE_CHANGED_NEW_AREA",
		accountWide = true,
	    criteria =
	    {
		    {
			    required = 150,
				variable = 0,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function (tbl,event,...)
                    tbl.variable = tbl.variable + 1
				end,
			    key = "STVDEFENDER2C1",
			}
		}
	})

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
		previous = TA.achisKeys["STVDEFENDER2"],
	    name = "Stranglethorn Höse",
	    description = "Szerezz 300 Honorable Killt Stranglethorn Vale területén",
	    texture = "Interface\\Icons\\spell_holy_powerwordshield",
	    points = 10,
	    key = "STVDEFENDER3",
	    save = TAchik,
        requiredState = "Stranglethorn Vale",
		requiredFunction = "GetZoneText",
		requiredEvents = "ZONE_CHANGED_NEW_AREA",
		accountWide = true,
	    criteria =
	    {
		    {
			    required = 300,
				variable = 0,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function (tbl,event,...)
                    tbl.variable = tbl.variable + 1
				end,
			    key = "STVDEFENDER2C1",
			}
		}
	})

end
