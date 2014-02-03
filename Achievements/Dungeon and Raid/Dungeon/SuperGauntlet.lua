local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_SuperGauntlet()

	local function SUPERGAUNTLET1(tbl,event,...)
        if event == "COMBAT_LOG_EVENT_UNFILTERED" then
            if arg2 == "PARTY_KILL" then
                if tContains(tbl.needCreature,arg7) then
                    tbl.variable = tbl.variable + 1
                    TA:StartTimedAchievement(tbl)
                    return tbl.value(tbl) >= tbl.required
                end
            end
        end
    end

    local function SUPERGAUNTLET2(tbl,event,...)
        if event == "COMBAT_LOG_EVENT_UNFILTERED" then
            if arg2 == "PARTY_KILL" then
                return arg7 == tbl.needCreature
            end
        end
    end

    local function SUPERGAUNTLETV(tbl)
        return tbl.variable
    end

    TA:AddAchievement(
    {
		category = TA_PVE_DUNG,
		name = "Supermassive Gauntlet",
		description = "Gyözd le Gortok Palehoofot Utgarde Pinnacleban miután megölted valamelyik három vadállatját 1 perc leforgása alatt Heroic nehézségen",
		texture = "Interface\\Icons\\Ability_rogue_rupture",
		points = 15,
		key = "SUPERGAUNTLET",
		save = TAchik,
		requiredState = { "Utgarde Pinnacle" , 2 },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		requiredEvents = "INSTANCE_CHANGED",
		resetOnLeave = true,
		criteria =
		{
			{
			    name = "3 vadállat megölve 1 perc alatt",
			    requiredState = "Trophy Hall",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED_INDOORS",
				needCreature = { "Ravenous Furbolg" , "Massive Jormungar" , "Ferocious Rhino" , "Frenzied Worgen" },
				value = SUPERGAUNTLETV,
				variable = 0,
				required = 3,
				timed = true,
	            duration = 60,
	            specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
	            activate = "SUPERGAUNTLETC2",
				events =  { "COMBAT_LOG_EVENT_UNFILTERED" },
				objective = SUPERGAUNTLET1,
				key = "SUPERGAUNTLETC1",
			},
			{
			    requiredState = "Trophy Hall",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED_INDOORS",
				name = "Gyözd le Gortok Palehoofot",
				needCreature = "Gortok Palehoof",
				events = {},
				specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				activator = "SUPERGAUNTLETC1",
				objective = SUPERGAUNTLET2,
				key = "SUPERGAUNTLETC2",
			},
		},
	});

end
