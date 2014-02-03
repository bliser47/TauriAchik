local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Everydayimshufflin()

	local function DOSHUFFL(tbl,event, ...)
        local weekday = CalendarGetDate()
		return tbl.weekreq == weekday and arg2 == UnitName("player") and arg1:find("dance")
	end

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Minden nap csak csoszogok",
		description = "VOFuY29saiBhIGjpdCBtaW5kZW4gbmFwauFu",
		texture = "Interface\\Icons\\inv_boots_cloth_17",
		points = 10,
		key = "EDIS",
		save = TAchik,
		hidden = true,
		accountWide = true,
		criteria =
		{
			{
				weekreq = 2,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS1",
			},
			{
				weekreq = 3,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS2",
			},
			{
				weekreq = 4,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS3",
			},
			{
				weekreq = 5,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS4",
			},
			{
				weekreq = 6,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS5",
			},
			{
				weekreq = 7,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS6",
			},
			{
				weekreq = 1,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective = DOSHUFFL,
				key = "EDIS7",
			},
		},
	});

end
