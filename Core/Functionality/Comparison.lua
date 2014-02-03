--[[

                   UnCompletion Functionality for TauriAchik Core 2.0
                                     By Bliser
]]--

local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:SortAchievementsForComparison(category)
    TA.achiListSorted = {}
    local ownListSort = {}
    local hisListSort = {}
    local noList = {}
    for k,v in pairs(TA.achis) do
        if ( v.category == category  or category == 0 ) then
            completedComp = GetAchievementComparisonInfo(v.id)
            if v.complete and completedComp then
                tinsert(TA.achiListSorted,v.id)
            elseif v.complete and (completedComp == false or completedComp == nil) then
                tinsert(ownListSort,v.id)
            elseif completedComp and not v.invisible then
                tinsert(hisListSort,v.id)
            elseif not v.invisible then
                previd = GetPreviousAchievement(v.id)
                if previd then
                    previd, prevname, prevpoints, prevcompleted  = GetAchievementInfo(previd);
                    if prevcompleted then
                        tinsert(noList,v.id)
                    end
                else
                    tinsert(noList,v.id)
                end
            end
       end
   end
   table.sort(TA.achiListSorted,TA.SortAchievements);
   table.sort(ownListSort,TA.SortAchievements);
   table.sort(hisListSort,TA.SortComparisonAchievements);
   table.sort(noList,TA.SortComparisonAchievements);

   for i=1,#ownListSort,1 do
       tinsert(TA.achiListSorted,ownListSort[i])
   end
   for i=1,#hisListSort,1 do
       tinsert(TA.achiListSorted,hisListSort[i])
   end
   for i=1,#noList,1 do
       tinsert(TA.achiListSorted,noList[i])
   end
end

function TA:RequestComparisonAchievementData(name)
    TA.comparisonData = {}
	if not name then
	    if AchievementFrameComparisonHeaderPortrait then
            if select(1,UnitFactionGroup("player")) == TAchik_GetFactionGroupFromRace(AchievementFrameComparisonHeaderPortrait.race) then
                name = AchievementFrameComparisonHeaderName:GetText()
		    end
		end
	end
	if name then
	    SendAddonMessage("TAchik_Need", UnitName("player") , "WHISPER" , name);
	else
	    TAchik_Print("Sikertelen adatcsere, nem talált karakter!","error")
	end
end

function TA.SortComparisonAchievements(a,b)
	local aT = select(5,GetAchievementComparisonInfo(a))
	local bT = select(5,GetAchievementComparisonInfo(b))
	return TAchik_SortComparisonDates(a,aT,b,bT)
end

function TA:GetComparisonTotalAchievementPoints()
    local comparisonPoints = 0
    for k,v in pairs(TA.achis) do
        if TA.comparisonData[v.key] then
            comparisonPoints = comparisonPoints + v.points
        end
    end
    return comparisonPoints
end

local old_GetComparisonCategoryNumAchievements = GetComparisonCategoryNumAchievements;
function GetComparisonCategoryNumAchievements(id, ...)
    if TA.cats[id] then
        local num = 0
        for k,v in ipairs(TA.cats[id].achis) do
            if TA.comparisonData[TA.achis[v].key] then
                num = num + 1
            end
	    end
	    return num
    elseif achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS then
        return TA.comparisonData.numAchievements or 0
    else
        return old_GetComparisonCategoryNumAchievements(id, ...);
    end
end

local old_GetAchievementComparisonInfo = GetAchievementComparisonInfo;
function GetAchievementComparisonInfo(achi, arg, ...)
    if TA.achis[achi] then
	    local iconFriend
		local pointFriend
	    if TA.achis[achi].factionDependent or TA.achis[achi].raceDependent or TA.achis[achi].sexDependent then
	        local sexFriend = AchievementFrameComparisonHeaderPortrait.sex and
		    AchievementFrameComparisonHeaderPortrait.sex > 1  and
            TAchik_GetUnitSexName(AchievementFrameComparisonHeaderPortrait.sex) or
		    TA.comparisonData.sex
		    local raceFriend = AchievementFrameComparisonHeaderPortrait.race or TA.comparisonData.race
		    if raceFriend and sexFriend then
			    local _, _, texture, points = TA:GetAchievementDependentInfo(TA.achis[achi],raceFriend,sexFriend)
                iconFriend = texture
				pointFriend = points
			end
		else
		    iconFriend = TA.achis[achi].texture
			pointFriend = TA.achis[achi].points
		end
		if TA.comparisonData[TA.achis[achi].key] then
			return true,
			TA.comparisonData[TA.achis[achi].key].month,
			TA.comparisonData[TA.achis[achi].key].day,
			TA.comparisonData[TA.achis[achi].key].year,
			TA.comparisonData[TA.achis[achi].key].unix,
			iconFriend,
			TA.comparisonData[TA.achis[achi].key].awDone,
			pointFriend
		else
		    return false,0,0,0,0,iconFriend,false,pointFriend
		end
	else
	    return old_GetAchievementComparisonInfo(achi,arg,...);
	end
end
