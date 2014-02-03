function THEFLAGMV(tbl)
    return tbl.variable.counter
end

function THEFLAGM(tbl,event,...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
	    if arg2 == "SPELL_AURA_REMOVED" then
	        if tContains(tbl.needSpell,arg9) then
				tbl.variable.takeTime = time()
				tbl.variable.takeId = arg9
			end
		end
	elseif event == "CHAT_MSG_BG_SYSTEM_HORDE" or event == "CHAT_MSG_BG_SYSTEM_ALLIANCE" then
	    if arg1:find("captured") and arg2 == UnitName("player") then
		    if tContains(tbl.needSpell,tbl.variable.takeId) and time() - tbl.variable.takeTime < 1 then
		        tbl.variable.counter = tbl.variable.counter + 1
		        if tbl.value(tbl) >= tbl.required then
				    return true
				else
				    CA:StartAchievementBasedTimedAchievement(tbl,event)
				end
		    end
	    end
	end
end

function AddTheFlagMachine()

	GLOBAL_ACHIEVEMENTS["THEFLAGM"] = CA:AddAchievement(
	{
		category = TA_PVP,
		name = "A Zászlótartó",
		description = "Egy nap alatt lopj el 2-2 zászlót Warsong Gulch és Eye of the Storm területén",
		texture = "Interface\\Icons\\achievement_bg_captureflag_eos",
		points = 20,
		key = "THEFLAGM",
		save = TAchik,
		timed = true,
	    duration = CA:GetSecondsLeftOfToday(),
		startTime = 0,
		criteria =
		{
		    {
			    requiredState = { "Warsong Gulch" , "Silverwing Hold" , "Warsong Lumber Mill" },
		        requiredFunction = "GetZoneText",
		        resetTemplate = { ["takeTime"] = 0 , ["takeId"] = 0 , ["counter"] = 0 },
			    variable = { ["takeTime"] = 0 , ["takeId"] = 0 , ["counte"] = 0 },
				required = 2,
				value = THEFLAGMV,
				needSpell = { 23335 , 23333 },
				events = { "PLAYER_ENTERING_WORLD" , "COMBAT_LOG_EVENT_UNFILTERED" , "CHAT_MSG_BG_SYSTEM_HORDE" , "CHAT_MSG_BG_SYSTEM_ALLIANCE" },
				objective = THEFLAGM,
				key = "THEFLAGMV1",
			},
			{
			    requiredState = "Eye of the Storm",
		        requiredFunction = "GetZoneText",
		        resetTemplate = { ["takeTime"] = 0 , ["takeId"] = 0 , ["counter"] = 0 },
			    variable = { ["takeTime"] = 0 , ["takeId"] = 0 ,  ["counter"] = 0 },
				required = 2,
		 		value = THEFLAGMV,
				needSpell = { 34976 },
				events = { "PLAYER_ENTERING_WORLD" , "COMBAT_LOG_EVENT_UNFILTERED" , "CHAT_MSG_BG_SYSTEM_HORDE" , "CHAT_MSG_BG_SYSTEM_ALLIANCE" },
				objective = THEFLAGM,
				key = "THEFLAGMV2",
			},
		},
	});

end
