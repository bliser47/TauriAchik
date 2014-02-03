local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_VisszaAhonnan()

    local function ELEMENTALBACK(tbl,event,...)
        if event == "COMBAT_LOG_EVENT_UNFILTERED" then
            if arg2 == "SPELL_CAST_START" then
                if arg10 == "Emerge" then
                    if tbl.variable == 0 then
                        tbl.variable = 1
                        TA:StartTimedAchievement(tbl)
                    else
					    return true
					end
                end
            end
        end
    end

    local function ELEMENTALBACKV(tbl)
        return tbl.variable
    end

    local function ELEMENTALBACK2(tbl,event,...)
        if event == "COMBAT_LOG_EVENT_UNFILTERED" then
            if arg2 == "PARTY_KILL" or arg2 == "UNIT_DIED" then
                return arg7 == tbl.needCreature
		    end
	    end
    end

	TA:AddAchievement(
    {
		category = TA_PVE_DUNG,
		name = "Vissza ahonnan jöttél",
		description = "Gyözd le a Drakkari Collossust Gundrakban Heroic nehézségen úgy, hogy elöhívod kétszer a Drakkari Elementalt 30 másodperc alatt",
		texture = "Interface\\Icons\\spell_nature_acid_01",
		points = 15,
		key = "ELEMENTALBACK",
		save = TAchik,
		requiredState = { "Gundrak" , 2 },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty" },
		requiredEvents = "INSTANCE_CHANGED",
		resetOnLeave = true,
		criteria =
		{
			{
			    name = "2 Drakkari Elementál 30 másodperc alatt",
			    requiredState = { "Pool of Twisted Reflections" , "Tomb of the Ancients" },
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED_INDOORS",
			    timed = true,
	            duration = 30,
	            variable = 0,
				required = 2,
				value = ELEMENTALBACKV,
				events = { "COMBAT_LOG_EVENT_UNFILTERED" },
				specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
				activate = "ELEMENTALBACKC2",
				objective = ELEMENTALBACK,
				key = "ELEMENTALBACKC1",
			},
			{
			    name = "Gyözd le a Drakkari Collossust",
                events = {},
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				needCreature = "Drakkari Colossus",
				activator = "ELEMENTALBACKC1",
				objective = ELEMENTALBACK2,
				key = "ELEMENTALBACKC2",
			},
		},
	});

end
