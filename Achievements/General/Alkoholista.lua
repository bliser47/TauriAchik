local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Alkoholista()

	local function ALKOHOLISTA(tbl,event, ...)
        return ( arg1:find("drunk") or arg1:find("smashed") ) and arg1:find("You") and date("%w") == tbl.needDay
    end

	TA:AddAchievement(
	{
		category = TA_FUN_GENERAL,
		name = "Másnapos, mikor?",
		description = "Rugjál be a hét minden napján",
		texture = "Interface\\Icons\\Inv_drink_22",
		points = 20,
		key = "ALKOHOLISTA",
		accountWide = true,
		save = TAchik,
		criteria =
		{
			{
				name = "Hétfö",
				needDay = "1",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC1",
			},
			{
				name = "Kedd",
				needDay = "2",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC2",
			},
			{
				name = "Szerda",
				needDay = "3",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC3",
			},
			{
				name = "Csütörtök",
				needDay = "4",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC4",
			},
			{
				name = "Péntek",
				needDay = "5",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC5",
			},
			{
				name = "Szombat",
				needDay = "6",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC6",
			},
			{
				name = "Vasárnap",
				needDay = "0",
				events = "CHAT_MSG_SYSTEM",
				objective = ALKOHOLISTA,
				key = "ALKOHOLISTAC7",
			},
		},
	});


	TA:AddAchievement(
	{
		category = TA_HIDDEN,
		name = "Stohl Buci nyomdokain",
		description = "w5xsaiBmZWwgYSBtb3VudG9kcmEgdGVsamVzZW4gcsOpc3plZ2Vu",
		texture = "Interface\\Icons\\inv_potion_12",
		points = 20,
		key = "STOHL",
		save = TAchik,
		hidden = true,
		criteria =
		{
		    {
			    events = "CHAT_MSG_SYSTEM",
				objective =
				function(tbl,event,...)
                    return arg1:find("You") and ( arg1:find("drunk") or arg1:find("smashed") )
				end,
	            activate = "STOHLC2",
                key = "STOHLC1",
			},
			{
			    events = {},
				specialEvents = { "UNIT_AURA" },
				objective =
				function(tbl,event,...)
				    local compDate = TA.crits[TA.critsKeys["STOHLC1"]].complete
					compDate = TA:GetTauriUNIX(compDate)
					if time() - compDate > 540 then
					    TA:UnCompleteAchievementCriterias(tbl)
					else
				        return IsMounted() == 1
					end
				end,
				activator = "STOHLC1",
                key = "STOHLC2",
			}
	    }
	})

	TA:AddAchievement(
	{
		category = TA_HIDDEN,
		name = "Ne óvakodj a részeges Motorostohl",
		description = "U3rDoWd1bGRqIHZhbGFraXZlbCBhIG1vdG9yb2RiYW4sIG1pa8O2emJlbiByw6lzemVnIHZhZ3k=",
		texture = "Interface\\Icons\\spell_misc_drink",
		points = 20,
		key = "STOHL2",
		save = TAchik,
		hidden = true,
		criteria =
		{
		    {
			    events = "CHAT_MSG_SYSTEM",
				objective =
				function(tbl,event,...)
                    return arg1:find("You") and ( arg1:find("drunk") or arg1:find("smashed") )
				end,
	            activate = "STOHL2C2",
                key = "STOHL2C1",
			},
			{
			    events = {},
				specialEvents = { "UNIT_ENTERED_VEHICLE" },
				objective =
				function(tbl,event,...)
				    local compDate = TA.crits[TA.critsKeys["STOHL2C1"]].complete
					compDate = TA:GetTauriUNIX(compDate)
					if time() - compDate > 540 then
					    TA:UnCompleteAchievementCriterias(tbl)
						return
					end
                    return UnitAura("player",GetSpellInfo(55531)) or UnitAura("player",GetSpellInfo(60424))
				end,
				activator = "STOHL2C1",
                key = "STOHL2C2",
			}
	    }
	})

end
