local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_KozszolgaloFelcser()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Közszolgáló Felcser",
		description = "Használj Heavy Frostweave Bandaget 100 különbözö játékoson, egyik vitatott területen",
		texture = "Interface\\Icons\\inv_misc_bandage_16",
		points = 20,
		key = "FELCSER2",
		accountWide = true,
		save = TAchik,
		criteria =
		{
	    	{
	    	    requiredState = "contested",
			    requiredFunction = "GetZonePVPInfo",
				requiredEvents = "INSTANCE_CHANGED",
	    	    variable = {},
				required = 100,
				value = function(tbl) return #tbl.variable end,
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
				key = "FELCSER2",
			},
		},
	});

end
