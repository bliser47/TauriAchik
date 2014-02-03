local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_QuickArena()

	local function QUICKARENA(tbl,event,...)
        if arg1:find("wins") then
            winner = GetBattlefieldWinner()
            teamName1 = GetArenaTeam(1)
            teamName2 = GetBattlefieldTeamInfo(winner)
            return tbl.variable and teamName1 == teamName2 and TA:TimedAchievementStillGood(tbl)
         elseif arg1:find("The Arena battle has begun") then
             TA:StartTimedAchievement(tbl)
             tbl.variable = true
         end
    end

    TA:AddAchievement(
    {
	    category = TA_ARENA,
	    name = "Ez gyors volt",
	    description = "Nyerj meg egy 2v2 arena harcot 1 perc alatt",
	    texture = "Interface\\Icons\\achievement_bg_grab_cap_flagunderxseconds",
	    points = 20,
	    key = "QUICKARENA",
     	save = TAchik,
	    criteria =
	    {
		    {
		        timed = true,
	            startTime = 0,
	            duration = 60,
		        variable = false,
			    events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective = QUICKARENA,
			    key = "QUICKARENAC1",
		    },
	    },
    });

end
