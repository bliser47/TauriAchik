local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Ottvagyunk()

	local function OTTVAGYUNK(tbl,event,...)
	    if event == "TIME_UPDATE" then
		    return tbl.startTime > tbl.duration
		elseif ( event == "UNIT_ENTERING_VEHICLE" and arg1 == "player" and arg3 == "Natural" ) or TAchik_InOtherVehicle() then
		    TA:StartTimedAchievement(tbl,"OnForward")
		else
			TA:PauseTimedAchievement(tbl)
		    return tbl.startTime > tbl.duration
		end
	end

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Olcsó fuvar",
		description = "Utazz 1 percet más mountján",
		texture = "Interface\\Icons\\Ability_mount_mammoth_brown_3seater",
		points = 10,
		key = "OTTVAGYUNK",
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 59,
				events = { "UNIT_ENTERING_VEHICLE" , "UNIT_EXITING_VEHICLE" , "PLAYER_ENTERING_WORLD" },
				objective = OTTVAGYUNK,
				key = "OTTVAGYUNKC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Ott vagyunk már?",
		previous = TA.achisKeys["OTTVAGYUNK"],
		description = "Utazz 10 percet más mountján",
		texture = "Interface\\Icons\\Ability_mount_mammoth_brown_3seater",
		points = 10,
		key = "OTTVAGYUNK2",
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
				timed = true,
				timedType = "forward",
				duration = 559,
				events = { "UNIT_ENTERING_VEHICLE" , "UNIT_EXITING_VEHICLE" , "PLAYER_ENTERING_WORLD" },
				objective = OTTVAGYUNK,
				key = "OTTVAGYUNK2C1",
			},
		},
	});

end
