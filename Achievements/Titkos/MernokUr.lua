local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_MernokUr()

	local function FrameStackIsNowShown(tbl,event,...)
        TA:CompleteAchievement(nil,"MERNOK")
    end

    local function HookTheFrameStackFrame(tbl, event, ...)
	    if arg1 == "Blizzard_DebugTools" then
		    hooksecurefunc("FrameStackTooltip_Toggle",FrameStackIsNowShown)
	    end
    end


    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Dolgozunk, Mérnök úr?",
		description = "Tnlpc2QgbWVnIGEgRnJhbWUgU3RhY2sgcGFuZWx0",
		texture = "Interface\\Icons\\inv_misc_screwdriver_02",
		points = 10,
		key = "MERNOK",
		accountWide = true,
		save = TAchik,
		hidden = true,
		invisible = true,
		criteria =
		{
			{
				events = "ADDON_LOADED",
				objective = HookTheFrameStackFrame,
				key = "MERNOK",
			},
		},
	});

end
