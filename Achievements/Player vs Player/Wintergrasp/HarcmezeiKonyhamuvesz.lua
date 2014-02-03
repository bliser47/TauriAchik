local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_HarcmezeiKonyhamuvesz()

	local function WGFISHINGV(tbl)
        return tbl.variable
    end

	local function WGFISHING(tbl,event,...)
   		if event == "CHAT_MSG_LOOT" then
			if tbl.action == "Fish" then
				local loot = TAchik_GetItemNameFromLootString(arg1)
				if tContains(tbl.needData,loot) and not tContains(tbl.missData,loot) and arg1:find("You") then
					tbl.variable = tbl.variable + TAchik_GetValueFromLootString(arg1)
				end
			elseif tbl.action == "Cook" then
				local loot = TAchik_GetItemNameFromLootString(arg1)
				if tContains(tbl.needData,loot) and arg1:find("You") then
					tbl.variable = tbl.variable + 1
				end
			end
        	return tbl.value(tbl) >= tbl.required
    	end
	end


    TA:AddAchievement(
    {
	    category = TA_PVP_WG,
	    name = "Harcmezei Konyhamüvész",
        description = "Fogj ki egy Wintergrasp csata ideje alatt 10 halat és süsd meg öket anélkül, hogy meghalnál.",
	    texture = "Interface\\Icons\\achievement_profession_fishing_journeymanfisher",
	    points = 30,
	    key = "KONYHAMVESZ",
	    save = TAchik,
		events = "PLAYER_DEAD",
		resetOnDeath = true,
        requiredState =
		{
		    [4] =
			{
		        requiredState =
				{
				    ["Wintergrasp"] =
					{
					    requiredState = nil,
					    requiredFunction = "GetWintergraspWaitTime",
					    requiredEvents = { "CHAT_MSG_BG_SYSTEM_NEUTRAL" },
					}
				},
				requiredFunction = { "GetZoneText" },
		        requiredEvents = { "ZONE_CHANGED_NEW_AREA" },
			}
		},
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		accountWide = true,
		resetOnLeave = true,
	    criteria =
	    {
		    {
			    name = "10 fogás",
		        variable = 0,
			    required = 10,
			    action = "Fish",
			    needData = { "Glacial Salmon" , "Musselback Sculpin" , "Nettlefish" , "Terrorfish" , "Sickly Fish" },
			    missData = { "Poached Nettlefish" , "Spicy Blue Nettlefish" },
			    value = WGFISHINGV,
			    events = "CHAT_MSG_LOOT",
			    objective = WGFISHING,
			    key = "KONYHAMVESZV1",
		    },
		    {
			    name = "10 sütés",
		        variable = 0,
			    required = 10,
			    action = "Cook",
			    needData = { "Smoked Salmon" , "Firecracker Salmon" , "Grilled Sculpin" , "Poached Northern Sculpin" , "Poached Nettlefish" , "Spicy Blue Nettlefish" },
			    value = WGFISHINGV,
			    events = "CHAT_MSG_LOOT",
			    objective = WGFISHING,
			    key = "KONYHAMVESZV2",
		    },
	    },
    });

end
