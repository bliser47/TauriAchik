--[[
Achievement Created on: 120312-1835
Achievement Created By: Executioner
Status: ?

]]--

--Achievement Variables(save=True,temp=True)
if combohk == nil then
    combohk = 0
end

--RETURN FUNCTION
function ComboV()
    return combohk/3
end
--RETURN FUNCTION

--CHECK FUNCTION
function ComboCHK()
    if combohk > 0 and not IsInBattleground() then
        combohk = 0
    end
end
--CHECK FUNCTION

--MAIN FUNCTION
function ComboO(tbl,event,...)
    if event == "PLAYER_PVP_KILLS_CHANGED" then
        if IsInBattleground() then
                if combohk < tbl.required then
					                    combohk = combohk + 1
										end
                end
        end
    if event == "ZONE_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
        ComboCHK()
    end
	if event == "PLAYER_DEAD" then
	 if not(combohk == tbl.required) then
	 combohk = 0
	 else
	 return true
	end
	end
end
--MAIN FUNCTION

function AddCombo()

    GLOBAL_ACHIEVEMENTS["2Combo"] = TA.CA:AddAchievement(
    {
		category = TA_PVP,
		name = "C-C-C-Combo Breaker!",
		description = "Halj meg egy BG-n, miután szereztél 15 Honorable Kill-t",
		texture = "Interface\\Icons\\ability_druid_rake",
		points = 10,
		info="Elég, ha (relatívan) messze vagy az ellenségtöl, csak meglegyen a 30 yard; így esélyes hogy nem halsz meg a 15 HK megszerzése elött.",
		key = "2Combo",
		save = TAchik,
		savekey = TAGLOBAL.savekey,
		criteria = 
		{
			{
				name = "2ComboC1",
				hidden = false,
				required = 15,
				value = ComboV,
				events = { "PLAYER_PVP_KILLS_CHANGED" , "ZONE_CHANGED" , "PLAYER_ENTERING_WORLD","PLAYER_DEAD"},
				objective = ComboO,
				key = "2ComboC1",
		    },
		},
	});
	
end