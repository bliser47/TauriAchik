--[[

                   Linking Functionality for TauriAchik Core 2.0
                                     By Bliser
]]--

local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:GetCriteriaStateBitSet(parentId)
    local returnString = ""
    local returnTableData = {}
    for k,v in pairs(TA.achis[parentId].criteria) do
        -- Check for non-existant criteria ( alliance/realm existant )
        if TA.crits[v.id] then
            if v.key and v.name then
			    local name = v.name
                local comp = 0
                if TA.crits[v.id].complete then
                    comp = 1
                end
                if v.required and v.required > 1 then
					if comp == 1 then
						name = name.." ( "..v.required.."/"..v.required.." )"
					else
						name = name.." ( "..v.value(v).."/"..v.required.." )"
					end
                end
                tinsert(returnTableData, { ["name"] = name , ["state"] = comp })
            end
        end
    end
    for c=1,#returnTableData do
        returnString = returnString..returnTableData[c].name..">"..returnTableData[c].state
        returnString = returnString.."+"
    end
    return strsub(returnString,0,strlen(returnString)-1)
end

function TA:IsTauriAchievement(achiName,msg,descStart)
    TAchik_Print("IsTauriAchievement? : "..achiName,"debug")
    local found = nil
    for k,v in pairs(TA.achis) do
        local _,n = GetAchievementInfo(v.id)
        if n == achiName then
            found = v.id
            break
        elseif v.factionDependent then
			if achiName == v.name[UnitFactionGroup("player")] then
				found = v.id
				break
			end
		end
    end
	if not found then
	    for k,v in pairs(TA.achis) do
            local _,n_,_,_,_,_,_,d = GetAchievementInfo(v.id)
			if d then
                if strsub(msg,descStart+4,descStart+4+strlen(d)) == d then
                    found = v.id
                    break
                end
			end
        end
	end
	if not found then
	    local achiWords = split(achiName," ")
		if #achiWords > 2 then
		    -- only check
		    for k,v in pairs(TA.achis) do
			    local thisWords = split(v.name," ")
				local foundCount = 0
				if #thisWords == #achiWords then
                    for i=1,#achiWords do
					    if achiWords[i] == thisWords[i] then
                            foundCount = foundCount + 1
						end
					end
				end
				local perc = (foundCount*100)/#achiWords
				if perc > 49 then
                    found = v.id
					break
				end
		    end
		else
		    -- parse from desc
		end
	end
    return found
end

function TA:GetTauriAchievementLink(id,unitName,sentBitSet)
  local Name, comp, m, d, y, Description, key
  local compN = 0
  if unitName == UnitName("player") then
      _, Name, _, comp, m, d, y, Description, _, _, _, key = GetAchievementInfo(id)
      compN = 0
      if comp then
          compN = 1
      else
          m = 0
          d = 0
          y = -1
      end
      return "|cffffff00|Hachievement:"..key..":"..unitName..":"..compN..":"..m..":"..d..":"..y..":$"..TA:GetCriteriaStateBitSet(id).."$|h["..Name.."]|h|r",
      strlen(GetAchievementLink(id))
   elseif sentBitSet then
       _, Name, _, _, _, _, _, Description, _, _, _, key = GetAchievementInfo(id)
      compN = 1
      return "|cffffff00|Hachievement:"..key..":"..unitName..":"..compN..":"..date("%m")..":"..date("%d")..":"..date("%y")..":$"..sentBitSet.."$|h["..Name.."]|h|r",
      strlen(GetAchievementLink(id))
   else
       return nil
   end
end

function TA:ShowTauriAchievementLink(link)
    function addLine(text,warp, ...)
        if text then
            return ItemRefTooltip:AddLine(text,1,1,1,warp), addLine(...);
        end
    end
    ShowUIPanel(ItemRefTooltip);
    if (not ItemRefTooltip:IsVisible()) then
        ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
    end
    ItemRefTooltip:ClearLines();
    local _, lineid , player , comp , m , d , y  = strsplit(":", link);
	local _,criteriaData = strsplit("$", link);
    local criteriaDataTable = {}
    criteriaDataTable = split(criteriaData,"+")
    ItemRefTooltip:SetWidth(128)
    local achi,name,points,_,_,_,_,desc = GetAchievementInfo(TA.achisKeys[lineid])
	name = name or "Verzió hiba nállad vagy küldönél!"
	desc = desc or "Verzió hiba nállad vagy küldönél!"
    addLine(name);
    addLine(" ")
    if comp == "1" then
        addLine("\124cff00ff00"..CA_LINK_EARNED_BY..player.." on "..d.."/"..m.."/20"..y.."\124r",false);
    else
        addLine("\124cff00ff00"..CA_LINK_PROGRESS.." "..player.."\124r",false);
    end
    addLine(" ")
    addLine(desc,true)
    addLine(" ")
    local criteriaDataOrganized = {}
    local organizeCount = 0
    local organizePlace = 1
    for cr=1,#criteriaDataTable do
        local name,comp = strsplit(">",criteriaDataTable[cr])
        if not criteriaDataOrganized[organizePlace] then criteriaDataOrganized[organizePlace] = {} end
        if comp == "1" then
            tinsert(criteriaDataOrganized[organizePlace],{ ["data"] = "\124cff00ff00"..name.."\124r" })
        else
            tinsert(criteriaDataOrganized[organizePlace],{ ["data"] ="\124cff808080"..name.."\124r" })
        end
        organizeCount = organizeCount + 1
        if organizeCount > 1 then
            organizePlace = organizePlace + 1
            organizeCount = 0
        end
    end
    for org=1,#criteriaDataOrganized do
        if criteriaDataOrganized[org][2] then
            ItemRefTooltip:AddDoubleLine(criteriaDataOrganized[org][1].data,criteriaDataOrganized[org][2].data,1,1,1,1,1,1)
        else
            addLine(criteriaDataOrganized[org][1].data)
        end
    end
    ItemRefTooltip:Show();
end

function TA:ParseDrunk(name,achiId,search,rep)
    local drunkSearch = true
	local count = 0
	local achiName = name
	while drunkSearch do
		local foundAny = false
		local foundAt = achiName:find(search)
		local achiAt = TA.achis[achiId].description:find(search)
		if foundAt and not achiAt then
			achiName = strsub(achiName,0,foundAt-1)..strsub(achiName,foundAt+1,strlen(achiName))
			foundAny = true
			count = count + 1
		elseif foundAt then
			-- sh is contained in both
			if foundAt-2 < achiAt and achiAt < foundAt+2 then
				achiName = strsub(achiName,0,foundAt-1)..strsub(achiName,foundAt+1,strlen(achiName))
				foundAny = true
				count = count + 1
			end
		end
		if not foundAny then
		    drunkSearch = false
		end
	end
	return count
end

function TA:GetLinkFromString(arg1,sender)
    local search = true
	local stringData = ""
    if arg1:find("%] %-") then
	    local achiStart = arg1:find("%[")
		local achiEnd = arg1:find("%]")
     	if achiStart and achiEnd then
	        local achiName = strsub(arg1,achiStart+1,achiEnd-1)
	    	local achiId = TA:IsTauriAchievement(achiName,arg1,achiEnd)
		    if achiId ~= nil then
		  	    local link , length = TA:GetTauriAchievementLink(achiId,sender)
				if not link then
				    return nil,true
				end
				length = length + TA:ParseDrunk(achiName,achiId,"sh","s")
				length = length + TA:ParseDrunk(achiName,achiId,"Sh","S")
		   	    stringData = stringData..strsub(arg1,0,achiStart-1)
			    stringData = stringData..link
			    stringData = stringData..TA:GetLinkFromString(strsub(arg1,achiStart+1+length,strlen(arg1)),sender)
			else
			    return strsub(arg1,0,achiEnd)..TA:GetLinkFromString(strsub(arg1,achiEnd+1,strlen(arg1)),sender)
			end
		else
		    return arg1
		end
	else
	    return arg1
	end
	return stringData
end


function TAchik_HandleParsedMsgs()
    -- Ha nem kapunk adatot a linkrol ( nem addonos nyomta a linket ) akkor irja ki ugy ahogy van
    for c=1,#TA.msgQueue do
        if TA.msgQueue[c] and time() - TA.msgQueue[c].timeData > 1 then
            oldChatFrame_MessageEventHandler(TA.msgQueue[c].self,
            TA.msgQueue[c].event,
            TA.msgQueue[c].arg1,
            TA.msgQueue[c].arg2,
            TA.msgQueue[c].arg3,
            TA.msgQueue[c].arg4,
            TA.msgQueue[c].arg5,
            TA.msgQueue[c].arg6,
            TA.msgQueue[c].arg7,
            TA.msgQueue[c].arg8,
            TA.msgQueue[c].arg9,
            TA.msgQueue[c].arg10,
            TA.msgQueue[c].arg11,
            TA.msgQueue[c].arg12,
            TA.msgQueue[c].arg13,
            TA.msgQueue[c].arg14,
            TA.msgQueue[c].arg15)
            tremove(TA.msgQueue,c)
        end
    end
end

local old_GetAchievementLink = GetAchievementLink;
function GetAchievementLink(id, ...)
    if TA.achis[id] then
        local _, Name, _, _, _, _, _, Description = GetAchievementInfo(id)
        return "["..Name.."] - "..Description
    else
        return old_GetAchievementLink(id, ...)
    end
end

    oldChatFrame_MessageEventHandler = ChatFrame_MessageEventHandler
    function ChatFrame_MessageEventHandler(self, event, ...)
        local arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13 =  ...
		if TAchik_IsDev(arg2) then arg6 = "DEV" end
	    if arg1 and arg1:find("No player named") then
	        if time() - TA.enteredTime < 2 then
		        TAchik_Print(arg1,"error")
		        return
		    end
	    end
	    if arg1 then
	        local sender = arg2
            if event == "CHAT_MSG_WHISPER_INFORM" then
	            sender = UnitName("player")
            end
	        local link,parse = TA:GetLinkFromString(arg1,sender)
	        if link then
		        arg1 = link
	        elseif parse then
		        SendAddonMessage("TAchik_LinkRequest",arg1,"WHISPER",sender)
			    tinsert(TA.msgQueue,
                {
			        ["self"] = self,
                    ["event"] = event,
                    ["user"] = sender,
                    ["timeData"] = time(),
                    ["arg1"] = arg1,
                    ["arg2"] = arg2,
                    ["arg3"] = arg3,
                    ["arg4"] = arg4,
                    ["arg5"] = arg5,
                    ["arg6"] = arg6,
                    ["arg7"] = arg7,
                    ["arg8"] = arg8,
                    ["arg9"] = arg9,
                    ["arg10"] = arg10,
                    ["arg11"] = arg11,
                    ["arg12"] = arg12,
                })
			    TAchik_WaitForFunction(2,TAchik_HandleParsedMsgs)
			    return;
		    end
        end
		if self and event and ... then
            oldChatFrame_MessageEventHandler(self,event,arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12)
		end
    end


function filterFunc(self, event, msg, ...)
    if msg:find("TauriAchit") then
	    return false,gsub(msg,"TauriAchit"," \124cffFF00FFT\124r\124cffFFFFFF-\124r\124cff9d9d9dauri\124r\124cffFF00FFAchit\124r"),...
	end
	return false,msg,...
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",filterFunc);


local lastLink
local origChatFrame_OnHyperlinkShow = ChatFrame_OnHyperlinkShow
ChatFrame_OnHyperlinkShow = function(...)
    local chatFrame, link, text, button = ...;
    local data, lineid = strsplit(":", link);
    local numberid = tonumber(lineid)
    if data and data == "achievement" then
        if numberid and numberid > 0 then
            lastLink = link
            return origChatFrame_OnHyperlinkShow(...);
        else
		    if IsModifiedClick() then
                HandleModifiedItemClick(GetAchievementLink(TA.achisKeys[lineid]))
			else
                if ItemRefTooltip:IsShown() then
                    if lastLink == link then
                        ItemRefTooltip:Hide()
                    else
                        TA:ShowTauriAchievementLink(link)
                        lastLink = link
                    end
                else
                    TA:ShowTauriAchievementLink(link)
                    lastLink = link
                end
			end
        end
    else
        lastLink = link
        return origChatFrame_OnHyperlinkShow(...);
    end
end
