local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_TakardSzemed()

	TA:AddAchievement(
    {
		category = TA_PVE_DUNG,
		name = "Takard el a szemed!",
		description = "Gyözd le Ormorok the Tree-Shapert Nexusban Heroic nehézségen úgy, hogy a Spell Reflection képessége nem tükröz vissza több mint 5 varázslatot",
		texture = "Interface\\Icons\\spell_shadow_teleport",
		points = 15,
		key = "NOREFLECT",
		save = TAchik,
		requiredState =
		{
		    ["The Nexus"] =
			{
                requiredState = { "The Singing Grove" , 2 },
		        requiredFunction = { "GetSubZoneText" , "GetInstanceDifficulty" },
				requiredEvents = { "ZONE_CHANGED_INDOORS" }
			}
		},
		requiredFunction = "GetZoneText",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
				needCreature = "Ormorok the Tree-Shaper",
				bossStart = "Noo!",
				maxFail = 5,
				variable = 0,
				events = { "CHAT_MSG_MONSTER_YELL" },
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				specialCase = 1,
	            specialCaseFunction = "InCombatLockdown",
				objective =
				function(tbl,event,...)
					if event == "CHAT_MSG_MONSTER_YELL" then
        			    if arg1 == tbl.bossStart and arg2 == tbl.needCreature then
           			        tbl.variable = tbl.resetTemplate
            			    TA:RegisterEvent(tbl,tbl.specialEvents)
        			    end
    			    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        			    if arg2 == "UNIT_DIED" or arg2 == "PARTY_KILL" then
           			        return arg7 == tbl.needCreature
        			    elseif arg2 == "SPELL_MISSED" and arg12 == "REFLECT" then
           			        tbl.variable = tbl.variable + 1
							if tbl.variable > tbl.maxFail then
							    TA:UnRegisterEvent(tbl,tbl.specialEvents)
							end
            			end
       			    end
  			    end,
				key = "NOREFLECTC1",
			},
		},
	});

end
