local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_JamesBasin()

    TA:AddAchievement(
    {
	    category = TA_PVP_AB,
	    name = "Pihekönnyü",
        description = "Foglald el/vissza a Blacksmith-et Arathi Basinon 25 másodperc különbséggel, miután elfoglaltad, vagy visszafoglaltad Lumber Millt",
        texture = "Interface\\Icons\\spell_magic_featherfall",
        points = 10,
	    key = "ARATHIBOND",
	    save = TAchik,
		requiredState = "Arathi Basin",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    criteria =
	    {
		    {
		        timed = true,
	            startTime = 0,
	            duration = 25,
		        factionDependent = true,
			    eventsHorde = "CHAT_MSG_BG_SYSTEM_HORDE",
				eventsAlliance = "CHAT_MSG_BG_SYSTEM_ALLIANCE",
			    objective =
				function(tbl,event,...)
                    if arg1:find(UnitName("player")) then
                        if arg1:find("lumber mill") then
                            TA:StartTimedAchievement(tbl)
                        elseif arg1:find("blacksmith") then
                            return TA:TimedAchievementStillGood(tbl)
                        end
                    end
				end,
			    key = "ARATHIBOND1",
		    },
	    },
    });

	TA:AddAchievement(
    {
	    category = TA_PVP_AB,
	    name = "Azért se legyen meg..",
        description = "Foglald el az ellenség valamelyik bázisát 10 másodperccel nyereségük elött mikor az össes bázíst az ellenség birtokolja",
        texture = "Interface\\Icons\\inv_misc_coin_15",
        points = 20,
	    key = "ARATHICSICSKA",
	    save = TAchik,
		requiredState = "Arathi Basin",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		accountWide = true,
	    criteria =
	    {
		    {
		        timed = true,
	            startTime = 0,
	            duration = 10,
		        factionDependent = true,
				stateInfoIndex = { ["Alliance"] = 1 , ["Horde"] = 2 },
				events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    eventsHorde = "CHAT_MSG_BG_SYSTEM_HORDE",
				eventsAlliance = "CHAT_MSG_BG_SYSTEM_ALLIANCE",
			    objective =
				function(tbl,event,...)
				    if event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" then
					    if arg1:find(TAchik_GetOtherFaction().." wins") then
						    return TA:TimedAchievementStillGood(tbl)
						end
					else
				        if arg1:find(UnitName("player")) then
                            if arg1:find("assaulted") and select(3,GetWorldStateUIInfo(tbl.stateInfoIndex[TAchik_GetOtherFaction()])):find("Bases: 4") then
						        TA:StartTimedAchievement(tbl)
						    end
					    end
					end
				end,
			    key = "ARATHICSICSKA1",
		    },
	    },
    });

	 TA:AddAchievement(
    {
	    category = TA_PVP_AB,
	    name = "Az ugró eventek nyertese",
        description = "Közelítsd meg a Blacksmithet Lumber Mill felöl úgy, hogy a vizen lévö dobozokon ugrasz át anélkül, hogy beesel a vízbe",
        texture = "Interface\\Icons\\ability_heroicleap",
        points = 10,
	    key = "ARATHIJUMP",
	    save = TAchik,
		requiredState = "Arathi Basin",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    criteria =
	    {
		    {
			    events = { "PLAYER_JUMP" , "ZONE_CHANGED" , "MIRROR_TIMER_START" , "MOUNT_JUMP" },
				variable  = false,
				duration = 10,
				timed = true,
			    objective =
				function(tbl,event,...)
				    if event == "PLAYER_JUMP" or event == "MOUNT_JUMP" then
					    if IsSwimming() then
						    TA:UnCompleteAchievementCriteria(tbl)
						else
					        if TAchik_InMapGrid("39-41/40-47") then
                                tbl.variable = true
							    TA:StartTimedAchievement(tbl)
						    end
						end
					elseif event == "MIRROR_TIMER_START" and arg1 == "BREATH" then
					    TA:UnCompleteAchievementCriteria(tbl)
					elseif GetSubZoneText() == "Blacksmith" then
					    return tbl.variable
					end
				end,
			    key = "ARATHIJUMP",
		    },
	    },
    });

end
