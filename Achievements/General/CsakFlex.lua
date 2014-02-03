local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_CsakFlex()

    local function FOVMA(tbl,event,...)
        if event == "TIME_UPDATE" then
		    return tbl.startTime >= tbl.duration
		elseif arg1:find("are no longer Away") then
			if tbl.startTime >= tbl.duration then
				return true
			else
				TA:StopTimedAchievement(tbl)
			end
		elseif arg1:find("are now Away") and TAchik_OnEpicMount("player") then
			TA:StartTimedAchievement(tbl)
		end
	end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Csak flexelni jöttem",
	    description = "Legyél AFK ritka mounton minden fövárosban legalább 10 percet",
	    texture = "Interface\\Icons\\ability_mount_spectraltiger",
	    points = 20,
	    key = "FOVMA",
	    save = TAchik,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
			    timed = true,
				timedType = "forward",
				duration = 599,
				startTime = 0,
		        factionDependent = true,
				resetOnLoad = true,
				requiredStateHorde = "Orgrimmar",
				requiredStateAlliance = "Stormwind City",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Orgrimmar",
			    nameAlliance = "Stormwind",
			    events = "CHAT_MSG_SYSTEM",
			    objective = FOVMA,
			    key = "FOVMAC1",
		    },
		    {
				timed = true,
				timedType = "forward",
				duration = 599,
		        factionDependent = true,
				resetOnLoad = true,
				requiredStateHorde = "Undercity",
				requriedStateAlliance = "Ironforge",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Undercity",
			    nameAlliance = "Ironforge",
			    events = "CHAT_MSG_SYSTEM",
			    objective = FOVMA,
			    key = "FOVMAC2",
		    },
		    {
				timed = true,
				timedType = "forward",
				duration = 599,
		        factionDependent = true,
				resetOnLoad = true,
				requiredStateHorde = "Thunder Bluff",
				requriedStateAlliance = "Darnassus",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Thunder Bluff",
			    nameAlliance = "Darnassus",
			    events = "CHAT_MSG_SYSTEM",
			    objective = FOVMA,
			    key = "FOVMAC3",
		    },
		    {
				timed = true,
				timedType = "forward",
				duration = 599,
		        factionDependent = true,
				resetOnLoad = true,
				requiredStateHorde = "Silvermoon City",
				requriedStateAlliance = "The Exodar",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Silvermoon City",
			    nameAlliance = "The Exodar",
			    events = "CHAT_MSG_SYSTEM",
			    objective = FOVMA,
			    key = "FOVMAC4",
		    },
		}
	})

end
