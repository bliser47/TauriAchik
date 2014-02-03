local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ReflectionPortals()

	TA:AddAchievement(
	{
		category = TA_PVE_DUNG,
		name = "Egy rajnyi szellem" ,
		description = "Idézzetek elö 4 hullám szellemet 2 perc alatt Halls of Reflection-n belül Heroic nehézségen",
		texture = "Interface\\Icons\\spell_holy_searinglightpriest",
		points = 20,
		key = "SWARMOFSPIRITS",
		save = TAchik,
        requiredState = { "Halls of Reflection" , 2 },
		requiredFunction = { "GetZoneText" , "GetInstanceDifficulty"  },
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
				events = "UPDATE_WORLD_STATES",
				variable = {},
				value = function(tbl) if #tbl.variable > 0 then return #tbl.variable-1 else return 0 end end,
				required = 4,
				timed = true,
				duration = 120,
				objective =
				function (tbl,event,...)
					local _,_,t = GetWorldStateUIInfo(1)
					if t and t:find("Spirit Wave") then
					    t = tonumber(string.sub(t,t:find(":")+2,t:find("/")-1))
					    if t > 0 and  not tContains(tbl.variable,t) then
					        tinsert(tbl.variable,t)
						    TA:StartTimedAchievement(tbl)
						    return tbl.value(tbl) >= tbl.required
					    end
					end
				end,
				key = "SWARMOFSPIRITSC1",
			},
		},
	});

end
