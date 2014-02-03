local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_BgAchievements()

    local function BGHEROV(tbl)
        return tbl.variable/3
    end

    local function BGACHIEVEMENT(tbl,event,...)
		tbl.variable = tbl.variable + 1
		return tbl.value(tbl) >= tbl.required
    end

    TA:AddAchievement(
    {
		category = TA_PVP_AV,
		name = "A hideg csak erösit",
		description = "Ölj meg 100 ellenséget egy Alterac Valley csata alatt",
		texture = "Interface\\Icons\\achievement_bg_winav",
		points = 10,
		key = "AVHERO",
		save = TAchik,
		requiredState = "Alterac Valley",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
        	{
				value = BGHEROV,
				required = 100,
				variable = 0,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = BGACHIEVEMENT,
				key = "AVHERO1",

			},
		},
    });

	TA:AddAchievement(
    {
		category = TA_PVP_EOS,
		name = "Nincs csend a vihar elött",
		description = "Ölj meg 100 ellenséget egy Eye of the Storm csata alatt",
		texture = "Interface\\Icons\\achievement_bg_wineos",
		points = 10,
		key = "EOSHERO",
		save = TAchik,
		requiredState = "Eye of the Storm",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
        	{
				value = BGHEROV,
				required = 100,
				variable = 0,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = BGACHIEVEMENT,
				key = "EOSHERO1",

			},
		},
    });

	TA:AddAchievement(
    {
		category = TA_PVP_WSG,
		name = "A zászló a gyengéknek van",
		description = "Ölj meg 100 ellenséget egy Warsong Gulch csata alatt",
		texture = "Interface\\Icons\\inv_misc_rune_07",
		points = 10,
		key = "WSGHERO",
		save = TAchik,
		requiredState = { "Warsong Gulch" , "Warsong Lumber Mill" , "Silverwing Hold" },
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
        	{
				value = BGHEROV,
				required = 100,
				variable = 0,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = BGACHIEVEMENT,
				key = "WSGHERO1",

			},
		},
    });

	TA:AddAchievement(
    {
		category = TA_PVP_IOC,
		name = "Egy híján háromszáz gyáva",
		description = "Ölj meg 100 ellenséget egy Isle of Conquest csata alatt",
		texture = "Interface\\Icons\\inv_shield_61",
		points = 10,
		key = "IOCHERO",
		save = TAchik,
		requiredState = "Isle of Conquest",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
        	{
				value = BGHEROV,
				required = 100,
				variable = 0,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = BGACHIEVEMENT,
				key = "IOCHERO1",

			},
		},
    });

	TA:AddAchievement(
    {
		category = TA_PVP_SOTA,
		name = "Mindent az ereklye érdekében",
		description = "Ölj meg 100 ellenséget egy Strand of the Ancients csata alatt",
		texture = "Interface\\Icons\\achievement_bg_winsoa",
		points = 10,
		key = "SOTAHERO",
		save = TAchik,
		requiredState = "Strand of the Ancients",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
        	{
				value = BGHEROV,
				required = 100,
				variable = 0,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = BGACHIEVEMENT,
				key = "SOTAHERO1",

			},
		},
    });

	TA:AddAchievement(
    {
		category = TA_PVP_AB,
		name = "Véres medence",
		description = "Ölj meg 100 ellenséget egy Arathi Basin csata alatt",
		texture = "Interface\\Icons\\achievement_bg_abshutout",
		points = 10,
		key = "ABHERO",
		save = TAchik,
		requiredState = "Arathi Basin",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
        	{
				value = BGHEROV,
				required = 100,
				variable = 0,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective = BGACHIEVEMENT,
				key = "ABHERO1",

			},
		},
    });

end
