local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Haladjunk()

    TA:AddAchievement(
    {
	    category = TA_PVE_GENERAL,
	    name = "Haladjunk! van még 5 karim",
	    description = "Teljesíts egy Random Heroic Dungeont 15 perc alatt",
	    texture = "Interface\\Icons\\spell_fire_burningspeed",
	    points = 20,
	    key = "QUICKRHC",
     	save = TAchik,
	    criteria =
	    {
		    {
		        timed = true,
	            startTime = 0,
	            duration = 900,
		        variable = 0,
			    events = { "LFG_COMPLETION_REWARD" , "LFG_PROPOSAL_UPDATE" },
			    specialEvents = { "WORLD_MAP_UPDATE" },
			    objective =
				function(tbl,event,...)
					if event == "LFG_PROPOSAL_UPDATE" then
						local _,_,_,_,_,_, hasResponded,_,completedEncounters = GetLFGProposal();
						if not hasResponded and completedEncounters == 0 then
							tbl.variable = 1
							TA:RegisterEvent(tbl,tbl.specialEvents)
						end
					elseif event == "WORLD_MAP_UPDATE" then
						if GetInstanceDifficulty() == 2 and tbl.variable == 1 then
							tbl.startTime = 0
							tbl.variable = 2
							TA:StartTimedAchievement(tbl)
							TA:UnRegisterEvent(tbl,tbl.specialEvents)
						end
					elseif event == "LFG_COMPLETION_REWARD" then
       			        return tbl.variable == 2
					end
				end,
			    key = "QUICKRHCC1",
		    },
	    },
    });

end
