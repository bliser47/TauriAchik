local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Husdaralo()

    TA:AddAchievement(
    {
		category = TA_PVP_SOTA,
		name = "Húsdaráló",
		description = "Strand of the Ancients-on ölj meg 50 ellenséget miközben gépben ülsz",
		texture = "Interface\\Icons\\Inv_gizmo_02",
		points = 10,
		key = "HSDR",
		save = TAchik,
		requiredState = "Strand of the Ancients",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		criteria =
		{
			{
			    variable = 0,
				required = 50,
				requiredState = "Attacker",
		        requiredFunction = "TAchik_GetBattlegroundAction",
				requiredEvents = "UNIT_ENTERED_VEHICLE",
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function(tbl,event,...)
				    if IsVehicleAimAngleAdjustable() then
                        tbl.variable = tbl.variable + 1
                        return tbl.value(tbl) >= tbl.required
                    end
				end,
				key = "HSDR",
			},

		},
	});

	local function SZINEK(tbl,event,...)
        if GetSubZoneText() == tbl.name then
	        tbl.variable = tbl.variable + 1
			return tbl.value(tbl) >= tbl.needKills
		end
	end

	TA:AddAchievement(
    {
		category = TA_PVP_SOTA,
		name = "Halálos szinek",
		description = "Egy Strand of the Ancients alatt ölj meg 3 ellenséget mindegyik kapunál",
		texture = "Interface\\Icons\\inv_misc_gem_variety_02",
		points = 10,
		key = "SZINEK",
		save = TAchik,
		requiredState = "Strand of the Ancients",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
			{
			    name = "Gate of the Green Emerald",
			    variable = 0,
		        needKills = 3,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = SZINEK,
				key = "SZINEK",
			},
			{
			    name = "Gate of the Blue Sapphire",
			    variable = 0,
		        needKills = 3,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = SZINEK,
				key = "SZINEK",
			},
			{
			    name = "Gate of the Red Sun",
			    variable = 0,
		        needKills = 3,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = SZINEK,
				key = "SZINEK",
			},
			{
			    name = "Gate of the Purple Amethyst",
			    variable = 0,
		        needKills = 3,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = SZINEK,
				key = "SZINEK",
			},
			{
			    name = "Gate of the Yellow Moon",
			    variable = 0,
		        needKills = 3,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = SZINEK,
				key = "SZINEK",
			},

		},
	});

	local function GRAVEY(tbl,events,...)
        return arg1:find(tbl.claimString) and arg2 == UnitName("player")
	end

	TA:AddAchievement(
    {
		category = TA_PVP_SOTA,
		name = "A lélek tövább él",
		description = "Egy Strand of the Ancients alatt foglald el mindhárom temetöt",
		texture = "Interface\\Icons\\inv_enchant_essenceeternallarge",
		points = 10,
		key = "GRAVEY",
		save = TAchik,
		requiredState = "Strand of the Ancients",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		accountWide = true,
		criteria =
		{
			{
			    name = "Keleti temetö",
				claimString = "East",
			    events = "CHAT_MSG_RAID_BOSS_WHISPER",
				objective = GRAVEY,
				key = "GRAVEYC1",
			},
			{
			    name = "Nyugati temetö",
				claimString = "West",
			    events = "CHAT_MSG_RAID_BOSS_WHISPER",
				objective = GRAVEY,
				key = "GRAVEYC2",
			},
			{
				name = "Déli temetö",
				claimString = "South",
			    events = "CHAT_MSG_RAID_BOSS_WHISPER",
				objective = GRAVEY,
				key = "GRAVEYC3",
			},

		},
	});

end
