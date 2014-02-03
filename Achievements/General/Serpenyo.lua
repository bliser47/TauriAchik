local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Serpenyo()

    local function TVENDOR(tbl,event,...)
        return UnitIsVisible("target") and UnitName("target") == "Tauri Vendor" and arg1:find("You spit")
    end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Serpenyöt sem veszek!",
	    realm = { "[HU] Tauri WoW Server" , "[HU] Reborn WoW Server" , "[HU] Warriors of Darkness" },
	    description = "Köpd le a Tauri Vendort az alábbi helyeken",
	    texture = "Interface\\Icons\\Inv_misc_food_dimsum",
	    points = 10,
	    key = "TVENDOR",
	    save = TAchik,
		accountWide = true,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
		        requiredState =
				{
				    ["Orgrimmar"] =
                    {
		                requiredState = "Valley of Strength",
		                requiredFunction = "GetSubZoneText",
                        requiredEvents = { "ZONE_CHANGED_INDOORS" }
	                },
					"Stormwind City"
				},
		        requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
		        factionDependent = true,
			    nameHorde = "Orgrimmar",
			    nameAlliance = "Stormwind City",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = TVENDOR,
			    key = "TVENDORC1",
		    },
		    {
		        requiredState =
				{
				    ["Undercity"] =
                    {
	                    requiredState = "Trade Quarter",
		                requiredFunction = "GetSubZoneText",
                        requiredEvents = { "ZONE_CHANGED_INDOORS" }
                    },
					"City of Ironforge"
				},
		        requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
		        factionDependent = true,
			    nameHorde = "Undercity",
			    nameAlliance = "City of Ironforge",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = TVENDOR,
			    key = "TVENDORC2",
		    },
		    {
		        requiredState =
				{
				    ["Thunder Bluff"] =
	                {
		                requiredState = "",
		                requiredFunction = "GetSubZoneText",
                        requiredEvents = { "ZONE_CHANGED" }
	                },
					"Darnassus"
				},
		        requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
		        factionDependent = true,
			    nameHorde = "Thunder Bluff",
			    nameAlliance = "Darnassus",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective = TVENDOR,
			    key = "TVENDORC3",
		    },

	    },
    });

end


