local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_FlagVsFlag()

   TA:AddAchievement(
   {
       category = TA_PVP_WSG,
       name = "Zászlók harca",
       description = "Öld meg azt ellenség zászló hordozóját, miközben nálad van az ellenség zászlaja",
       texture = "Interface\\Icons\\achievement_bg_winwsg",
       points = 20,
       key = "FLAGVFLAG",
       save = TAchik,
	   requiredState = { "Warsong Lumber Mill" , "Silverwing Hold" , "Warsong Gulch" },
	   requiredFunction = "GetZoneText",
      requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	   resetOnLeave = true,
       criteria =
       {
	       {
		        variable = { ["deathName"] = nil , ["deathTime"] = nil , ["damagedPlayers"] = {} },
                events = "COMBAT_LOG_EVENT_UNFILTERED",
                objective =
			    function(tbl,event,...)
                    return TAchik_KilledPlayerWithAura(tbl,{23333,23335},...) and ( UnitAura("player",GetSpellInfo(23333)) or UnitAura("player",GetSpellInfo(23335)) )
			    end,
                key = "FLAGVFLAGC1",
            },
        },
   });

end
