local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ArathiQuickCap()

    TA:AddAchievement(
    {
	    category = TA_PVP_AB,
	    nameAlliance = "Nézd "..UnitName("player").." lovait!",
        nameHorde = "Krumpliszedö "..UnitName("player"),
        descriptionAlliance = "Arathi Basin kezdetekor foglald el a Stablest",
	    descriptionHorde = "Arathi Basin kezdetekor foglald el a Farmot",
        textureAlliance = "Interface\\Icons\\ability_mount_ridinghorse",
        textureHorde = "Interface\\Addons\\TauriAchik\\Icons\\INV_ThanksGiving_SweetPotato",
        points = 10,
	    key = "ARATHIQ",
	    save = TAchik,
		requiredState = "Arathi Basin",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    factionDependent = true,
	    criteria =
	    {
		    {
		        factionDependent = true,
		        claimString =
				{
				    ["Horde"] = "claims the farm",
					["Alliance"] = "claims the stables"
				},
			    eventsHorde = "CHAT_MSG_BG_SYSTEM_HORDE",
				eventsAlliance = "CHAT_MSG_BG_SYSTEM_ALLIANCE",
			    objective =
				function(tbl,event,...)
				    return arg1:find(UnitName("player")) and arg1:find(tbl.claimString[UnitFactionGroup("player")])
				end,
			    key = "ARATHIQC1",
		    },
	    },
    });

end
