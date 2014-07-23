local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Pentek()

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Péntek van!",
		description = "w5Zyw7xsaiBhbm5hayBob2d5IHDDqW50ZWsgdmFu",
		texture = "Interface\\Icons\\inv_misc_bomb_04",
		points = 10,
		key = "PENTEK",
		hidden = true,
		save = TAchik,
		criteria =
	    {
			{
				events = { "CHAT_MSG_YELL" , "CHAT_MSG_YELL" , "CHAT_MSG_SAY" , "CHAT_MSG_WHISPER_INFORM" , "CHAT_MSG_GUILD" },
				objective =
				function(tbl,event,...)
					local arg1 = select(1,...)
					if arg1 and arg1:find("pentek") or arg1:find("péntek") then
						if ( arg1:find("vegre") or arg1:find("végre") or arg1:find("hurra") or arg1:find("hurrá") or arg1:find("van") or arg1:find("yay") or arg1:find("fasza") or arg1:find("jó") or arg1:find("jo")) then
							if event == "CHAT_MSG_WHISPER_INFORM" then
								return select(1, CalendarGetDate()) == 6
							end
							return select(1, CalendarGetDate()) == 6 and arg2 == UnitName("player")
						end
					end
				end,
				key = "PENTEKC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Légszomj",
		description = "S2FwY3NvbGQga2kgYSBzaXNha29kIGzDoXRoYXTDs3PDoWfDoXQ=",
		texture = "Interface\\Icons\\spell_shadow_painandsuffering",
		points = 5,
		key = "LEGSZOMJ",
		hidden = true,
		save = TAchik,
		criteria =
	    {
			{
				events = "UNIT_PORTRAIT_UPDATE",
				variable = false,
				objective =
				function(tbl,event,...)
				    if ShowingHelm() then
					    tbl.variable = true
					else
                        return tbl.variable and InterfaceOptionsFrame:IsShown()
					end
				end,
				key = "LEGSZOMJC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Ví Áj Píj",
		description = "TWVudHNkIGVsIGEga2FyYWt0ZXJlZGV0IGEgIi5zYXZlIiBwYXJhbmNzIMOhbHRhbA==",
		texture = "Interface\\Icons\\inv_helmet_96",
		points = 5,
		key = "VIAJPI",
		hidden = true,
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
				events = "CHAT_MSG_SYSTEM",
				objective =
				function(tbl,event,...)
					local arg1 = select(1,...)
				    return arg1 and arg1:find("Karaktered elmentve")
				end,
				key = "VIAJPIC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Dupla ügynök",
		description = "TMOpcGrDqWwgZmVsIGVneSBrYXJpdmFsIG1pbmRrw6l0IGZyYWtjacOzYsOzbA==",
		texture = "Interface\\Icons\\spell_shadow_nethercloak",
		key = "DAGENT",
		hidden = true,
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
				events = "PLAYER_ENTERING_WORLD",
				objective =
				function(tbl,event,...)
				    return UnitFactionGroup("player") == "Alliance"
				end,
				key = "DAGENTC1",
			},
			{
				events = "PLAYER_ENTERING_WORLD",
				objective =
				function(tbl,event,...)
				    return UnitFactionGroup("player") == "Horde"
				end,
				key = "DAGENTC2",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Tripla ügynök",
		previous = TA.achisKeys["DAGENT"],
		description = "RWd5IG5hcCBhbGF0dCDDtmxqIG1lZyBlZ3kgZWxsZW5zw6lnZXQgbWFqZCBlZ3kgbcOhc2lrIGZyYWtjacOzasO6IGVsbGVuc8OpZ2V0IHbDqWfDvGwgYXogZWxzw7YgZnJha2Npw7Niw7NsIGVneSBlbGxlbnPDqWdldA==",
		texture = "Interface\\Icons\\ability_druid_predatoryinstincts",
		points = 10,
		key = "TAGENT",
		hidden = true,
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
			    timed = true,
				duration = 86400,
				events = "PLAYER_PVP_KILLS_CHANGED",
				variable = { false , false },
				objective =
				function(tbl,event,...)
					TA:StartTimedAchievement(tbl)
                    if tbl.variable[1] then
					    if tbl.variable[2] then
                            return tbl.variable[2] and UnitFactionGroup("player") == tbl.variable[1]
						elseif UnitFactionGroup("player") ~= tbl.variable[1] then
						    tbl.variable[2] = true
						end
					else
					    tbl.variable[1] = UnitFactionGroup("player")
					end
				end,
				key = "TAGENTC1",
			}
		}
	});



end
