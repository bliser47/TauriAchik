local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Jenkins()

    TA:AddAchievement(
    {
	    category = TA_PVP_AV,
	    name = "Jenkins visszatér",
	    description = "Alterac Valley valamelyik bányájában ölj meg 15 másodpercen belül 20 ellenséget",
	    texture = "Interface\\Icons\\trade_mining",
	    points = 20,
	    key = "JENK",
	    save = TAchik,
		requiredState = "Alterac Valley",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		accountWide = true,
	    criteria =
	    {
		    {
			    requiredState = { "Irondeep Mine" , "Coldtooth Mine" },
	            requiredFunction = "GetSubZoneText",
		        requiredEvents = "ZONE_CHANGED",
			    value = function(tbl) return tbl.variable end,
			    required = 20,
				variable = 0,
				timed = true,
				duration = 15,
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
				needKill = { "Irondeep Miner" , "Coldmine Miner" , "Coldmine Peon" , "Whitewhisker Digger" , "Irondeep Trogg" , "Coldmine Explorer" ,
				 "Coldmine Guard" , "Whitewhisker Vermin" , "Whitewhisker Geomancer" , "Coldmine Surveyor" },
			    objective =
				function(tbl,event,...)
                    if arg2 == "UNIT_DIED" and tContains(tbl.needKill,arg7) then
					    TA:StartTimedAchievement(tbl)
						tbl.variable = tbl.variable + 1
						return tbl.required >= tbl.value(tbl)
					end
				end,
				key = "JENKC1",
		    },
	    },
    });

end

