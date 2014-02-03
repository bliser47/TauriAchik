local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_HaljMeg()

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Veszélyes túlnépesedés",
		description = "SGFsaiBtZWcgRGFsYXJhbiB0ZXLDvGxldMOpbg==",
		texture = "Interface\\Icons\\spell_arcane_teleportdalaran",
		points = 10,
		key = "HALJMEGD",
		save = TAchik,
		hidden = true,
		accountWide = true,
		requiredState = 4,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
	    {
			{
				events = "PLAYER_DEAD",
				objective =
				function(tbl,event,...)
				    return GetZoneText() == "Dalaran"
				end,
				key = "HALJMEGD1",
			},
		},
	});

end
