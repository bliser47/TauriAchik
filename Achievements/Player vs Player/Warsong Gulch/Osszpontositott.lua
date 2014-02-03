local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Osszpontositott()

	local function VARBAVISSZA(tbl,event,...)
	    if GetSubZoneText() == tbl.name then
            tbl.variable = tbl.variable + 1
            return tbl.variable/3 >= tbl.needKills
        end
    end

    TA:AddAchievement(
    {
	    category = TA_PVP_WSG,
	    name = "Összpontosított campelés",
	    description = "Szerezz 10 Honorable Kill-t az alábbi helyeken, egy Warsong Gulch alatt",
	    texture = "Interface\\Icons\\ability_hunter_eagleeye",
	    points = 10,
	    key = "VARBAVISSZA",
	    save = TAchik,
		requiredState = { "Warsong Lumber Mill" , "Silverwing Hold" , "Warsong Gulch" },
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		accountWide = true,
	    criteria =
	    {
		    {
		        name = "Warsong Lumber Mill",
		        variable = 0,
		        needKills = 10,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = VARBAVISSZA,
			    key = "MEDENCEC1",
		    },
		    {
		        name = "Silverwing Hold",
		        variable = 0,
		        needKills = 10,
			    events = "PLAYER_PVP_KILLS_CHANGED",
			    objective = VARBAVISSZA,
			    key = "MEDENCEC2",
		    },
	    },
    });

end
