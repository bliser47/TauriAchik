local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:Achievement_AddCsatazuzo()


	local function DEFKILL(tbl,event,...)
		if UnitAura("player","Honorable Defender") then
			tbl.variable = tbl.variable + 1
			return tbl.value(tbl) >= tbl.required
		end
	end

    TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Fö a védelem",
	    description = "Szerezz 15 Honorable Kill-t egy Battleground alatt miközben rajtad van a Honorable Defender buff",
	    texture = "Interface\\Icons\\achievement_bg_ab_defendflags",
	    points = 5,
	    key = "CSATZ",
	    save = TAchik,
		requiredState = { "Arathi Basin" , "Isle of Conquest" , "Eye of the Storm" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
	    criteria =
	    {
		    {
		        variable = 0,
			    required = 15,
			    value = function(tbl) return tbl.variable/3 end,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = DEFKILL,
			    key = "CSATZC1",
		    },
	    },
    });


    TA:AddAchievement(
    {
	    previous = TA.achisKeys["CSATZ"],
	    category = TA_PVP_GENERAL,
	    name = "Óvakodó",
	    description = "Szerezz 30 Honorable Kill-t egy Battleground alatt miközben rajtad van a Honorable Defender buff",
	    texture = "Interface\\Icons\\achievement_bg_ab_defendflags",
	    points = 10,
	    key = "CSATZ2",
	    save = TAchik,
		requiredState = { "Arathi Basin" , "Isle of Conquest" , "Eye of the Storm" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
	    criteria =
	    {
		    {
		        variable = 0,
			    required = 30,
			    value = function(tbl) return tbl.variable/3 end,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = DEFKILL,
			    key = "CSATZ2C1",
		    },
	    },
    });

	TA:AddAchievement(
    {
	    previous = TA.achisKeys["CSATZ2"],
	    category = TA_PVP_GENERAL,
	    name = "A holttestemen keresztül!",
	    description = "Szerezz 60 Honorable Kill-t egy Battleground alatt miközben rajtad van a Honorable Defender buff",
	    texture = "Interface\\Icons\\achievement_bg_ab_defendflags",
	    points = 15,
	    key = "CSATZ3C1",
	    save = TAchik,
		requiredState = { "Arathi Basin" , "Isle of Conquest" , "Eye of the Storm" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
	    criteria =
	    {
		    {
		        variable = 0,
			    required = 30,
			    value = function(tbl) return tbl.variable/3 end,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = DEFKILL,
			    key = "CSATZ3C1",
		    },
	    },
    });

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
		previous = TA.achisKeys["CSATZ3"],
	    name = "Az emberi pajzs",
	    description = "Szerezz 200 Honorable Kill-t miközben rajtad van a Honorable Defender buff",
	    texture = "Interface\\Icons\\spell_holy_ardentdefender",
	    points = 20,
	    key = "CSATZ4",
	    save = TAchik,
		requiredState = { "Arathi Basin" , "Isle of Conquest" , "Eye of the Storm" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		accountWide = true,
	    criteria =
	    {
		    {
		        variable = 0,
			    required = 200,
				mergeable = "addition",
			    value = function(tbl) return tbl.variable/3 end,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = DEFKILL,
			    key = "CSATZ4C1",
		    },
	    },
    });

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Emberi kordon",
		previous = TA.achisKeys["CSATZ4"],
	    description = "Szerezz 500 Honorable Kill-t miközben rajtad van a Honorable Defender buff",
	    texture = "Interface\\Icons\\spell_holy_ardentdefender",
	    points = 25,
	    key = "CSATZ5",
	    save = TAchik,
		requiredState = { "Arathi Basin" , "Isle of Conquest" , "Eye of the Storm" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		accountWide = true,
	    criteria =
	    {
		    {
		        variable = 0,
			    required = 500,
				mergeable = "addition",
			    value = function(tbl) return tbl.variable/3 end,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = DEFKILL,
			    key = "CSATZ5C1",
		    },
	    },
    });

	TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
		previous = TA.achisKeys["CSATZ5"],
	    name = "Kell egy kordonvédö-kordon",
	    description = "Szerezz 1000 Honorable Kill-t miközben rajtad van a Honorable Defender buff",
	    texture = "Interface\\Icons\\spell_holy_ardentdefender",
	    points = 30,
	    key = "CSATZ6",
	    save = TAchik,
		requiredState = { "Arathi Basin" , "Isle of Conquest" , "Eye of the Storm" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		accountWide = true,
	    criteria =
	    {
		    {
		        variable = 0,
			    required = 1000,
				mergeable = "addition",
			    value = function(tbl) return tbl.variable/3 end,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = DEFKILL,
			    key = "CSATZ6C1",
		    },
	    },
    });

end
