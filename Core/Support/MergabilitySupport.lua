--[[

                   PandariaStyle Mergability Support for TauriAchik Core 2.0
                                          By Bliser
]]--

local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:ResetButtonColor(button,category,index,id)
    local completed
	if not id then
        _, _, _, completed = GetAchievementInfo(category,index)
    else
	     _, _, _, completed = GetAchievementInfo(id)
	end
    _G[button:GetName() .. "TitleBackground"]:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
	if completed then
	    button:SetBackdropBorderColor(ACHIEVEMENTUI_REDBORDER_R, ACHIEVEMENTUI_REDBORDER_G, ACHIEVEMENTUI_REDBORDER_B, ACHIEVEMENTUI_REDBORDER_A);
	else
	    button:SetBackdropBorderColor(.5, .5, .5);
	end
end

function TA:ColorButtonAccordingToSettings(button,id,completed)
    button.titleBar = _G[button:GetName() .. "TitleBackground"]
	if TA.achis[id] then
	    if TA.achis[id].class then
			local cR,cG,cB = TAchik_GetClassRGBColor(TA.achis[id].class)
			button:SetBackdropBorderColor(cR,cG,cB,1);
            button.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
	    elseif TA.achis[id].mergers then
		    button.titleBar:SetTexture("Interface\\Addons\\TauriAchik\\Icons\\AccountLevelSystem-AchievementHeader")
		    button:SetBackdropBorderColor(ACHIEVEMENTUI_GREENBORDER_R, ACHIEVEMENTUI_GREENBORDER_G, ACHIEVEMENTUI_GREENBORDER_B, ACHIEVEMENTUI_GREENBORDER_A);
        elseif TA.achis[id].accountWide and not TA.achis[id].invisible then
	        button.titleBar:SetTexture("Interface\\Addons\\TauriAchik\\Icons\\AccountLevel-AchievementHeader")
		    button:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B, ACHIEVEMENTUI_BLUEBORDER_A);
	    elseif TA.achis[id].invisible then
            button.titleBar:SetTexture("Interface\\Addons\\TauriAchik\\Icons\\Secret-AchievementHeader")
		    button:SetBackdropBorderColor(ACHIEVEMENTUI_PURPLEBORDER_R, ACHIEVEMENTUI_PURPLEBORDER_G, ACHIEVEMENTUI_PURPLEBORDER_B, ACHIEVEMENTUI_PURPLEBORDER_A);
	    else
            button.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
		    if completed then
			    button:SetBackdropBorderColor(ACHIEVEMENTUI_REDBORDER_R, ACHIEVEMENTUI_REDBORDER_G, ACHIEVEMENTUI_REDBORDER_B, ACHIEVEMENTUI_REDBORDER_A);
		    else
			    button:SetBackdropBorderColor(.5, .5, .5);
		    end
		end
	else
		button.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
		if completed then
			button:SetBackdropBorderColor(ACHIEVEMENTUI_REDBORDER_R, ACHIEVEMENTUI_REDBORDER_G, ACHIEVEMENTUI_REDBORDER_B, ACHIEVEMENTUI_REDBORDER_A);
		else
			button:SetBackdropBorderColor(.5, .5, .5);
		end
	end
	if completed then
		button.titleBar:SetTexCoord(0, 0.9765625, 0, 0.3125);
    else
		button.titleBar:SetTexCoord(0, 0.9765625, 0.34375, 0.65625);
	end
end

function TA:ColorComparisonButtonAccordingToSettings(button,id,completed,friendawDone)
    button.titleBar = _G[button:GetName() .. "TitleBackground"]
	if TA.achis[id] then
	    if TA.achis[id].class then
		    local cR,cG,cB = TAchik_GetClassRGBColor(TA.achis[id].class)
			button:SetBackdropBorderColor(cR,cG,cB,1);
            button.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
	    elseif friendawDone and friendawDone ~= "nil" then
		    button.titleBar:SetTexture("Interface\\Addons\\TauriAchik\\Icons\\AccountLevelSystem-AchievementHeader")
		    button:SetBackdropBorderColor(ACHIEVEMENTUI_GREENBORDER_R, ACHIEVEMENTUI_GREENBORDER_G, ACHIEVEMENTUI_GREENBORDER_B, ACHIEVEMENTUI_GREENBORDER_A);
        elseif TA.achis[id].accountWide and not TA.achis[id].invisible then
	        button.titleBar:SetTexture("Interface\\Addons\\TauriAchik\\Icons\\AccountLevel-AchievementHeader")
		    button:SetBackdropBorderColor(ACHIEVEMENTUI_BLUEBORDER_R, ACHIEVEMENTUI_BLUEBORDER_G, ACHIEVEMENTUI_BLUEBORDER_B, ACHIEVEMENTUI_BLUEBORDER_A);
	    elseif TA.achis[id] and TA.achis[id].invisible then
            button.titleBar:SetTexture("Interface\\Addons\\TauriAchik\\Icons\\Secret-AchievementHeader")
		    button:SetBackdropBorderColor(ACHIEVEMENTUI_PURPLEBORDER_R, ACHIEVEMENTUI_PURPLEBORDER_G, ACHIEVEMENTUI_PURPLEBORDER_B, ACHIEVEMENTUI_PURPLEBORDER_A);
	    else
            button.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
		    if completed then
			    button:SetBackdropBorderColor(ACHIEVEMENTUI_REDBORDER_R, ACHIEVEMENTUI_REDBORDER_G, ACHIEVEMENTUI_REDBORDER_B, ACHIEVEMENTUI_REDBORDER_A);
		    else
			    button:SetBackdropBorderColor(.5, .5, .5);
		    end
		end
	else
		button.titleBar:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Title")
		if completed then
			button:SetBackdropBorderColor(ACHIEVEMENTUI_REDBORDER_R, ACHIEVEMENTUI_REDBORDER_G, ACHIEVEMENTUI_REDBORDER_B, ACHIEVEMENTUI_REDBORDER_A);
		else
			button:SetBackdropBorderColor(.5, .5, .5);
		end
	end
	if completed then
		button.titleBar:SetTexCoord(0.3, 0.575, 0, 0.3125);
    else
		button.titleBar:SetTexCoord(0.3, 0.575, 0.34375, 0.65625);
	end
end

function TA:GetBattlegroupName(realm)
    local knownServerRealmGroups =
    {
        ["TauriServer"] =
        {
            "[HU] Reborn WoW Server",
            "[HU] Tauri WoW Server",
            "[HU] TauriBattle",
            "[HU] Warriors of Darkness",
        },
        ["NexusServer"] =
        {
            "Chris piciny kis fészke",
            "Welcome to Destiny [Higi]",
        }
    }
	for k,v in pairs(knownServerRealmGroups) do
	    if tContains(v,realm) then
		    return k
		end
	end
	return "Unknown"
end

function TA:RealmOnSameServer(thisRealm,realm)
    local knownServerRealmGroups =
    {
        ["TauriServer"] =
        {
            "[HU] Reborn WoW Server",
            "[HU] Tauri WoW Server",
            "[HU] TauriBattle",
            "[HU] Warriors of Darkness",
        },
        ["NexusServer"] =
        {
            "Chris piciny kis fészke",
            "Welcome to Destiny [Higi]",
        }
    }
    for k,v in pairs(knownServerRealmGroups) do
        if tContains(v,realm) and tContains(v,thisRealm) then
            return true
        end
    end
    return false
end

function TA:SetMergeData(to)
	TAchik.merged = to
end

function TA:MergersToString(mergers)
	if not mergers then return "" end
    local str
	for k,v in pairs(mergers) do
	    if str then
		    str = str.." és "..v
		else
		    str = v
		end
	end
	return str
end

function TA:HandleMergers(crit,mergers)
    for k,v in pairs(mergers) do
	    if crit.parent.mergers then
		    if not tContains(crit.parent.mergers,v) then
		        tinsert(crit.parent.mergers,v)
			end
		else
		    crit.parent.mergers = { v }
		end
	end
end

function TA:MergeCriteriaVariableData(crit,withGUID)
    local newVar = table.copy(crit.variable)
    local mergers = {}
    for k,v in pairs(TAchik.Realms) do
        if TA:RealmOnSameServer(GetRealmName(),k) then
            for c,d in pairs(TAchik.Realms[k].Characters) do
                if c ~= UnitGUID("player") and  d.variables[crit.key] ~= nil and ( withGUID == nil or c == withGUID ) then
                    if crit.mergeable == "addition" then
					    if not TA:VariableSame(d.variables[crit.key],crit.resetTemplate) then
                            newVar = newVar + d.variables[crit.key]
						    if not tContains(mergers,d.character.name) then
                                tinsert(mergers,d.character.name)
						    end
						end
                    elseif crit.mergeable == "uniqueElements" then
                        for t=1,#d.variables[crit.key] do
						    if not TA:VariableSame(d.variables[crit.key][t],crit.resetTemplate) then
                                if not tContains(newVar,d.variables[crit.key][t]) then
                                    tinsert(newVar,d.variables[crit.key][t])
								    if not tContains(crit.variable,d.variables[crit.key][t]) then
                                        if not tContains(mergers,d.character.name) then
                                            tinsert(mergers,d.character.name)
						                end
								    end
                                elseif not tContains(crit.variable,d.variables[crit.key][t]) then
							        if not tContains(mergers,d.character.name) then
                                        tinsert(mergers,d.character.name)
						            end
							    end
							end
                        end
                    elseif crit.mergeable == "uniqueSuccesiveDates" then
					    newVar,mergers = TA:GetDatesLinkedCountTo(crit,{ date("%d") , date("%m") , date("%y")},{},true,{})
					end
                end
            end
        end
    end
	if not withGUID then
	    TA:HandleMergers(crit,mergers)
	end
    return newVar,mergers
end

function TA:GetCriteriaMergedVariableData(crit)
    local mergedVar = select(1,TA:MergeCriteriaVariableData(crit))
    return crit.value( { ["variable"] = mergedVar } )
end

function TA:RealmAbrv(realm)
    local abr =
	{
        "Reborn",
		"TauriBattle",
		"Tauri",
		"woD",
	}
	for k,v in pairs(abr) do
	    if realm:find(v) then
		    return v
		end
	end
	return realm
end

function TA:GetAchievementInfoOnAccount(tbl,key)
    local comp,setDate,setTime
	local from = {}
    for k,v in pairs(TAchik.Realms) do
        if TA:RealmOnSameServer(GetRealmName(),k) then
            for c,f in pairs(TAchik.Realms[k].Characters) do
                if f.achis[key] then
				    if setTime == nil or f.achis[key] < setTime then
					    setTime = f.achis[key]
					    setDate = TA:TimeStampToDate(TA:GetTauriUNIX(f.achis[key]))
                        comp = true
					end
					if not tContains(from,f.character.name) then
						tinsert(from,f.character.name)
					end
                end
            end
        end
    end
    if comp then
        return setDate,from,setTime
    else
        return nil
    end
end


function TA:GetCriteriaInfoOnAccount(key)
    local comp,from = false , {}
    for k,v in pairs(TAchik.Realms) do
        if TA:RealmOnSameServer(GetRealmName(),k) then
            for c,d in pairs(TAchik.Realms[k].Characters) do
                if d.crits[key] and not ( d.critsCompletedMerged and d.critsCompletedMerged[key] ) then
                    comp = d.crits[key]
					if not tContains(from,d.character.name) then
						tinsert(from,d.character.name)
					end
                end
            end
        end
    end
    return comp,from
end
