local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_HalalosAjandek()

	TA:AddAchievement(
    {
		category = TA_PVE_DUNG,
		name = "Halálos ajándék",
		description = "Gyözd le The Prophet Tharon'ja-t Drak'Tharon Keepben Heroic nehézségen miközben rajtad van a Gift of Tharon'ja debuff",
		texture = "Interface\\Icons\\spell_shadow_raisedead",
		points = 15,
		key = "THARANJAGIFT",
		save = TAchik,
		requiredState =
		{
		    ["Drak'Tharon Keep"] =
			{
			    requiredState = { "Drak'Tharon Overlook" , 2 },
				requierdFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
				requiredEvents = { "ZONE_CHANGED" }
			}
		},
	    requiredFunction = "GetZoneText",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
				needCreature = "The Prophet Tharon'ja",
				bossStart = "Tharon'ja sees all! The work of mortals shall not end the eternal dynasty!",
				needAura = 52509,
				specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
	            events = { "CHAT_MSG_MONSTER_YELL" },
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				objective =
				function(tbl,event,...)
                    if event == "CHAT_MSG_MONSTER_YELL" then
                        if arg1 == tbl.bossStart and arg2 == tbl.needCreature then
                            TA:RegisterEvent(tbl,tbl.specialEvents)
                        end
                    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
                        if arg2 == "PARTY_KILL" then
                            return arg7 == tbl.needCreature and UnitDebuff("player",GetSpellInfo(tbl.needAura))
                        end
                    end
				end,
				key = "THARONJAGIFTC1",
			},
		},
	});

end
