local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_SpeedClick()

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Speed-clicker",
        description = "Targetolj ki 12 különbözö játékost kevesebb mint 6 másodperc alatt",
	    texture = "Interface\\Icons\\inv_enchant_essencenetherlarge",
	    points = 10,
	    key = "SPEEDCLICKER",
	    save = TAchik,
	    criteria =
	    {
		    {
			    required = 12,
			    timed = true,
	            duration = 6,
	            variable = {},
			    value = function (tbl) return #tbl.variable end,
			    events = "PLAYER_TARGET_CHANGED",
			    objective =
				function(tbl,event,...)
                    local targetName = UnitName("target")
                    if UnitIsPlayer("target") and UnitName("target") ~= UnitName("player") then
					    TA:StartTimedAchievement(tbl,event)
						if not tContains(tbl.variable,targetName) then
                            tinsert(tbl.variable,targetName)
                            return tbl.value(tbl) >= tbl.required
						end
                    end
				end,
			    key = "SPEEDCLICKCERC1",
		    },
	    },
    });

end
