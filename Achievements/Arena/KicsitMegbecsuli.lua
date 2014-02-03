local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_KicsitMegbecsuli()

    TA:AddAchievement(
    {
	    category = TA_ARENA,
	    name = "Ki a kicsit megbecsüli",
	    description = "Egy héten keresztül nyerjél naponta egy Random Battleground-ot",
	    texture = "Interface\\Icons\\Ability_druid_balanceofpower",
	    points = 30,
	    key = "KELLARENAPONT",
	    save = TAchik,
	    criteria =
	    {
			{
		        variable = {},
			    required = 7,
			    timed = true,
				addTime = 86400,
	            startTime = 0,
				mergeable = "uniqueSuccesiveDates",
	            duration = 0,
				durationType = "SuccesiveDuration",
				value = function(tbl) return TA:GetSuccesiveTimedAchievementCount(tbl) end,
				events = { "CURRENCY_DISPLAY_UPDATE" , "PLAYER_ENTERING_WORLD" , "PVPQUEUE_ANYWHERE_SHOW" },
			    objective =
				function (tbl,event,...)
				    local hasWin, winHonor, winArena, lossHonor, lossArena = GetRandomBGHonorCurrencyBonuses();
                    if winArena == 0 and winHonor == 1860 and hasWin then
					    if not TA:DoneToday(tbl) then
					        tinsert(tbl.variable,{ date("%d") , date("%m") , date("%y") })
						    TA:SetDurationForSuccesiveCriteria(tbl)
						    TA:TimedAchievementStillGood(tbl,"CheckSuccesiveMergePossibility")
						    TA:StartTimedAchievement(tbl,"OnSuccesion")
					    end
					end
					return tbl.value(tbl) >= tbl.required
				end,
			    key = "KELLARENAPONTC1",
		    },
	    },
    });

end
