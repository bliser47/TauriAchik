local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_DeadLooter()



	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Hulla fosztogató",
	    description = "Fosztogass 1 goldot vagy többet halott játékosokból egy Battleground alatt",
	    texture = "Interface\\Icons\\Inv_misc_coin_16",
	    points = 20,
	    key = "HULLAF",
	    save = TAchik,
        requiredState = true,
		requiredFunction = "TAchik_PlayerIsInBattleground",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
	    criteria =
	    {
		    {
			    moneyFormat = true,
			    required = 10000,
			    events = { "PLAYER_MONEY" , "LOOT_OPENED" ,"UNIT_SPELLCAST_SUCCEEDED" },
				variable = { ["counter"] = 0 , ["lootOpen"] = false , ["removed"] = false },
				value = function(tbl) return tbl.variable.counter end,
				objective =
				function(tbl,event,...)
                    if event == "LOOT_OPENED" then
					    tbl.variable.lootOpen = GetMoney()
					elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
                        if arg1 == "player" and arg2 == "Remove Insignia" then
							tbl.variable.removed = true
						end
					elseif tbl.variable.removed and tbl.variable.lootOpen then
					    tbl.variable.counter = tbl.variable.counter + (  GetMoney() - tbl.variable.lootOpen )
						tbl.variable.lootOpen = false
						tbl.variable.removed = false
						return tbl.value(tbl) >= tbl.required
					end
				end,
				key = "HULLAFC1",
			}
		}
	})

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Hullák havere",
	    description = "Fosztogass 100 goldot vagy többet halott játékosokból valamelyik Battlegroudon",
	    texture = "Interface\\Icons\\inv_misc_coin_18",
	    points = 30,
	    key = "HULLAF2",
	    save = TAchik,
        requiredState = true,
		requiredFunction = "TAchik_PlayerIsInBattleground",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		accountWide = true,
	    criteria =
	    {
		    {
			    moneyFormat = true,
			    required = 1000000,
			    events = { "PLAYER_MONEY" , "LOOT_OPENED" ,"UNIT_SPELLCAST_SUCCEEDED" },
				variable = { ["counter"] = 0 , ["lootOpen"] = false },
				value = function(tbl) return tbl.variable.counter end,
				objective =
				function(tbl,event,...)
                    if event == "LOOT_OPENED" then
					    tbl.variable.lootOpen = GetMoney()
					elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
                        if arg1 == "player" and arg2 == "Remove Insignia" then
							tbl.variable.removed = true
						end
					elseif tbl.variable.removed and tbl.variable.lootOpen then
					    tbl.variable.counter = tbl.variable.counter + (  GetMoney() - tbl.variable.lootOpen )
						tbl.variable.lootOpen = false
						tbl.variable.removed = false
						return tbl.value(tbl) >= tbl.required
					end
				end,
				key = "HULLAF2C1",
			}
		}
	})

end
