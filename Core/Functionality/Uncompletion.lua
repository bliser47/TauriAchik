--[[

                   UnCompletion Functionality for TauriAchik Core 2.0
                                     By Bliser
]]--

local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:UnCompleteAchievement(id,key)
    local achi = TA.achis[id or TA.achisKeys[key:upper()]]
    if achi then
        if achi.complete then
	        achi.complete = nil
			achi.completeTime = nil
			if achi.save.achisCompletedMerged and achi.save.achisCompletedMerged[achi.key] then
			    achi.save.achisCompletedMerged[achi.key] = nil
			end
	        if achi.key and achi.save.achis[achi.key] ~= nil then
	            achi.save.achis[achi.key] = nil
	        end
			if achi.events then
			    TA:ValidateAchievement(achi,true)
			end
	    end
        for k,v in ipairs(achi.criteria) do
		    if v.parent then
	            TA:UnCompleteAchievementCriteria(v)
			end
	    end
		if achi.invisible then
		    for i=1,#TA.cats[achi.category].achis do
				if TA.achis[TA.cats[achi.category].achis[i]] == achi then
                    tremove(TA.cats[achi.category].achis,i)
				end
			end
		end
        if achi.next then
            TA:UnCompleteAchievement(achi.next,nil)
		end

		if TAchik.merged and not achi.accountWide and not achi.guildWide then
	        if not achi.unmergeable then
	            if achi.key then
	                if TA:GetAchievementInfoOnAccount(achi,achi.key) ~= nil then
	                    achi.complete , achi.mergers , achi.completeTime = TA:GetAchievementInfoOnAccount(achi,achi.key)
	                    if achi.save.achisCompletedMerged == nil then achi.save.achisCompletedMerged = {} end
	                    achi.save.achisCompletedMerged[achi.key] = true
	                end
	            end
			end
		end


		for k,v in pairs(TA.crits) do
		    if v.achievement and v.achievement == achi.id then
			    TA:UnCompleteAchievementCriteria(v)
			end
		end

		TA:SortCategories(achi.category)
		if AchievementFrame then
		    AchievementFrameSummaryCategoriesStatusBar_Update()
		    AchievementFrameSummary_UpdateAchievements()
		    AchievementFrameAchievements_ForceUpdate()
		end
		TAchik_Print("Uncompleted "..achi.name,"debug")
		if TA:IsCheckedEvent("TA_ACHIEVEMENT_UNEARNED") then
	        TA.OnEvent(nil,"TA_ACHIEVEMENT_UNEARNED",achi);
        end
	else
	    TAchik_Print("Hibás Achievement ID vagy Kulcs!","error")
	end
end


function TA:UnCompleteAchievementCriterias(criteriaCalling)
    for k,v in ipairs(TA.achis[criteriaCalling.parent.id].criteria) do
	    TA:UnCompleteAchievementCriteria(v)
	end
end

function TA:ResetVariable(crit)
	crit.variable = table.copy(crit.resetTemplate)
    crit.parent.save.variables[crit.key] = nil
	TAchik_Print("Seting variable [ "..tostring(crit.variable).." ] of criteria [ parent "..crit.parent.name.." ] with key = "..crit.key.." to "..tostring(crit.resetTemplate),"debug")
end

function TA:UnCompleteAchievementCriteria(criteria,key)
    if key then
	    criteria = TA.crits[TA.critsKeys[key]]
		if not criteria then
		    TAchik_Debug("Failed to uncomplete "..key.." no such criteria","debug")
	    end
    end
    if criteria.key then
        if criteria.parent.save.crits[criteria.key] then
            criteria.parent.save.crits[criteria.key] = nil
        end
        if criteria.variable ~= nil then
			TA:ResetVariable(criteria)
        end
    end
	if criteria.timed then
        if criteria.parent.save.timed then
            criteria.parent.save.timed[criteria.key] = nil
		end
	    criteria.startTime = 0
		if WATCHFRAME_TIMEDCRITERIA[criteria.id] then
            WATCHFRAME_TIMEDCRITERIA[criteria.id] = nil
	    end
	end
    if criteria.parent.tracked then
        WatchFrame_Update()
    end
	if criteria.activator then
	    if criteria.specialEvents then
            TA:UnRegisterEvent(criteria,criteria.specialEvents)
		end
	end
    if criteria.complete  then
        criteria.complete = nil
	    if criteria.events and criteria.parent.valid then
	        TA:ValidateCriteria(criteria,true,"CRITERIA_REINSTATE")
	    end
        if criteria.parent.save.critsCompletedMerged and criteria.parent.save.critsCompletedMerged[criteria.key] then
		    criteria.parent.save.critsCompletedMerged[criteria.key] = nil
		end
		if TAchik.merged and not criteria.parent.accountWide then
			if not criteria.parent.unmergeable then
				if criteria.key then
					criteria.complete,criteria.mergers = TA:GetCriteriaInfoOnAccount(criteria.key)
					if criteria.complete then
						if criteria.parent.save.critsCompletedMerged == nil then
							criteria.parent.save.critsCompletedMerged = {}
						end
						criteria.parent.save.critsCompletedMerged[criteria.key] = criteria.mergers
						TA:HandleMergers(criteria,criteria.mergers)
					elseif criteria.mergeable ~= nil then
						TA:RegisterEvent(criteria,{ "PLAYER_ENTERING_WORLD" })
					end
				end
			end
		end
	end
end
