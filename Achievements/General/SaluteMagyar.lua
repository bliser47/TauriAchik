local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_SaluteMagyar()


	local function SALUTENPC(tbl,event, ...)
        if not UnitIsPlayer("target") and arg1:find("salute") and UnitIsVisible("target") and arg2 == UnitName("player") then
            return UnitName("target") == tbl.name
        end
    end

    TA:AddAchievement(
	{
		category = TA_FUN_GENERAL,
		name = "Tiszteld a Magyart!",
		description = "Tisztelegj legalább 2 NPC elött az alábbi listából",
		texture = "Interface\\Icons\\achievement_worldevent_lunar",
		points = 10,
		key = "HUNRESPECT",
		save = TAchik,
		required = 2,
		accountWide = true,
		lateComplete = true,
		criteria =
		{
			{
				name = "Combat Master Szigeti",
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = SALUTENPC,
				key = "HUNRESPECTC1",
			},
			{
				name = "Torta",
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = SALUTENPC,
				key = "HUNRESPECTC2",
			},
			{
				name = "Nyoma",
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = SALUTENPC,
				key = "HUNRESPECTC3",
			},
			{
				name = "Kanosak",
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = SALUTENPC,
				key = "HUNRESPECTC4",
			}
		},
	})



end
