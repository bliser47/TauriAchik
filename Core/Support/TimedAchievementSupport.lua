--[[

                   TimedAchievement Support for TauriAchik Core 2.0
                                   By Bliser
]]--

local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:GetSecondsLeftOf(dateData)
	local timeStampEnd = time({year="20"..dateData[3],month=dateData[2],day=tonumber(dateData[1])+1,hour=0,min=0,sec=0})
	return timeStampEnd - time()
end

function TA:GetSecondsLeftOfToday()
    local timeNow = tonumber(date("%H"))
    local minuteNow = tonumber(date("%M"))
    local seconds = tonumber(date("%S"))
    local leftHours = 24-timeNow
    local minutesLeft = leftHours*60 - minuteNow
    local secondLeft = minutesLeft*60 - seconds
    return secondLeft
end

function TA:GetSecondsPassedOfToday()
    return 86400 - TA:GetSecondsLeftOfToday()
end

function TA:DateToTimeStamp(dateData)
    return time({year="20"..dateData[3],month=dateData[2],day=dateData[1]})
end

function TA:DateToExactTimeStamp(dateData)
    return time({year="20"..dateData[3],month=dateData[2],day=dateData[1],hour=dateData[4],min=dateData[5],sec=dateData[6]})
end


function TA:TimeStampToDate(timeStamp)
    local now = date("*t", timeStamp)
	return { now.day , now.month , now.year-2000 }
end

function TA:DoneToday(crit,forceMerged,mergers)
    local dateData = { date("%d") , date("%m") , date("%y") , date("%H") , date("%M") , date("%S") }
    for k,v in pairs(crit.variable) do
		local allTrue = true
	    for c,t in pairs(v) do
			if c < 4 and dateData[c] ~= t then
				allTrue = false
				break
			end
		end
		if allTrue then
		    return true
		end
	end
	if forceMerged then
		for k,v in pairs(TAchik.Realms) do
            if TA:RealmOnSameServer(GetRealmName(),k) then
                for c,d in pairs(TAchik.Realms[k].Characters) do
                    if c ~= UnitGUID("player") and d.variables[crit.key] ~= nil then
					    for s,p in pairs(d.variables[crit.key]) do
							local allTrue = true
	                        for l,r in pairs(p) do
			                    if l < 4 and dateData[l] ~= r then
				                   allTrue = false
								   break
								end
			                end
		                    if allTrue then
							    tinsert(mergers,d.character.name)
		                        return true
		                    end
						end
					end
				end
			end
		end
	end
	return false
end

function TA:GetDateBeforeDate(d,m,y)
	local todayUnix = TA:DateToTimeStamp({d,m,y})
	return TA:TimeStampToDate(todayUnix-86400)
end

function TA:GetDateAfterDate(d,m,y)
	local todayUnix = TA:DateToTimeStamp({d,m,y})
	return TA:TimeStampToDate(todayUnix+86400)
end

function TA:HandleTimedCriteria(v)
	v.startTime = 0
    if v.factionDependent then
	    if UnitFactionGroup("player") == "Alliance" then
		    v.duration = v.durationAlliance or v.duration
		else
		    v.duration = v.durationHorde or v.duration
		end
	end
	if v.durationType == "SuccesiveDuration" then
        TA:SetDurationForSuccesiveCriteria(v)
	elseif v.parent.save.timed and v.parent.save.timed[v.key] then
        v.startTime = v.parent.save.timed[v.key].savedTime
    end
    if v.startTime ~= 0 and v.timedType == nil then
	    if TA:TimedAchievementStillGood(v) then
            TA:StartTimedAchievement(v,"OnLogon")
        end
	end
end

function TA:SetDurationForSuccesiveCriteria(crit)
    if TA:GetSuccesiveTimedAchievementCount(crit,TAchik.merged) > 0 then
	    if TA:GetSecondsLeftOf(TA:GetLastValidDate(crit)) > 0 then
			crit.duration = TA:GetSecondsLeftOf(TA:GetLastValidDate(crit))
		else
			crit.duration = TA:GetSecondsPassedOfToday() * - 1
			-- There will be criterias where you may need to substract the lost time
		end
		local addTime = crit.addTime or 0
		crit.duration = crit.duration + addTime
		crit.startTime = time()
		if TA.crits[crit.id] then
			TA.crits[crit.id].duration = crit.duration
			TA.crits[crit.id].startTime = time()
		end
	else
	    if TA:GetSuccesiveTimedAchievementCount(crit,true) == 0 then
		    -- Clear All Character Dates!
			for k,v in pairs(TAchik.Realms) do
                if TA:RealmOnSameServer(GetRealmName(),k) then
                    for c,d in pairs(TAchik.Realms[k].Characters) do
                        if d.variables[crit.key] then
                            d.variables[crit.key] = nil
						end
					end
				end
			end
		end
	end
end

function TA:GetLastValidDate(crit)
    if TA:DoneToday(crit,TAchik.merged,{}) then
	    return { date("%d") , date("%m") , date("%y") }
	else
	    local dateBefore = TA:GetDateBeforeDate( date("%d") , date("%m") , date("%y") )
	    return { dateBefore.day , dateBefore.month , strsub(dateBefore.year,3,4) }
	end
end

function TA:GetDatesLinkedCountTo(crit,thisDate,dates,forceMerged,mergers)
    local dateBefore = TA:GetDateBeforeDate( thisDate[1] , thisDate[2] , thisDate[3] )
	local foundDate = false
	for k,v in pairs(crit.variable) do
	    if tonumber(v[1]) == dateBefore.day and tonumber(v[2]) == dateBefore.month and tonumber("20"..v[3]) == dateBefore.year then
		    tinsert(dates,v)
		    return TA:GetDatesLinkedCountTo(crit,v,dates,forceMerged,mergers)
		end
	end
    local foundDateMerged = false
	for k,v in pairs(TAchik.Realms) do
		if TA:RealmOnSameServer(GetRealmName(),k) then
			for c,d in pairs(TAchik.Realms[k].Characters) do
				if c ~= UnitGUID("player") and d.variables[crit.key] ~= nil then
					for s,p in pairs(d.variables[crit.key]) do
						if tonumber(p[1]) == dateBefore.day and tonumber(p[2]) == dateBefore.month and tonumber("20"..p[3]) == dateBefore.year then
						    if forceMerged then
							    if not tContains(mergers,d.character.name) then
								    tinsert(mergers,d.character.name)
							    end
							    tinsert(dates,p)
							    return TA:GetDatesLinkedCountTo(crit,p,dates,forceMerged,mergers)
							end
							foundDateMerged = true
						end
					end
				end
			end
		end
	end
	for k,v in pairs(TAchik.Realms) do
        if TA:RealmOnSameServer(GetRealmName(),k) then
            for c,d in pairs(TAchik.Realms[k].Characters) do
                if d.variables[crit.key] ~= nil then
					for s,p in pairs(d.variables[crit.key]) do
	                    if 86400+TA:DateToTimeStamp({p[1],p[2],p[3]}) < TA:DateToTimeStamp({thisDate[1],thisDate[2],thisDate[3]}) then
						    if not foundDateMerged then
							    -- If there is no longer a link to this date ( Even with merging )
								-- Then we can delete it to free DB space
							    tremove(d.variables[crit.key],s)
                            end
		                end
	                end
			    end
			end
		end
	end
	if TA:DoneToday(crit,forceMerged,mergers) then
	    tinsert(dates,{ date("%d") , date("%m") , date("%y")})
	end
	return dates,mergers
end

function TA:GetSuccesiveTimedAchievementCount(crit,forceMerge)
	return #TA:GetDatesLinkedCountTo(crit,{ date("%d") , date("%m") , date("%y")},{},forceMerge,{})
end

function TA:TimedAchievementStillGood(crit)
    if crit.timedType == "forward" then
        return true
	else
        if ( time() - crit.startTime ) < crit.duration then
	        return true
	    else
	        TA:StopTimedAchievement(crit)
		    return false
	    end
	end
end

function TA:PauseTimedAchievement(crit)
	WATCHFRAME_TIMEDCRITERIA[crit.id] = nil
end

function TA:StopTimedAchievement(crit)
    if WATCHFRAME_TIMEDCRITERIA[crit.id] then
        WATCHFRAME_TIMEDCRITERIA[crit.id] = nil
	end
	if crit.durationType == nil or crit.durationType ~= "SuccesiveDuration" then
	    TA:UnCompleteAchievementCriteria(crit)
	end
end

function TA:SaveTimedAchievement(crit)
    if crit.durationType == "SuccesiveDuration" then return end
    if crit.parent.save.timed == nil then crit.parent.save.timed = {} end
	if crit.startTime ~= 0 then
	    if crit.parent.save.timed[crit.key] then
			crit.parent.save.timed[crit.key].savedTime = crit.startTime
	    else
			crit.parent.save.timed[crit.key] = { ["savedTime"] = crit.startTime  }
	    end
	elseif crit.parent.save.timed[crit.key] then
	    crit.parent.save.timed[crit.key] = nil
	end
end


function TA.ForceSaveTimedAchievement(crit)
	if WATCHFRAME_TIMEDCRITERIA[crit.id] then
        crit.startTime = crit.startTime + 1
		TA:SaveTimedAchievement(crit)
	    TAchik_WaitForFunction(1,TA.ForceSaveTimedAchievement,crit)
	else
        TA.looping[crit.id] = nil
	end
end

function TA:OnStart(crit)
    if crit.timedType == "forward" and not TA.looping[crit.id] then
		function callEvent(event)
			TA.OnEvent(nil,event,nil);
		end
		TA:RegisterEvent(crit,"TIME_UPDATE")
		TAchik_WaitForFunction((crit.duration+1)-crit.startTime,callEvent,"TIME_UPDATE")
		TA.ForceSaveTimedAchievement(crit)
		TA.looping[crit.id] = true
	end
end

function TA:StartTimedAchievement(crit,event,...)
    if crit.startTime == 0 then
	    if crit.timedType == nil then
            crit.startTime = time()
		end
        WATCHFRAME_TIMEDCRITERIA[crit.id] = crit
		TA:OnStart(crit)
    elseif event == "OnLogon" or event == "OnSuccesion" or event == "OnForward" then
        WATCHFRAME_TIMEDCRITERIA[crit.id] = crit
		TA:OnStart(crit)
    elseif not TA:TimedAchievementStillGood(crit) then
		TA:StartTimedAchievement(crit,event)
	end
	TA:SaveTimedAchievement(crit)
end

function WatchFrame_UpdateTimedAchievements (elapsed)
	local numAchievementLines = #WATCHFRAME_ACHIEVEMENTLINES
	local timeNow, timeLeft;
	local needsUpdate = false;
	for i = 1, numAchievementLines do
		local line = WATCHFRAME_ACHIEVEMENTLINES[i];
		if ( line and line.criteriaID and WATCHFRAME_TIMEDCRITERIA[line.criteriaID] ) then
			timeNow = timeNow or GetTime();
			if TA.crits[line.criteriaID] then
                timeNow = time()
            end
			if TA.crits[line.criteriaID] and TA.crits[line.criteriaID].timedType == "forward" then
			    line.text:SetText(" + " .. SecondsToTime(TA.crits[line.criteriaID].startTime));
				needsUpdate = true;
		    else
			   timeLeft = math.floor(line.startTime + line.duration - timeNow);
			   if ( timeLeft <= 0 ) then
				    line.text:SetText(string.format(" - " .. SECONDS_ABBR, 0));
				    line.text:SetTextColor(1, 0, 0, 1)
			        if TA.crits[line.criteriaID] then
				        TA:StopTimedAchievement(TA.crits[line.criteriaID])
				    end
			    else
				    line.text:SetText(" - " .. SecondsToTime(timeLeft));
				    line.text:SetTextColor(GetTimerTextColor(line.duration, line.duration - timeLeft));
				    needsUpdate = true;
			    end
			end
		end
	end
	if ( not needsUpdate ) then
		WatchFrameLines_RemoveUpdateFunction(WatchFrame_UpdateTimedAchievements);
	end
end
