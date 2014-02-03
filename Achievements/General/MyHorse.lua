local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_MyHorse()

	TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Nézd a lovamat, a lovam bámulatos",
	    description = "Legyél AFK Celestial Steeden legalább 5 percig Aludane Whitecloudot eltakarva",
	    texture = "Interface\\Icons\\ability_mount_celestialhorse",
	    points = 10,
	    key = "MYHORSE",
	    save = TAchik,
		accountWide = true,
        requiredState =
		{
		    [4] =
			{
			    requiredState =
				{
				    ["Dalaran"] =
					{
					    requiredState = "Krasus' Landing",
					    requiredFunction = "GetSubZoneText",
						requiredEvents = { "ZONE_CHANGED" }
					}
				},
		        requiredFunction = "GetZoneText" ,
				requiredEvents = { "ZONE_CHANGED_NEW_AREA" },
			}
		},
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
			    timed = true,
				timedType = "forward",
				duration = 299,
				events = "CHAT_MSG_SYSTEM",
				objective =
				function (tbl,event,...)
                    if event == "TIME_UPDATE" then
					    return tbl.startTime >= tbl.duration
				    elseif arg1:find("are no longer Away") then
						if tbl.startTime > tbl.duration then
							return true
						else
							TA:StopTimedAchievement(tbl)
						end
					elseif arg1:find("are now Away") and UnitBuff("player","Celestial Steed") and TAchik_InMapGrid("72-72.30/45.60-45.90") then
						tbl.startTime = 0
						TA:StartTimedAchievement(tbl)
					end
				end,
			    key = "MYHORSEC1",
			}
		}
	})

end
