function TAchik_PurgeAllConfirmText()
    TAchik_PurgeAllConfirmString = tostring(random(1000,9999)..random(1000,9999))
	return "Biztos törölni akarod minden adatodat ami a TauriAchik™-al kapcsolatos?\nEzt \124cffFF3333nem tudod visszavonni\124r. A Törlés gombra kattintás után egy töltöképernyöt fogsz látni.\n\nA törléshez írd be ezt a számot: \124cffFFFF00"..TAchik_PurgeAllConfirmString.."\124r"
end

function TAchik_UnMergeAllConfirmText()
    TAchik_MergeAllConfirmString = tostring(random(1000,9999))
	return "Biztos vagy benne, hogy külön szeretnéd választani a TauriAchik™ mentéseid? A Különválasztás gombra kattintás után egy töltöképernyöt fogsz látni.\n\nA különválaszáshoz írd be ezt a számot: \124cffFFFF00"..TAchik_MergeAllConfirmString.."\124r"
end

function TAchik_MergeAllConfirmText()
    TAchik_MergeAllConfirmString = tostring(random(1000,9999))
	return "Biztos vagy benne, hogy egybe szeretnéd vonni a TauriAchik™ mentéseid? Az Egybevonás gombra kattintás után egy töltöképernyöt fogsz látni.\n\nAz egybevonáshoz írd be ezt a számot: \124cffFFFF00"..TAchik_MergeAllConfirmString.."\124r"
end

function TAchik_PlayerIsInBattleground()
    local battlegrounds =
	{
	    "Warsong Gulch",
	    "Warsong Lumber Mill",
        "Silverwing Hold",
        "Eye of the Storm",
        "Arathi Basin",
        "Alterac Valley",
        "Strand of the Ancients",
        "Isle of Conquest"
    }
	return tContains(battlegrounds,GetZoneText()) == 1
end

function TAchik_GetNumAuras(unit)
	local i = 1
	while UnitAura(unit,i) do
		i = i + 1
	end
	return i-1
end

function TAchik_OnEpicMount(unit)
    for i=1,TAchik_GetNumAuras(unit) do
	    local spellId = select(11,UnitAura(unit,i))
        if TAchik_IsEpicMount(spellId) then
		    return true
		end
	end
    return false
end

function TAchik_IsEpicMount(spellId)
    local epicMounts =
	{
	    36702 , -- Fiery Warhorse
		17481 , -- Rivendare
        41252 , -- Ravenlord
		46628 , -- White hawkstrider
		54753 , -- White polarbear
		61465 , -- Grand blackwar mammoth 1
		61467 , -- Grand blackwar mammoth 2
		72282 , -- Invincible
		68188 , -- Crusader's black warhorse
		68187  -- Crusader's white warhoseE
	}
	return tContains(epicMounts,spellId)
end

function TAchik_az(text)
   local consonants =
   {
     "b", "c", "d", "f", "g", "h", "j",
     "k", "l", "m", "n", "p", "q", "r",
	 "s", "t", "v", "w", "x", "y" , "z"
   }
   if tContains(consonants,strsub(text,1,1):lower()) then
      return "a "..text
   else
      return "az "..text
   end
end

function TAchik_tremovebyval(tab, val)
   for k,v in pairs(tab) do
     if(v==val) then
       table.remove(tab, k);
       return true;
     end
   end
   return false;
 end

function TAchik_LfgFrameIsShown()
    if MiniMapLFGFrame then
        return MiniMapLFGFrame:IsShown()
	end
end

function TAchik_InOtherVehicle()
	return CanExitVehicle() == 1 and not UnitControllingVehicle("player")
end

function TAchik_KilledPlayerWithAura(tbl,auras,...)
    if arg2 == "SPELL_AURA_REMOVED" then
        if tContains(auras,arg9) then
            tbl.variable.deathName = arg7
            tbl.variable.deathTime = time()
        end
    elseif arg2 == "UNIT_DIED" then
	    -- If there is a deathTime and the auraLoss unix_time exceeds 2 seconds (+1 for lag) then reset
        if tbl.variable.deathTime and time() - tbl.variable.deathTime > 2 then
            tbl.variable.deathName = nil
            tbl.variable.deathTime = 0
        end
	    local damagedEnemy = false
	    for k,v in pairs(tbl.variable.damagedPlayers) do
		    if time() - v.at < 10 then
		       -- If the damage was less than 10 seconds ago then the dmg probably helped defeat the enemy
			    if v.name == tbl.variable.deathName then
				    -- If the dmg was dealt to that enemy which lost the aura then we know that we helped towards the criteria
				    damagedEnemy = true
			        tremove(tbl.variable.damagedPlayers,k)
				end
			else
		       -- If the damage was 10 seconds ago then the dmg probably didnt help defeat the enemy
			    tremove(tbl.variable.damagedPlayers,k)
			end
		end
		return damagedEnemy
	elseif arg2:find("DAMAGE") then
	    if arg4 == UnitName("player") then
		    tinsert(tbl.variable.damagedPlayers,{ ["name"] = arg7, ["at"] = time()})
		end
	end
end

function TAchik_szamragozas(szam)
    szam = szam or ""
    local numbPairs =
    {
        [1] = "e",
	    [2] = "ő",
	    [3] = "a",
	    [4] = "ö",
	    [5] = "e",
	    [6] = "o",
	    [7] = "e",
	    [8] = "a",
	    [9] = "e"
    }
    return szam.."-"..numbPairs[tonumber(strsub((szam),-1,-1))]
end

function TAchik_InMapGrid(str)
    -- String is x1-x2/y1-y2
    local x,y = strsplit("/",str)
	local x1,x2 = strsplit("-",x)
	local y1,y2 = strsplit("-",y)
	local p1,p2 = GetPlayerMapPosition("player")
	p1 = p1*100
	p2 = p2*100
	return p1 > tonumber(x1) and p1 < tonumber(x2) and p2 > tonumber(y1) and p2 < tonumber(y2)
end

function TAchik_UnitInRaidOrPartyHasAura(aura)
    local limit = 5
    local setup = "party"
	local hasAura = false
    if UnitInRaid("player") then
        limit = 40
        setup = "raid"
    end
    for i=1,limit,1 do
        if UnitName(setup..i) then
            local name = UnitName(setup..i)
            if UnitAura(name,GetSpellInfo(aura)) then
                hasAura = true
                break
            end
        end
    end
	if not hasAura and UnitAura("player",GetSpellInfo(aura)) then
	    hasAura = true
	end
	return hasAura
end

function TAchik_GetInstanceFromCurrentZone()
     for i=1,4 do
        local tempZones = { GetMapZones(i) }
		if i == 2 then tinsert(tempZones,"City of Ironforge") end
		if i == 4 then tinsert(tempZones,"The Crimson Dawn") end
        for z=1,#tempZones do
		    if GetZoneText() == tempZones[z] then
		        return i
		    end
        end
    end
	return GetZoneText()
end

function TAchik_IsDev(name)
    local devs =
    {
       "Bliser",
	   "Blider",
	   "Exedru" ,
	   "Executioner",
	   "Exedíszknájt",
	   "Exeretardin",
	   "Renoitucexe"
	}
	return tContains(devs,name)
end

function TAchik_GetOtherFaction()
    if UnitFactionGroup("player") == "Alliance" then
	    return "Horde"
	end
	return "Alliance"
end

function TAchik_GetUnitSexName(id)
    local genderTable = { "neuter or unknown", "Male", "Female" };
    return genderTable[id]
end


function TAchik_GetBattlegroundAction()

    if GetZoneText() == "Strand of the Ancients" then
        local faction = UnitFactionGroup("player")

        local state1a, hidden1a, text1a, icon1a = GetWorldStateUIInfo(2)
	    local state1b, hidden1b, text1b, icon1b = GetWorldStateUIInfo(3)
	    local state2a, hidden2a, text2a, icon2a = GetWorldStateUIInfo(5)
	    local state2b, hidden2b, text2b, icon2b = GetWorldStateUIInfo(6)

		if hidden1a == 0 then
            -- Round 1
			if icon2a and icon1a:find(faction) then
                if text2a then
				    if text2a:find("Defender") then
					    return "Defender"
				    else
                        return "Attacker"
					end
				end
			end
			if icon2b and icon2b:find(faction) then
			    if text2b then
				    if text2b:find("Defender") then
					    return "Defender"
				    else
                        return "Attacker"
					end
				end
			end
		else
            -- Round 2
            if icon1a and icon1a:find(faction) then
                if text1a then
				    if text1a:find("Defender") then
					    return "Defender"
				    else
                        return "Attacker"
					end
				end
			end
			if icon1b and icon1b:find(faction) then
			    if text1b then
				    if text1b:find("Defender") then
					    return "Defender"
				    else
                        return "Attacker"
					end
				end
			end
        end
	end
	return "unknown"
end

function TAchik_IsEnemy(check)
    local englishFactionCheck  = UnitFactionGroup(check)
    local englishFactionPlayer = UnitFactionGroup("player")
    return englishFactionCheck ~= englishFactionPlayer
end

function TAchik_PlayerHasWiped()
    local wiped = true
    local groupType = nil
    local limit = nil
    if UnitInParty("player") then
        limit = 5
        groupType = "party"
    elseif UnitInRaid("player") then
        limit = 40
        groupType = "raid"
    end
    if limit ~= nil and groupType ~= nil then
        for i=1,limit,1 do
            if UnitName(groupType..i) then
                partyPosX , partyPosY = GetPlayerMapPosition(groupType..i)
                if partyPosX ~= 0 and partyPosY ~= 0 then
                    if UnitIsDead(groupType..i) == nil then
                        wiped = false
                    end
                end
            end
        end
    end
    if UnitIsDead("player") == nil then
        wiped = false
    end
    return wiped
 end

function TAchik_Installed()
    local installed = false
    if TAchik then
        if TAchik["GLOBAL"] and TAchik["GLOBAL"][UnitGUID("player")] then
            installed = true
        end
    end
    return installed
end

function TAchik_PlayerInCombat()
    local inCombat = false
    local groupType = nil
    local limit = nil
    if UnitInParty("player") then
        limit = 5
        groupType = "party"
    elseif UnitInRaid("player") then
        limit = 40
        groupType = "raid"
    end
    if limit ~= nil and groupType ~= nil then
        for i=1,limit,1 do
            if UnitName(groupType..i) then
                partyPosX , partyPosY = GetPlayerMapPosition(groupType..i)
                if partyPosX ~= 0 and partyPosY ~= 0 then
                    if UnitAffectingCombat(groupType..i) then
                        inCombat = true
                    end
                end
            end
        end
    end
    if UnitAffectingCombat("player") then
        inCombat = true
    end
    return inCombat
 end


function TAchik_HexToRGB(hex)
	local rhex, ghex, bhex = string.sub(hex, 1, 2), string.sub(hex, 3, 4), string.sub(hex, 5, 6)
	return tonumber(rhex, 16), tonumber(ghex, 16), tonumber(bhex, 16)
end

function TAchik_GetClassColor(class)
    local classColors =
	{
        ["Hunter"] = "abd473",
        ["Warlock"] = "9482c9",
        ["Priest"] = "ffffff",
        ["Paladin"] = "f58cba",
        ["Mage"] = "69ccf0",
        ["Rogue"] = "fff569",
        ["Druid"] = "ff7d0a",
        ["Shaman"] = "0070de",
        ["Warrior"] = "c79c6e",
        ["Death Knight"] ="c41f3b"
    }
    return classColors[class]
end

function TAchik_GetClassRGBColor(class)
    local classRGBColors =
	{
        ["Hunter"] = { 0.67,0.83,0.45 },
        ["Warlock"] = { 0.58,0.51,0.79 },
        ["Priest"] = { 1.00,1.00,1.00 },
        ["Paladin"] = { 0.96,0.55,0.73 },
        ["Mage"] = { 0.41,0.80,0.94	},
        ["Rogue"] = { 1.00,0.96,0.41 },
        ["Druid"] = { 1.00,0.49,0.04 },
        ["Shaman"] = { 0.0,0.44,0.87 },
        ["Warrior"] = { 0.78,0.61,0.43},
        ["Death Knight"] = { 0.77,0.12,0.23 }
    }
    return classRGBColors[class][1],classRGBColors[class][2],classRGBColors[class][3]
end

function TAchik_ReturnClassWithColor(name,class)
    if name and class then
	    return "\124cff"..TAchik_GetClassColor(class)..name.."\124r"
	else
	    return ""
	end
end

function TAchik_GetDayOfWeek()
    return tonumber(date("%w"))
end


function TAchik_IsHourBetween(h1,h2)
    local now = tonumber(date("%H"))
	local nowM = tonumber(date("M"))
	h1 = tonumber(h1)
	h2 = tonumber(h2)
	return h1 <= now and now < h2
end

function TAchik_UnitIsNaked(unit)
    local HeadSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("HeadSlot"))
    local ShoulderSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("ShoulderSlot"))
    local ChestSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("ChestSlot"))
    local LegsSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("LegsSlot"))
    local FeetSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("FeetSlot"))
    local HandsSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("HandsSlot"))
    local BackSlot = GetInventoryItemLink(unit,GetInventorySlotInfo("BackSlot"))

    if ( HeadSlot == nil or ShowingHelm() == nil ) and ShoulderSlot == nil and ChestSlot == nil and
    LegsSlot == nil and FeetSlot == nil and HandSlot == nil and ( BackSlot == nil or ShowingCloak() == nil ) then
        return true
    else
        return false
    end
end

function TAchik_GetFactionGroupFromRace(race)
    local allianceRaces = { "Human" , "Gnome" , "Dwarf" , "Draenei" , "Night Elf" }
    local hordeRaces = { "Undead" , "Orc" , "Troll" , "Tauren" , "Blood Elf" }
    if tContains(allianceRaces,race) then
        return "Alliance"
    end
    return "Horde"
end

function TAchik_GetValueFromLootString(lootString)
    local multip = string.find(lootString,"]|h|rx")
    if multip then
        local dot = string.find(lootString,"%.")
	    return tonumber(string.sub(lootString,multip+6,dot))
	else
	    return 1
	end
end

function TAchik_GetItemNameFromLootString(lootString)
    local paraStart , paraEnd
    paraStart = string.find(lootString,"%[")
    paraEnd = string.find(lootString,"%]")
    return string.sub(lootString,paraStart+1,paraEnd-1)
end



function TAchik_SortComparisonDates(aID,aT,bID,bT)
    if not aT and not bT then
	    -- Both are incomplete
	    return aID > bID
	elseif not aT then
	    -- First is incomplete second is complete
        return false
    elseif not bT then
	    -- First is complete second is incomplete
        return true
    else
	    -- Both were completed at the same time
	    if aT == bT then
		    return aID > bID
		else
            return aT > bT
		end
	end
end

function TAchik_SortDates(achi1,achi2)
    if not achi1.complete and not achi2.complete then
	    -- Both are incomplete
		if achi1.racePriority and tContains(achi1.racePriority,UnitRace("player")) then
		    if achi2.racePriority then
	            if tContains(achi2.racePriority,UnitRace("player")) then
                    return achi1.id > achi2.id
				else
                    return true
				end
			else
			    return true
			end
		else
		    if achi2.racePriority and tContains(achi2.racePriority,UnitRace("player")) then
				return false
			else
		        return achi1.id > achi2.id
			end
		end
	elseif not achi1.complete then
	    -- First is incomplete second is complete
        return false
    elseif not achi2.complete then
	    -- First is complete second is incomplete
        return true
    else
	    -- Both were completed at the same time
	    if achi1.completeTime == achi2.completeTime then
		    if achi1.meta and achi2.meta then
			    -- If both achievemens are meta-achievements
				-- Then the containing the other one goes first
                return achi1.id < achi2.id
		    elseif achi1.meta then
			    -- If only the first is meta
				-- then he goes first
			    return true
			elseif achi2.meta then
			    -- If the second is meta
				-- then he goes first
				return false
			else
			    -- If none of them are meta achievements
				-- return by id
		        return achi1.id > achi2.id
			end
		else
            return achi1.completeTime > achi2.completeTime
		end
	end
end

--------------------------------------------------- MISC --------------------------------------------

function between(x,a,b)
    return x > a and x < b
end

function returnbybool(what,iffalse,iftrue)
	if (what == true or what==1) then
		return iftrue
	else
		return iffalse
	end
end

function tcount(tab)
   local n = 0
   for _ in pairs(tab) do
     n = n + 1
   end
   return n
end

function SecondsToClock(sSeconds)
    local nSeconds = tonumber(sSeconds)
    if nSeconds == 0 then
        return "00:00:00";
    else
        nHours = string.format("%02.f", math.floor(nSeconds/3600));
        nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
        nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));
        return nHours..":"..nMins..":"..nSecs
    end
end

function SecondsToMinutes(sSeconds)
    local nSeconds = tonumber(sSeconds)
    if nSeconds == 0 then
        return "00:00";
    else
        nHours = string.format("%02.f", math.floor(nSeconds/3600));
        nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
        nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));
        return nMins..":"..nSecs
    end
end

function SecondsToHours(sSeconds)
    local nSeconds = tonumber(sSeconds)
    if nSeconds == 0 then
        return "0:00:00";
    else
        nHours = string.format("%02.f", math.floor(nSeconds/3600));
        nMins = string.format("%02.f", math.floor(nSeconds/60 - (nHours*60)));
        nSecs = string.format("%02.f", math.floor(nSeconds - nHours*3600 - nMins *60));
        return nHours..":"..nMins..":"..nSecs
    end
end

function split(str, pat)
   if not str then
       TAchik_Print("Tying to split empty string!","error")
   end
   local t = {}
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
	      tinsert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      tinsert(t, cap)
   end
   return t
end

function table.copy(t)
    local t2 = t
    if type(t) == "table" then
        local t2 = {}
        for k,v in pairs(t) do
            t2[k] = v
        end
        return t2
    else
        return t2
    end
end

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function enc(data)
    return ((data:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

function tkpContains(tbl,key,search)
    for k,v in pairs(tbl) do
	    if tbl[key] == search then
		    return tbl[key]
		end
	end
	return false
end

local delayedFunctions = {}
function TAchik_NeedWaitForFunction()
    if #delayedFunctions > 0 then
        TAchik_WaitForFunction(nil,nil)
    end
end


function TAchik_WaitForFunction(delay,func,args)
    if delay and func then
        tinsert(delayedFunctions,{delay,func,time()-1,args})
    else
        for v=1,#delayedFunctions do
            if delayedFunctions[v] then
                if time() - delayedFunctions[v][3] > delayedFunctions[v][1] then
                    delayedFunctions[v][2](delayedFunctions[v][4])
                    tremove(delayedFunctions,v)
                end
            end
        end
    end
end
WatchFrame:HookScript("OnUpdate",TAchik_NeedWaitForFunction);
