local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_BuffBasin()

	local function ABBUFF(tbl,event,...)
        return arg1 == "player" and ( arg2 == "Restoration" or arg2 == "Berserking" or arg2 == "Speed" )
    end

    TA:AddAchievement(
    {
	    category = TA_PVP_AB,
	    name = "Buffteli Basin",
        description = "Arathi Basinon szedd fel a Berserking/Restoration/Speed buffokat az alábbi helyeken",
        texture = "Interface\\Icons\\spell_arcane_arcane04",
        points = 10,
	    key = "ARATHIBUFF",
	    save = TAchik,
		requiredState = "Arathi Basin",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    criteria =
	    {
	        {
	            name = "Farm",
		        requiredState = "Farm",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = ABBUFF,
			    key = "ARATHIBUFFC1",
		    },
		    {
		        name = "Blacksmith",
		        requiredState = "Blacksmith",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = ABBUFF,
			    key = "ARATHIBUFFC2",
		    },
		    {
		        name = "Lumber Mill",
		        requiredState = "Lumber Mill",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = ABBUFF,
			    key = "ARATHIBUFFC3",
		    },
		    {
		        name = "Gold Mine",
		        requiredState = "Gold Mine",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = ABBUFF,
			    key = "ARATHIBUFFC4",
		    },
		    {
		        name = "Stables",
		        requiredState = "Stables",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = ABBUFF,
			    key = "ARATHIBUFFC5",
		    },
	    },
    });

end
