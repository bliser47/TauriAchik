local CA = LibStub:GetLibrary("TauriAchikLib")
function CA:AddAchievement_Gbmoney()

	local function GBMONEY(tbl,event,...)
        if event == "GUILDBANKFRAME_OPENED" then
            tbl.variable.temp = GetMoney()
        elseif event == "GUILDBANKFRAME_CLOSED" then
            tbl.variable.temp = false
        elseif tbl.variable.temp then
            if tbl.variable.temp - GetMoney() > 0 then
                tbl.variable.counter = tbl.variable.counter + ( tbl.variable.temp - GetMoney() )
                tbl.variable.temp = GetMoney()
            end
            return tbl.value(tbl) >= tbl.required
        end
    end

    local function GBMONEYV(tbl)
        return tbl.variable.counter/10000
    end

    GLOBAL_ACHIEVEMENTS["ADKA"] = CA:AddAchievement(
    {
		category = TA_GUILD,
		name = "Adakozó",
		description = "Tegyél be 200 aranyat a "..GetGuildInfo("player").." guild bankjába",
		texture = "Interface\\Icons\\Inv_misc_coin_04",
		points = 5,
		key = "ADKA",
		save = TAchik,
		guildWide = true,
		criteria =
		{
			{
			    name = "200 Gold",
				required = 200,
				value = GBMONEYV,
				variable = { ["counter"] = 0 , ["temp"] = false },
				events = { "GUILDBANKFRAME_OPENED" , "GUILDBANKFRAME_CLOSED"  , "PLAYER_MONEY" },
				objective = GBMONEY,
				key = "ADKAC1",
			},
		},
	});

	GLOBAL_ACHIEVEMENTS["FILANTR"] = CA:AddAchievement(
    {
		category = TA_GUILD,
		previous = GLOBAL_ACHIEVEMENTS["ADKA"],
		name = "Filantróp",
		description = "Tegyél be 1000 aranyat a "..GetGuildInfo("player").." guild bankjába",
		texture = "Interface\\Icons\\Inv_misc_coin_02",
		points = 10,
		key = "FILANTR",
		save = TAchik,
		guildWide = true,
		criteria =
		{
			{
			    name = "1000 gold",
				required = 1000,
				value = GBMONEYV,
				variable = { ["counter"] = 0 , ["temp"] = false },
				events = { "GUILDBANKFRAME_OPENED" , "GUILDBANKFRAME_CLOSED"  , "PLAYER_MONEY" },
				objective = GBMONEY,
				key = "FILANTRC1",
			},
		},
	});

end
