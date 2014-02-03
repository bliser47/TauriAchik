local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Slowmotion()

	TA:AddAchievement(
	{
		category = TA_PVE_DUNG,
		name = "Lassított halál" ,
		description = "Gyözd le Chrono-Lord Epoch-ot The Culling of Stratholme-n belül Heroic nehézségen, miközben rajtad van a Time Warp debuff",
		texture = "Interface\\Icons\\inv_qiraj_jewelblessed",
		points = 20,
		key = "SLOWMOKILL",
		save = TAchik,
        requiredState = { "The Culling of Stratholme" , 2 },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty"  },
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
				needCreature = "Chrono-Lord Epoch",
				needAura = 52766,
				bossStart = { "We'll see about that, young prince" , "Let's get this over with." },
				events = { "CHAT_MSG_MONSTER_YELL" },
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				objective =
				function (tbl,event,...)
    				if event == "CHAT_MSG_MONSTER_YELL" then
				        if arg2 == tbl.needCreature and tContains(tbl.bossStart,arg1) then
							TA:RegisterEvent(tbl,tbl.specialEvents)
						end
    				elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        				if arg2 == "PARTY_KILL" then
                            if arg7 == tbl.needCreature then
							    if UnitDebuff("player",GetSpellInfo(tbl.needAura)) then
                                    return true
								else
                                    TA:UnRegisterEvent(tbl,tbl.specialEvents)
								end
							end
                        end
    				end
				end,
				key = "SLOWMOKILLC1",
			},
		},
	});

end
