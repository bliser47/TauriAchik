local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_DuplaSzivarvany()

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Dupla szivárvány!! De hol?",
	    description = "Csodálj meg egy szivárványt a /gasp emote által",
	    texture = "Interface\\Addons\\TauriAchik\\Icons\\Achievement_doublerainbow.tga",
	    points = 10,
	    key = "SZIVA",
	    save = TAchik,
		accountWide = true,
		requiredState = 4,
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
		        requiredState =
				{
				    ["Sholazar Basin"] =
					{
					    requiredState = "River's Heart",
					    requiredFunction = "GetSubZoneText",
						requiredEvents = { "ZONE_CHANGED" }
					}
				},
		        requiredFunction = "GetZoneText",
				requiredEvents = "ZONE_CHANGED_NEW_AREA",
			    events = "CHAT_MSG_TEXT_EMOTE",
			    objective =
				function (tbl,event,...)
				    return arg1:find("gasp") and arg2 == UnitName("player")
				end,
			    key = "SZIVAC1",
		    },
	    },
    });

end
