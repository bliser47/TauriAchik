local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Broker()

	TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Dalaran bróker",
		description = "Nyisd ki Dalaran két Guild bankját 30 masodperc alatt",
		texture = "Interface\\Icons\\inv_misc_bag_16",
		points = 10,
		key = "DALABROKER",
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
			    variable = {},
				timed = true,
				duration = 30,
			    needZone = { "The Bank of Dalaran" , "Dalaran Merchant's Bank" },
				events = "GUILDBANKFRAME_OPENED",
				objective =
				function(tbl,event,...)
				     if event == "GUILDBANKFRAME_OPENED" then
						if tContains(tbl.needZone,GetSubZoneText()) then
						    if not tContains(tbl.variable,GetSubZoneText()) then
							    tinsert(tbl.variable,GetSubZoneText())
								TA:StartTimedAchievement(tbl)
								return #tbl.variable == 2
							end
						end
					end
				end,
				key = "DALABROKERC1",
			}
		}
	});

end
