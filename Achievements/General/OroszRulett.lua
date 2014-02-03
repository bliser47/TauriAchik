local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_OroszRulett()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Orosz Rulett",
		realm = { "[HU] Tauri WoW Server" , "[HU] Reborn WoW Server" , "[HU] Warriors of Darkness" },
		description = "Öljön meg a Tauri Vendor",
		texture = "Interface\\Icons\\inv_misc_bone_humanskull_01",
		points = 5,
		key = "OROSZRULETT",
		save = TAchik,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
        	{
        	    requiredState = TACHIK_TAURI_VENDOR_REQUIRED_STATE,
			    requiredFunction = "GetZoneText",
				requiredEvents =  { "ZONE_CHANGED_NEW_AREA" , "NEW_HOUR" },
				events = "CHAT_MSG_MONSTER_SAY",
				objective =
			    function(tbl,event,...)
				    return arg2 == "Tauri Vendor" and arg5 == UnitName("player") and arg1:find("Pufff")
				end,
				key = "OROSZRULETTC1",
			},
		},
    });

end
