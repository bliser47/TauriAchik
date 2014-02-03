local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_TeamFortress()

    TA:AddAchievement(
    {
	    category = TA_PVP_WSG,
	    name = "Team Fortress",
	    description = "Lopd el az ellenség zászlaját, maximum 3 másodperc különbséggel attól, hogy az ellenség is ellopja a tiéteket",
	    texture = "Interface\\Icons\\achievement_bg_defendxtowers_av",
        points = 10,
	    key = "TEMFORTR",
	    save = TAchik,
		requiredState = {  "Warsong Gulch" , "Silverwing Hold" , "Warsong Lumber Mill" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    criteria =
	    {
		    {

		        timed = true,
		        startTime = 0,
		        duration = 4,
		        variable = { ["criteriaIsEligable"] = false , ["allianceFlagAtBase"] = true , ["hordeFlagAtBase"] = true },
			    events = { "CHAT_MSG_BG_SYSTEM_HORDE" , "CHAT_MSG_BG_SYSTEM_ALLIANCE" , "CHAT_MSG_BG_SYSTEM_NEUTRAL" },
			    objective =
				function(tbl,event,...)
					if event == "CHAT_MSG_BG_SYSTEM_HORDE" then
        				local faction = UnitFactionGroup("player")
       				    if arg1:lower():find("alliance flag was picked up") then
                            if faction == "Alliance" then
                                if tbl.variable.allianceFlagAtBase then
                                    tbl.variable.criteriaIsEligable = true
                                    TA:StartTimedAchievement(tbl)
                                end
                            else
			                    if strsub(arg1,36,strlen(arg1)-1) == UnitName("player") then
				                    return tbl.variable.criteriaIsEligable and TA:TimedAchievementStillGood(tbl)
				                end
			                end
                            tbl.variable.allianceFlagAtBase = false
                        elseif arg1:lower():find("captured the Horde flag") then
                            tbl.variable.hordeFlagAtBase = true
                        elseif arg1:find("was returned") then
                            tbl.variable.hordeFlagAtBase = true
                        end
                    elseif event == "CHAT_MSG_BG_SYSTEM_ALLIANCE" then
                        local faction = UnitFactionGroup("player")
                        if arg1:lower():find("horde flag was picked up") then
                            if faction == "Horde" then
                                if tbl.variable.hordeFlagAtBase then
                                    tbl.variable.criteriaIsEligable = true
                                    TA:StartTimedAchievement(tbl)
                                end
                            else
			                    if strsub(arg1,33,strlen(arg1)-1) == UnitName("player") then
				                    return tbl.variable.criteriaIsEligable and TA:TimedAchievementStillGood(tbl)
				                end
			                end
                            tbl.variable.hordeFlagAtBase = false
                        elseif arg1:lower():find("captured the alliance flag") then
                            tbl.variable.allianceFlagAtBase = true
                        elseif arg1:find("was returned") then
                            tbl.variable.allianceFlagAtBase = true
                        end
                    elseif event == "CHAT_MSG_BG_SYSTEM_NEUTRAL" then
                        if arg1:find("is now placed at its base") then
                           if arg1:lower():find("horde flag") then
                               tbl.variable.hordeFlagAtBase = true
                           elseif arg1:lower():find("alliance flag") then
                               tbl.variable.allianceFlagAtBase = true
                           end
                        end
                    end
				end,
			    key = "TEMFORTR",
		    },
	    },
    });

end

