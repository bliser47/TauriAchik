--[[

                   GetDataHook Overide for TauriAchik Core 2.0
                                     By Bliser
]]--

local TA = LibStub:GetLibrary("TauriAchikLib")

local old_GetPreviousAchievement = GetPreviousAchievement;
function GetPreviousAchievement(id, ...)
	if TA.achis[id] then
		return TA.achis[id].previous
	else
		return old_GetPreviousAchievement(id, ...);
	end
end

local old_GetNextAchievement = GetNextAchievement;
function GetNextAchievement(id, ...)
	if TA.achis[id] then
		if TA.achis[id].next then
			local _, _, _, comp = GetAchievementInfo(TA.achis[id].next);
			return TA.achis[id].next, comp;
		else
			return;
		end
	else
		return old_GetNextAchievement(id, ...);
	end
end

local old_GetAchievementNumRewards = GetAchievementNumRewards;
function GetAchievementNumRewards(id, ...)
	if TA.achis[id] then
		return 1;
	else
		return old_GetAchievementNumRewards(id, ...);
	end
end

local old_GetAchievementNumCriteria = GetAchievementNumCriteria;
function GetAchievementNumCriteria(id, ...)
	if TA.achis[id] then
		return #TA.achis[id].visible
	else
		return old_GetAchievementNumCriteria(id, ...);
	end
end

local old_GetAchievementCriteriaInfo = GetAchievementCriteriaInfo;
function GetAchievementCriteriaInfo(crit, arg, ...)
	if arg then
		if TA.achis[crit] then
			crit = TA.achis[crit].visible[arg];
		else
			return old_GetAchievementCriteriaInfo(crit, arg, ...);
		end
	end
	if not crit then
		return;
	elseif TA.crits[crit] then
	    local modVal = TA.crits[crit].value(TA.crits[crit])
	    if TA.crits[crit].complete or TA.achis[TA.crits[crit].parent.id].complete then
		    modVal = TA.crits[crit].required
		elseif TA.crits[crit].mergeable and TAchik.merged then
	        modVal = TA:GetCriteriaMergedVariableData(TA.crits[crit])
	    end
		local modFormat = TA.crits[crit].format and format(TA.crits[crit].format,modVal,TA.crits[crit].required)
		if TA.crits[crit].moneyFormat  then
		    modFormat = GetCoinTextureString(modVal).." / "..GetCoinTextureString(TA.crits[crit].required)
		end
		return TA.crits[crit].name or "",
        TA.crits[crit].achievement and 8 or 0,
		TA.crits[crit].complete,
		modVal,
		TA.crits[crit].required,
		TA.crits[crit].complete,
		TA.crits[crit].progress,
		TA.crits[crit].achievement,
		modFormat,
		crit;
	else
		return old_GetAchievementCriteriaInfo(crit, nil, ...);
	end
end


local old_GetCategoryInfo = GetCategoryInfo;
function GetCategoryInfo(id,...)
	if TA.cats[id] then
		return TA.cats[id].name, TA.cats[id].parent, 0;
	else
		return old_GetCategoryInfo(id, ...);
	end
end



local old_GetCategoryNumAchievements = GetCategoryNumAchievements;
function GetCategoryNumAchievements(id,showAll)
	local num, total = 0, 0;
	if TA.cats[id] then
		for k,v in pairs(TA.cats[id].achis) do
		    if TA.achis[v].complete then
			    total = total + 1
				num = num + 1
			else
			    total = total + 1
			end
		end
	elseif achievementFunctions and achievementFunctions == COMPARISON_TAURIACHI_FUNCTIONS then
        total,num = TA:GetNumCompletedAchievements(false)
	else
		total,num = old_GetCategoryNumAchievements(id,showAll);
	end
	return total, num;
end

local old_GetAchievementCategory = GetAchievementCategory;
function GetAchievementCategory(id, ...)
	if TA.achis[id] then
		return TA.achis[id].category;
	else
		return old_GetAchievementCategory(id, ...);
	end
end


function TA.GetCategoryList()
    local t = {}
	for k,v in pairs(TA.cats) do
	    table.insert(t,k);
	end
	table.sort(t,function(a,b) return b < a end)
	return t;
end


local old_GetAchievementInfo = GetAchievementInfo;
function GetAchievementInfo(achi,arg,...)
	if arg then
		if TA.cats[achi] then
			achi = TA.cats[achi].achis[arg]
		elseif achievementFunctions == nil or achievementFunctions ~= COMPARISON_TAURIACHI_FUNCTIONS then
			return old_GetAchievementInfo(achi, arg, ...);
		end
	elseif achi and ( not TA.achis[achi] ) then
	    return old_GetAchievementInfo(achi, arg, ...);
	end
	if not achi then
		return;
	elseif TA.achis[achi] then
        local modDesc = TA.achis[achi].description
	    if TA.achis[achi].hidden then
	        if TA.achis[achi].complete then
			    modDesc = dec(modDesc)
			else
				modDesc = CA_HIDDEN_UNTILL_EARNED
		    end
		end
	    return achi,
	    TA.achis[achi].name,
		TA.achis[achi].points,
		TA.achis[achi].complete and true or nil,
		TA.achis[achi].complete and TA.achis[achi].complete[2] or nil,
		TA.achis[achi].complete and TA.achis[achi].complete[1] or nil,
		TA.achis[achi].complete and TA.achis[achi].complete[3] or nil,
		modDesc,
		TA.achis[achi].flags or 0,
		TA.achis[achi].texture,
		TA.achis[achi].reward,
        TA.achis[achi].key,
		TA.achis[achi].completeTime
	elseif achievementFunctions ~= COMPARISON_TAURIACHI_FUNCTIONS then
	    return old_GetAchievementInfo(achi, arg, ...)
	end
end
