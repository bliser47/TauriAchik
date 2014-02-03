local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Pedobear()

    TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL,
		name = "Pedómaci kalandjai",
		description = "Egy legalább 30 szintes karival, segíts egy 18-nál kisebb szintü játékosnak egy küldetés befejezésében",
		texture = "Interface\\Addons\\TauriAchik\\Icons\\Inv_misc_bearcubbrown",
		points = 10,
		key = "PEDOBEAR",
		save = TAchik,
		accountWide = true,
		criteria =
		{
			{
				events = "UNIT_QUEST_LOG_CHANGED",
				objective =
				function(tbl,event,...)
                    if UnitLevel("player") > 29 and UnitName(arg1) ~= UnitName("player") then
                        for i=1,5 do
                            return UnitExists("party"..i) and UnitName(arg1) == UnitName("party"..i) and UnitLevel(arg1) < 18
                        end
                    end
				end,
				key = "PEDOBEARC1",
			},
		},
	});

	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_10,
		name = "Junior Kincskeresö",
		description = "Teljesítsd a \"Captain Sanders' Hidden Treasure\" sorozat utolsó küldetését megtalálva Captain Sanders kincsét",
		texture = "Interface\\Icons\\inv_misc_map_01",
		key = "QTREASURE1",
		save = TAchik,
		unmergeable = true,
		invisible = true,
		criteria =
		{
			{
				quest = 140,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QTREASUREC1",
			},
		},
	});

	local function QDO(tbl,event,...)
	    if type(tbl.quest) == "number" then tbl.quest = { tbl.quest } end
		for i=1,#tbl.quest do
		    if TA.compQuests.table[tbl.quest[i]] then
                 return true
			end
		end
	end
	TA:AddAchievement(
    {
		category = TA_QUESTS_GENERAL_20,
		nameAlliance = "A Defias testvériség bukása",
		descriptionAlliance = "Teljesítsd a \"Brotherhood's End\" küldetést",
		textureAlliance = "Interface\\Icons\\inv_misc_bandana_03",
		nameHorde = "Arugal fövarázsló bukása",
		descriptionHorde = "Teljesítsd az \"Arugal Must Die\" küldetést",
		textureHorde = "Interface\\Icons\\inv_chest_cloth_31",
		key = "QBOSS1",
		factionDependent = true,
		save = TAchik,
		unmergeable = true,
		points = 10,
		racePriority = { "Human" , "Undead" },
		criteria =
		{
			{
				factionExistent = "Alliance",
				quest = { 395 , 396 },
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QBOSS1C1",
			},
			{
			    factionExistent = "Horde",
				quest = 1014,
				events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
				objective = QDO,
			    key = "QBOSS1C2",
			}
		},
	});

	TA:AddAchievement(
    {
			category = TA_QUESTS_GENERAL_40,
			factionDependent = true,
			nameAlliance = "A megtalált diplomata",
			descriptionAlliance = "Teljesítsd a \"The Missing Diplomat\" sorozat utolsó küldetését",
			textureAlliance = "Interface\\Icons\\inv_scroll_01",
			nameHorde = "",
			descriptionHorde = "",
			textureHorde = "",
			key = "QHIGH",
			save = TAchik,
			points = 10,
			unmergeable = true,
			criteria =
			{
				{
				    factionExistent = "Alliance",
					quest = 1267,
					events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
					objective = QDO,
					key = "QHIGHC1",
				},
				{
				    factionExistent = "Horde",
					quest = 1267,
					events = { "QUESTDATA_UPDATED" , "PLAYER_ENTERING_WORLD" },
					objective = QDO,
					key = "QHIGHC2",
				}
			}
	})

end
