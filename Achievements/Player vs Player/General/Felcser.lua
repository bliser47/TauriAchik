local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Felcser()

    TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Felcser",
	    description = "Egy Battleground alatt használj Heavy Frostweave Bandage-ot 10 különbözö játékosra kiknek élete legalább 70% alatt van",
	    texture = "Interface\\Icons\\inv_misc_bandage_frostweave",
        points = 20,
	    key = "FELCSER",
	    save = TAchik,
		accountWide = true,
	    criteria =
	    {
	        {
	            requiredState = true,
		        requiredFunction = "TAchik_PlayerIsInBattleground",
				requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	            variable = {},
				resetOnLeave = true,
			    required = 10,
			    value =  function(tbl) return #tbl.variable end,
			    events = "UNIT_SPELLCAST_SENT",
			    objective =
				function(tbl,event,...)
				    if arg1 == "player" and arg2 == "First Aid" then
                        if UnitIsPlayer("target") == 1 and arg4 ~= UnitName("player") and arg3 == "Rank 15" and ((UnitHealth("target")/UnitHealthMax("target"))*100) <= 70 then
                            if not tContains(tbl.variable,arg4) then
                                tinsert(tbl.variable,arg4)
                            end
                            return tbl.value(tbl) >= tbl.required
                        end
                    end
				end,
			    key = "FELCSERC1",
		    },
	    },
    });

end
