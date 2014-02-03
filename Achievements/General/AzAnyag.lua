local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_AzAnyag()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Az anyag nem vész el...",
		description = "Vegyél 100 darab [Common Parchment]-t",
		texture = "Interface\\Icons\\inv_inscription_parchment",
		points = 10,
		save = TAchik,
		key = "AZANYAG",
		criteria =
	    {
			{
			    variable = 0,
			    mergeable = "addition",
				required = 100,
				value = function(tbl) return tbl.variable end,
				events = "CHAT_MSG_LOOT",
				objective =
				function(tbl,event,...)
                    if event == "CHAT_MSG_LOOT" then
                        if arg1:find("Common Parchment") and arg1:find("You receive") then
	                        tbl.variable = tbl.variable + TAchik_GetValueFromLootString(arg1)
	                    end
                    end
                    return tbl.value(tbl) >= tbl.required
				end,
				key = "AZANYAGC1",
			},
		},
	});

end
