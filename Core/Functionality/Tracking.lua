--[[ 
                   
                   UnCompletion Functionality for TauriAchik Core 2.0
                                     By Bliser 
]]--

local CA = LibStub:GetLibrary("TauriAchikLib")

local old_IsTrackedAchievement = IsTrackedAchievement;
function IsTrackedAchievement(id, ...)
	if CA.achis[id] then
		return CA.tracked[id] or false;
	else
		return old_IsTrackedAchievement(id,...);
	end
end


local old_GetTrackedAchievements = GetTrackedAchievements;
function GetTrackedAchievements(...)
	local tbl = {old_GetTrackedAchievements(...)};
	for k,v in pairs(CA.tracked) do
		table.insert(tbl,k);
	end
	return unpack(tbl);
end

local old_AddTrackedAchievement = AddTrackedAchievement;
function AddTrackedAchievement(id, ...)
	if CA.achis[id] then
		CA.tracked[id] = true;
		CA.achis[id].tracked = true;
		if AchievementFrame then
			AchievementFrameAchievements_OnEvent(nil, "TRACKED_ACHIEVEMENT_UPDATE");
		end
		if CA.achis[id].save then
			CA.achis[id].save.tracked[id] = true;
		end
	else
		return old_AddTrackedAchievement(id, ...);
	end
end

local old_RemoveTrackedAchievement = RemoveTrackedAchievement;
function RemoveTrackedAchievement(id, ...)
	if CA.achis[id] then
		CA.tracked[id] = nil;
		CA.achis[id].tracked = false;
		if AchievementFrame then
			AchievementFrameAchievements_OnEvent(nil, "TRACKED_ACHIEVEMENT_UPDATE");
		end
		if CA.achis[id].save then
			CA.achis[id].save.tracked[id] = nil;
		end
	else
		return old_RemoveTrackedAchievement(id, ...);
	end
end


local old_GetNumTrackedAchievements = GetNumTrackedAchievements;
function GetNumTrackedAchievements(...)
	return old_GetNumTrackedAchievements(...) + #CA.tracked;
end