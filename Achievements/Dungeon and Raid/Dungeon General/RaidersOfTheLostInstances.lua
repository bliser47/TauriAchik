local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_ElveszettInstak()

    local function ELVESZETT(tbl,event,...)
        return arg2 == "UNIT_DIED" and arg7 == tbl.name
    end

    TA:AddAchievement(
    {
	    category = TA_PVE_GENERAL,
	    name = "Az elveszett insták fosztogatói",
	    description = "Végezz a két frakció fövárosának rejtelmeivel",
	    texture = "Interface\\Icons\\racial_dwarf_findtreasure",
	    points = 10,
	    key = "ELVESZETT",
	    save = TAchik,
	    criteria =
	    {
		    {
		        requiredState = "Ragefire Chasm",
		        requiredFunction = "GetZoneText",
				requierdEvents = "INSTANCE_CHANGED",
			    name = "Jergosh the Invoker",
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective = ELVESZETT,
			    key = "ELVESZETTC1",
		    },
		    {
		        requiredState = "Stormwind Stockade",
		        requiredFunction = "GetZoneText",
				requiredEvents = "INSTANCE_CHANGED",
			    name = "Bazil Thredd",
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective = ELVESZETT,
			    key = "ELVESZETTC2",
		    },
	    },
    });

	TA:AddAchievement(
    {
	    category = TA_PVE_GENERAL,
	    name = "Heisenberg terve",
	    description = "Öld meg a Stockadeben található 5 fogjot 2 perc alatt anélkül, hogy eközben valamelyik Defias észrevenne",
	    texture = "Interface\\Icons\\inv_helmet_50",
	    points = 50,
	    key = "PRISON",
	    save = TAchik,
		accountWide = true,
	    criteria =
	    {
		    {
			    names =
				{
				    "Bazil Thredd" ,
					"Bruegal Ironknuckle" ,
					"Kam Deepfury",
                    "Targorr the Dread",
                    "Dextren Ward",
				},
				variable = {},
				timed = true,
				required = 6,
				value = function(tbl) return #tbl.variable end,
				duration = 120,
                events = "RAID_INSTANCE_WELCOME",
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" , "INSTANCE_CHANGED" },
				objective =
				function(tbl,event,...)
				    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
                        if arg2 == "UNIT_DIED" and tContains(tbl.names,arg7) then
		                    if not tContains(tbl.variable,arg7) then
			                    tinsert(tbl.variable,arg7)
						        TA:StartTimedAchievement(tbl)
			                end
		                elseif arg2 == "SWING_DAMAGE" then
						    if arg4:find("Defias") then
							    TA:UnRegisterEvent(tbl,tbl.specialEvents)
							    TA:UnCompleteAchievementCriteria(tbl)
							end
						end
					elseif event == "RAID_INSTANCE_WELCOME" then
					    if arg1 == "Stormwind Stockade" and arg2 == 7200 then
						    TA:RegisterEvent(tbl,tbl.specialEvents)
						end
					elseif GetZoneText() ~= "Stormwind Stockade" then
					    TA:UnRegisterEvent(tbl,tbl.specialEvents)
						TA:UnCompleteAchievementCriteria(tbl)
					end
				end,
				key = "PRISONC1",
			}
		}
	})


end


