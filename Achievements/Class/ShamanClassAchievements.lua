local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_NonCombatBL()

    TA:AddAchievement(
    {
		category = TA_CLASS_SHAMAN,
		factionDependent = true,
		nameHorde = "Elmaradt Vérengzés",
		nameAlliance = "Lecsúszott hös",
		descriptionHorde = "Harcon kívül használd el a Bloodlust képességed",
		descriptionAlliance = "Harcon kívül használd el a Heroism képességed",
		textureHorde = ICONS_ROOT.."spell_nature_bloodlust",
		textureAlliance = ICONS_ROOT.."ability_shaman_heroism",
		key = "OOCBL",
		class = "Shaman",
		points = 5,
		save = TAchik,
		criteria =
		{
			{
				events = { "PLAYER_ENTERING_WORLD" , "PLAYER_REGEN_DISABLED" , "PLAYER_REGEN_ENABLED" },
				specialEvents = { "UNIT_SPELLCAST_SUCCEEDED" },
				objective =
				function(tbl,event,...)
				    if event == "UNIT_SPELLCAST_SUCCEEDED" then
				        return arg1 == "player" and ( arg2 == "Bloodlust" or arg2 == "Heroism" )
					else
					    if event == "PLAYER_REGEN_DISABLED" then
						    TA:UnRegisterEvent(tbl,tbl.specialEvents)
						elseif not InCombatLockdown() then
						    TA:RegisterEvent(tbl,tbl.specialEvents)
						end
					end
				end,
				key = "OOCBL",
			},
		},
	});

end

function TA:AddAchievement_KillWithWater()

    TA:AddAchievement(
    {
		category = TA_CLASS_SHAMAN,
		name = "Vigyázz, víz!",
		description = "Ölj meg valakit azáltal, hogy megáldod vízenjárással",
		class = "Shaman",
		texture = ICONS_ROOT.."inv_elemental_primal_water",
		key = "WATERWKILLER",
		points = 10,
		save = TAchik,
		criteria =
		{
			{
			    variable = {},
				events = "UNIT_SPELLCAST_SENT",
				specialEvents = { "COMBAT_LOG_EVENT_UNFILTERED" },
				objective =
				function(tbl,event,...)
				    if event == "UNIT_SPELLCAST_SENT" then
				        if arg1 =="player" and arg2 == "Water Walking" then
					        tinsert(tbl.variable,{ ["name"] = arg4 , ["added"] = time() })
							if #tbl.variable == 1 then
							    TA:RegisterEvent(tbl,tbl.specialEvents)
							end
					    end
					else
					    for a,b in pairs(tbl.variable) do
					        if time() - b.added > 10 then
                               tremove(tbl.variable,a)
						    elseif b.damage then
								if time() - b.damage.at > 5 then
                                    b.damage = nil
								end
							end
						end
						if #tbl.variable == 0 then
                            TA:UnRegisterEvent(tbl,tbl.specialEvents)
                            return
					    end
						if arg2 == "ENVIRONMENTAL_DAMAGE" then
						    for a,c in pairs(tbl.variable) do
						        if c.name == arg7 then
                                    tbl.variable[a].damage = { ["name" ] = arg7 , ["at"] = time() }
								end
							end
					    elseif arg2 == "UNIT_DIED" then
						    for a,b in pairs(tbl.variable) do
							    if b.name == arg7 and b.damage then
								    return true
								end
							end
						end
					end
				end,
				key = "WATERWKILLERC1",
			},
		},
	});

end
