--[[

Achievement Created on: 120317-0845
Achievement Created by: Executioner

]]--


function HVER(tbl,event,...)
   if event==COMBAT_LOG_EVENT_UNFILTERED then -- note: arg5 = source, arg7=target
	if arg2==UNIT_DIED and arg5==iam then -- i kill first
		TA_Print("1-"..arg1.." 3-"..arg3.." 5-"..arg5.." 6-"..arg6.." 8-"..arg8,"debug")
		TA_hverT = arg7
		TA_hvertime=GetTime()
	end
	if arg2==UNIT_DIED and arg5==TA_hverT and arg7==iam and TA_hvertime+TA_ifdev(10,1.5)<GetTime() then
		return true
	end
	
	if arg2==UNIT_DIED and arg7==iam then -- s/he kills first
		TA_Print("1-"..arg1.." 3-"..arg3.." 5-"..arg5.." 6-"..arg6.." 8-"..arg8,"debug")
		TA_hverS = arg5
		TA_hvertime2=GetTime()
	end
	if arg2==UNIT_DIED and arg7==TA_hverS and arg5==iam and TA_hvertime2+TA_ifdev(10,1.5)<GetTime() then
		return true
	end
   end
end

function AddHoltverseny()

    GLOBAL_ACHIEVEMENTS["HVER"] = TA.CA:AddAchievement(
    {
	    category = TA_PVP,
	    name = "Holtverseny",
	    description = "Öljétek meg egymást egy ellenféllel egy másodpercen belül",
	    texture = TAURIACHIK_PLACEHOLDER_ICON,
	    points = 10,
	    key = "HVER",
	    save = TAchik,
	    savekey = TAGLOBAL.savekey,
	    criteria = 
	    {
		    {
			    hidden = true,
			    events = { "PLAYER_PVP_KILLS_CHANGED" , "COMBAT_LOG_EVENT_UNFILTERED" },
			    objective = HVER,
			    key = "HVERC1",
		    },
	    },
    });

end