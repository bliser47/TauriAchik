local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_StylistMeleg()

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    factionDependent = true,
	    raceDependent = true,
	    sexDependent = true,
	    nameAllianceMale = "Az Alliance melegje",
	    nameHordeMale = "A Horda melegje",
	    nameAllianceFemale = "Divat királykisasszony",
	    nameHordeFemale = "Divatdiktátor",
	    description = "Öt napon át, minden nap változtasd meg a frizurád",
	    points = 15,
		accountWide = true,
	    key = "FRIZURAS",
	    save = TAchik,
	    criteria =
	    {
		    {
		        variable = {},
			    required = 5,
			    timed = true,
				addTime = 86400,
				mergeable = "uniqueSuccesiveDates",
	            duration = 0,
				durationType = "SuccesiveDuration",
				value = function(tbl) return TA:GetSuccesiveTimedAchievementCount(tbl) end,
			    events = "BARBER_SHOP_APPEARANCE_APPLIED",
			    objective =
				function (tbl,event,...)
				    if event == "BARBER_SHOP_APPEARANCE_APPLIED" then
					    if not CA:DoneToday(tbl) then
					        tinsert(tbl.variable,{ date("%d") , date("%m") , date("%y") })
						    TA:SetDurationForSuccesiveCriteria(tbl)
						    TA:TimedAchievementStillGood(tbl,"CheckSuccesiveMergePossibility")
						    TA:StartTimedAchievement(tbl,"OnSuccesion")
					    end
					end
					return tbl.value(tbl) >= tbl.required
				end,
			    key = "FRIZURASC1",
		    },
	    },
    });

end
