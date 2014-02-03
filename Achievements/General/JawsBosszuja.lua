local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_JawsBosszuja()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Jaws bosszúja",
		description = "Öljön meg egy cápa",
		texture = "Interface\\Addons\\TauriAchik\\Icons\\INV_Pet_BabyShark",
		points = 10,
		key = "JAWSB",
		save = TAchik,
		accountWide = true,
		requiredState = { 1 , 2 , 4 },
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
		criteria =
		{
			{
			    requiredState =
				{
				    ["Dalaran"] =
					{
					    requiredState = "The Black Market",
						requiredFunction = "GetSubZoneText",
						requiredEvents = { "ZONE_CHANGED_INDOORS" }
					},
				    "Tanaris" ,
				    ["Howling Fjord"] =
					{
					    requiredState = true,
						requiredFunction = "TAchik_InMapGrid,20-75/2-15",
						requiredEvents = { "ZONE_CHANGED" }
					},
				    ["Borean Tundra"] =
					{
						requiredState = true,
						requiredFunction = "TAchik_InMapGrid,55-70/60-75",
						requiredEvents = { "ZONE_CHANGED" }
					},
				    "Dustwallow Marsh",
				    "The Barrens",
					"The Crimson Dawn",
				    ["Icecrown"] =
					{
					    requiredState = true,
						requiredFunction = "TAchik_InMapGrid,60-80/0-20",
						requiredEvents = { "ZONE_CHANGED" }
					},
				    "Alterac Mountains",
			    	"Silverpine Forest",
				    ["Durotar"] =
                    {
					    requiredState = "The Merchant Coast",
						requiredFunction = "GetSubZoneText",
						requiredEvents = { "ZONE_CHANGED" }
                    },
				    "Azshara"
				},
		        requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
				variable = false,
				events = { "COMBAT_LOG_EVENT_UNFILTERED" , "PLAYER_REGEN_ENABLED" },
				objective =
				function(tbl,event,...)
                    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
                        if arg2 == "UNIT_DIED" then
                            return arg7 == UnitName("player") and tbl.variable
                        else
                            if arg4 and ( arg4:lower():find("shark") or arg4 == "Segacedi" ) and not UnitIsPlayer(arg4) then
                               tbl.variable = true
                            end
                        end
                    elseif event == "PLAYER_REGEN_ENABLED" then
                        tbl.variable = false
                    end
				end,
				key = "JAWSBC1",
			},
		},
	});

end
