local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_AzEnNapom()

    local function ENNAPOM(tbl,event,...)
		if arg2 == "Tauri Vendor" then
			if arg5 == UnitName("player") then
				if arg1:find("Pufff") then
					tbl.variable = 0
				elseif arg1:find("szerencse") then
					tbl.variable = tbl.variable  + 1
					return tbl.value(tbl) >= tbl.required
				end
			end
		end
	end

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Ez az ÉN napom!",
		realm = { "[HU] Tauri WoW Server" , "[HU] Reborn WoW Server" , "[HU] Warriors of Darkness" },
		description = "Játsz a Tauri Vendorral amig rádmosolyog a szerencse 5x egymás után",
		texture = "Interface\\Addons\\TauriAchik\\Icons\\Spell_holy_rebuke",
		points = 10,
		key = "ENNAPOM",
		save = TAchik,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    name = "5 szerencse  egymás után",
			    requiredState = TACHIK_TAURI_VENDOR_REQUIRED_STATE,
			    requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				value = function(tbl) return tbl.variable end,
				required = 5,
				variable = 0,
				events = "CHAT_MSG_MONSTER_SAY",
				objective = ENNAPOM,
				key = "ENNAPOMC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Föállású Máker",
		realm = { "[HU] Tauri WoW Server" , "[HU] Reborn WoW Server" , "[HU] Warriors of Darkness" },
		description = "Játsz a Tauri Vendorral amig rádmosolyog a szerencse 10x egymás után",
		texture = "Interface\\Icons\\inv_misc_herb_goldclover",
		previous = TA.achisKeys["ENNAPOM"],
		points = 10,
		key = "ENNAPOM2",
		save = TAchik,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    name = "10 szerencse egymás után",
			    requiredState = TACHIK_TAURI_VENDOR_REQUIRED_STATE,
			    requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				value = function(tbl) return tbl.variable end,
				required = 10,
				variable = 0,
				events = "CHAT_MSG_MONSTER_SAY",
				objective = ENNAPOM,
				key = "ENNAPOM2C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Profi Félkarú",
		realm = { "[HU] Tauri WoW Server" , "[HU] Reborn WoW Server" , "[HU] Warriors of Darkness" },
		description = "Játsz a Tauri Vendorral amig rádmosolyog a szerencse 20x egymás után",
		texture = "Interface\\Icons\\spell_shadow_unholystrength",
		previous = TA.achisKeys["ENNAPOM2"],
		points = 10,
		key = "ENNAPOM3",
		save = TAchik,
		requiredState = { 1 , 2 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    name = "20 szerencse egymás után",
			    requiredState = TACHIK_TAURI_VENDOR_REQUIRED_STATE,
			    requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				value = function(tbl) return tbl.variable end,
				required = 20,
				variable = 0,
				events = "CHAT_MSG_MONSTER_SAY",
				objective = ENNAPOM,
				key = "ENNAPOM3C1",
			},
		},
	});

end
