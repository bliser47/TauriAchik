local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_OnlinePlayersAchievements()

	local function ONLINEPLAYERSV(tbl)
        return TAchik_GetOnline()
    end

    local function ONLINEPLAYERS(tbl,event,...)
        return tbl.value(tbl) >= tbl.required
    end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Achizó Party",
	    description = "Legyetek online a frakciódon belül 5-en TauriAchik addonnal",
	    texture = "Interface\\Addons\\TauriAchik\\Icons\\Achievement_guild_level5",
	    points = 5,
	    key = "EGYP",
	    save = TAchik,
		accountWide = true,
	    criteria =
	    {
		    {
                required = 5,
                value = ONLINEPLAYERSV,
			    events = "TACHIK_PING",
			    objective = ONLINEPLAYERS,
			    key = "EGYPC1",
		    },
	    },
    });

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Achizó Raidecske",
	    description = "Legyetek online a frakciódon belül 10-en TauriAchik addonnal",
	    texture = "Interface\\Addons\\TauriAchik\\Icons\\Achievement_guild_level10",
	    previous = TA.achisKeys["EGYP"],
	    points = 10,
	    key = "EGYP2",
	    save = TAchik,
		accountWide = true,
	    criteria =
	    {
		    {
                required = 10,
                value = ONLINEPLAYERSV,
			    events = "TACHIK_PING",
			    objective = ONLINEPLAYERS,
			    key = "EGYPC2",
		    },
	    },
    });

end
