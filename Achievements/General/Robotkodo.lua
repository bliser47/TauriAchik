local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Robotkodo()

    local function ROBOTKODO(tbl,event,...)
        for i=1,GetNumCompanions("MOUNT") do
			if select(2, GetCompanionInfo("MOUNT",i)) == tbl.name then
                return true
			end
		end
    end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
		factionDependent = true,
	    nameHorde = "VonaKodo",
	    descriptionHorde = "Szerezd meg az összes Mulgore-i mountot",
		textureHorde = "Interface\\Icons\\Ability_mount_kodo_03",
		nameAlliance = "Robotoló",
		descriptionAlliance = "Szerezd meg (majdnem) az összes Dun Morogh-i mountot",
		textureAlliance = "Interface\\Icons\\Ability_mount_mechastrider",
	    points = 10,
	    key = "ROBOTKODO",
	    save = TAchik,
		unmergeable = true,
	    criteria =
	    {
		    {
		        factionDependent = true,
			    events = { "COMPANION_LEARNED" , "COMPANION_UPDATE" , "PLAYER_ENTERING_WORLD" },
				key = "ROBOTKODOC1",
				nameHorde = "Gray Kodo",
				nameAlliance = "Blue Mechanostrider",
			    objective = ROBOTKODO,
		    },
			{
		        factionDependent = true,
			    events = { "COMPANION_LEARNED" , "COMPANION_UPDATE" , "PLAYER_ENTERING_WORLD" },
				key = "ROBOTKODOC2",
				nameHorde = "Brown Kodo",
				nameAlliance = "Green Mechanostrider",
			    objective = ROBOTKODO,
		    },
			{
		        factionDependent = true,
			    events = { "COMPANION_LEARNED" , "COMPANION_UPDATE" , "PLAYER_ENTERING_WORLD" },
				key = "ROBOTKODOC3",
				nameHorde = "White Kodo",
				nameAlliance = "Red Mechanostrider",
			    objective = ROBOTKODO,
		    },
			{
		        factionDependent = true,
			    events = {"COMPANION_LEARNED","COMPANION_UPDATE","PLAYER_ENTERING_WORLD" },
				key = "ROBOTKODOC4",
				nameHorde = "Great Gray Kodo",
				nameAlliance = "Swift Green Mechanostrider",
			    objective = ROBOTKODO,
		    },
			{
		        factionDependent = true,
			    events = { "COMPANION_LEARNED" ,"COMPANION_UPDATE" , "PLAYER_ENTERING_WORLD" },
				key = "ROBOTKODOC5",
				nameHorde = "Great Brown Kodo",
				nameAlliance = "Swift White Mechanostrider",
			    objective = ROBOTKODO,
		    },
			{
		        factionDependent = true,
			    events = { "COMPANION_LEARNED" , "COMPANION_UPDATE" , "PLAYER_ENTERING_WORLD" },
				key = "ROBOTKODOC6",
				nameHorde = "Great White Kodo",
				nameAlliance = "Swift Yellow Mechanostrider",
			    objective = ROBOTKODO,
		    },

	    },
    });

end
