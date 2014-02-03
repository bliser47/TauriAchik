--[[
Achievement Created : 2012.01.03
Achievement Created By : Bliser
Status : 50% (needs objective function)

How it works
  ->   
]]--

--Achievement Variables(save=True,temp=True)
if killingSpreeTimer == nil then
    killingSpreeTimer = 0
end
if killingSpreeValue == nil then
    killingSpreeValue = 0
end

--VALUE FUNCTION
function KILLINGSPREEV()
    if time() - killingSpreeTimer > 30  then
        killingSpreeValue = 0
        killingSpreeTimer = 0
    end
    return killingSpreeValue
end
--VALUE FUNCTION

--MAIN FUNCTION
function KILLINGSPREE(tbl,event,...)
    if event == "PLAYER_PVP_KILLS_CHANGED" then
        if IsInBattleground() then
            if killingSpreeTimer == 0 then
                killingSpreeTimer = time()
            end
            killingSpreeValue = killingSpreeValue + 1/3
            if killingSpreeValue >= tbl.required and (time() - killingSpreeTimer < 30)then
                return true
            end
        end
    end
    if event == "ZONE_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
        if IsInBattleground() == false then
            killingSpreeTimer = 0
            killingSpreeValue = 0
        end
    end
end
--MAIN FUNCTION

function AddKillingSpree()

    GLOBAL_ACHIEVEMENTS["KINGSPREE"] = CA:AddAchievement(
    {
		category = FC_PVP,
		name = UnitRace("player").." Nindzsa",
		description = "Ölj meg egy BG-n 10 ellenséget 30 másodperc alatt",
		texture = "Interface\\Icons\\inv_throwingknife_07",
    	points = 30,
		key = "KINGSPREE",
		save = FailDB,
		savekey = FCGLOBAL.savekey,
		criteria = 
		{
        	{
				name = "KILLINGSPREEC1",
				hidden = false,
            	required=10,
            	value = KILLINGSPREEV,
				events = { "COMBAT_LOG_EVENT_UNFILTERED" , "PLAYER_PVP_KILLS_CHANGED" , "PLAYER_ENTERING_WORLD" , "ZONE_CHANGED" },
				objective = KILLINGSPREE,
				key = "KILLINGSPREEC1",
			},	
		},
	});

end