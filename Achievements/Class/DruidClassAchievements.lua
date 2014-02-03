--[[

Achievement Created : 2012.04.24
Achievement Created By : Bliser
Status : 

How it works :
]]--

--MAIN FUNCTION
function CASTSPELLONTARGET(tbl,event,...)
   return  arg10 == tbl.needSpell and arg4 == UnitName("player") and UnitClass("target") == tbl.name
end
--MAIN FUNCTION

function DruidClassAchievements()

    GLOBAL_ACHIEVEMENTS["DCREBIRTH"] = CA:AddAchievement(
	{
		category = TA_CLASS,
		name = "Azt élesztek akit akarok",
		description = "Éleszd újra az alábbi listából minden kasztot harc közben",
		texture = "Interface\\Icons\\spell_nature_reincarnation",
		key = "DCREBIRTH",
		save = TAchik,
		classExistent = "Druid",
		criteria = 
		{
			{
			    name = "Warrior",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC1",
			},
			{
			    name = "Paladin",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC2",
			},
			{
			    name = "Warlock",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC3",
			},
			{
			    name = "Mage",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC4",
			},
			{
			    name = "Shaman",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC5",
			},
			{
			    name = "Druid",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC6",
			},
			{
			    name = "Death Knight",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC7",
			},
			{
			    name = "Hunter",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC8",
			},
			{
			    name = "Rogue",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC9",
			},
			{
			    name = "Priest",
			    needSpell = "Rebirth",
				events = "COMBAT_LOG_EVENT_UNFILTERED",
				objective = CASTSPELLONTARGET,
				key = "DCREBIRTHC10",
			},
			
		},
	});
	
end

 
 