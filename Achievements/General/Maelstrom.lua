local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_Maelstrom()

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "A Maelstrom kalóza",
		description = "Hajózd át a Maelstromot miközben viseled a kalózruha mind a 4 darabját vagy kalózként vagy alcázva",
		texture = "Interface\\Icons\\Inv_helmet_46",
		points = 10,
		key = "MAELSTROM",
		save = TAchik,
		accountWide = true,
		criteria =
	    {
			{
			    variable = 0,
				events = { "INSTANCE_CHANGED" , "ZONE_CHANGED" },
				objective =
				function(tbl,event,...)
					if GetSubZoneText() == "The Great Sea" then
						if tbl.variable > 0 and time() - tbl.variable < 60 then
						    if time() - tbl.variable > 2 then
							    return UnitBuff("player",GetSpellInfo(8222)) or ( IsEquippedItem(22742) and IsEquippedItem(22744) and IsEquippedItem(22745) and IsEquippedItem(22743) )
						    end
						else
							tbl.variable = time()
						end
					end
				end,
				key = "MAELSTROMC1",
			}
		}
	});

end
