local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Csillap()

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Csillapodjále!",
		description = "Q2VuesO6csOhenpvbiBlZ3kgc3rDs3QgYSBUYXVyaSBlZ3kgw7x6ZW5ldGVkYsO2bA==",
		texture = "Interface\\Icons\\ability_warrior_battleshout",
		points = 10,
		key = "CSILLAP",
		hidden = true,
		save = TAchik,
		criteria =
	    {
			{
				events = { "CHAT_MSG_CHANNEL" , "CHAT_MSG_YELL" , "CHAT_MSG_SAY" , "CHAT_MSG_WHISPER_INFORM" , "CHAT_MSG_GUILD" },
				objective =
				function(tbl,event,...)
				    if event == "CHAT_MSG_WHISPER_INFORM" then
			            return arg1:find("%*%*%*%*")
					end
					return arg1:find("%*%*%*%*") and arg2 == UnitName("player")
				end,
				key = "CSILLAPC1",
			},
		},
	});

end
