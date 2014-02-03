local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_SzarnyasokFejvadasza()

    TA:AddAchievement(
    {
		category = TA_PVP_GENERAL,
		name = "Szárnyasok fejvadásza",
		description = "Ölj meg egy Paladint miközben az épp Avenging Wrath hatás alatt van",
		texture = "Interface\\Icons\\spell_holy_avenginewrath",
		points = 15,
		key = "SZARNYASOK",
		save = TAchik,
		requiredState = true,
		requiredFunction = "TAchik_PlayerIsInBattleground",
        requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
        resetOnLeave = true,
		criteria =
		{
			{
			    variable = { ["deathName"] = nil , ["deathTime"] = 0 , ["damagedPlayers"] = {} },
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective =
				function(tbl,event,...)
                    return TAchik_KilledPlayerWithAura(tbl,{31884},...)
				end,
				key = "SZARNYASOKC1",
			},
		},
	});

end
