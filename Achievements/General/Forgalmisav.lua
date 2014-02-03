local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Forgalmisav()

  TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Vezetöi állás, Forgalmi sáv nélkül",
		description = "Vágd pofán a Guild Mastered",
		info = "Keresd meg a klánvezért, és /slap. Reménykedj, hogy van egy kis humora :)",
		texture = ICONS_ROOT.."Ability_Warrior_SecondWind",
		points = 10,
		key = "FSAV",
		save = TAchik,
		criteria =
		{
			{
				events = "CHAT_MSG_TEXT_EMOTE",
				objective =
				function(tbl,event,...)
    				if UnitExists("target") and UnitIsPlayer("target") and UnitIsVisible("target") then
        				local guildMaster = "GMISOFFLINE"
        				for i=1,GetNumGuildMembers(),1 do
            				if select(3, GetGuildRosterInfo(i)) == 0 then
                				guildMaster = select(1, GetGuildRosterInfo(i))
                				break
            				end
        				end
	        			return arg1:find("You slap") and arg2 == UnitName("player") and ( arg1:find(guildMaster) or (arg1:find("yourself") and arg2 == guildMaster) )
					end
				end,
				key = "FSAVC1",
			}
		},
	});

end
