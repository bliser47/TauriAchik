local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ForestFuss()

	local function FORESTFUSS(tbl,event,...)
        return UnitBuff("player","Netherstorm Flag") and GetSubZoneText() == tbl.name
    end

	TA:AddAchievement(
	{
		category = TA_PVP_EOS,
		name = "Zöldlámpás a viharban",
		description = "Szerezz 30 Honorable Kill-t egy Eye of the Storm alatt, miközben nállad van a zászló",
		texture = "Interface\\Icons\\inv_misc_summerfest_braziergreen",
		points = 10,
		key = "EOSHONOR",
		save = TAchik,
		requiredState = "Eye of the Storm",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
		    {
			    variable = 0,
				required = 30,
				value = function(tbl) return tbl.variable/3 end,
				events = "PLAYER_PVP_KILLS_CHANGED",
				objective =
				function(tbl,event,...)
			        if UnitAura("player",GetSpellInfo(34976))  then
                        tbl.variable = tbl.variable + 1
		                return tbl.value(tbl) >= tbl.required
                    end
				end,
				key = "EOSHONORC1",
			},
		}
	})

	TA:AddAchievement(
	{
		category = TA_PVP_EOS,
		name = "Torony ör",
		description = "Foglald el teljes mértékben Eye of the Storm valamelyik toronyát",
		texture = "Interface\\Icons\\spell_nature_shamanrage",
		points = 10,
		key = "EOSSTAND",
		save = TAchik,
		requiredState =
		{
		    ["Eye of the Storm"] =
			{
			    requiredState = { "Fel Reaver Ruins" , "Blood Elf Tower", "Mage Tower" , "Draenei Ruins" },
				requiredFunction = "GetSubZoneText",
				requiredEvents = { "ZONE_CHANGED" }
			}
		},
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		resetOnLeave = true,
		criteria =
		{
		    {
				events = "UPDATE_WORLD_STATES",
				variable = false,
				objective =
				function(tbl,event,...)
				    if not UnitIsDead("player") and WorldStateCaptureBar1 and WorldStateCaptureBar1:IsShown() then
					    if UnitFactionGroup("player") == "Alliance" then
                            if WorldStateCaptureBar1.oldValue  > 50 then
							    tbl.variable = true
							elseif WorldStateCaptureBar1.oldValue < 35 then
							    return tbl.variable
							end
						else
                            if WorldStateCaptureBar1.oldValue < 50 then
							    tbl.variable = true
							elseif WorldStateCaptureBar1.oldValue > 90 then
							    return tbl.variable
							end
						end
				    else
                        tbl.variable = false
					end
				end,
				key = "EOSSTANDC1",
			},
		}
	})


	TA:AddAchievement(
	{
		category = TA_PVP_EOS,
		name = "Fuss Forest Gump, Fuss !",
		description = "Fuss körbe Eye Of The Stormon anélkül hogy meghalnál, érintve mind a 4 bázist miközben nálad van a zászló",
		texture = "Interface\\Icons\\Spell_nature_mentalquickness",
		points = 30,
		key = "FORESFUSS",
		save = TAchik,
		requiredState = "Eye of the Storm",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		events = "PLAYER_DEAD",
		resetOnLeave = true,
		resetOnDeath = true,
		criteria =
		{
			{
				name = "Fel Reaver Ruins",
				events = "ZONE_CHANGED",
				objective = FORESTFUSS,
				key = "FORESFUSSC1",
			},
			{
				name = "Blood Elf Tower",
				events = "ZONE_CHANGED",
				objective = FORESTFUSS,
				key = "FORESFUSSC2",
			},
			{
				name = "Mage Tower",
				events = "ZONE_CHANGED",
				objective = FORESTFUSS,
				key = "FORESFUSSC3",
			},
			{
				name = "Draenei Ruins",
				events = "ZONE_CHANGED",
				objective = FORESTFUSS,
				key = "FORESFUSSC4",
			},
		},
	});



	TA:AddAchievement(
    {
	    category = TA_PVP_EOS,
	    name = "Vadvihar",
        description = "Nyerd meg Eye of the Stormot kevesebb mint 100 pont különbséggel",
        texture = "Interface\\Icons\\spell_nature_callstorm",
        points = 20,
	    key = "EOSALMOST",
	    save = TAchik,
		requiredState = "Eye of the Storm",
	    requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
		accountWide = true,
	    criteria =
	    {
		    {
				events = "CHAT_MSG_BG_SYSTEM_NEUTRAL",
			    objective =
				function(tbl,event,...)
				    if arg1:find(UnitFactionGroup("player").." wins!") then
                        local aPoints = select(3,GetWorldStateUIInfo(2)):match("%d+%d+%d+%/%d+%d+%d+%d+")
						local hPoints = select(3,GetWorldStateUIInfo(3)):match("%d+%d+%d+%/%d+%d+%d+%d+")
						if aPoints and hPoints then
						    aPoints = tonumber(select(1,string.split("/",aPoints)))
                            hPoints = tonumber(select(1,string.split("/",hPoints)))
						    if UnitFactionGroup("player") == "Alliance" then
						        return aPoints - hPoints < 100
							else
                                return hPoints - aPoints < 100
							end
						end
					end
				end,
			    key = "EOSALMOSTC1",
		    },
	    },
    });

	local function EOSBUFF(tbl,event,...)
        return arg1 == "player" and ( arg2 == "Restoration" or arg2 == "Berserking" or arg2 == "Speed" )
    end

	TA:AddAchievement(
    {
	    category = TA_PVP_EOS,
	    name = "Áldás a viharban",
        description = "Eye of the Stormon szedd fel a Berserking/Restoration/Speed buffokat az alábbi helyeken",
        texture = "Interface\\Icons\\spell_shaman_staticshock",
        points = 10,
	    key = "EOSBUFF",
	    save = TAchik,
		requiredState = "Eye of the Storm",
		requiredFunction = "GetZoneText",
		requiredEvents = { "ENTER_BATTLEGROUND" , "LEAVE_BATTLEGROUND" },
	    criteria =
	    {
	        {
	            name = "Fel Reaver Ruins",
		        requiredState = "Fel Reaver Ruins",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = EOSBUFF,
			    key = "EOSBUFFC1",
		    },
		    {
		        name = "Blood Elf Tower",
		        requiredState = "Blood Elf Tower",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = EOSBUFF,
			    key = "EOSBUFFC2",
		    },
		    {
		        name = "Mage Tower",
		        requiredState = "Mage Tower",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = EOSBUFF,
			    key = "EOSBUFFC3",
		    },
		    {
		        name = "Draenei Ruins",
		        requiredState = "Draenei Ruins",
		        requiredFunction = "GetSubZoneText",
				requiredEvents = "ZONE_CHANGED",
			    events = "UNIT_SPELLCAST_SUCCEEDED",
			    objective = EOSBUFF,
			    key = "EOSBUFFC4",
		    },
	    },
    });


end
