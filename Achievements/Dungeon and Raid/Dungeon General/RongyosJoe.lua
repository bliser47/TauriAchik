local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_RongyosJoe()

    TA:AddAchievement(
    {
	    category = TA_PVE_GENERAL,
	    name = "Rongyos Joe",
	    description = "Gyüjts össze egy Heroic Dungeon alatt 40 darab Frostweave clothot",
	    texture = "Interface\\Icons\\inv_fabric_soulcloth",
	    points = 20,
	    key = "RONGY",
     	save = TAchik,
        requiredState = { 2 , true },
		requiredFunction = { "GetInstanceDifficulty" , "TAchik_LfgFrameIsShown" },
		requiredEvents = "INSTANCE_CHANGED",
		resetOnLeave = true,
	    criteria =
	    {
		    {
			    name = "40 Frostweave Cloth",
		        needed = "Frostweave Cloth",
		        variable = 0,
			    required = 40,
			    value = function(tbl) return tbl.variable end,
			    events = "CHAT_MSG_LOOT",
			    objective =
				function(tbl,event,...)
					if arg1:find("You receive") and TAchik_GetItemNameFromLootString(arg1) == tbl.needed then
						tbl.variable = tbl.variable + TAchik_GetValueFromLootString(arg1)
						return tbl.value(tbl) >= tbl.required
					end
				end,
			    key = "RONGYC1",
		    },
	    },
    });

end
