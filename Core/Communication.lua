-- VARIABLES -------------
local TA = LibStub:GetLibrary("TauriAchikLib")
TAchik_Version = "2"
TAchik_DBVersion = "1175"
TAchik_Release = "Beta"
TAchik_DebugMode = 0
TAchik_ResetCode = nil
TAchik_MergeCode = nil
TAchik_TransferCode = nil
TAchik_ChangeLog =
{
	[1175]= "Postman achik for Alliance 100% ,Added new achievements and optimized DB memory",
    [1167] = "Added /ta transfer, fixed Postas for alliance misc misc es more stb fix",
    [1159] = "Added arena achievements",
    [1159] = "Postas achik factionDependancy scrited for alliance ( first part )",
    [1156] = "Added rest of General pvp achievements",
    [1152] = "BuffBasin will not reset on leave (since buff's dont respawn on Tauri) core misc/cosmetic",
    [1149] = "Dont merge variable with self",
    [1148] = "Localize CA (library), Ottvagyunkmar table data, TimedAchievement support tweaks for timedType = forward (todo: try to display timer instead of variable on watchframe)",
    [1147] = "AccountWide achievements will be saved to AccountWide table of Realm (uncompletion is now possible), uncompletion will set criteria/achievement to nil instead of false",
    [1143] = "Fix GetCategoryNumAchievements and GetAchievementInfo when category/index is passed (QuestHelper fix)",
    [1142] = "Arathi basin achievement fixez",
    [1141] = "factionDependent achievement requiredSate:Horde/Alliance support",
    [1140] = "added support for durationHorde/durationAlliance for timedAchievement factionDependent, start Postas achi factionDependancy for alliance, Stormwind missing 1 mailbox coords",
    [1138] = "Fix timedAchievement startAgain after uncompletion from self, Carmageddon misc",
	[1135] = "Restored ping timer to 30sec ~Executioner",
    [1134] = "Added Postas achik seperate file",
    [1127] = "achievementLinking misc",
    [1125] = "fix issue with prat",
    [1122] = "SotA achievements and Misc",
    [1121] = "FINALY fix fucking C stack overflow caused by hookings tons of achievements -.-",
    [1118] = "implement /ta compare name command, mergeability fix (resetTemplate like variables will no longer tribute to criteria variable, and MISC",
    [1117] = "implement support for forwardTimed achievement, implement custom formating for this kind, add OttVagyunkMar achievement, also modify linkCreating to support timeFormating",
    [1114] = "merge visual and logic csapo 563 -.-",
    [1113] = "succesiveTimed achievements dont need to be saved, also dont save timedAchievements with startTime == 0, add durationType instead of using duration==string etc..",
    [1112] = "misc fix",
    [1111] = "fix mergeability visual for comparison",
    [1109] = "Add AB achievement and BG achievements ( 100HK ) change some stuff and misc fixez ",
    [1105] = "succesiveTimedAchievements should now merge correctly and should merge smart! todo : deleteDate or allDates in case of dateLinkage cutoff",
    [1104] = "Bunch of fixez, prev commit function may cause errors due to DB corruption, idc you are BetaTesters sry :) ",
    [1103] = "Implement VariableHasNotChangedType so if we change variable structure DB will shape itself according to the new structure",
    [1102] = "Clear combatlog entries every 15 seconds (hooked to ping)",
    [1097] = "Refactored WSG achievements, Implemented TAchik_KilledPlayerWithAura(table) which needs deathName deathTime and damagedPlayers critvariable variables",
    [1093] = "complete criteria of accountWide achievement..",
    [1091] = "fix /ta new x if ChangeLog key is missing",
    [1089] = "Implemented announce by Exedru",
    [1084] = "dont save templated variable to DB, add TAchik_ to functions so they dont overwrite other addon functions, show new error after showing changelog :) ",
    [1083] = "fix mergability certain case for timedAddition, check tab existence (write crossRealm player request compareData)",
	[1082] = "Chat command cosmetic fixes ~Executioner",
    [1081] = "Make thankPlayer achievement accountWide and some visual fixez",
    [1080] = "add table.copy function, pass resetTemplate by value (LUA passes all tables by ref.) ",
    [1079] = "fix timedAchievement reset from watchFrame and TAchik in battleground function",
    [1078] = "Criteria/Achievement uncompletion if they got completed through mergebility then unmerging happens, visual fixes",
    [1077] = "Timedachievements are now mergeable if the variable is a set of unique dates, mergeable = timedAddtion flag",
    [1076] = "Succesive TimedAchievements should now be 100% working(implement mergeability), merged variables will now cause green visual effect for uncompleted achievements",
    [1075] = "SuccesiveAchievementSupportSystem no longer exists all succesive achievements will now be timed, write support for succesiveTimedAchievement mergability",
    [1074] = "ComparisonAchievement will now show who completed the achievement in tooltip if the achievement(comparison) got completed by merging",
    [1073] = "Fix a few thing i screwed up along the way",
    [1072] = "typo -.-",
    [1071] = "remove print",
    [1070] = "forgot to readd some achievement, send tbl.mergers for comparison request, implement visual for comparisonAchievement frame (show comparison awMergers)",
    [1069] = "Grammar mistakes #1, Refactored database handling, reimplemented TA:VariableSame and changed the timedAchievement system",
    [1068] = "TimedAchievement fix (Forgot to save timedAchievement on event..), Continue subOptimization for JawsBosszuja",
    [1067] = "Loremaster requirement nerfs on both side but mainly for alliance! also add meta achievement for capital quest achievements",
    [1066] = "Fix uncompletion for factionExistant criterias (weird merge bug), mergers variable added for achievement and visual fix for mergedAchievement mouseOver",
    [1065] = "Add achievement SzarnyasokFejvadasza and try to fix overflow AGAIN..",
    [1064] = "this should fix Cstack Overflow",
    [1063] = "Add missing CA_EARNED to Constants",
    [1062] = "Some achievements will no longer be mergable (unmergable = true), lvl<10 characters will now be able to open the achievement window etc.",
    [1061] = "Corrected prevCommit visual",
    [1060] = "Achievements earned through the merging will now display in the topright corner the character from which they got completed",
    [1059] = "Delimit YouTouchMyTralala to respective zones, requiredStateHorde/Alliance seem to be working fine at factionDependent criterias",
    [1058] = "Fix TachikFilter (missing arg12) no more lua errors",
    [1057] = "Correctly reset border and TitleTexture for SummaryAchievement",
    [1056] = "Correct TextureCoords for ComparisonAchievement TitleBar",
    [1055] = "Compared achievement will now show if it was completed by accountWide system if the achievement isnt soly accountWide (greenEffect)",
    [1054] = "OverWrite should now be ObjectOriented, fix onlySexDependent achievement at comparison, accountWide visual tweaks and fixez",
    [1053] = "Implement SolyAccountWide achievement, ComparisonAccountWide visual first part (need to send data of completed achi through aW system)",
    [1052] = "Fix SummaryVisual for accountWide achievement (switching between Normal and TauriAchik tab",
    [1051] = "Implemented PandariaStyle AccountWide achievement visual",
    [1050] = "Add Stormwind Harbor to SpyAchievement initialization zone since that also may be the initializing ZONE_NEW_AREA",
    [1049] = "Implement TAchik_UnitInRaidOrPartyHasAura(aura) for SzaguldasPorcheSzerelem and for many others ahead",
    [1048] = "Localized functions will now be indigenous to their local space (kevesebb memoria nem hasznalt achik eseten)",
    [1047] = "Dont Update! Major Optimization, Support for SubRequiredment System, Major Changes to every achievement, Localization,etc.",
    [1046] = "Continue refactoring achievements, correct objective and value functions ALSO remove resetTemplate due to redundancy",
    [1045] = "single criteria objective functions should not be declared at all, shared objective functions should be localized! *fix timedAchievement correct resetMachnic etc.",
    [1044] = "check achievement validty and add to optimization only if it isnt't compelte also remove criteria/achievement from optimization list on completion",
    [1043] = "forgot to add version number -.-",
    [1042] = "remove debug, also fixed hidden achievement points show in prev commit",
    [1041] = "uncomplete eventless stateRequired achievement only if they are valid in the first case",
    [1040] = "remaster chatHandler, fully working better then blizzlike!",
    [1039] = "implement achievement var resetOnWipe which will reset all criterias ONCE if you wipe",
    [1038] = "cosmetics and redundant check removes",
    [1037] = "logic fix and more achievement refactoring",
    [1036] = "Register criteria events if achievement is also valid",
    [1035] = "Core : implement achievementBased eventSystem, optimized resets on Death/Leave! needs extensive testing",
    [1034] = "loremaster nerf#2",
    [1033] = "loremaster nerfs, other tweaks",
    [1032] = "tweaks here and there",
    [1031] = "baywatch resetOnLeave fix",
    [1030] = "try to fix Pihekonnyu",
    [1029] = "buffBasin correct now",
    [1028] = "fix buffbasin return fail",
    [1027] = "IsTauriAchievement (forLinkSystem) implement support for nameSpecific achievements",
    [1026] = "Fix BuffBasin and CriteriaGetBitset/UnCompleteCriteria set to nil instead of false",
    [1025] = "Implement /ta ver all command",
    [1024] = "Fix Oszpontositott campeles huge fail XD",
    [1023] = "More timedAchievement stuff , if TimedAchievementGood is false resetTimedAchievement",
    [1022] = "TimedAchievements should be Blizzlike, reset only occours on EVENT or if criteria is tracked so we need to double check at objective",
    [1021] = "Fix timed achievement reset->StartAgain if criteria isn't tracked",
    [1020] = "Linking bug fix",
    [1019] = "Add putricide achievement file",
    [1018] = "Implement resetCriteria/Achievement on load if criteria requiredFunction does not meet state",
    [1017] = "add resetOnLeave ( resetAll ) to almost all criterias which need to be reset upon no longer meeting the requiredFunction state",
    [1016] = "FussForest : reset all criterias ( not very dandy but this is how its supposed to be done ) if 1 criteria calls fail => 4x4 = 16 uncompletions...",
    [1015] = "Add GuildAchievements ( testing ) - needs optimization",
    [1014] = "SuperGauntlet : dont reset on Wipe ( since encounter has offcombat phase) instead reset 1st criteria on leave , reset all ( 2nd active ) on leave",
    [1013] = "fix hidden flag at HSV : 1 instead of true",
    [1012] = "fix achievement flag return, bug with progressive achievement (show completionSource at reward of merged achievement)",
    [1011] = "stuck debug",
    [1010] = "stupid timed achievement bug",
    [1009] = "achievent descriptino typo",
    [1008] = "Timed achievements fixed",
    [1007] = "Implement callOnOptimize, simplify FussForest and Optimize optimization function",
    [1006] = "LoremasterBreakdown : EasternPlaguelands horde:50(down from 100) alliance:40(from:90)",
    [1005] = "Optimize TeamFortress and fix typo at ResetCriteria",
    [1004] = "Fix hidden achievement points show bug with blizzard frame",
    [1003] = "Unfort. nearSystem links won't be blizzlike for a while,NameChange for Lady achi",
    [1002] = "new Command comparison fix(stupid me)",
    [1001] = "haxFix for No player names Y is currently playing caused by Sending IAmOnline/DataRequest msg",
    [1000] = "happy 1000'th commit!, dont do nearAlert for own achievements,hidden points visual etc(misc)",
    [999] = "Fix timed achievement huge fuckup at resetSystem,implement ResetVariable function (using template)",
    [998] = "VisszaAhonnan achievement new system style",
    [997] = "Lady deathwhisper achievement, activator feature for criterias, new implements etc",
    [996] = "Implement resetOnDeath and resetOnWipe features to criterias, lots and lots of misc",
    [995] = "Implement smartRegister and smartWipe->Reset support for dungeon achievements",
    [994] = "shitLoad of fixez to achievements,added Names,implemented mergeablity to some criterias and core function to add mergeEvents to events if Tachi.merged and criteria is mergeable",
    [993] = "Fix Oroszrulett requiredStates",
    [992] = "Core : achievementTracking 100%, fix GetAchievementInfo in certain cases",
    [991] = "Core : fix Blizzard achievements tracking issue",
    [990] = "more fixez to msgQue",
    [989] = "chatHandler arg2->Unit sender",
    [988] = "Forgot to remove debug",
    [987] = "Misc fixez to Achievement linking",
    [986] = "Achievement linking 100% (ffs ez egy nehez szules volt)",
    [985] = "GetAchievementLink old method, try different approach",
    [984] = "fix Tauri lateArg -> channelMsg interpretation error",
    [983] = "delimitation for linking type:WHISPER",
    [982] = "correct criteria bitset(wannabe) order",
    [981] = "change linking method",
    [980] = "hihi",
    [979] = "securehook ChatEdit_SendText, stupid me",
    [978] = "Link interpretation should now be OOP",
	[977] = "internal db error",
    [976] = "Link send/receive system implement (offline prevention)",
    [975] = "misc",
    [974] = "stupid typo#2",
    [973] = "fcking typo",
    [972] = "Only show value/required where required>1",
    [971] = "AchievementLink tweaks and fixez",
    [970] = "quickFix",
    [969] = "Implement achievementLink (haxFix) on whisper channel",
    [968] = "Fix OverWrite error",
    [967] = "Comm - Remove /fix command, akinek kellenek az achievementjei elkuldi nekem a WTF/Acc/SavedVariables/TauriAchik.lua filet",
    [966] = "Comm - TempFix /fix command",
    [965] = "Core : Implement Blizzlike GetAchievementLink , players with addon will now correctly see link data",
    [964] = "Fix stupid error with Optimization, Optimize SzaguldasPorcheSzerelem to Dalaran zone",
    [963] = "RealmOrder Database functionality should be 100%",
    [962] = "Implement RealmOrderer Database functionality,Add /ta fix command to get achievements from OldDb to newDB",
    [961] = "Comm - Fix new command output",
    [960] = "typo",
    [959] = "Addon - Shitload of fixes to Register/UnRegister events, optmization on ZONE_CHANGED_INDOORS, variable reset on Uncompletion,implementation of criteria.activate feature etc..",
    [958] = "Core - Fix huge bug with specialCase optimization return",
    [957] = "Core - Implement dayDependancy optimization criteria feature, TODO: script custom event NEW_DAY",
    [956] = "Achievements : - HalalosAjandek : Optimize 100%",
    [955] = "Core : - Fix StopTimedAchievement , VisszaAhonnan : Reset on Wipe",
    [954] = "Achievements : - VisszaAhonnan : Change event from UNIT_DIED to PARTY_KILL",
    [953] = "Addon : Fix new command show",
    [952] = "Test : Quick test for new command",
    [951] = "Addon : Implement /ta new command ",
    [950] = "Achievements :  - TakardSzemed : Optimize + Remove useless Unregister",
    [949] = "Achievements :  - AnubeJump : Remove useless code",
    [948] = "Achievements :  - Crazy optimization",
    [947] = "Achievements :    - SuperGauntlet final fix i hope...   - First criteria only exists in Trophy Hall ( if you leave the room combat_log will be unregisterted if InCombatLockDown returns nil )",
    [946] = "Core : - specialCase and specialCaseFunction fixes",
    [945] = "Achievements :    - SuperGauntlet ( prevCommit lost Part )",
    [944] = "Core : - Implement specialEvent check at Criteria optimization Reset data on caseFail ( also check specialCase if exists ) - Implement specialEvent : CA_CRITERIA_COMPLETE",
    [943] = "Quests/Kalimdor.lua : - Remove 1 non-existent quest SuperGauntlet.lua :   - Should only complete second criteria if first is complete [ Need 2 implement requiredCriteria dependency ]",
}

function TAchik_FilterComm(self,event,arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9,arg10, arg11, arg12)
    if (TAchik_FilterComms == 1) then
        return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9,arg10, arg11, arg12
    else
        if arg9 == "TAchiComm" then
            return true
        else
            return false, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9,arg10, arg11, arg12
        end
   end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",TAchik_FilterComm)

function TAchik_Print(msg, type)
    local eloTag
    if TAchik_DebugMode == 1 then
        eloTag = "\124cff007CFF\[\124rT\124cff007CFFauri\124rA\124cff007CFFchik\124r "..TAchik_Version.."\124cff007CFF\]"
    else
        eloTag = "\124cff007CFF\[\124rT\124cff007CFFauri\124rA\124cff007CFFchik\124r "..strsub(TAchik_Version,1,3).."\124cff007CFF\]"
    end
    if msg == nil then
        msg = "nil"
    end
    if (type == "error") then
        DEFAULT_CHAT_FRAME:AddMessage(eloTag.."\124cFFFF0000\ Hiba!\124cffFFFF00\ "..msg.."\124r",0.25,0.25,1)
	elseif ( type == "alert" ) then
	   DEFAULT_CHAT_FRAME:AddMessage(eloTag.."\124cFFFF0000\ Figyelem!\124cffFFFF00\ "..msg.."\124r",0.25,0.25,1)
    elseif (type == "debug" and TAchik_DebugMode == 1) then
		if (msg == "nil") then
			TAchik_Print("TAchik_Print()-debug was called without message","error")
		else
			DEFAULT_CHAT_FRAME:AddMessage(eloTag.."\124cFFFF8000\ Debug:\124cffFFFF00\ "..msg.."\124r",0.25,0.25,1)
		end
    elseif not(type == "debug" or type == "error") then
        DEFAULT_CHAT_FRAME:AddMessage(eloTag.."\124cffFFFF00\ "..msg.."\124r",0.25,0.25,1)
    end
end

function TAchik_FilterSwitch()
    if (TAchik_FilterComms == 1) then
        TAchik_FilterComms = nil
   else
        TAchik_FilterComms = 1
   end
   TAchik_Print("Kommunikációs csatorna üzeneteinek kiírása "..returnbybool(TAchik_FilterComms,"ki","be").."kapcsolva.")
end

function TAchik_GetOnline()
    local total = 0
	for k,v in ipairs(TA.onlinePlayers) do
	    total = total + 1
	end
    return total + 1
end

function TAchik_RefreshOnline()
    for k,v in ipairs(TA.onlinePlayers) do
	    if time() - v.time > 30 then
	        tremove(TA.onlinePlayers,k)
			if (v.name~=UnitName("player")) then TAchik_Print("Removing player from onlinePlayers, didn't ping for a while, possibly AFK","debug") else
				TAchik_Print("Remove "..v.name.." from onlinePlayers, didn't ping for a while","debug")
			end
	    end
	end
end

local sentTimes = {}
function TAchik_CanUseChannel()
    if #sentTimes > 3 then
	    if time() - sentTimes[#sentTimes] > 10 then
		    sentTimes = {}
		else
		    return false
		end
	end
    if UnitIsAFK("player") then
	    return false
	else
	    if UnitClass("player") == "Death Knight" then
		    if UnitLevel("player") >= 60 then
	            tinsert(sentTimes,time())
				return true
			end
		elseif UnitLevel("player") >= 15 then
		    tinsert(sentTimes,time())
			return true
		end
	end
end

function TAchik_Ping()
    TAchik_RefreshOnline()
	if GetChannelName("TAchiComm") == 0 or GetChannelName("TAchiComm") == nil then
		JoinChannelByName("TAchiComm")
	end
	local points = TA:GetTotalAchievementPoints(TAchik.merged) or 0
	local guild = GetGuildInfo("player") or "noGuild"
	if TAchik_CanUseChannel() then
	    SendChatMessage("ping#"..points.."#"..guild,"CHANNEL",nil,GetChannelName("TAchiComm"))
	else
	    TAchik_Print("Player is AFK/LowLvL, not pinging through custom channel","debug")
	    --SendAddonMessage("TAchiComm","ping "..TA:GetTotalAchievementPoints(),"GUILD") ez mi?
    end
	CombatLogClearEntries()
    TAchik_WaitForFunction(30,TAchik_Ping)
end


local function OtherGet(achiname,achikey,bitset,player)
    local achiId = TA.achisKeys[achikey]
	local link = achiname
	if achiId then
        link = TA:GetTauriAchievementLink(achiId,player,bitset)
		if not link then
		    link = achiname
		end
	end
    DEFAULT_CHAT_FRAME:AddMessage("["..player.."] megszerezte "..TAchik_az(link).." \124cffFF00FFT\124r\124cffFFFFFF-\124r\124cff9d9d9dauri\124r Achievementet!",1,1,0)
end

function TA:ParseOtherPlayerAchievementGet(message, sender)
    local achiname,x,y,ininstance,zone,achikey,bitset = strsplit("#",strsub(message, 6))
	if zone == select(1, GetMapInfo()) then
		if IsInInstance() and ininstance then
			for i=1,5,1 do
				if sender == UnitName("party"..i) then
					OtherGet(achiname,achikey,bitset,sender)
				end
			end
			for r=1,120,1 do
				if sender == UnitName("raid"..r) then
					OtherGet(achiname,achikey,bitset,sender)
				end
			end
		else
			local x,y = GetPlayerMapPosition("player")
			if between(x,x-7,x+7) and between(y,y-7,y+7) then
				OtherGet(achiname,achikey,bitset,sender)
			end
		end
	end
end

function TauriAchik_Command(paramc)
	local param = paramc:lower()
    if param == "guild" then
	    if IsInGuild() then
	        local playerList = ""
	        local playerCount = 1
	        for k,v in ipairs(TA.onlinePlayers) do
	            if v.guild == GetGuildInfo("player") then
	                playerList = playerList.." "..v.name
	                playerCount = playerCount + 1
	            end
	        end
	        TAchik_Print("Összes TauriAchis Játékos "..TAchik_az(GetGuildInfo("player")).." klánban: "..UnitName("player")..""..playerList.."\n Ez összesen "..playerCount.." játékos.")
	    else
	        TAchik_Print("Nem vagy klánban.","error")
	    end
    elseif param == "online" then
	    local playerList = ""
	    local playerCount = 1
	    for k,v in ipairs(TA.onlinePlayers) do
	        playerList = playerList.." "..v.name
	        playerCount = playerCount + 1
	    end
        TAchik_Print("Összes TauriAchis Játékos: "..UnitName("player")..playerList.."\n Ez összesen "..playerCount.." játékos.")
    elseif param == "ping" then
	    TAchik_Print("Pingelés...")
	    TAchik_Ping()
	elseif param=="profiling" then
		if (TAchik["profiling"]==nil or TAchik["profiling"]==false) then
			TAchik_Print("Script profiling bekapcsolva. Nyiss Achievement panel TauriAchik fület. Ha nem mér (0ms mindig), futtass egy Reload UI-t.")
			TAchik["profiling"]=true
			SetCVar("scriptProfile","1")
		else
			TAchik_Print("Script profiling kikapcsolva.")
			TAchik["profiling"]=false
			SetCVar("scriptProfile","1")
		end
	elseif param:find("profiling updaterate") or param:find("prate") then
		if (param:match("%d")) then
			TAchik["profilingUpdateRate"] = param:match("%d")
		else
			TAchik("Nem adtál meg értéket a script profiling frissítési gyakoriságához (másodperc).","error")
		end
	elseif param=="profiling log" or param=="plog" then
		if (TAchik_Profiling_Logger_Enabled==nil or TAchik_Profiling_Logger_Enabled==false) then
			TAchik_Profiling_Logger_Enabled=true
			TAchik_Print("Script profiling melletti mentés bekapcsolva, legfeljebb 7200 érték lesz tárolva. Ez a beállítás nem mentődik.")
			TAchik["profilingLog"] = TAchik["profilingLog"] or {}
		else
			TAchik_Profiling_Logger_Enabled=false
			TAchik_Print("Script profiling melletti mentés kikapcsolva.")
		end
	elseif param=="profiling log purge" or param=="ppurge" then
			TAchik["profilingLog"] ={}
			TAchik_Print("Script profiling mentése törölve.")
	elseif param:find("profiling log list") or param:find("plist") then
	    local DB = table.copy(TAchik["profilingLog"])
		local zone = ""
		if param:find("%(") then
			local z1 = param:find("%(")
			local z2 = param:find("%)")
			zone = strsub(paramc,z1+1,z2-1)
			for i=1,#DB do
                if DB[i] and not DB[i]:find(zone) then
				    DB[i] = nil
				end
			end
		end
		if (param:match("%d+%+")) then
			TAchik_Print("Profiling mentések, ahol "..param:match("%d+").."ms fölött volt a CPU használat:")
			for i=1,#DB do
				local msPos = DB[i]:find("ms") - 1
				local deltaPos = DB[i]:find("Delta:") + 7
				local ms = strsub(DB[i],deltaPos,msPos)
				if tonumber(ms) >= tonumber(param:match("%d+")) then
					TAchik_Print(DB[i])
				end
			end
		elseif (param:match("-%d+")) then
			TAchik_Print("Első "..param:match("%d+").." profiling mentés:")
			for i=1,param:match("%d+") do
				TAchik_Print(DB[i])
			end
		elseif (param:match("%d+")) then
			TAchik_Print("Utolsó "..param:match("%d+").." profiling mentés:")
			for i=#DB-param:match("%d+"),#DB do
				TAchik_Print(DB[i])
			end
		else
			TAchik_Print("Profiling mentés:")
			for i=1,#DB,1 do
				TAchik_Print(DB[i])
			end
		end
		DB = nil
    elseif param == "debug" then
	    if not(TAchik_DebugMode == 1) then
	       TAchik_DebugMode = 1
	       TAchik_Print("Debug mód bekapcsolva. A Chatspam ne legyen meglepő.","debug")
	    else
	       TAchik_Print("Debug mód kikapcsolva.")
	       TAchik_DebugMode = 0
	    end
    elseif param == "filter" then
	    TAchik_FilterSwitch()
    elseif param:find("new") then
        local param,sub = strsplit(" ",param)
        if not sub then
            TAchik_Print("Legutolsó kiadás frissítései:")
            for i=tonumber(TAchik["LastVersion"])+1,tonumber(TAchik_DBVersion) do
			    if TAchik_ChangeLog[i] then
                    TAchik_Print(i.." - "..TAchik_ChangeLog[i])
				end
            end
        else
            TAchik_Print("Utolsó "..sub.." frissítés: ")
			if tonumber(sub) < tcount(TAchik_ChangeLog) then
			    local iCounter = 1
				for i=tonumber(TAchik_DBVersion),1,-1 do
				    if TAchik_ChangeLog[i] then
					    TAchik_Print(i.." - "..TAchik_ChangeLog[i])
					    iCounter = iCounter + 1
					end
				    if iCounter > tonumber(sub) then
				        break
				    end
				end
			else
				TauriAchik_Command("new "..tcount(TAchik_ChangeLog)-1)
			    TAchik_Print("Több frissítést akartál lekérni mint amennyit tudunk mutatni. Megmutattuk helyette mind a "..TAchik_szamragozas(tcount(TAchik_ChangeLog)).."t.","error")
			end
        end
    elseif param:find("merge") then
        if TAchik_PlayerInCombat() then
            TAchik_Print("Nem teheted combat közben!","error")
            return
        end
        local param , sub = strsplit(" ",param);
	    if sub and TAchik_MergeCode then
	        if sub == TAchik_MergeCode then
	            if param:find("un") then
	                TA:SetMergeData(false)
	            else
	                TA:SetMergeData(true)
	            end
	            ReloadUI()
	        else
	            TAchik_Print("A kód nem egyezik!\124r","error")
	        end
	    else
	        if param:find("un") then
	            if TAchik.merged then
	                TAchik_Print("Biztos vagy benne, hogy külön szeretnéd választani a TauriAchik™ mentéseid [Automatikus Reload!]?")
                    TAchik_MergeCode = tostring(math.random(10000,30000))
	                TAchik_Print("Ha igen akkor használd a \"/ta unmerge "..TAchik_MergeCode.."\" parancsot")
	            else
	                TAchik_Print("A TauriAchik™ mentéseid nincsenek egybeolvasztva!","error")
	            end
	        else
	            if not TAchik.merged then
                    TAchik_Print("Biztos vagy benne, hogy egybe szeretnéd vonni a TauriAchik™ mentéseid [Automatikus Reload!]?")
                    TAchik_MergeCode = tostring(math.random(10000,30000))
	                TAchik_Print("Ha igen akkor használd a \"/ta merge "..TAchik_MergeCode.."\" parancsot")
	            else
	                TAchik_Print("A TauriAchik™ mentéseid már egybevannak olvasztva!","error")
	            end
	        end
	    end
	elseif param:find("compare") then
	    local param , sub = strsplit(" ",paramc)
		local own
		if sub and sub ~= UnitName("player"):lower() then
		    for char=1,TA:GetNumCharactersOnRealm() do
                if TA:GetCharacterDataById(char).character.name == sub then
				    own = TA:GetCharacterDataById(char)
				end
			end
			if not own then
			    TA.farCompare = true
			    TA:RequestComparisonAchievementData(sub)
			else
			    local total = 0
                for a,b in pairs(own.achis) do
		            local unix = TA:GetTauriUNIX(b)
		            local cDate = TA:TimeStampToDate(unix)
					local awDone
					if own.achisCompletedMerged and own.achisCompletedMerged[a] then
					    awDone = TA:MergersToString(own.achisCompletedMerged[a])
					end
					TA.comparisonData[a]=
		            {
			            ["month"] =  cDate[2],
			            ["day"] = cDate[1],
						["year"] = cDate[3],
						["unix"] = unix,
						["awDone"] = awDone,
		            }
					total = total + 1
				end
				TA.comparisonData.comparisonEnded = true
				if not AchievementFrame then
			        AchievementFrame_LoadUI()
			    end
			    TA.farCompare = nil
		        local race, sex , count = own.character.race, own.character.sex, total
		        sex = TAchik_GetUnitSexName(tonumber(sex))
		        InspectAchievements(own.character.name)
		        TA.comparisonData.numAchievements = tonumber(count)
		        TA.comparisonData.sex = sex
		        TA.comparisonData.race = race
		        customTexture = TAchik_CustomIcons[TAchik_GetFactionGroupFromRace(race)][race][sex]["FRIZURAS"]
			    AchievementFrameComparisonHeaderPortrait:SetTexture(customTexture)
		        AchievementFrameComparisonHeaderName:SetText(own.character.name);
		        AchievementFrameComparisonTab_OnClick(3)
			end
		else
		    TAchik_Print("Adj meg egy karakternevet (ami nem a tied)!","error")
		end
    elseif param:find("ver") then
	    local param , sub = strsplit(" ",param)
		if sub == "all" then
		    for k,v in ipairs(TA.onlinePlayers) do
			    SendAddonMessage("RequestTauriAchikVersion",TAchik_DBVersion,"WHISPER",v.name)
			end
		else
            TAchik_Print("Verzió ["..TAchik_Release.." Channel]: "..TAchik_Version..", achievement adatbázis: r"..TAchik_DBVersion)
		end
	elseif param:find("devmode") then -- obsolete, leftover?

	elseif param:find("add") then
	    local com , sub = strsplit(" ",paramc)
		if param:find("crit") then
		    if param:find("un") then
                TA:UnCompleteAchievementCriteria(nil,sub);
			else
                TA:CompleteCriteria(nil,sub);
			end
		else
	        if param:find("un") then
		        TA:UnCompleteAchievement(nil,sub)
		    else
		        TA:CompleteAchievement(nil,sub)
		    end
		end
	elseif param:find("reset") then
	    local param , sub = strsplit(" ",param);
	    if sub and TAchik_ResetCode then
	        if sub == TAchik_ResetCode then
	            TA:ResetAchievements()
	            if AchievementFrame then
	                AchievementFrameBaseTab_OnClick(3)
	                AchievementFrameAchievements_ForceUpdate()
	            end
	        else
	            TAchik_Print("A kód nem egyezik!\124r","error")
	        end
	    else
	        TAchik_Print("Biztos vagy benne, hogy Resetelni szeretnéd a TauriAchik™ mentéseid?")
	        TAchik_ResetCode = tostring(math.random(10000,30000))
	        TAchik_Print("Ha igen akkor használd a  \"/ta reset "..TAchik_ResetCode.."\" parancsot")
	    end
    elseif param == "broadcast" then
        if TAchik["SETTINGS"]["boolBroadCastGuild"] then
            TAchik["SETTINGS"]["boolBroadCastGuild"] = false
        else
            TAchik["SETTINGS"]["boolBroadCastGuild"] = true
        end
		TAchik_Print("Guild hirdetés "..returnbybool(TAchik["SETTINGS"]["boolBroadCastGuild"],"ki","be").."kapcsolva")
    elseif param == "help" then
        TAchik_Print("Elérhető parancsok:");
	    if IsInGuild() then
	        TAchik_Print("/tauriachi guild -- kiírja, hogy kik rendelkeznek a TauriAchik™ addonnal a guildodból\124r")
	        TAchik_Print("/tauriachi broadcast -- ki/bekapcsolhatod a TauriAchik™ hírdetését guildchaten")
	    end
	    TAchik_Print("/tauriachi online -- kiírja, hogy kik rendelkeznek a TauriAchik™ addonnal az egész szerveren")
	    TAchik_Print("/tauriachi ping -- kézileg \"ping\"elhetsz, hogy hamarabb tudjanak a többi játékosok arról, hogy te a TauriAchik™-at futtatod","debug")
	    TAchik_Print("/tauriachi filter -- ki/bekapcsolhatod a TauriAchik™ kommunikációs csatornájának a kiírását","debug")
	    TAchik_Print("/tauriachi debug -- ki/bekapcsolhatod a debug módot")
		TAchik_Print("/tauriachi new -- kiírja a TauriAchik™ addonnal legútolsó frissitését ( vagy 'new N' esetén az utolsó N frissitést )")
		TAchik_Print("/tauriachi ver -- kiírja a TauriAchik™ addonod verzióját ( vagy 'ver all' esetén a fentlévö játékosok verzíóit )")
		TAchik_Print("/tauriachi merge -- eggyesíti a TauriAchik™ teljesítményeidet account szinten ( vagy unmerge szétválaszja )")
		TAchik_Print("/tauriachi transfer -- átrkaja/felcsereléli a TauriAchik™ teljesítményeidet két karakter között)")
	    TAchik_Print("Használhatod a /tauriachi helyett a /tachi, vagy a /ta parancsot is.")
    else
        TAchik_Print("Hibás alparancs, használd a 'help' alparancsot elérhető parancsok érdekében!","error");
    end
end

SLASH_TauriAchik1 = "/tauriachik"
SLASH_TauriAchik2 = "/tauriachi"
SLASH_TauriAchik3 = "/tachi"
SLASH_TauriAchik4 = "/ta"
SlashCmdList["TauriAchik"] = TauriAchik_Command
