local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Tafirst()

    local function TAFIRST_DORUN(tbl)
        if tbl.variable == 1 then
            AchievementAlertFrame_ShowAlert("TauriAchik Telepítve!")
            TAchik_WaitForFunction(6,TAFIRST_DORUN,tbl)
        elseif tbl.variable == 2 then
            AchievementAlertFrame_ShowAlert("Hitted, mi?")
            TAchik_WaitForFunction(6,TAFIRST_DORUN,tbl)
        elseif tbl.variable == 3 then
            AchievementAlertFrame_ShowAlert("Najó, legyen...")
            TAchik_WaitForFunction(6,TAFIRST_DORUN,tbl)
        elseif tbl.variable == 4 then
     	    TA:CompleteAchievement(nil,"TAFIRST");
        end
		tbl.variable = tbl.variable + 1
    end

    local function TAFIRST(tbl,event,...)
        if event == "ADDON_LOADED" and arg1 == "Blizzard_AchievementUI" then
	        TAFIRST_DORUN(tbl)
        end
    end

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "A Remény Cselekedete",
		description = "VGVsZXDDrXRzZCBhIFRhdXJpQWNoaWsgYWRkb250IGVneSBhY2hpZXZlbWVudCB1dMOhbmkgcmVtw6luecOpcnQ=",
		texture = "Interface\\Icons\\Achievement_bg_tophealer_av",
		points = 10,
		key = "TAFIRST",
		hidden = true,
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
			    variable = 1,
				events = "ADDON_LOADED",
				objective = TAFIRST,
				key = "TAFIRSTC1",
			},
		},
	});

end
