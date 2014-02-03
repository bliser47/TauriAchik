--[[
Achievement Created on: 120312-1657
Achievement Created By: Executioner
Status: ?
]]--

-- Achievement Variables(save=True,temp=True)
if giveyouupCounter1 == nil then
    giveyouupCounter1 = 0
end


--RETURN FUNCTION
function NGGYUV()
    return giveyouupCounter1
end
--RETURN FUNCTION

--CHECK FUNCTION
function NGGYU_C()

end
--MAIN FUNCTION

function AddNevergonnagiveyouup()

    GLOBAL_ACHIEVEMENTS["NGGYU"] = CA:AddAchievement({
	    category = FC_PVE_GENERAL,
	    name = "Sose foglak feladni",
	    description = "Csinálj meg 25 questet anélkül, hogy közbe egyet is feladnál",
	    texture = "Interface\\Icons\\inv_fabric_soulcloth",
	    points = 25,
	    key = "NGGYU",
     	save = FailDB,
	    savekey = FCGLOBAL.savekey,
	    criteria = 
	    {
		    {
			    name = "NGGYU1",
			    hidden = false,
			    required = 40,
			    value = NGGYUV,
			    events = { "QUEST_FINISHED" , "CHAT_MSG_SYSTEM" },
			    objective = NGGYU_C,
			    key = "NGGYU1",
		    },
	    },
    });

end