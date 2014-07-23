local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_HelloSzia()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Helló, "..UnitName("player").." vagyok!",
		description = "Köszönj 100 különbözö játékosnak",
		texture = "Interface\\Icons\\spell_misc_emotionhappy",
		points = 50,
		key = "HSV",
		save = TAchik,
		accountWide = true,
		criteria =
		{
			{
				required = 100,
				variable = {},
				mergeable = "uniqueElements",
				value = function(tbl) return #tbl.variable end,
				events = "CHAT_MSG_TEXT_EMOTE",
				objective =
				function(tbl,event,...)
					if event == "CHAT_MSG_TEXT_EMOTE" then
						local targetName = UnitName("target")
						local arg1 = select(1,...)
                        if UnitIsPlayer("target") and arg1 and  arg1:find("You greet") and targetName ~= UnitName("player") then
                            if not(tContains(tbl.variable,targetName)) then
                                tinsert(tbl.variable,targetName)
							end
				         end
                     end
                     return tbl.value(tbl) >= tbl.required
			    end,
				key = "HSVC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Alteregó",
		description = "S8O2c3rDtm5qIMO2bm1hZ2FkbmFr",
		texture = "Interface\\Icons\\spell_magic_lesserinvisibilty",
		points = 5,
		key = "HSV2",
		save = TAchik,
		accountWide = true,
		hidden = true,
		criteria =
		{
			{
				events = "CHAT_MSG_TEXT_EMOTE",
				objective =
				function(tbl,event,...)
					local arg1 = select(1,...)
                    return UnitIsPlayer("target") and arg1 and arg1:find("You greet") and UnitName("target") == UnitName("player")
			    end,
				key = "HSV2C1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Vonakodó",
		description = "Q3NhdGxha296eiBlZ3kgQmF0dGxlZ3JvdW5kcmEgbWlrw7Z6YmVuIHJhanRhZCB2YW4gYSBEZXNlcnRlciBkZWJ1ZmY=",
		texture = "Interface\\Icons\\spell_holy_divineillumination",
		key = "VONAKODO",
		save = TAchik,
		accountWide = true,
		hidden = true,
		criteria =
		{
			{
				events = "UI_INFO_MESSAGE",
				objective =
				function(tbl,event,...)
					local arg1 = select(1,...)
                    return UnitDebuff("player",GetSpellInfo(26013)) and arg1 and arg1:find("Deserter")
			    end,
				key = "VONAKODOC1",
			},
		},
	});

end
