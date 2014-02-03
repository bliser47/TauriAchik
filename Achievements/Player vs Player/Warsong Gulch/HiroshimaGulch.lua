local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_HiroshimaGulch()

    TA:AddAchievement(
    {
	    category = TA_PVP_WSG,
	    name = "Hiroshima Gulch",
	    description = "Öld meg az ellenség zászló hordozóját, miközben rajtad van a Berserking buff",
	    texture = "Interface\\Icons\\Inv_gizmo_supersappercharge",
	    points = 10,
	    key = "HRSGV",
	    save = TAchik,
		requiredState = { "Warsong Lumber Mill" , "Silverwing Hold", "Warsong Gulch" },
		requiredFunction = "GetZoneText",
        requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
	    criteria =
	    {
		    {
		        variable = { ["deathName"] = nil , ["deathTime"] = 0 , ["damagedPlayers"] = {} },
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective =
				function(tbl,event,...)
					return TAchik_KilledPlayerWithAura(tbl,{23333,23335},...) and UnitAura("player",GetSpellInfo(24378))
			    end,
			    key = "HRSGV",

		    },
	    },
    });

end
