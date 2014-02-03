local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ControlledDeconstruction()

    TA:AddAchievement(
    {
		category = TA_PVE_DUNG,
		name = "Irányított dekonstrukció",
		description = "Gyözd le Skarvald the Constructort és Dalronn the Controllert Utgarde Keepben Heroic nehézségen úgy, hogy haláluk között kevesebb mint 3 másodperc telik el",
		texture = "Interface\\Icons\\inv_misc_head_vrykul",
		points = 15,
		key = "SPEARHALAL",
		save = TAchik,
		requiredState =
		{
		    ["Utgarde Keep"] =
			{
			    requiredState = { "Nidvar Stair" , 2 },
				requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
				requiredEvents = { "ZONE_CHANGED_INDOORS" }
			}
		},
		requiredFunction = "GetZoneText",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    needCreatures = { "Skarvald the Constructor" , "Dalronn the Controller" },
			    bossStart = "Dalronn! See if you can muster the nerve to join my attack!",
				timed = true,
	            duration = 3,
	            variable = 0,
	            specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
	            events = { "CHAT_MSG_MONSTER_YELL" },
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				objective =
				function(tbl,event,...)
                    if event == "CHAT_MSG_MONSTER_YELL" then
                        if arg1 == tbl.bossStart then
                            TA:RegisterEvent(tbl,tbl.specialEvents)
                        end
                    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
                        if arg2 == "PARTY_KILL" then
                            if tContains(tbl.needCreatures,arg7) then
                                tbl.variable = tbl.variable + 1
                                TA:StartTimedAchievement(tbl)
                                return tbl.variable == 2
                            end
                        end
                    end
				end,
				key = "SPEARHALALC1",
			},
		},
	});

end
