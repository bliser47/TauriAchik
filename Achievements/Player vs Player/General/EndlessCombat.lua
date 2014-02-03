local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_EndlessCombat()

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Véget nem érö harc",
	    description = "Legyél harcban legalább 3 percig egy Battleground alatt",
	    texture = "Interface\\Icons\\spell_nature_timestop",
	    points = 15,
	    key = "VEGET",
	    save = TAchik,
        requiredState = true,
		requiredFunction = "TAchik_PlayerIsInBattleground",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    criteria =
	    {
		    {
			    timed = true,
				duration = 180,
				timedType = "forward",
				events = { "PLAYER_REGEN_ENABLED" , "PLAYER_REGEN_DISABLED"  },
				objective =
				function (tbl,event,...)
				    if event == "PLAYER_REGEN_DISABLED" then
                       tbl.startTime = 0
					   TA:StartTimedAchievement(tbl)
					else
                        if tbl.startTime >= tbl.duration then
                            return true
						else
                            TA:StopTimedAchievement(tbl)
						end
					end
				end,
			    key = "VEGETC1",
			}
		}
	})

end
