--[[

Achievement Created : 2011.12.18
Achievement Created By : Bliser
Status : 99% (needs test on tauri)

How it works :
  -> When the player enters combat the time is saved 
    -> When the player leaves combat the difference between then and now is made
      -> If the difference is bigger then the required value return true
        -> Otherwise reset timer

]]--

-- Achievement Variables(save=False,temp=False)
local combatTimer = 0

--MAIN FUNCTION
function VEGET(tbl,event,...)
    if event == "PLAYER_REGEN_DISABLED" then
        if IsInBattleground() then
            combatTimer = time()
        end
    end
    if event == "PLAYER_REGEN_ENABLED" then
        if time() - combatTimer >= tbl.required and combatTimer~=0 then
            return true
        else
            combatTimer = 0 
        end
    end
end
--MAIN FUNCTION

function AddVegetNemEroHarc()

    GLOBAL_ACHIEVEMENTS["VEGET"] = CA:AddAchievement(
    {
	    category = FC_PVP,
	    name = "Véget nem érö harc ",
	    description = "Legyél combatban legalább 3 percig egy BG alatt",
	    texture = "Interface\\Icons\\spell_nature_timestop",
	    points = 15,
	    key = "VEGET",
	    save = FailDB,
	    savekey = FCGLOBAL.savekey,
	    criteria = 
	    {
		    {
			    name = "VEGETC1",
			    hidden = true,
			    required = 180,
			    events = { "PLAYER_REGEN_ENABLED" , "PLAYER_REGEN_DISABLED" },
			    objective = VEGET,
			    key = "VEGETC1",
		    },
	    },
    });

end