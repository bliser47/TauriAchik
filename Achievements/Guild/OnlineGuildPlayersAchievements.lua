--[[

Achievement Created : 2012.02.04
Achievement Created By : Bliser
Status : 0%

How it works

]]--

--RETURN FUNCTION
function ACHIZOGUILDV(tbl)
    return #tbl.table + 1
end
--RETURN FUNCTION

--MAIN FUNCTION
function ACHIZOGUILD(tbl,event,...)
    if tbl.value(tbl) >= tbl.required then
        return true
    end
end
--MAIN FUNCTION


function AddOnlineGuildPlayers()

    GLOBAL_ACHIEVEMENTS["ACHIZOGUILD"] = CA:AddAchievement(
    {
		category = TA_GUILD,
		name = "Achizó Guild",
		description = "Legyetek online a guildeden belül 5-en TauriAchik addonnal",
		texture = "Interface\\Addons\\TauriAchik\\Icons\\Achievement_guildperk_mrpopularity",
		points = 20,
		key = "ACHIZOGUILD",
		save = TAchik,
		criteria = 
		{
			{
			    name = "5 online",
			    table = TAchi_guildonlineplayers,
				value = ACHIZOGUILDV,
				required = 5,
				events = "CHAT_MSG_ADDON",
				objective = ACHIZOGUILD,
				key = "ACHIZOGUILDC1",
			
			},
		},
	});
	
	GLOBAL_ACHIEVEMENTS["ACHIBETEGGUILD"] = CA:AddAchievement(
    {
		category = TA_GUILD,
		name = "Achibeteg Guild",
		description = "Legyetek online a guildeden belül 10-en TauriAchik addonnal",
		texture = "Interface\\Addons\\TauriAchik\\Icons\\Achievement_guildperk_mrpopularity_rank2",
		previous = GLOBAL_ACHIEVEMENTS["ACHIZOGUILD"],
		points = 20,
		key = "ACHIBETEGGUILD",
		save = TAchik,
		criteria = 
		{
			{
			    name = "10 online",
			    table = TAchi_guildonlineplayers,
				value = ACHIZOGUILDV,
				required = 10,
				events = "CHAT_MSG_ADDON",
				objective = ACHIZOGUILD,
				key = "ACHIBETEGGUILDC1",
			
			},
		},
	});
	
end
