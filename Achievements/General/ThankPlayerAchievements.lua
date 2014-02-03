local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ThankPlayerAchievements()

    local function THANKPLAYER(tbl,event, ...)
	    if event == "CHAT_MSG_WHISPER_INFORM" then
		    arg2 = gsub(arg2,".Tauri","")
            if arg2 == tbl.name or tContains(tbl.altNames,arg2) then
			    return ( arg1:lower():find("kösz") or arg1:lower():find("kosz") ) and ( arg1:lower():find("addon") or arg1:lower():find("achit") )
			end
		else
            if arg1:find("thank") and UnitIsVisible("target") and arg2 == UnitName("player") then
                return UnitName("target") == tbl.name or ( tbl.altNames ~= nil and tContains(tbl.altNames,UnitName("target")) )
            end
		end
    end

	TA:AddAchievement(
	{
		category = TA_FUN_GENERAL,
		name = "A megalkotók",
		battlegroupExistent = "TauriServer",
		description = "Köszönd meg legalább egy embernek az alábbi listából az addonba rakott munkát",
		texture = "Interface\\Icons\\Spell_holy_spellwarding",
		points = 40,
		key = "THANK",
		save = TAchik,
		required = 1,
		accountWide = true,
		lateComplete = true,
		criteria =
		{
			{
				name = "Bliser",
				altNames = { "Blider" , "Eddärd" },
				events = { "CHAT_MSG_TEXT_EMOTE" , "CHAT_MSG_WHISPER_INFORM" },
				objective = THANKPLAYER,
				key = "THANKC1",
			},
			{
				name = "Executioner",
				altNames = { "Exedru" , "Exedíszknájt","Exeretardin","Renoitucexe" },
				events = { "CHAT_MSG_TEXT_EMOTE" , "CHAT_MSG_WHISPER_INFORM" },
				objective = THANKPLAYER,
				key = "THANKC2",
			},
		},
	})

end
