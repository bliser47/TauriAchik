local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_AchiWhore()

    TA:AddAchievement(
    {
		category = TA_HIDDEN,
		name = "Teljesítmény szajha",
		description = "S2FwaiBlZ3kgVGF1cmktYWNoaXQsIGFtaSBlZ3kgVGF1cmktYWNoacOpcnQgasOhcg==",
		texture = "Interface\\Icons\\Inv_misc_toy_07",
		points = 10,
		hidden = true,
		key = "ACHIWHORE",
		save = TAchik,
		meta = true,
		accountWide = true,
		criteria =
	    {
			{
				events = "TA_ACHIEVEMENT_EARNED",
				objective =
				function(tbl,event,...)
                    local achi = ...
					return achi and achi.meta
				end,
				key = "ACHIWHOREC1",
			},
		},
	});

end
