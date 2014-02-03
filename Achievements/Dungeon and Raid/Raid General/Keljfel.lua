--[[

Achievement Created on: 120316-1933
Achievement Created By: Executioner
Status: ?
           
]]--

--RETURN FUNCTION
function KeljFelR(tbl)
    return tbl.variable["resscount"]
end
--RETURN FUNCTION

--MAIN FUNCTION
function KeljFel(tbl,event, ...) 
		if (tbl.variable["resscount"] == nil) then tbl.variable["resscount"] = 0 end
		if (tbl.variable["instance"] == nil) then tbl.variable["instance"] = (GetZoneText()) end
if ((select(2,IsInInstance()) == "raid") and event=="RESURRECT_REQUEST") then
		if not(GetZoneText() == tbl.variable["instance"]) then tbl.variable["resscount"] = 0; tbl.variable["instance"] = nil end
		if tbl.variable["resscount"] >= 5 then return true end
	end
 end
--MAIN FUNCTION

function AddKeljFel()

    GLOBAL_ACHIEVEMENTS["KeljFel"] = CA:AddAchievement(
    {
		category = FC_PVE_GENERAL,
		name = "Kelj fel! Aha, aha!",
		description = "Kapj újjáélesztést egy 10/25 fös instán belül ötször.",
		texture = TAURIACHIK_PLACEHOLDER_ICON,
		points = 10,
		key = "KeljFel",
		save = FailDB,
		savekey = FCGLOBAL.savekey,
		hidden=false,
		criteria = 
		{
			{
				name = "KeljFel1",
				hidden = false,
				required= 5,
				variable = {},
				value = KeljFelR,
				events = {"RESURRECT_REQUEST","PLAYER_ENTERING_WORLD"},
				objective = KeljFel,
				key = "KeljFel1",
			},
		},
	});
	
end