local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:AddAchievement_ForeverTogether()

	TA:AddAchievement(
    {
		category = TA_CLASS_WARLOCK,
		name = "Örökre együtt",
		description = "Teljesítsd mind a három \"The Binding\" küldetést",
		texture = "Interface\\Icons\\inv_enchant_voidsphere",
		key = "WARLOCKPETS",
		save = TAchik,
		class = "Warlock",
		points = 10,
		unmergeable = true,
		criteria =
		{
			{
			    name = "Voidwalker",
				qAlliance = { 1689 },
				qHorde = { 9619 , 1471 , 1504 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective =
				function(tbl,event,...)
					for _,id in pairs(tbl["q"..UnitFactionGroup("player")]) do
						if TA.compQuests.table[id] then
                            return true
						end
					end
				end,
			    key = "VOIDWALKC1",
			},
			{
			    name = "Felhunter",
                quest = 1795,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective =
				function(tbl,event,...)
					return TA.compQuests.table[tbl.quest]
				end,
			    key = "FELHUNTERC1",
			},
			{
			    name = "Succubus",
                qAlliance = 1739,
				qHorde = 1513,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective =
				function(tbl,event,...)
					return TA.compQuests.table[tbl["q"..UnitFactionGroup("player")]]
				end,
			    key = "SUCCUBUSC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_CLASS_WARLOCK,
		name = "Közelgö végzet",
		description = "Tárold el a lelked halálod elött 10 másodperccel",
		texture = "Interface\\Icons\\spell_shadow_shadowworddominate",
		key = "SELFSTONED",
		save = TAchik,
		class = "Warlock",
		points = 10,
		unmergeable = true,
		criteria =
		{
		    {
		        events = { "BAG_UPDATE" , "PLAYER_DEAD" },
			    variable = false,
			    timed = true,
			    duration = 10,
			    objective =
			    function(tbl,event,...)
				    if event == "BAG_UPDATE" then
				        if UnitBuff("player","Soulstone Resurrection") and select(7,UnitBuff("player","Soulstone Resurrection")) - GetTime() > 888 then
					        tbl.variable = true
					        TA:StartTimedAchievement(tbl)
					    end
				    else
				        return tbl.variable and TA:TimedAchievementStillGood(tbl)
				    end
			    end,
			    key = "SELFSTONEDC1",
			}
		}
	})

end
