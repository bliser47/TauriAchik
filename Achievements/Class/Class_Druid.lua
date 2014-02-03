--[[

Achievement Created: 120318-1129
Achievement Created By : Executioner

]]--


function Ittrepul(tbl,event,...)
    if arg2==SPELL_AURA_REMOVED and arg4 == iam and arg10:find("Flight Form") then
		    TA_druidflyend = GetTime()
    end
	if arg2 == "ENVIRONMENTAL_DAMAGE" and arg9 == "FALLING" and arg7 == iam and UnitHealth("player") == 1 and TA_druidflyend+3 < GetTime() then
        return true
	elseif arg2 == "ENVIRONMENTAL_DAMAGE" and arg9 == "FALLING" and arg7 == iam and UnitHealth("player") > 1 then
		TA_druidflyend = 2^31-2
	end
end

function AddDruid_Ittrepul()

    GLOBAL_ACHIEVEMENTS["DR_REPUL"] = CA:AddAchievement(
    {
		category = FC_CLASS,
		name = "Itt repül a-",
		description = "Halj meg egy halálos eséstől, miután Fly formból kijőve legalább 30 yardot estél",
		texture = TAURIACHIK_PLACEHOLDER_ICON,
		points = 10,
		key = "DR_REPUL",
		hidden = false ,
		save = FailDB,
		savekey = FCGLOBAL.savekey,
		criteria =
	    {
			{
				name = "IttrepulC1",
				events = COMBAT_LOG_EVENT_UNFILTERED ,
				objective = Ittrepul,
				key = "IttrepulC1",
				hidden = true,
			},
		},
	});

end

function Joejt(tbl,event,...)
    if arg2==SPELL_AURA_APPLIED and arg4 == iam and arg7:find("Grizzly") and arg10 == "Hibernate" then
		   return true
	end
end

function AddDruid_Joejt()

    GLOBAL_ACHIEVEMENTS["Joejt"] = CA:AddAchievement(
    {
		category = FC_CLASS,
		name = "Vissza a barlangba",
		description = "Küldj el aludni egy Grizzly medvét",
		texture = TAURIACHIK_PLACEHOLDER_ICON,
		points = 10,
		key = "Joejt",
		hidden = false ,
		save = FailDB,
		savekey = FCGLOBAL.savekey,
		criteria =
	    {
			{
				name = "JoejtC1",
				events = COMBAT_LOG_EVENT_UNFILTERED ,
				objective = Joejt,
				key = "JoejtC1",
				hidden = true,
			},
		},
	});

end
