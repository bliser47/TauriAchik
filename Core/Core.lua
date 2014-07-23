--[[

                   TauriAchik Core 2.0

              Credits to CustomAchievements
              Improved by Bliser and Exedru
                  Created for WoW 3.3.5
                 For Achievementhunterz!


]]--

local TA = LibStub:NewLibrary("TauriAchikLib", 1);
local TA_Cat_ID = TA_Cat_ID or -2;
local TA_Achi_ID = TA_Achi_ID or -1;
local TA_Crit_ID = TA_Crit_ID or -1;

TA.frame = CreateFrame("Frame","TAchik_EventFrame");
TA.events = {};
TA.eventsAchi = {};
TA.cats = {};
TA.achis = {};
TA.achisKeys = {};
TA.achiListSorted = {};
TA.crits = {};
TA.critsKeys = {};
TA.tracked = {};
TA.optimAchi = {};
TA.optimCrit = {};
TA.compQuests = { ["table"] = {} , ["loaded"] = false };
TA.hookedButtons = {};
TA.comparisonData = {};
TA.onlinePlayers = {};
TA.msgQueue = {};
TA.inexistent = {}
TA.calledEvents = {}
TA.removedAchis = {}
TA.looping = {} -- Forward time achievements
TA.loadedFiles =
{
    "Core\\Core.lua"
}


-- not including LibStub
TA.requiredFiles =
{
    "Core\\CustomTextures.lua",
    "Core\\Constants.lua",
    "Core\\Functions.lua",
    "Core\\Core.lua",
    "Core\\Communication.lua",
    "Core\\OverWrite.lua",

    "Core\\Support\\TimedAchievementSupport.lua",
    "Core\\Support\\MergabilitySupport.lua",
    "Core\\Support\\GuildAchievementSupport.lua",
    "Core\\Support\\Transfer.lua",
    "Core\\Support\\LibCompress.lua",
    "Core\\Functionality\\Tracking.lua",
    "Core\\Functionality\\Comparison.lua",
    "Core\\Functionality\\Optimization.lua",
    "Core\\Functionality\\Uncompletion.lua",
    "Core\\Functionality\\GetDataHook.lua",
    "Core\\Functionality\\Linking.lua",

    "Quests\\Kalimdor.lua",
    "Quests\\Eastern_Kingdoms.lua",

    "Achievements\\General\\KockaProblem.lua",
    "Achievements\\General\\Fenykepesz.lua",
    "Achievements\\General\\EledesMestere.lua",
    "Achievements\\General\\Alkoholista.lua",
    "Achievements\\General\\AzAnyag.lua",
    "Achievements\\General\\AzEnNapom.lua",
    "Achievements\\General\\BigMac.lua",
    "Achievements\\General\\CsakNemTeAchi.lua",
    "Achievements\\General\\DalaranAviatikus.lua",
    "Achievements\\General\\DuplaSzivarvany.lua",
    "Achievements\\General\\Haljmeg.lua",
    "Achievements\\General\\OnlinePlayersAchievements.lua",
    "Achievements\\General\\RayOfDarkness.lua",
    "Achievements\\General\\SpeedClick.lua",
    "Achievements\\General\\StylistMeleg.lua",
    "Achievements\\General\\Hellosziavagyok.lua",
    "Achievements\\General\\JawsBosszuja.lua",
    "Achievements\\General\\YouTouchMyTralalalala.lua",
    "Achievements\\General\\Ugri.lua",
    "Achievements\\General\\SzaguldasPorcheSzerelem.lua",
    "Achievements\\General\\Serpenyo.lua",
    "Achievements\\General\\OroszRulett.lua",
    "Achievements\\General\\Hopuskas.lua",
    "Achievements\\General\\KozszolgaloFelcser.lua",
    "Achievements\\General\\ThankPlayerAchievements.lua",
    "Achievements\\General\\Postas.lua",
    "Achievements\\General\\Robotkodo.lua",

    "Achievements\\Player vs Player\\General\\BGAchievements.lua",
    "Achievements\\Player vs Player\\General\\Csatazuzo.lua",
    "Achievements\\Player vs Player\\General\\Felcser.lua",
    "Achievements\\Player vs Player\\General\\HeroNapja.lua",
    "Achievements\\Player vs Player\\General\\MorokBajnoka.lua",
    "Achievements\\Player vs Player\\General\\Rovidt.lua",
    "Achievements\\Player vs Player\\General\\Sorozatgyilkos.lua",
    "Achievements\\Player vs Player\\General\\Szarnyasokfejvadasza.lua",

    "Achievements\\Player vs Player\\Warsong Gulch\\FlagVsFlag.lua",
    "Achievements\\Player vs Player\\Warsong Gulch\\HiroshimaGulch.lua",
    "Achievements\\Player vs Player\\Warsong Gulch\\KellAHonor.lua",
    "Achievements\\Player vs Player\\Warsong Gulch\\Osszpontositott.lua",
    "Achievements\\Player vs Player\\Warsong Gulch\\TeamFortress.lua",

    "Achievements\\Player vs Player\\Arathi Basin\\ArathiQuickCap.lua",
    "Achievements\\Player vs Player\\Arathi Basin\\JamesBasin.lua",
    "Achievements\\Player vs Player\\Arathi Basin\\BuffBasin.lua",

    "Achievements\\Player vs Player\\SotA\\Baywatch.lua",
    "Achievements\\Player vs Player\\SotA\\Husdaralo.lua",
    "Achievements\\Player vs Player\\SotA\\Carmageddon.lua",

    "Achievements\\Player vs Player\\Eye of the Storm\\FussForest.lua",

    "Achievements\\Player vs Player\\Wintergrasp\\HarcmezeiKonyhamuvesz.lua",

    "Achievements\\Quest\\LoremasterBreakdown.lua",
    "Achievements\\Quest\\LoremasterMeta.lua",
    "Achievements\\Quest\\Level10.lua",
    "Achievements\\Quest\\Level20.lua",
    "Achievements\\Quest\\Level30.lua",
    "Achievements\\Quest\\Level40.lua",
    "Achievements\\Quest\\Level50.lua",
    "Achievements\\Quest\\Level60.lua",
    "Achievements\\Quest\\Pedobear.lua",

    "Achievements\\Class\\ShamanClassAchievements.lua",

    "Achievements\\Dungeon and Raid\\Dungeon General\\EtiopKisgyerek.lua",
    "Achievements\\Dungeon and Raid\\Dungeon General\\Haladjunk.lua",
    "Achievements\\Dungeon and Raid\\Dungeon General\\RongyosJoe.lua",
    "Achievements\\Dungeon and Raid\\Dungeon General\\RaidersOfTheLostInstances.lua",

    "Achievements\\Dungeon and Raid\\Dungeon\\AnubeJump.lua",
    "Achievements\\Dungeon and Raid\\Dungeon\\ControlledDeconstruction.lua",
    "Achievements\\Dungeon and Raid\\Dungeon\\HalalosAjandek.lua",
    "Achievements\\Dungeon and Raid\\Dungeon\\VisszaAhonnan.lua",
    "Achievements\\Dungeon and Raid\\Dungeon\\TakardSzemed.lua",
    "Achievements\\Dungeon and Raid\\Dungeon\\SuperGauntlet.lua",
    "Achievements\\Dungeon and Raid\\Dungeon\\SzentCsapas.lua",
    "Achievements\\Dungeon and Raid\\DungeonGyujto.lua",

    "Achievements\\Dungeon and Raid\\Raid\\Fazos.lua",
    "Achievements\\Dungeon and Raid\\Raid\\NemArad.lua",
    "Achievements\\Dungeon and Raid\\Raid\\Kapitany.lua",
    "Achievements\\Dungeon and Raid\\Raid\\Verfolt.lua",
    "Achievements\\Dungeon and Raid\\Raid\\Bacikerulo.lua",
    "Achievements\\Dungeon and Raid\\Raid\\Gazak.lua",
    "Achievements\\Dungeon and Raid\\Raid\\PestisBeosztok.lua",

    "Achievements\\Arena\\ArenaAchievements.lua",
    "Achievements\\Arena\\QuickArena.lua",
    "Achievements\\Arena\\ArenaGyujto.lua",
    "Achievements\\Arena\\KicsitMegbecsuli.lua",

    "Achievements\\Guild\\Gbmoney.lua",
    "Achievements\\Guild\\GuildAchievements.lua",

    "Achievements\\Titkos\\MernokUr.lua",
    "Achievements\\Titkos\\Kussolja.lua",
    "Achievements\\Titkos\\Firstrun.lua",
    "Achievements\\Titkos\\Pentek.lua",
    "Achievements\\Titkos\\Everydayimshufflin.lua",
    "Achievements\\Titkos\\Csillapodjale.lua",
    "Achievements\\Titkos\\Achievementwhore.lua"

}
function TA.SortAchievements(a,b)
	return TAchik_SortDates(TA.achis[a],TA.achis[b])
end

function TA:GetPlayerLatestAchievements()
    local achievementList = {}
    for o,b in pairs(TA.cats) do
	    for k,v in pairs(b.achis) do
			tinsert(achievementList,v)
		end
    end
    table.sort(achievementList,TA.SortAchievements);
    return achievementList
end

function TA:AddCategory(name, parent)
	TA_Cat_ID = TA_Cat_ID - 1;

	TA.cats[TA_Cat_ID] = {
		id = TA_Cat_ID,
		name = name,
		parent = parent or -1,
		achis = {},
	};

	return TA_Cat_ID;
end

-- Overwrite for Level < 10 characters to enable TachiTab
function HasCompletedAnyAchievement() return true end

function TA:IsSpecialEvent(eventName)
    local specialEvents =
    {
        "TA_ACHIEVEMENT_EARNED",
        "TA_ACHIEVEMENT_UNEARNED",
        "TA_CRITERIA_COMPLETE",
        "PLAYER_JUMP",
        "INSPECT_ACHIEVEMENT_TAURIACHIK",
        "FIRST_LOAD_COMPLETED",
        "QUESTDATA_UPDATED",
        "TACHIK_GMEMBER_CAME_ONLINE",
        "TACHIK_PING",
		"INSTANCE_CHANGED",
		"ENTER_BATTLEGROUND",
		"LEAVE_BATTLEGROUND",
    }
    return tContains(specialEvents,eventName)
end

function TA:GetAchievementDependentInfo(achi,race,sex)
    local name,desc,texture,points,pfaction
	local f,r,s = "","",""
	if race == "Scourge" then
	    race = "Undead"
    end
	pfaction = TAchik_GetFactionGroupFromRace(race)
    if achi.factionDependent then
	    f = pfaction
	end
	if achi.raceDependent then
	    r = gsub(race," ","")
	end
	if achi.sexDependent then
	    s = sex
	end
    name = achi["name"..f..s..r] or achi["name"..f..s] or achi["name"..f..r] or achi["name"..r..s] or achi.name
	desc = achi["description"..f..s..r] or achi["description"..f..s] or achi["description"..f..r] or achi["description"..r..s] or achi.description
	points = achi["points"..f..s..r] or achi["points"..f..s] or achi["points"..f..r] or achi["points"..r..s] or achi.points
	if achi.raceDependent then
	    if achi.sexDependent then
	        --texture = TAchik_CustomIcons[pfaction][race][s][achi.key]
		else
		    --texture = TAchik_CustomIcons[pfaction][race][achi.key]
		end
	else
	    texture = achi["texture"..f..s] or achi["texture"..f] or achi["texture"..s] or achi.texture
	end
    return name,desc,texture,points
end

function TA:GetCriteriaDependentInfo(criteria)
    local name,required,events,requireEvents,requiredState,requiredFunction
	local f,r,s = "","",""
    if criteria.factionDependent then
	    f = UnitFactionGroup("player")
	end
	if criteria.raceDependent then
	    r = gsub(UnitRace("player")," ","")
	end
	if criteria.sexDependent then
	    s = TAchik_GetUnitSexName(UnitSex("player"))
	end
    name = criteria["name"..f..s..r] or criteria["name"..f..s] or criteria["name"..f..r] or criteria["name"..r..s] or criteria.name
	required = criteria["required"..f..s..r] or criteria["required"..f..s] or criteria["required"..f..r] or criteria["required"..r..s] or criteria.required
	events = criteria["events"..f..s..r] or criteria["events"..f..s] or criteria["events"..f..r] or criteria["events"..r..s] or criteria.events
	requiredEvents = criteria["requiredEvents"..f..s..r] or criteria["requiredEvents"..f..s] or criteria["requiredEvents"..f..r] or criteria["requiredEvents"..r..s] or criteria.requiredEvents
    requiredState = criteria["requiredState"..f..s..r] or criteria["requiredState"..f..s] or criteria["requiredState"..f..r] or criteria["requiredState"..r..s] or criteria.requiredState
	requiredFunction = criteria["requiredFunction"..f..s..r] or criteria["requiredFunction"..f..s] or criteria["requiredFunction"..f..r] or criteria["requiredFunction"..r..s] or criteria.requiredFunction

	return name,required,events,requiredEvents,requiredState,requiredFunction
end

function TA:VariableHasNotChangedType(var1,var2)
    if type(var1) == type(var2) then
	    if type(var2) == "table" then
			local variableCount = 0
			local saveCount = 0
			for k,v in pairs(var2) do
			    if type(v) == "table" and type(k) == "string" then
				    variableCount = variableCount + 1
				end
			end
			for k,v in pairs(var1) do
			    if type(v) == "table" and type(k) == "string" then
				    saveCount = saveCount + 1
				end
			end
			return saveCount == variableCount
		else
		    return true
		end
	else
	    return false
	end
	return true
end

function TA:AddAchievement(tbl)

	TA_Achi_ID = TA_Achi_ID - 1;
	local achievementNeedsReset = false

	if tbl.factionDependent then
	    if UnitFactionGroup("player") == "Horde" then
		    tbl.category = tbl.categoryHorde or tbl.category
		else
		    tbl.category = tbl.categoryAlliance or tbl.category
		end
	end

	if tbl.category ~= nil then
	    if TA.cats[tbl.category] then
		    if tbl.realm then
		        if tContains(tbl.realm,GetRealmName()) then
			        tinsert(TA.cats[tbl.category].achis,TA_Achi_ID);
			    else
				    tinsert(TA.inexistent,tbl)
			        TA_Achi_ID = TA_Achi_ID + 1;
			        return false
			    end
		    elseif tbl.factionExistent then
		        if tbl.factionExistent == UnitFactionGroup("player") then
		            tinsert(TA.cats[tbl.category].achis,TA_Achi_ID);
		        else
				    tinsert(TA.inexistent,tbl)
		            TA_Achi_ID = TA_Achi_ID + 1;
			        return false
		        end
		    elseif tbl.classExistent then
		        if tbl.classExistent == UnitClass("player") then
		            tinsert(TA.cats[tbl.category].achis,TA_Achi_ID);
		        else
				    tinsert(TA.inexistent,tbl)
		            TA_Achi_ID = TA_Achi_ID + 1;
		            return false
		        end
		    elseif tbl.raceExistent then
			    if type(tbl.raceExistent) == "string" then tbl.raceExistent = { tbl.raceExistent } end
			    if tContains(tbl.raceExistent,UnitRace("player")) then
		            tinsert(TA.cats[tbl.category].achis,TA_Achi_ID);
				else
				    tinsert(TA.inexistent,tbl)
					TA_Achi_ID = TA_Achi_ID + 1;
		            return false
				end
		    elseif tbl.battlegroupExistent then
			    if tbl.battlegroupExistent == TA:GetBattlegroupName(GetRealmName()) then
		            tinsert(TA.cats[tbl.category].achis,TA_Achi_ID);
				else
				    tinsert(TA.inexistent,tbl)
					TA_Achi_ID = TA_Achi_ID + 1;
		            return false
				end
			else
		        tinsert(TA.cats[tbl.category].achis,TA_Achi_ID);
		    end
		else
			TA_Achi_ID = TA_Achi_ID + 1;
			return false
		end
	end

	if tbl.previous then
	    if TA.achis[tbl.previous] then
			TA.achis[tbl.previous].next = TA_Achi_ID;
		end
	end

	if tbl.save then
		if tbl.accountWide then
		    local bgName = TA:GetBattlegroupName(GetRealmName())
		    tbl.save[bgName] = tbl.save[bgName] or {}
			tbl.save = tbl.save[bgName]
		    tbl.save["AccountWide"] = tbl.save["AccountWide"] or {}
			tbl.save = tbl.save["AccountWide"]
		elseif tbl.guildWide then
		    tbl.save["Realms"] = tbl.save["Realms"] or {}
	        tbl.save.Realms[GetRealmName()] = tbl.save.Realms[GetRealmName()] or {};
	        tbl.save = tbl.save.Realms[GetRealmName()];
			tbl.save["Guilds"] = tbl.save["Guilds"] or {}
			local gName = GetGuildInfo("player")
			tbl.save.Guilds[gName] = tbl.save.Guilds[gName] or {}
			tbl.save = tbl.save.Guilds[gName]
		else
	        tbl.save["Realms"] = tbl.save["Realms"] or {}
	        tbl.save.Realms[GetRealmName()] = tbl.save.Realms[GetRealmName()] or {};
	        tbl.save = tbl.save.Realms[GetRealmName()];
			tbl.save["Characters"] = tbl.save["Characters"] or {}
			tbl.save = tbl.save.Characters
	        tbl.save[UnitGUID("player")] = tbl.save[UnitGUID("player")] or {}
	        tbl.save = tbl.save[UnitGUID("player")]
		end

		tbl.save.achis = tbl.save.achis or {}
		tbl.save.crits = tbl.save.crits or {}
		tbl.save.tracked = tbl.save.tracked or {}
		tbl.save.variables = tbl.save.variables or {}
		if tbl.save.achis[tbl.key] then
			tbl.complete = TA:TimeStampToDate(TA:GetTauriUNIX(tbl.save.achis[tbl.key]))
		    tbl.completeTime = tbl.save.achis[tbl.key]
		end
		tbl.tracked = tbl.save.tracked[TA_Achi_ID]
	end

	tbl.complete = tbl.complete or nil
	tbl.completeTime = tbl.completeTime or nil
	tbl.name,tbl.description,tbl.texture,tbl.points = TA:GetAchievementDependentInfo(tbl,UnitRace("player"),TAchik_GetUnitSexName(UnitSex("player")))
	tbl.id = TA_Achi_ID;
	tbl.criteria = tbl.criteria or {};
	tbl.description = tbl.description or "";
	tbl.points = tbl.points or 0;
	tbl.reward = tbl.reward or "";
	tbl.visible = {};
	tbl.hidden = tbl.hidden or nil
	tbl.mergeable = tbl.mergeable or true
	tbl.mergers = tbl.mergers or nil
	tbl.valid = true
	tbl.invisible = tbl.invisible or false

	if tbl.invisible and not tbl.complete then
        tremove(TA.cats[tbl.category].achis,id);
	end


	------------------------------------------------- Merge Feature ------------------------------------------
	if TAchik.merged and not tbl.accountWide and not tbl.guildWide then
	    if not tbl.unmergeable then
	        if not tbl.complete then
	            if TA:GetAchievementInfoOnAccount(tbl,tbl.key) ~= nil then
	                tbl.complete , tbl.mergers , tbl.completeTime = TA:GetAchievementInfoOnAccount(tbl,tbl.key)
	                if tbl.save.achisCompletedMerged == nil then tbl.save.achisCompletedMerged = {} end
	                tbl.save.achisCompletedMerged[tbl.key] = tbl.mergers
	            end
	        elseif tbl.save.achisCompletedMerged and tbl.save.achisCompletedMerged[tbl.key] then
			    _, tbl.mergers = TA:GetAchievementInfoOnAccount(tbl,tbl.key)
			end
		end
    else
	    if tbl.save.achisCompletedMerged ~= nil then
            if tbl.save.achisCompletedMerged[tbl.key] then
			    tbl.save.achis[tbl.key] = nil
                tbl.save.achisCompletedMerged[tbl.key] = nil
				tbl.complete = nil
				tbl.completeTime = nil
				if #tbl.save.achisCompletedMerged == 0 then
				    tbl.save.achisCompletedMerged = nil
				end
            end
		end
    end
	------------------------------------------------- Merge Feature ------------------------------------------
	-- Set Events to Table ------------------------------------------
	if tbl.requiredEvents then
	    if type(tbl.requiredEvents) == "string" then
			tbl.requiredEvents = { tbl.requiredEvents }
	    end
	end
	if tbl.events then
		if type(tbl.events) == "string" then
			tbl.events = { tbl.events }
		end
    end
	-- Set Events to Table ------------------------------------------
	---------------------------------------------- AchievementEventSystem ------------------------------------
	if not tbl.complete or tbl.mergers then
	    if tbl.requiredState then
			tbl.valid = TA:EvaluateRequirement(tbl)
			if tbl.requiredEvents then
			    for x,y in ipairs(tbl.requiredEvents) do
				    if not TA.optimAchi[y] then
						TA.optimAchi[y] = {};
						if not TA:IsSpecialEvent(y) then
							TA.frame:RegisterEvent(y);
						end
				    end
					tinsert(TA.optimAchi[y],tbl);
				end
			end
		end
		if tbl.valid then
			if tbl.events then
				for x,y in ipairs(tbl.events) do
					if not TA.eventsAchi[y] then
						TA.eventsAchi[y] = {};
						if not TA:IsSpecialEvent(y) then
							TA.frame:RegisterEvent(y);
						end
				    end
					tinsert(TA.eventsAchi[y],tbl);
				end
			end
		else
		    achievementNeedsReset = true
		end
	end

	-- Class --
	if tbl.class and tbl.class ~= UnitClass("player") then
		tbl.valid = false
		if TA:GetAchievementInfoOnAccount(tbl,tbl.key) ~= nil then
		    tbl.complete , tbl.mergers , tbl.completeTime = TA:GetAchievementInfoOnAccount(tbl,tbl.key)
		end
	end

	---------------------------------------------- AchievementEventSystem ------------------------------------

	for k,v in ipairs(tbl.criteria) do
        if v.raceExistent then
			if type(v.raceExistent) == "string" then v.raceExistent = { v.raceExistent } end
		end
        if ( v.raceExistent and tContains(v.raceExistent,UnitRace("player")) ) or not v.raceExistent then
		if ( v.factionExistent and UnitFactionGroup("player") == v.factionExistent ) or not v.factionExistent then

		    TA_Crit_ID = TA_Crit_ID - 1;

			v.name,v.required,v.events,v.requiredEvents,v.requiredState,v.requiredFunction = TA:GetCriteriaDependentInfo(v)

		    if v.events then
		        if type(v.events) == "string" then
			        v.events = {v.events};
		        end
			end

			if v.requiredEvents then
			    if type(v.requiredEvents) == "string" then
			        v.requiredEvents = { v.requiredEvents }
			    end
			end

	    	v.id = TA_Crit_ID;
		    v.parent = tbl;
		    v.value = v.value or function() return 0 end
		    v.progress = v.required and 1 or 0
		    v.required = v.required or 1;
		    v.format = v.format or (v.required and "%d / %d");
		    v.criteriaID = v.id
		    v.achievementID = tbl.id
		    v.hidden = v.hidden or nil

		    -- If the achievement has a save database
		    if tbl.save then
		    	if tbl.save.crits[v.key] then
				    -- Tauri UNIX!
			    	v.complete = tbl.save.crits[v.key]
				end
		    end

		    ------------ Merge Feature --------------
	        if TAchik.merged and not v.parent.accountWide then
			    if not v.parent.unmergeable then
	                if v.key and not v.complete then
	                    v.complete,v.mergers = TA:GetCriteriaInfoOnAccount(v.key)
	                    if v.complete then
							if tbl.save.critsCompletedMerged == nil then
								tbl.save.critsCompletedMerged = {}
							end
							tbl.save.critsCompletedMerged[v.key] = v.mergers
							TA:HandleMergers(v,v.mergers)
	                    elseif v.mergeable ~= nil then
					        TA:RegisterEvent(v,{ "PLAYER_ENTERING_WORLD" })
					    end
	                elseif v.key and tbl.save.critsCompletedMerged and tbl.save.critsCompletedMerged[v.key] then
                        -- Criterias is complete and has mergers
						_, v.mergers = TA:GetCriteriaInfoOnAccount(v.key)
						TA:HandleMergers(v,v.mergers)
					end
				end
            elseif v.key and not v.parent.accountWide then
    			if v.parent.save.critsCompletedMerged ~= nil then
                    if v.parent.save.critsCompletedMerged[v.key] then
                        v.parent.save.critsCompletedMerged[v.key] = nil
						v.parent.save.crits[v.key] = nil
						v.complete = nil
				        if #v.parent.save.critsCompletedMerged == 0 then
				            v.parent.save.critsCompletedMerged = nil
				        end
                    end
				end
            end

			if tbl.class and tbl.class ~= UnitClass("player") then
		        if TA:GetCriteriaInfoOnAccount(v.key) ~= nil then
		            v.complete,v.mergers = TA:GetCriteriaInfoOnAccount(v.key)
				end
		    end
	        ------------ Merge Feature --------------

		    -- If the criteria has a saved variable
	        if v.variable ~= nil then
			    v.resetTemplate = table.copy(v.variable)
				if TA:VariableHasNotChangedType(tbl.save.variables[v.key],v.variable) or tbl.save.variables[v.key] == nil then
                    if tbl.save.variables[v.key] ~= nil then
                        v.variable = tbl.save.variables[v.key]
					end
			    elseif tbl.save.variables[v.key] ~= nil then
					TAchik_Print("Found new variable type , replacing type of variable "..v.key.." ( DB TYPE "..type(tbl.save.variables[v.key]).." TACHI TYPE "..type(v.variable).." )","alert")
			        tbl.save.variables[v.key] = v.variable
                end
                if type(v.variable) == "table" then
                    if v.variable.counter and v.variable.counter < 0 then
                        v.variable.counter = 0
                    end
                elseif tbl.variable ~= nil and type(v.variable) == "number" and tbl.variable < 0 then
                    v.variable = 0
                end
	        end

			-- If the achievement has a string description or a progress bar THEN show it
			if (v.name or v.required > 1) and not v.hidden  then
				tinsert(tbl.visible,v.id);
			end


			if tbl.lateCheck or (not tbl.complete or tbl.lateComplete or ( tbl.mergers and not tbl.unmergeable ) ) and ( not v.complete or v.mergers ) then

			    -- Register if the vlaue of registerOnLogonIf is true
			    if v.registerOnLogonIf and v[v.registerOnLogonIf.state] then
			        if v.registerOnLogonIf.sub then
				        if v[v.registerOnLogonIf.state][v.registerOnLogonIf.sub] then
				            TA:RegisterEvent(v,v[v.registerOnLogonIf.table])
				        end
				    else
					    TA:RegisterEvent(v,v[v.registerOnLogonIf.table])
				    end
		        end

			    -- Activate OTHER criteria if THIS criteria is complete
			    if v.activator and TA.crits[TA.critsKeys[v.activator]].complete then
				    --tinsert(v.events,"PLAYER_ENTERING_WORLD")
				    if v.specialEvents then
	                    TA:RegisterEvent(v,v.specialEvents)
				    end
		        end

		        -- If the criteria is timed
			    if v.timed then
		            TA:HandleTimedCriteria(v)
			    end

				-- ResetVariable for criteria if it is invalid
			    local needsReset = false
			    if v.resetOnLoad then
                    needsReset = true
				end
		        local isValid = tbl.valid
		        if v.requiredFunction and isValid then
					isValid = TA:EvaluateRequirement(v)
					if v.requiredEvents then
					    for x,y in pairs(v.requiredEvents) do
				            if not TA.optimCrit[y] then
						        TA.optimCrit[y] = {};
						        if not TA:IsSpecialEvent(y) then
							        TA.frame:RegisterEvent(y);
								end
				            end
							tinsert(TA.optimCrit[y],v);
				        end
					end
		        end
		        if isValid then
			        if v.events then
				        for x,y in ipairs(v.events) do
					        if not TA.events[y] then
						        TA.events[y] = {};
						        if not TA:IsSpecialEvent(y) then
							        TA.frame:RegisterEvent(y);
						        end
					        end
					        tinsert(TA.events[y],v);
				        end
				    end
			    else
				    needsReset = true
				end
		    end
		    TA.crits[TA_Crit_ID] = v;
			if v.key then
			    TA.critsKeys[v.key] = TA_Crit_ID
			end
			----------------- Reset Criteria --------------------
			if needsReset and ( v.resetOnLeave or v.resetOnLoad ) then
                TA:UnCompleteAchievementCriteria(v)
            end
			----------------- Reset Criteria --------------------
	    end -- Close raceCheck
		end -- Close factionCheck
	end -- CloseCriteria Loop
	TA.achis[TA_Achi_ID] = tbl;
	TA.achisKeys[tbl.key] = TA_Achi_ID
	----------------- Reset Achievement --------------------
	if not tbl.complete and  ( achievementNeedsReset and tbl.resetOnLeave ) then
		TA:UnCompleteAchievement(TA_Achi_ID)
	end
	----------------- Reset Achievement --------------------
	if tbl.tracked then
		TA.tracked[TA_Achi_ID] = true;
		WatchFrame_Update();
	end
	if not tbl.complete then
	    TA:CheckComplete(tbl,true);
	end
	return TA_Achi_ID;
end


function TA:VariableSame(v1,v2)
    if v1 and v2 then
        if type(v1) == type(v2) then
		    if type(v1) == "table" then
                for k,v in pairs(v1) do
		            for c,d in pairs(v2) do
			            if k == c then
                            if v ~= d then
				                return false
				            end
				        end
			        end
                end
		        return #v1 == #v2
	        else
	            return v1 == v2
	        end
		else
		    return false
		end
	else
	    return v1 == nil and v2 == nil
	end
end

function TA:ActivateCriteria(activate)
    local activation = TA.crits[TA.critsKeys[activate]]
	TAchik_Print("Criteria needs to activate criteria with key : "..activate.." id :"..activation.id,"debug")
	if ( not activation.complete ) and activation.specialEvents then
	    TAchik_Print("Activating "..activate.." id :"..activation.id,"debug")
	    TA:RegisterEvent(activation,activation.specialEvents)
	end
end

function TA:CritComplete(crit,mergers,dueComp)

    if crit.complete and not crit.mergers then
        return;
    end

    if TA:IsCheckedEvent("TA_CRITERIA_COMPLETE") then
        TA.OnEvent(nil,"TA_CRITERIA_COMPLETE",crit.key);
    end

	crit.complete = TA:GetTauriUNIX()

	if crit.parent.save then
	    if crit.key then
		    crit.parent.save.crits[crit.key] = crit.complete
	        if mergers ~= nil then
	            if not crit.parent.save.critsCompletedMerged then
	                crit.parent.save.critsCompletedMerged = {}
	            end
	            crit.parent.save.critsCompletedMerged[crit.key] = mergers
	        elseif crit.parent.save.critsCompletedMerged then
			    if crit.parent.save.critsCompletedMerged[crit.key] then
				    -- Remove critsCompletedMerged if you ALSO achieved this criteria
			        crit.parent.save.critsCompletedMerged[crit.key] = nil
			        crit.mergers = nil
				end
			end
			if crit.variable and crit.parent.resetOnLeave then
			    if crit.parent.save.variables[crit.key] then
				    crit.parent.save.variables[crit.key] = nil
				end
			end
			if crit.timed then
                if crit.parent.save.timed then
                    crit.parent.save.timed[crit.key] = nil
		        end
	        end
		end
	end

	if crit.specialEvents then
	    TA:UnRegisterEvent(crit,crit.specialEvents)
	end

	if crit.activate and not dueComp then
	    TA:ActivateCriteria(crit.activate)
	end

	if crit.requiredEvents then
	    for k,v in pairs(crit.requiredEvents) do
		    if TA.optimCrit[v] then
		        for x,y in pairs(TA.optimCrit[v]) do
			        if y == crit then
		                tremove(TA.optimCrit[v],x)
				    end
			    end
			    if #TA.optimCrit[v] == 0 then
				    if not TA:IsSpecialEvent(v) then
					    TA.frame:UnregisterEvent(v);
				    end
				    TA.optimCrit[v] = nil;
			    end
			end
		end
	end

	if crit.events and not crit.parent.lateCheck then
		for k,v in ipairs(crit.events) do
		    if TA.events[v] then
			    for x,y in ipairs(TA.events[v]) do
			    	if y == crit then
				    	tremove(TA.events[v],x);
				    end
			    end
			    if #TA.events[v] == 0 then
				    if not TA:IsSpecialEvent(v) then
					    TA.frame:UnregisterEvent(v);
				    end
				    TA.events[v] = nil;
			    end
			else
			    TAchik_Print("Paradox ! : Achievement "..crit.parent.name.. " completed in weird way !","error")
			end
		end
	end


	if AchievementFrame and AchievementFrame:IsShown() then
		AchievementFrameAchievements_ForceUpdate();
	end

	if crit.parent.tracked then
		WatchFrame_Update();
	end

	TA:CheckComplete(crit.parent,false);

end

function TA:CompleteCriteria(id, key)
	local crit = TA.crits[id or TA.critsKeys[key:upper()]]
	if crit then
	    TA:CritComplete(crit);
	else
	    TAchik_Print("Hibás Criteria ID!","error")
	end
end

function TA:ResetAchievements()
    for k,v in pairs(TA.achis) do
        if v.complete and v.key then
            if v.save.achisCompletedMerged == nil then
                TA:UnCompleteAchievement(v.id)
            end
        else
            for c,d in pairs(v.criteria) do
                if d.parent ~= nil and ( d.parent.save.critsCompletedMerged == nil or ( d.parent.save.critsCompletedMerged[d.key] ~= true ) ) then
                    TA:UnCompleteAchievementCriteria(d)
                end
            end
        end
    end
end

function TA:GetNumCompletedAchievements(showAll)
    local total = 0
    local completed = 0
	for k,v in pairs(TA.achis) do
		if v.complete then
		    completed = completed + 1
			total = total + 1
		elseif not v.invisible then
		    if showAll == nil or showAll == true then
			    total = total + 1
			else
			    if v.previous then
			        if TA.achis[v.previous].complete then
			            total = total + 1
			        end
			    else
			        total = total + 1
			    end
			end
		end
	end
	return total,completed
end

function TA:GetTotalAchievementPoints(returnMerged)
    local totalPoints = 0
	for k,v in pairs(TA.achis) do
		if v.complete or returnMerged and v.save.achisCompletedMerged and v.save.achisCompletedMerged[v.key] then
			totalPoints = totalPoints + v.points
		end
    end
	return totalPoints
end

function TA:GetTotalAchievementPointsOf(guid)
    local totalPoints = 0
	local getPoints = 0
	local db = TAchik.Realms[GetRealmName()].Characters[guid]
	local ac = TAchik[TA:GetBattlegroupName(GetRealmName())].AccountWide
	if db then
	    for k,v in pairs(TA.achis) do
		    if db.achis[v.key] or ac.achis[v.key] or ( TAchik.merged and TA:GetAchievementInfoOnAccount(v,v.key) ~= nil ) then
			    totalPoints = totalPoints + select(4,TA:GetAchievementDependentInfo(v,db.character.race,db.character.sex))
				if not v.complete and not v.accountWide and not v.unmergeable and not v.lateCheck then
				    getPoints = getPoints + v.points
				end
			end
	    end
		for k,v in pairs(TA.inexistent) do
		    if db.achis[v.key] or ac.achis[v.key] or ( TAchik.merged and TA:GetAchievementInfoOnAccount(v,v.key) ~= nil ) then
			    totalPoints = totalPoints + v.points
				if not v.complete and not v.accountWide and not v.unmergeable then
				    getPoints = getPoints + v.points
				end
			end
		end
	end
	return totalPoints,getPoints
end

function TA:CheckComplete(achi,startup)
    if not achi.complete or achi.mergers then
	    local numCrits = 0;
	    local numRequired = 0
		local numMerged = 0
		for k,v in ipairs(achi.criteria) do
			if TA.crits[v.id] then
			    numRequired = numRequired + 1
				if achi.mergers and achi.complete then
				    if achi.save.critsCompletedMerged then
                        if not achi.save.critsCompletedMerged[v.key] then
						    numCrits = numCrits + 1
						else
						    numMerged = numMerged + 1
						end
					else
                        numCrits = numCrits + 1;
					end
				else
			        if TA.crits[v.id].complete then
				        numCrits = numCrits + 1;
						if achi.save.critsCompletedMerged and achi.save.critsCompletedMerged[v.key] then
						    numMerged = numMerged + 1
						end
				    end
				end
			end
		end
		if numCrits >= ( achi.required or numRequired ) then
			TA:CompleteAchievement(achi.id,nil,startup)
        elseif achi.mergers and numMerged == 0 then
		    achi.mergers = nil
		end
	end
end

function TA:RegisterEvent(criteria,events)
    if type(events) == "string" then events = { events } end
    for e=1,#events do
	    if not TA.events[events[e]] then
		    TA.events[events[e]] = {};
			if not TA:IsSpecialEvent(events[e]) then
			    TA.frame:RegisterEvent(events[e]);
			    TAchik_Print("InstanceScript Registering Event : "..events[e],"debug")
			end
	    end
	    if not tContains(TA.events[events[e]],criteria) then
		    TAchik_Print("InstanceScript Registering Event : "..events[e].." for achievement "..criteria.parent.name,"debug")
			tinsert(TA.events[events[e]],criteria);
		end
	end
end

function TA:UnRegisterEvent(criteria,events)
    if type(events) == "string" then events = { events } end
    for e=1,#events do
        if TA.events[events[e]] ~= nil then
		    for x,y in ipairs(TA.events[events[e]]) do
			    if y == criteria then
				    tremove(TA.events[events[e]],x);
				    TAchik_Print("InstanceScript UnRegistering Event : "..events[e].." for achievement "..criteria.parent.name,"debug")
				end
			end
			if #TA.events[events[e]] == 0 then
		        if not TA:IsSpecialEvent(events[e]) then
				    TA.frame:UnregisterEvent(events[e]);
				    TAchik_Print("InstaneScript UnRegistering Event : "..events[e],"debug")
				end
				TA.events[events[e]] = nil;
			end
		end
	end
end

function TA:IsCheckedEvent(event)
    return TA.events[event] or TA.eventsAchi[event] or TA.optimAchi[event] or TA.optimCrit[event]
end

function TA:GetEventsCalled()
    local ret = ""
	local eventsDat = {}
	for i,v in pairs(TA.calledEvents) do
	    local key = v.key
		local ev = eventsDat[v.event]
	    if ev then
			if ev[key] then
                ev[key] = ev[key] + 1
			else
                ev[key] = 1
			end
		else
		    eventsDat[v.event] = { [key] =  1 }
		end
	end
	for a,b in pairs(eventsDat) do
         -- a is the Event name , b is the table containing the keys
		 for i,e in pairs(b) do
		     -- i is the Key name , e is the counter
             ret = i.."->"..a.."(x"..e..")"..","..ret
		 end
	end
	return ret;
end

function TA:ClearCalledEvents()
    TA.calledEvents = {}
end



function TA.OnEvent(self, event,...)
    if TA.optimAchi[event] then
		local validate = {}
	    for n=1,#TA.optimAchi[event] do
            tinsert(validate,TA.optimAchi[event][n])
			TAchik_Print("OptimAchiEvent called by ["..tostring(TA.optimAchi[event][n].key).."] "..tostring(TA.optimAchi[event][n].name).." event "..event,"debug")
		end
		for i=1,#validate do
	        TA:ValidateAchievement(validate[i])
		end
	end
	if TA.optimCrit[event] then
	    local validate = {}
	    for n=1,#TA.optimCrit[event] do
			tinsert(validate,TA.optimCrit[event][n])
			TAchik_Print("OptimAchiEvent called by ["..tostring(TA.optimCrit[event][n].key).."] "..tostring(TA.optimCrit[event][n].name).." event "..event,"debug")
		end
		for i=1,#validate do
			TA:ValidateCriteria(validate[i],nil,event)
		end
	end
    if TA.eventsAchi[event] then
	    for n=#TA.eventsAchi[event],1,-1 do
		    local achi = TA.eventsAchi[event][n];
			if not achi.complete or achi.mergers then
			    if achi.resetOnDeath and UnitIsDeadOrGhost("player") then
			        TAchik_Print("Uncompleting "..achi.name.." due to playerDeath","debug")
			        TA:UnCompleteAchievement(achi.id)
			    end
			    if achi.resetOnWipe then
				    if TAchik_PlayerHasWiped() or ( not TAchik_PlayerInCombat() ) then
				        local reason = "unknown"
					    if TAchik_PlayerHasWiped() then
					        reason = " playerWipe"
					    elseif not TAchik_PlayerInCombat() then
					        reason = " offCombat"
				        end
					    TAchik_Print("Uncompleting ["..event.."]"..achi.name.." due to "..reason,"debug")
					    TA:UnCompleteAchievement(achi.id)
				    end
				end
		    end
		end
	end
    if TA.events[event] then
		for n=#TA.events[event],1,-1 do
			local crit = TA.events[event][n];
			local state = crit.objective(crit, event, ...);
			crit.key = crit.key or "noKey"
			TAchik_Print("Event called by ["..crit.key.."] "..crit.parent.name.." event "..event,"debug")
	        if TAchik_Profiling_Logger_Enabled then
                tinsert(TA.calledEvents,{ ["key"] = crit.key , ["event"] = event });
	        end
			if state then
			    if not crit.achievement or TA.achis[crit.achievement].mergers == nil then
				    TA:CritComplete(crit,nil);
				end
			else

			    if crit.parent.tracked then
			        WatchFrame_Update()
			    end

			    if crit.key and crit.variable ~= nil then
			        if not crit.parent.save.variables then
			            crit.parent.save.variables = {}
			        end
					if crit.parent.save.variables[crit.key] ~= nil then
					    if not TA:VariableSame(crit.variable,crit.parent.save.variables[crit.key]) then
			                crit.parent.save.variables[crit.key] = crit.variable
						end
			        else
					    if not TA:VariableSame(crit.variable,crit.resetTemplate) then
						    crit.parent.save.variables[crit.key] = crit.variable
					    end
					end
			    end

				-- Wipe-Reset System --
				if crit.resetOnDeath and UnitIsDeadOrGhost("player") then
					TAchik_Print("Uncompleting "..crit.key.." due to playerDeath","debug")
					TA:UnCompleteAchievementCriteria(crit)
			    end
			    if crit.resetOnWipe and ( event == "PLAYER_ENTERING_WORLD" or event == "PLAYER_REGEN_ENABLED" ) then
     				if crit.activator == nil or ( crit.activator and TA.crits[crit.activator].complete ) then
				        if TAchik_PlayerHasWiped() or ( not TAchik_PlayerInCombat() ) then
						    local reason = "unknown"
							if TAchik_PlayerHasWiped() then
							    reason = " playerWipe"
							elseif not TAchik_PlayerInCombat() then
							    reason = " offCombat"
							end
					        TAchik_Print("Uncompleting ["..event.."]"..crit.key.." due to "..reason,"debug")
					        TA:UnCompleteAchievementCriteria(crit)
					    end
				    end
				end
				-- Wipe-Reset System --

			    -----------------------------MERGE SYSTEM---------------------------------------------
			    if crit.variable ~= nil and not crit.complete then
			        --- TRY OBJECTIVE WITH MERGE SYSTEM ---
			        if crit.mergeable and TAchik.merged then
			            local saveVar,mergers = table.copy(crit.variable)
                        crit.variable , mergers = TA:MergeCriteriaVariableData(crit)
                        local state = crit.objective(crit,"CHECK_MERGED");
			            crit.variable = saveVar
                        if state then
				            TA:CritComplete(crit,mergers);
				            TAchik_Print("Criteria "..crit.key.." completed due to Merge","debug")
			            elseif crit.parent.tracked then
			                WatchFrame_Update()
			            end
			        end
			        --- TRY OBJECTIVE WITH MERGE SYSTEM ---
			    end
			    -----------------------------MERGE SYSTEM---------------------------------------------
			end
			if AchievementFrameAchievements then
			    if AchievementFrameAchievements.selection == crit.parent.id then
		 	        AchievementFrameAchievements_ForceUpdate()
                end
	    	end
		end
    end
end
TA.frame:SetScript("OnEvent",TA.OnEvent);


function TA:ManageAchievements(v)
	for c,d in pairs(TA.removedAchis) do
	    tinsert(v.achis,d)
	end
    local toremove = {}
	TA.removedAchis = {}
	for a,b in ipairs(v.achis) do
	    local _, _, _, comp = GetAchievementInfo(b);
		if comp then
			local id, state = GetNextAchievement(b);
			if state then
				tinsert(toremove,b)
			end
		else
			local id = GetPreviousAchievement(b);
			local _, _, _, state = GetAchievementInfo(id);
			if id then
                if not state then
				    tinsert(toremove,b)
				end
			end
		end
	end
	for i=1,#toremove do
	    for a,c in pairs(v.achis) do
		    if toremove[i] == c then
		        tinsert(TA.removedAchis,c)
		        tremove(v.achis,a)
			end
		end
	end
end

function TA:SortCategories(cat,uncompletion)
    if cat then
		TA:ManageAchievements(TA.cats[cat])
		table.sort(TA.cats[cat].achis,TA.SortAchievements);
	else
        for k,v in pairs(TA.cats) do
			TA:ManageAchievements(v)
			table.sort(v.achis,TA.SortAchievements);
		end
	end
end

function TA:GetTauriUNIX(get)
    if get then
        return get + TA_UNIX
	else
	    return time() - TA_UNIX
	end
end



function TA:GetSetting(settingString)
    return TAchik["SETTINGS"][settingString]
end


local function SendNearAlert(achi)
	if GetChannelName("TAchiComm") == 0 or GetChannelName("TAchiComm") == nil then
		JoinChannelByName("TAchiComm")
	end
	local x,y = GetPlayerMapPosition("player")
	x = floor(x*100)
	y = floor(y*100)
	local zone = GetMapInfo() or ""
	local bitset = TA:GetCriteriaStateBitSet(achi.id)
	if TAchik_CanUseChannel() then
	    SendChatMessage("Get: "..TA.achis[achi.id].name.."#"..x.."#"..y.."#"..tostring(IsInInstance()).."#"..zone.."#"..achi.key.."#"..bitset,"CHANNEL",nil,GetChannelName("TAchiComm"))
    end
end

function TA:CompleteAchievement(id,key,startup)

	local achi = TA.achis[id or TA.achisKeys[key:upper()]]

	if ( achi and achi.complete and not achi.mergers ) or not achi then
	    if key then
	        TAchik_Print("Az achi nem létezik vagy már készen van "..tostring(id).." / "..tostring(key),"error")
		end
	    return
    end

	if achi.previous then
	    TA:CompleteAchievement(GetPreviousAchievement(achi.id),nil,startup)
	end

	if achi.requiredEvents then
	    for k,v in pairs(achi.requiredEvents) do
		    if TA.optimAchi[v] then
		        for x,y in pairs(TA.optimAchi[v]) do
			        if y == achi then
		                tremove(TA.optimAchi[v],x)
				    end
			    end
				if #TA.optimAchi[v] == 0 then
				    if not TA:IsSpecialEvent(v) then
					    TA.frame:UnregisterEvent(v);
				    end
				    TA.optimAchi[v] = nil;
			    end
			end
		end
	end

	if not startup then
		if not AchievementFrame then
			AchievementFrame_LoadUI()
		end
		AchievementAlertFrame_ShowAlert(achi.id)
		if IsInGuild() and TA:GetSetting("boolBroadCastGuild") then
		    SendChatMessage("megszerezte a(z) "..GetAchievementLink(achi.id).." TauriAchit!","GUILD");
		end
		TAchik_WaitForFunction(1,SendNearAlert,achi)
	end

	if achi.save and achi.key then
		achi.save.achis[achi.key] = TA:GetTauriUNIX()
		local found = false
		for k,v in ipairs(achi.criteria) do
		    -- If atleast 1 criteria was completed thanks to mergeing
            if achi.save.critsCompletedMerged and achi.save.critsCompletedMerged[v.key] ~= nil then
			    if not achi.save.achisCompletedMerged then
			        achi.save.achisCompletedMerged = {}
			    end
	            achi.save.achisCompletedMerged[achi.key] = achi.save.critsCompletedMerged[v.key]
				found = true
	            break
	        end
	    end
        if not found or achi.complete then
		    if achi.save.achisCompletedMerged and achi.save.achisCompletedMerged[achi.key] then
			    achi.save.achisCompletedMerged[achi.key] = nil
				achi.mergers = nil
			end
		end
	end

	achi.complete = TA:TimeStampToDate(time())
	achi.completeTime = TA:GetTauriUNIX()

	if achi.tracked then
		RemoveTrackedAchievement(achi.id);
		WatchFrame_Update();
	end

	if achi.invisible then
		tinsert(TA.cats[achi.category].achis,achi.id);
	end

	if not achi.lateComplete then
	    for k,v in ipairs(achi.criteria) do
		    if TA.crits[v.id] and not TA.crits[v.id].complete then
			    TA:CritComplete(v,nil,true)
		    end
		end
	end

	if TA:IsCheckedEvent("TA_ACHIEVEMENT_EARNED") then
	    TA.OnEvent(nil,"TA_ACHIEVEMENT_EARNED",achi);
    end

	TA:SortCategories(achi.category)

	if not startup then
	    AchievementFrameSummaryCategoriesStatusBar_Update()
		AchievementFrameSummary_UpdateAchievements()
		AchievementFrameAchievements_ForceUpdate()
	end
end


local function Initialize()

    TAchik = TAchik or  { ["online"] = {} }

    TAchik["LastVersion"] = TAchik["LastVersion"] or TAchik_DBVersion
    if not TAchik["LastUpdate"] then
        TAchik["LastUpdate"] = TAchik_DBVersion
    end
    if TAchik["LastUpdate"] and tonumber(TAchik["LastUpdate"]) < tonumber(TAchik_DBVersion) then
        TAchik["LastVersion"] = TAchik["LastUpdate"]
        TAchik["LastUpdate"] = TAchik_DBVersion
    end

    TAchik["Realms"] = TAchik["Realms"] or {}
    TAchik.Realms[GetRealmName()] = TAchik.Realms[GetRealmName()] or {}
	TAchik.Realms[GetRealmName()]["Characters"] = TAchik.Realms[GetRealmName()]["Characters"] or {}
    TAchik.Realms[GetRealmName()].Characters[UnitGUID("player")] = TAchik.Realms[GetRealmName()].Characters[UnitGUID("player")] or {}

	if not TAchik["SETTINGS"] then TAchik["SETTINGS"] = {} end

    TAchik.Realms[GetRealmName()].Characters[UnitGUID("player")].character =
    {
       ["name"] = UnitName("player"),
       ["guid"] = UnitGUID("player"),
	   ["class"] = UnitClass("player"),
	   ["race"] = UnitRace("player"),
	   ["sex"] = UnitSex("player")
    }

    TA.onlinePlayers = TAchik.online

    ------------------------ Fun Achievements ----------------------
	TA_FUN = TA:AddCategory("Általános ")
	    TA_FUN_GENERAL= TA:AddCategory("Szórakoztató ",TA_FUN)
	    --TA_FUN_MAILBOX = TA:AddCategory("Postaládás ",TA_FUN)
		--TA_FUN_VISITOR = TA:AddCategory("Látogatós ",TA_FUN)
	------------------------ Fun Achievements ----------------------

	------------------------ PvP Achievements ----------------------
	--TA_PVP = TA:AddCategory("Player vs Player ")
	    --TA_PVP_GENERAL = TA:AddCategory("Általános ",TA_PVP)
	    --TA_PVP_WSG = TA:AddCategory("Warsong Gulch ",TA_PVP)
	    --TA_PVP_AB = TA:AddCategory("Arathi Basin ",TA_PVP)
	    --TA_PVP_EOS = TA:AddCategory("Eye of the Storm ",TA_PVP)
	    --TA_PVP_AV = TA:AddCategory("Alterac Valley ",TA_PVP)
	    --TA_PVP_SOTA = TA:AddCategory("Strand of the Ancients ",TA_PVP)
	    --TA_PVP_IOC = TA:AddCategory("Isle of Conquest ",TA_PVP)
	    --TA_PVP_WG = TA:AddCategory("Wintergrasp ",TA_PVP)
	------------------------ PvP Achievements ----------------------

	------------------------ PvE Achievements ----------------------
	--TA_PVE = TA:AddCategory("Dungeon és Raid ")
	   -- TA_PVE_GENERAL = TA:AddCategory("Általános ",TA_PVE)
	   -- TA_PVE_DUNG = TA:AddCategory("Dungeon ",TA_PVE)
	    --TA_PVE_RAID10 = TA:AddCategory("Raid (10 fös) ",TA_PVE)
	    --TA_PVE_RAID25 = TA:AddCategory("Raid (25 fös) ",TA_PVE)
    ------------------------ PvE Achievements ----------------------

    ------------------------ Quest Achievements ----------------------
	--[[
	TA_QUESTS = TA:AddCategory("Küldetések ")
	    TA_QUESTS_GENERAL = TA:AddCategory("Általános ",TA_QUESTS)
	    TA_QUESTS_GENERAL_10 = TA:AddCategory("LvL 1-10",TA_QUESTS)
	    TA_QUESTS_GENERAL_20 = TA:AddCategory("LvL 10-20",TA_QUESTS)
	    TA_QUESTS_GENERAL_30 = TA:AddCategory("LvL 20-30",TA_QUESTS)
		TA_QUESTS_GENERAL_40 = TA:AddCategory("LvL 30-40",TA_QUESTS)
		TA_QUESTS_GENERAL_50 = TA:AddCategory("LvL 40-50",TA_QUESTS)
        TA_QUESTS_GENERAL_60 = TA:AddCategory("LvL 50-60",TA_QUESTS)
	    TA_QUESTS_CAPITALS = TA:AddCategory("Fövárosok ",TA_QUESTS)
	    TA_QUESTS_KALIMDOR = TA:AddCategory("Kalimdor ",TA_QUESTS)
        TA_QUESTS_EASTERN_KINGDOMS = TA:AddCategory("Eastern Kingdoms ",TA_QUESTS)
	]]--
	------------------------ Quest Achievements ----------------------

	------------------------ Arena Achievements ----------------------
	--TA_ARENA = TA:AddCategory("Aréna ")
	    --TA_ARENA_SETUP = TA:AddCategory("Párosítások ",TA_ARENA)
	------------------------ Arena Achievements ----------------------

	----------------------- Class Achievements ---------------------
	--TA_CLASS = TA:AddCategory("Kaszt ")
	    --TA_CLASS_DK = TA:AddCategory("Death Knight ",TA_CLASS)
	    --TA_CLASS_DRUID = TA:AddCategory("Druid ",TA_CLASS)
	    --TA_CLASS_HUNTER = TA:AddCategory("Hunter ",TA_CLASS)
	    --TA_CLASS_MAGE = TA:AddCategory("Mage ",TA_CLASS)
	    --TA_CLASS_MONK = TA:AddCategory("Monk ",TA_CLASS)
	    --TA_CLASS_PALADIN = TA:AddCategory("Paladin ",TA_CLASS)
	    --TA_CLASS_PRIEST = TA:AddCategory("Priest ",TA_CLASS)
		--TA_CLASS_ROGUE = TA:AddCategory("Rogue ",TA_CLASS)
	    --TA_CLASS_SHAMAN = TA:AddCategory("Shaman ",TA_CLASS)
	    --TA_CLASS_WARLOCK = TA:AddCategory("Warlock ",TA_CLASS)
	    --TA_CLASS_WARRIOR = TA:AddCategory("Warrior ",TA_CLASS)
	----------------------- Class Achievements ---------------------

    ------------------------ Hidden Achievements ----------------------
	--TA_HIDDEN = TA:AddCategory("Titkos")
	------------------------ Hidden Achievements ----------------------

end

------------------------------------------------------ HOOKS ------------------------------------------------------------
function TAchik_JumpHook()
    if not IsFalling() and not IsFlying()  then
	    if not( UnitInVehicle("player") or IsMounted()) then
            if TA:IsCheckedEvent("PLAYER_JUMP") then
                TA.OnEvent(nil,"PLAYER_JUMP",nil);
	        end
		else
		    if TA:IsCheckedEvent("PLAYER_JUMP") then
                TA.OnEvent(nil,"MOUNT_JUMP",nil);
	        end
		end
	end
end
function TAchik_TooltipHook()

	if (UnitIsFriend("player","mouseover") and UnitIsPlayer("mouseover") and UnitIsConnected("mouseover")) then
	    SendAddonMessage("TAchiVersion","Request","WHISPER",select(1, GameTooltip:GetUnit()))
    end

	if ((GameTooltip:GetUnit() == "Exedru") or (GameTooltip:GetUnit() == "Executioner")) then
	    GameTooltip:AddLine(" - A megváltó - ",0.85, 0.85, 0)
	elseif ((GameTooltip:GetUnit() == "Bliser")) then
	    GameTooltip:AddLine(" - A megalkotó - ",0.85, 0.85, 0)
	end

end
----------------------------------------------------- HOOKS ------------------------------------------------------------

local function AddGuildAchievements()
	-- Guild --
    TA:AddAchievement_Gbmoney()
	TA:AddAchievement_GuildAchievements()

	TA:SortCategories(TA_GUILD)
end

local function AddAchievements()

    TAchik_Print("Adding TauriAchievements","debug")

	TA:AddAchievement_KockaProblem()
	
	--[[
    TA:AddAchievement_AzEnNapom()
    TA:AddAchievement_Alkoholista()
    TA:AddAchievement_AzAnyag()
	TA:AddAchievement_BigMac()
    TA:AddAchievement_CsakNemTeAchi()
	TA:AddAchievement_DalaranAviatikus()
	TA:AddAchievement_DuplaSzivarvany()
	TA:AddAchievement_EledesMestere()
	TA:AddAchievement_Fenykepesz()
	TA:AddAchievement_HaljMeg()
	TA:AddAchievement_HelloSzia()
	TA:AddAchievement_StylistMeleg()
	TA:AddAchievemetn_Hopuskas()
	TA:AddAchievement_OnlinePlayersAchievements()
	TA:AddAchievement_SpeedClick()
	TA:AddAchievement_RayOfDarkness()
	TA:AddAchievement_ThankPlayerAchievements()
	TA:AddAchievement_JawsBosszuja()
	TA:AddAchievement_UgriBugri()
	TA:AddAchievement_OroszRulett()
	TA:AddAchievement_Serpenyo()
	TA:AddAchievement_YouTouchMyTralalalala()
	TA:AddAchievement_PostasAchik()
	TA:AddAchievement_KozszolgaloFelcser()
	TA:AddAchievement_Robotkodo()
	TA:AddAchievement_Broker()
	TA:AddAchievement_Forgalmisav()
	TA:AddAchievement_Ottvagyunk()
	TA:AddAchievement_Maelstrom()
	TA:AddAchievement_SaluteMagyar()
    TA:AddAchievement_AfkCity()
	TA:AddAchievement_MyHorse()
	TA:AddAchievement_Freeze()
	TA:AddAchievement_CsakFlex()
	
	]]--

	-- Classes --
		--Shaman--
		--TA:AddAchievement_NonCombatBL()
		--TA:AddAchievement_KillWithWater()
		--Warlock--
        --TA:AddAchievement_ForeverTogether()


    -- Quests --
	--[[
	TA:AddAchievement_Level10()
	TA:AddAchievement_Level20()
	TA:AddAchievement_Level30()
	TA:AddAchievement_Level40()
	TA:AddAchievement_Level50()
	TA:AddAchievement_Level60()
    TA:AddAchievement_LoremasterBreakdown()
	TA:AddAchievement_LoremasterMeta()
	--TA:AddAchievement_Pedobear()

	-- Arena --
	TA:AddAchievement_ArenaAchievements()
	TA:AddAchievement_ArenaGyujto()
	TA:AddAchievement_QuickArena()
	TA:AddAchievement_KicsitMegbecsuli()



	-- Player vs Player --
	TA:Achievement_AddCsatazuzo()
	TA:AddAchievement_SzarnyasokFejvadasza()
	TA:AddAchievement_BgAchievements()
	TA:AddAchievement_Felcser()
	TA:AddAchievement_Sorozatgyilkos()
	TA:AddAchievement_Stranglethorn()
	TA:AddAchievement_EndlessCombat()
	TA:AddAchievement_DeadLooter()


		-- SotA--
		TA:AddAchievement_Baywatch()
		TA:AddAchievement_Husdaralo()
		TA:AddAchievement_Carmageddon()


	    -- WsG --
		TA:AddAchievement_FlagVsFlag()
		TA:AddAchievement_HiroshimaGulch()
		TA:AddAchievement_KellAHonor()
		TA:AddAchievement_Osszpontositott()
		TA:AddAchievement_TeamFortress()


		-- Arathi --
		TA:AddAchievement_BuffBasin()
		TA:AddAchievement_ArathiQuickCap()
		TA:AddAchievement_JamesBasin()


		-- EoS --
		TA:AddAchievement_ForestFuss()

		-- AV --
		--TA:AddAchievement_Jenkins()

		-- WG --
		--TA:AddAchievement_HarcmezeiKonyhamuvesz()

	TA:AddAchievement_HeroNapja()

	-- PvE --
	    -- Dungeon General --
	    TA:AddAchievement_Haladjunk()
	    TA:AddAchievement_EtiopKisgyerek()
	    TA:AddAchievement_RongyosJoe()
		TA:AddAchievement_ElveszettInstak()


	    -- Dungeon 5 Man --
	    TA:AddAchievement_AnubeJump()
	    TA:AddAchievement_ControlledDeconstruction()
	    TA:AddAchievement_HalalosAjandek()
	    TA:AddAchievement_SuperGauntlet()
	    TA:AddAchievement_SzentCsapas()
	    TA:AddAchievement_VisszaAhonnan()
	    TA:AddAchievement_TakardSzemed()
		TA:AddAchievement_Slowmotion()
		TA:AddAchievement_ReflectionPortals()
	    --TA:AddAchievement_DungeonGyujto()



	-- Secret
	TA:AddAchievement_MernokUr()
	TA:AddAchievement_Kussolja()
	TA:AddAchievement_Pentek()
	TA:AddAchievement_Tafirst()
	TA:AddAchievement_Csillap()
	TA:AddAchievement_Everydayimshufflin()
	TA:AddAchievement_AchiWhore()

	TA:AddAchievement_TauriPoints()
	
	]]--

    TAchik_Print("Addition of TauriAchievements finished","debug")
    TA.OnEvent(nil,"PLAYER_ENTERING_WORLD",nil)
    hooksecurefunc("JumpOrAscendStart",TAchik_JumpHook)
    TAchik_WaitForFunction(1,TAchik_Ping)
	TA:SortCategories()

end

function TA:GetVersion()
    return TAchik_DBVersion
end

local function HandleAddonMsg(...)
    if arg1 == "TAchik_Data" then
		local achievementData = split(arg2,",")
		local key = achievementData[1]
		local unix = TA:GetTauriUNIX(tonumber(achievementData[2]))
		local cDate = TA:TimeStampToDate(unix)
		local awDone = achievementData[3]
		local points = tonumber(achievementData[4])
		TA.comparisonData[key]=
		{
			["month"] =  cDate[2],
			["day"] = cDate[1],
			["year"] = cDate[3],
			["unix"] = unix,
			["awDone"] = awDone,
		}
	elseif arg1 == "TAchik_Need" then
        local total = tostring(select(2,TA:GetNumCompletedAchievements(true)))
		for _,v in pairs(TA.achis) do
			if v.complete then
			    local c = tostring(v.completeTime)
				local mergers = TA:MergersToString(v.mergers)
				local sendString = v.key..","..c..","..mergers
				SendAddonMessage("TAchik_Data",sendString, "WHISPER" , arg4)
			end
		end
		SendAddonMessage("TAchik_End", UnitRace("player").."/"..UnitSex("player").."/"..total, "WHISPER" , arg4)
	elseif arg1 == "TAchik_End" then
		TA.comparisonData.comparisonEnded = true
		if TA.events["INSPECT_ACHIEVEMENT_TAURIACHIK"] then
			TA.OnEvent(nil, "INSPECT_ACHIEVEMENT_TAURIACHIK",arg4);
		end
		if TA.farCompare then
		    if not AchievementFrame then
			    AchievementFrame_LoadUI()
			end
			TA.farCompare = nil
		    local race, sex , count = strsplit("/",arg2)
		    sex = TAchik_GetUnitSexName(tonumber(sex))
		    InspectAchievements(arg4)
		    TA.comparisonData.numAchievements = tonumber(count)
		    TA.comparisonData.sex = sex
		    TA.comparisonData.race = race
		    customTexture = TAchik_CustomIcons[TAchik_GetFactionGroupFromRace(race)][race][sex]["FRIZURAS"]
		    AchievementFrameComparisonHeaderPortrait:SetTexture(customTexture)
		    AchievementFrameComparisonHeaderName:SetText(arg4);
		    AchievementFrameComparisonTab_OnClick(3)
		end
		if TauriAchikTab then
			TauriAchikTab:SetAlpha(1)
		end
	elseif arg1 == "TAchik_GuildGet" then
		if TA:IsNormalFunction(arg2) then
			--SendAddonMessage("TAchik_GuildSend"..arg2,TA:GetFunctionData(arg2), "WHISPER" , arg4)
		end
	elseif arg1 == "TAchik_LinkRequest" then
		local parsed = TA:GetLinkFromString(arg2,UnitName("player"))
		SendAddonMessage("TAchik_LinkData",parsed,"WHISPER",arg4)
	elseif arg1 == "TAchik_LinkData" then
		for c=1,#TA.msgQueue do
			if TA.msgQueue[c] and TA.msgQueue[c].user == arg4 then
				oldChatFrame_MessageEventHandler(
				    TA.msgQueue[c].self,
				    TA.msgQueue[c].event,
				    arg2,
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
				    TA.msgQueue[c].arg12
				)
				tremove(TA.msgQueue,c)
			end
		end
	elseif arg1 == "TAchik_GuildNew" then
		if TA:IsCheckedEvent("TACHIK_GMEMBER_CAME_ONLINE") then
			TA.OnEvent(nil,"TACHIK_GMEMBER_CAME_ONLINE",nil);
		end
	elseif arg1 == "TAchik_GetVer" then
		SendAddonMessage("TAchik_Ver",TA:GetVersion(),"WHISPER",arg4)
	elseif arg1 == "TAchik_Ver" then
		TAchik_Print(arg4.." verziója : "..arg2)
	end
end

local function HandleChannelMsg(...)
    if arg9 == "TAchiComm" and arg2 ~= UnitName("player") then
		if arg1:find("Get:") then
			TA:ParseOtherPlayerAchievementGet(arg1,arg2)
		elseif arg1:find("%[ANNOUNCE%]") then
			TAchik_Print("Bejelentés:"..strsub(arg1,11,strlen(arg1)),"alert")
		elseif arg1:find("ping") or arg1:find("orah") then
			TAchik_Print("Ping : "..arg2,"debug") -- Remove from final release
			if TA:IsCheckedEvent("TACHIK_PING") then
				TA.OnEvent(nil,"TACHIK_PING",nil);
			end
			local playerRef
			for k,v in pairs(TA.onlinePlayers) do
			    if v.name == arg2 then
				    playerRef = v
					break
				end
			end
			local data = split(arg1,"#")
			local points = tostring(data[2])
			local guild = tostring(data[3])
			if not playerRef then
				TAchik_Print("Adding player "..arg2.." with guild : "..guild.." ( points = "..points.." , at time = "..time().." )","debug")
				tinsert(TA.onlinePlayers, { ["name"] = arg2 , ["time"] = time() , ["points"] = points , ["guild"] = guild  } )
			else
				TAchik_Print("Updating player "..arg2.." with guild : "..guild.." ( points = "..points.." , at time = "..time(),"debug")
				playerRef.points = points
				playerRef.guild = guild
			    playerRef.time = time()
			end
		end
	end
end


local function SendOnlineMsg()
    if not TA.sentOnline then
		for t=1,GetNumGuildMembers() do
			name,_,_,_,_,_,_,_,online = GetGuildRosterInfo(t)
			if online and ( not IsIgnored(name) ) then
				SendAddonMessage("GuildDataIAmOnline", tostring(time()) , "WHISPER" , name)
			end
		end
		TA.sentOnline = true
	end
end

local function HandleGuildUpdate()
    if GetGuildInfo("player") then
        TA.lastGuildRosterUpdate = time()
		TAchik_WaitForFunction(5,SendOnlineMsg)
		if not TA.guildAdded then
		    --TAchik_AddGuildAchievements()
		    TA.guildAdded = true
	    end
	end
end

local function HandleNewArea()
    if TA.enteredTime then
		if TA.lastInstance ~= TAchik_GetInstanceFromCurrentZone() then
			if TAchik_PlayerIsInBattleground() then
				if TA:IsCheckedEvent("ENTER_BATTLEGROUND") then
					TA.OnEvent(nil,"ENTER_BATTLEGROUND",nil);
				end
			else
			    if TA:IsCheckedEvent("LEAVE_BATTLEGROUND") then
					TA.OnEvent(nil,"LEAVE_BATTLEGROUND",nil);
				end
			end
			if TA:IsCheckedEvent("INSTANCE_CHANGED") then
				TA.OnEvent(nil,"INSTANCE_CHANGED",nil);
			end
			TA.lastInstance = TAchik_GetInstanceFromCurrentZone()
		end
	end
end

local TAchik_CoreFrame = CreateFrame("Frame","TAchik_CoreFrame",UIParent)
local function TAchik_CoreOnEvent(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
	    HandleAddonMsg(...)
	elseif event == "CHAT_MSG_CHANNEL" then
        HandleChannelMsg(...)
	elseif event == "INSPECT_ACHIEVEMENT_READY" then
		if not TA.comparisonData.comparisonEnded then
		    if TauriAchikTab then
			    TauriAchikTab:SetAlpha(0)
			end
			TA:RequestComparisonAchievementData()
		else
			TA.comparisonData.numAchievements = 0
		end
	elseif event == "QUEST_QUERY_COMPLETE" then
		TA.compQuests.table = GetQuestsCompleted()
		if TA:IsCheckedEvent("QUESTDATA_UPDATED") then
			TA.OnEvent(nil,"QUESTDATA_UPDATED",nil);
		end
	elseif event == "QUEST_FINISHED" then
	    QueryQuestsCompleted()
	elseif event == "PLAYER_TARGET_CHANGED" then
	    TA.comparisonData.comparisonEnded = false
	elseif event == "ZONE_CHANGED_NEW_AREA" then
	    HandleNewArea()
	elseif event == "PLAYER_ENTERING_WORLD" then
		TA.enteredTime = time()
		if not TA.intiliazed then
			Initialize()
	    	TA.lastInstance = TAchik_GetInstanceFromCurrentZone()
			AddAchievements()
			QueryQuestsCompleted()
			TA.intiliazed = true
		else
            HandleNewArea()
		end
	elseif event == "ADDON_LOADED" then
		local name = ...;
		if name == "TauriAchik" then
			TAchik_OverWriteWatchFrame()
		elseif name == "Blizzard_AchievementUI" then
			TAchik_OverWriteScript()
		end
	end
end

TAchik_CoreFrame:SetScript("OnEvent",TAchik_CoreOnEvent);
TAchik_CoreFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
TAchik_CoreFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA");
TAchik_CoreFrame:RegisterEvent("INSPECT_ACHIEVEMENT_READY");
TAchik_CoreFrame:RegisterEvent("QUEST_QUERY_COMPLETE");
TAchik_CoreFrame:RegisterEvent("QUEST_FINISHED");
TAchik_CoreFrame:RegisterEvent("PLAYER_TARGET_CHANGED");
TAchik_CoreFrame:RegisterEvent("CHAT_MSG_ADDON");
TAchik_CoreFrame:RegisterEvent("CHAT_MSG_CHANNEL");
TAchik_CoreFrame:RegisterEvent("UPDATE_INSTANCE_INFO")
TAchik_CoreFrame:RegisterEvent("ADDON_LOADED");
