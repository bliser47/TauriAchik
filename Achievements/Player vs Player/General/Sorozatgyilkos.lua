local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Sorozatgyilkos()

	local function SOROZATV(tbl)
        return select(2,tbl.criteriaFunction())
    end

    local function SOROZAT(tbl,event,...)
        return tbl.value(tbl) >= tbl.required
    end

    TA:AddAchievement(
    {
	    category = TA_PVP_GENERAL,
	    name = "Sorozatgyilkos",
	    description = "Két egymástkövetö napon szerezz külön-kölön 200 Honorable Killt",
	    texture = "Interface\\Icons\\ability_warrior_bloodfrenzy",
	    points = 20,
	    key = "SOROZAT",
	    save = TAchik,
	    criteria =
	    {
		    {
			    value = SOROZATV,
			    criteriaFunction = GetPVPYesterdayStats,
			    required = 200,
			    events = { "PLAYER_PVP_KILLS_CHANGED" , "PLAYER_ENTERING_WORLD" },
			    objective = SOROZAT,
		    },
		    {
		        value = SOROZATV,
			    criteriaFunction = GetPVPSessionStats,
			    required = 200,
			    events = { "PLAYER_PVP_KILLS_CHANGED" , "PLAYER_ENTERING_WORLD" },
			    objective = SOROZAT,
		    },
	    },
    });

end
