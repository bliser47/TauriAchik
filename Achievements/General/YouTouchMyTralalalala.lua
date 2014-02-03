local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_YouTouchMyTralalalala()

    local function YOUTOUCH(tbl,event,...)
        return arg1:find("dance") and arg2 == UnitName("player") and TAchik_UnitIsNaked("player")
    end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "You Touch My Tralalalala",
	    description = "Táncolj pucéran az alábbi helyeken",
	    texture = "Interface\\Icons\\inv_misc_firedancer_01",
	    points = 10,
	    key = "YOUTOUCH",
		accountWide = true,
	    save = TAchik,
	    criteria =
	    {
		    {
		        factionDependent = true,
				requiredStateHorde = "Orgrimmar",
				requriedStateAlliance = "Stormwind City",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Orgrimmar",
			    nameAlliance = "Stormwind City",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = YOUTOUCH,
			    key = "YOUTOUCHC1",
		    },
		    {
		        factionDependent = true,
				requiredStateHorde = "Undercity",
				requriedStateAlliance = "City of Ironforge",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Undercity",
			    nameAlliance = "Ironforge",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = YOUTOUCH,
			    key = "YOUTOUCHC2",
		    },
		    {
		        factionDependent = true,
				requiredStateHorde = "Thunder Bluff",
				requriedStateAlliance = "Darnassus",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Thunder Bluff",
			    nameAlliance = "Darnassus",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = YOUTOUCH,
			    key = "YOUTOUCHC3",
		    },
		    {
		        factionDependent = true,
				requiredStateHorde = "Silvermoon City",
				requriedStateAlliance = "The Exodar",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    nameHorde = "Silvermoon City",
			    nameAlliance = "The Exodar",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = YOUTOUCH,
			    key = "YOUTOUCHC4",
		    },
		    {
			    requiredState = "Shattrath City",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    name = "Shattrath City",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = YOUTOUCH,
			    key = "YOUTOUCHC5",
		    },
		    {
			    requiredState = "Dalaran",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				requiredFunction = "GetZoneText",
			    name = "Dalaran",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = YOUTOUCH,
			    key = "YOUTOUCHC6",
		    },
	    },
    });

	function DALASTARS(tbl,event,...)
        return UnitIsVisible("target") and UnitName("target") == tbl["name"..UnitFactionGroup("player")] and arg1:find("You greet")
	end

	TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Dalaran sztárjai",
	    description = "Köszönj az alábbi Dalarani sztároknak",
	    texture = "Interface\\Icons\\inv_jewelcrafting_gem_14",
	    points = 10,
	    key = "DALASTARS",
	    save = TAchik,
        requiredState = "Dalaran",
		requiredEvents = "ZONE_CHANGED_NEW_AREA",
		requiredFunction = "GetZoneText",
	    criteria =
	    {
		    {
			    factionDependent = true,
			    nameHorde = "Dak'hal the Black",
			    nameAlliance = "Donavan Bale",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC1",
			},
			{
			    factionDependent = true,
			    nameHorde = "Hunaka Greenhoof",
			    nameAlliance = "Narestel Palestar",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC2",
			},
			{
			    factionDependent = true,
			    nameHorde = "Warp-Huntress Kula",
			    nameAlliance = "Garl Grimgrizzle",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC3",
			},
			{
			    factionDependent = true,
			    nameHorde = "Juwanamana",
			    nameAlliance = "The Amazing Zanzo",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC4",
			},
			{
			    factionDependent = true,
			    nameHorde = "Saedelin Whitedawn",
			    nameAlliance = "Danric the Bold",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC5",
			},
			{
			    factionDependent = true,
			    nameHorde = "Sorrow",
			    nameAlliance = "Moon Priestess Nici",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC6",
			},
			{
			    factionDependent = true,
			    nameHorde = "Drool",
			    nameAlliance = "Linzi Redgrin",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC7",
			},
			{
			    factionDependent = true,
			    nameHorde = "Great Hexer Ohodo",
			    nameAlliance = "Disidra Stormglory",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC8",
			},
			{
			    factionDependent = true,
			    nameHorde = "Drog Skullbreaker",
			    nameAlliance = "Halga Steelbarrow",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC9",
			},
			{
			    factionDependent = true,
			    nameHorde = "Felcaster Virim",
			    nameAlliance = "Violetta",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = DALASTARS,
			    key = "DALASTARSC10",
			},
		}
	})

end
