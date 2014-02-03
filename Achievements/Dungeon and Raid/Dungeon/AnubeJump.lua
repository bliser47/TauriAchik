local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_AnubeJump()

	TA:AddAchievement(
	{
		category = TA_PVE_DUNG,
		name = "Rovaros tériszony" ,
		description = "Gyözd le Anub'arakot Azjol Nerubon belül Heroic nehézségen úgy, hogy a harc alatt senkit sem dob fel az Impale képessége",
		texture = "Interface\\Icons\\spell_nature_earthquake",
		points = 20,
		key = "ANUBJUMP",
		save = TAchik,
        requiredState = { "Azjol-Nerub" , 2 },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty"  },
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    variable = false,
				needCreature = "Anub'arak",
				bossStart = "Eternal agony awaits you!",
				bossEnd = "Ahhh... RAAAAAGH! Never thought... I would be free of him...",
				events = { "CHAT_MSG_MONSTER_YELL" },
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				objective =
				function (tbl,event,...)
    				if event == "CHAT_MSG_MONSTER_YELL" then
				        if arg2 == tbl.needCreature then
						    if arg1 == tbl.bossStart then
            				    tbl.variable = true
            				    TA:RegisterEvent(tbl,tbl.specialEvents)
        				    else
						        return arg1 == tbl.bossEnd and tbl.variable
        				    end
						end
    				elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        				if arg2 == "SPELL_DAMAGE" and arg10 == "Impale" and UnitIsPlayer(arg7) and tbl.variable then
            				TA:UnRegisterEvent(tbl,tbl.specialEvents)
            				tbl.variable = false
       				    end
    				end
				end,
				key = "ANUBJUMPC1",
			},
		},
	});

	TA:AddAchievement(
    {
	    category = TA_PVE_DUNG,
	    name = "Villámgyors leépítés",
	    description = "Ölj meg 4 valamilyen tipusú Construct-ot 10 másodperc alatt Halls of Lighton belül Heroic nehézségen",
	    texture = "Interface\\Icons\\spell_lightning_lightningbolt01",
	    points = 20,
	    key = "HOLLIGHT",
	    save = TAchik,
		requiredState = { "Halls of Lightning" , 2 },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty"  },
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
			    value = function(tbl) return tbl.variable end,
			    required = 4,
				variable = 0,
				timed = true,
				duration = 10,
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective =
				function(tbl,event,...)
                    if arg2 == "UNIT_DIED" and arg7:find("Construct") then
					    TA:StartTimedAchievement(tbl)
						tbl.variable = tbl.variable + 1
						return tbl.required >= tbl.value(tbl)
					end
				end,
				key = "HOLLIGHT1",
		    },
	    },
    });

end
