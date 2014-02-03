--[[

                   GuildAchievementSupport for TauriAchik Core 2.0
                                   By Bliser
]]--

local CA = LibStub:GetLibrary("TauriAchikLib")

function CA:GuildRequestData(tbl)
    if not CA.EnteredTime or time() - CA.EnteredTime < 2 then
        return;
	end
    GuildRoster()
   if time() - CA.lastGuildRosterUpdate < 2 then
      for t=1,GetNumGuildMembers() do
          name,_,_,_,_,_,_,_,online = GetGuildRosterInfo(t)
          if online and ( not IsIgnored(name) ) then
              SendAddonMessage("GuildDataNeeded", tbl.functionString , "WHISPER" , name)
			  CA.lastSent = time();
          end
       end
    end
end

function CA:GetFunctionData(func)
    local args = split(func,",")
    local data = nil
    if #args == 3 then
        data = _G[args[1]](args[2],args[3])
    elseif #args == 2 then
        data = _G[args[1]](args[2])
    else
        data = _G[args[1]]()
    end
    return data
end

function CA:IsNormalFunction(func)
    local normalFunctions = { "GetMoney" , "GetPVPLifetimeStats" , "CA:GetTotalAchievementPoints" , "GetTotalAchievementPoints" , "GetNumCompletedAchievements" }
    local normalFunctionsWithArgs = { "GetStatistic" , "GetAchievementInfo" , "GetAchievementCriteriaInfo" }
    local hasArgs = split(func,",")
    if #hasArgs > 1 then
        return tContains(normalFunctionsWithArgs,hasArgs[1])
    else
        return tContains(normalFunctions,func)
    end
end

function CA:GuildUpdateData(criteria,data,member)
    local found = false
    for v=1,#criteria.variable do
       if criteria.variable[v].player == member then
           found = v
       end
    end
    if not found then
        table.insert(criteria.variable,{ ["player"] = member , ["counter"] = tonumber(data) })
    else
        criteria.variable[found].counter = tonumber(data)
    end
end

function CA:GuildRemoveOffline(criteria)
    GuildRoster()
    for v=1,#criteria.variable do
        local offline = true
        for t=1,GetNumGuildMembers() do
            name,_,_,_,_,_,_,_,online = GetGuildRosterInfo(t)
            if criteria.variable[v] and criteria.variable[v].player == name and online then
                offline = false
            end
        end
        if offline then
            table.remove(criteria.variable,v)
        end
    end
end

function CA:GetGuildData(criteria)
    local data = 0
    for v=1,#criteria.variable do
        if criteria.variable[v].counter ~= nil then
            data = data + criteria.variable[v].counter
        end
    end
    if criteria.divide then
        data = data/criteria.divide
    end
    return data
end
