local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_EtiopKisgyerek()

    local function ETIOPV(tbl)
        return tbl.variable
    end

    local function ETIOP(tbl,event,...)
        if event == "CHAT_MSG_LOOT" then
            if arg1:find("You") and tContains(tbl.needed,TAchik_GetItemNameFromLootString(arg1)) then
                tbl.variable = tbl.variable + TAchik_GetValueFromLootString(arg1)
            end
        end
	    return tbl.value(tbl) >= tbl.required
    end

    TA:AddAchievement(
    {
	    category = TA_PVE_GENERAL,
	    name = "Etióp kisgyerek",
	    description = "Gyüjts össze 10 bármilyen italt és 10 bármilyen ételt Heroic insták alatt",
	    texture = "Interface\\Icons\\inv_misc_head_clockworkgnome_01",
	    points = 20,
	    key = "ETIOP",
	    save = TAchik,
		requiredState = 2,
		requiredFunction = "GetInstanceDifficulty",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
	 	    {
			    name = "10 étel",
			    required = 10,
			    variable = 0,
				mergeable = "addition",
                needed = { "Sparkling Frostcap" , "Salted Venison" , "Honey-Spiced Lichen" },
			    value = ETIOPV,
			    events = { "CHAT_MSG_LOOT" },
				mergeEvents = { "PLAYER_ENTERING_WORLD" },
			    objective = ETIOP,
			    key = "ETIOPC1",
		    },
		    {
			    name = "10 ital",
			    required = 10,
			    variable = 0,
				mergeable = "addition",
                needed =  { "Honeymint Tea", "Filtered Draenic Water", "Pungent Seal Whey" },
			    events = { "CHAT_MSG_LOOT"  },
				mergeEvents = { "PLAYER_ENTERING_WORLD" },
			    value = ETIOPV,
			    objective = ETIOP,
			    key = "ETIOPC2",
		    },
	    },
    });

end
