local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Fenykepesz()

    local function SCREENV(tbl)
        return #tbl.variable
    end

    local function SCREEN(tbl,event,...)
	    if event == "SCREENSHOT_SUCCEEDED" then
            local d = date("%d")..date("%m")..date("%y")
	        if not tContains(tbl.variable,d) then
	            tinsert(tbl.variable,d)
	        end
		end
		return tbl.value(tbl) >= tbl.required
    end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Amatör Fényképész",
	    description = "Készíts naponta 1 Screenshotot 5 egymástól független napig",
	    texture = "Interface\\Icons\\inv_misc_spyglass_03",
	    points = 10,
	    key = "SCREEN1",
	    save = TAchik,
	    criteria =
	    {
		    {
			    variable = {},
			    required = 5,
				mergeable = "uniqueElements",
			    value = SCREENV,
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREEN,
			    key = "SCREEN1",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Kezdö Képrögzitö",
	    previous = TA.achisKeys["SCREEN1"],
	    description = "Készíts naponta 1 Screenshotot 25 egymástól független napig",
	    texture = "Interface\\Icons\\inv_misc_spyglass_03",
	    points = 10,
	    key = "SCREEN2",
	    save = TAchik,
	    criteria =
	    {
		    {
			    variable = {},
			    required = 25,
				mergeable = "uniqueElements",
			    value = SCREENV,
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREEN,
			    key = "SCREEN2",
		    },
	    },
    });

    TA:AddAchievement(
	{
	    category = TA_FUN_GENERAL,
	    name = "Képregény Készitö",
	    previous = TA.achisKeys["SCREEN2"],
	    description = "Készíts naponta 1 Screenshotot 50 egymástól független napig",
	    texture = "Interface\\Icons\\inv_misc_spyglass_03",
	    points = 10,
	    key = "SCREEN3",
	    save = TAchik,
	    criteria =
	    {
		    {
			    variable = {},
			    required = 50,
				mergeable = "uniqueElements",
			    value = SCREENV,
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREEN,
			    key = "SCREEN3",
		    },
	    },
    });

	local function SCREENSPY(tbl,event,...)
        return UnitName("target") == tbl.name and UnitIsVisible("target")
    end

	TA:AddAchievement(
	{
	    category = TA_FUN_GENERAL,
	    nameFemale = "Mrs. Hari",
		nameMale = "Mr. Philby",
	    description = "Készíts egy Screenshotot az alábbi ellenségekröl",
	    textureMale = "Interface\\Icons\\ability_stealth",
		textureFemale = "Interface\\Icons\\ability_ambush",
	    points = 10,
	    key = "SCREENSPY",
	    save = TAchik,
		sexDependent = true,
		requiredStateAlliance = 3,
		requiredStateHorde = { 2 , 3 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		factionDependent = true,
		accountWide = true,
	    criteria =
	    {
		    {
			    requiredState = { "Stormwind City" , "Stormwind Harbor" },
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
			    factionExistent = "Horde",
				name = "Archbishop Benedictus",
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREENSPY,
			    key = "SCREENSPYC1",
		    },
			{
			    requiredState = { "Stormwind City" , "Stormwind Harbor" },
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
			    factionExistent = "Horde",
				name = "Master Mathias Shaw",
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREENSPY,
			    key = "SCREENSPYC2",
		    },
			{
			    requiredState = "Hellfire Peninsula",
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
			    factionExistent = "Alliance",
			    name = "Nazgrel",
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREENSPY,
			    key = "SCREENSPYC1",
		    },
			{
			    requiredState = "Nagrand",
				requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
			    factionExistent = "Alliance",
			    name = "Greatmother Geyah",
			    events = "SCREENSHOT_SUCCEEDED",
			    objective = SCREENSPY,
			    key = "SCREENSPYC2",
		    },
	    },
    });

end


