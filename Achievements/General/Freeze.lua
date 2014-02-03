local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Freeze()

	local function FREEZE(tbl,event,...)
		if tbl.startTime >= tbl.duration then
			return true
		else
		    if tbl.name == GetZoneText() and TAchik_UnitIsNaked("player") then
                TA:StartTimedAchievement(tbl,"OnForward")
			else
				TA:PauseTimedAchievement(tbl)
			end
		end
	end

	TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Fagyoskodó naturista",
	    description = "Tartózkodj pucéran legalább 1 percet az alábbi zónákban",
	    texture = "Interface\\Icons\\ability_mage_deepfreeze",
	    points = 10,
	    key = "FREEZE",
	    save = TAchik,
		requiredState = 4,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
			    requiredState = "Icecrown",
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				name = "Icecrown",
			    events = { "WORLD_MAP_UPDATE" , "PLAYER_EQUIPMENT_CHANGED" , "ITEM_LOCKED" , "ITEM_UNLOCKED" , "PLAYER_ENTERING_WORLD" },
			    timed = true,
				resetOnLoad = true,
				timedType = "forward",
				duration = 59,
				objective = FREEZE,
				key = "FREEZEC1"
			},
			{
			    requiredState = "The Storm Peaks",
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				name = "The Storm Peaks",
			    events = { "WORLD_MAP_UPDATE" , "PLAYER_EQUIPMENT_CHANGED" , "ITEM_LOCKED" , "ITEM_UNLOCKED" , "PLAYER_ENTERING_WORLD" },
			    timed = true,
                resetOnLoad = true,
				timedType = "forward",
				duration = 59,
				objective = FREEZE,
				key = "FREEZEC2"
			},
			{
			    requiredState = "Wintergrasp",
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				name = "Wintergrasp",
			    events = { "WORLD_MAP_UPDATE" , "PLAYER_EQUIPMENT_CHANGED" , "ITEM_LOCKED" , "ITEM_UNLOCKED", "PLAYER_ENTERING_WORLD" },
			    timed = true,
				resetOnLoad = true,
				timedType = "forward",
				duration = 59,
				objective = FREEZE,
				key = "FREEZEC3"
			},
			{
			    requiredState = "Dragonblight",
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				name = "Dragonblight",
			    events = { "WORLD_MAP_UPDATE" , "PLAYER_EQUIPMENT_CHANGED" , "ITEM_LOCKED" , "ITEM_UNLOCKED" , "PLAYER_ENTERING_WORLD" },
			    timed = true,
				resetOnLoad = true,
				timedType = "forward",
				duration = 59,
				objective = FREEZE,
				key = "FREEZEC4"
			}
		}
	})

end
