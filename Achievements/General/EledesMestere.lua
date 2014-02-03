local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_EledesMestere()

	local function RESURRECT(tbl,event,...)
        return arg2 == "SPELL_RESURRECT" and arg7 == UnitName("player") and tContains(tbl.needSpell,arg10)
    end

    TA:AddAchievement(
    {
	    category = TA_FUN_GENERAL,
	    name = "Éledés mestere",
	    description = "Élesszen fel minden kaszt az alábbi listából",
	    texture = "Interface\\Icons\\spell_holy_heal",
	    points = 5,
	    key = "RESURRECT",
	    save = TAchik,
		requiredState = 1,
        requiredFunction = "UnitIsDead,player",
		requiredEvents = { "PLAYER_DEAD" , "PLAYER_ALIVE" },
	    criteria =
	    {
		    {
		        name = "Priest",
		        needSpell = { "Resurrection" },
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective = RESURRECT,
			    key = "RESURRECTC1",
		    },
		    {
		        name = "Paladin",
		        needSpell = { "Redemption" },
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective = RESURRECT,
			    key = "RESURRECTC2",
		    },
		    {
		        name = "Shaman",
		        needSpell = { "Ancestral Spirit" },
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective = RESURRECT,
			    key = "RESURRECTC3",
		    },
		    {
		        name = "Druid",
		        needSpell = { "Revive" , "Rebirth" },
			    events = "COMBAT_LOG_EVENT_UNFILTERED",
			    objective = RESURRECT,
			    key = "RESURRECTC4",
		    },
	    },
    });

end


