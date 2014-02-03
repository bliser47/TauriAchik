local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_SzentCsapas()

	TA:AddAchievement(
    {
		category = TA_PVE_DUNG,
		name = "Szent csapás",
		description = "Szabadíts ki egy játékost Prince Taldaram Embrace of the Vampyr képessége alúl kevesebb mint 5 másodperc alatt, Ahn'Kahet: The Old Kingdom Heroic nehézségen",
		texture = "Interface\\Icons\\spell_holy_persuitofjustice",
		points = 15,
		key = "HOLYSMITE",
		save = TAchik,
		requiredState =
		{
		    ["Ahn'Kahet: The Old Kingdom"] =
			{
		        requiredState = { "Befouled Terrace" , 2 },
			    requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
				requiredEvents = { "ZONE_CHANGED_INDOORS" }
			}
		},
		requiredFunction = "GetZoneText",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
				needCreature = "Prince Taldaram",
				bossStart = "I will feast on your remains.",
				needSpell = "Embrace of the Vampyr",
				variable = false,
				timed = true,
	            duration = 5,
				events = { "CHAT_MSG_MONSTER_YELL" },
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
				objective =
				function(tbl,event,...)
                    if event == "CHAT_MSG_MONSTER_YELL" then
                        if arg1 == tbl.bossStart and arg2 == tbl.needCreature then
                            TA:RegisterEvent(tbl,tbl.specialEvents)
                        end
                    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
                        if arg2 == "SPELL_AURA_REMOVED" then
                            if arg4 == tbl.needCreature and arg10 == tbl.needSpell then
                                return tbl.variable
                            end
                        elseif arg2 == "SPELL_AURA_APPLIED" then
                            if arg4 == tbl.needCreature and arg10 == tbl.needSpell then
                                tbl.variable = true
                                TA:StartTimedAchievement(tbl)
                            end
                        end
                    end
				end,
				key = "HOLYSMITEC1",
			},
		},
	});


end
