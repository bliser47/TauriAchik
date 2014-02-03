--[[

                   Optimization for TauriAchik Core 2.0
                                By Bliser
]]--

local CA = LibStub:GetLibrary("TauriAchikLib")

function CA:RegisterOptimizationEvent(toTable,fromTable)
    for k,v in pairs(fromTable.requiredEvents) do
		tinsert(toTable.requiredEvents,v)
		TAchik_Print(" - > Optimization Registering Event : "..v.." for "..toTable.key,"debug")
    end
end

function CA:UnRegisterOptimizationEvent(fromTable,theTable)
    for k,v in pairs(theTable.requiredEvents) do
	    for r,p in pairs(fromTable.requiredEvents) do
		    -- IF events match and the keys of tables match
		    if v == p and fromTable.key == theTable.of then
		        local optimTable = CA.optimAchi
		        if fromTable.parent then optimTable = CA.optimCrit end
			    if optimTable[p] then
			        for x,y in pairs(optimTable[p]) do
						if y.key == fromTable.key then
                            tremove(optimTable[p],x);
                            TAchik_Print(" <- Optimization UnRegistering Event : "..v.." from "..fromTable.key,"debug")
						end
					end
					if #optimTable[p] == 0 then
						if not CA:IsSpecialEvent(p) then
							CA.frame:UnregisterEvent(p);
							TAchik_Print(" <--- Optimization UnRegistering Event : "..v,"debug")
						end
						optimTable[p] = nil;
				    end
			    end
				tremove(fromTable.requiredEvents,r)
				TAchik_Print(" <-- Optimization Removing Event : "..v.." from "..fromTable.key,"debug")
			end
		end
	end
end

function EvaluateFunction(f,s)
    if f then
        local isValid = false
        local func = split(f,",")
		if #func > 2 then
            isValid = _G[func[1]](func[2],func[3]) == s
        elseif #func > 1 then
            isValid = _G[func[1]](func[2]) == s
        else
            isValid = _G[func[1]]() == s
        end
        return isValid
	end
end

-- THIS FUNCTION IS MOTHERFUCKING COMPLICATED --
function CA:EvaluateRequirement(v)
    -- v is infact a table
    local isValid = false
    local functionCount = 0

	-- UnRegister the events first !
	if type(v.requiredFunction) == "table" then
	    for c=1,#v.requiredFunction do
		    if type(v.requiredState[c]) == "table" then
				-- for every state in the requiredState table
				for a,b in pairs(v.requiredState[c]) do
					if type(b) == "table"  then
						CA:UnRegisterOptimizationEvent(v,b)
					end
				end
			end
		end
	else
	    if type(v.requiredState) == "table" then
		    for requirementOne,subRequirement in pairs(v.requiredState) do
			    if type(subRequirement) == "table" then
					CA:UnRegisterOptimizationEvent(v,subRequirement)
			    end
		    end
		end
	end


	-- If the the are more requirements
	if type(v.requiredFunction) == "table" then
	    -- for every requirement
        for c=1,#v.requiredFunction do
		    -- if the are more possible states of requirement
            if type(v.requiredState[c]) == "table" then
				-- for every state in the requiredState table
                for a,b in pairs(v.requiredState[c]) do
				    -- if the state is a string meaning that v.requiredFunction needs to equal this
				    if type(b) == "string" or type(b) == "number" then
                        if EvaluateFunction(v.requiredFunction[c],b) then
                            functionCount = functionCount + 1
                        end
					elseif type(b) == "table" then
                        -- THIS IS THE COMPLICATED PART --
                        -- if the requiredState is only valid if the v.requiredFunctions equals !a!
						if EvaluateFunction(v.requiredFunction[c],a) then
						    -- !!register optimization events!! --
							CA:RegisterOptimizationEvent(v,b);
						    -- if this is true we need to check its subrequirements
							b.of = v.key
							if CA:EvaluateRequirement(b) then
                                functionCount = functionCount + 1
							end
						end
					end
                end
            else
			    -- if there is only one state for the requirement
                if EvaluateFunction(v.requiredFunction[c],v.requiredState[c]) then
                    functionCount = functionCount + 1
                end
            end
        end
		-- check validity according to functionCount existence
        if v.requiredFunctionCount then
            isValid = functionCount >= v.requiredFunctionCount
        else
            isValid = functionCount == #v.requiredFunction
        end
    else
	    -- if there is only 1 requirement
		-- and there are more possible states
        if type(v.requiredState) == "table" then
		    -- for every state in the requiredState table
            for requirementOne,subRequirement in pairs(v.requiredState) do
			    -- if the state is a string or a number
			    if type(subRequirement) == "string" or type(subRequirement) == "number" then
				    -- if it is good then the requirement is valid
                    if EvaluateFunction(v.requiredFunction,subRequirement) then
						isValid = true
						break;
					end
				elseif type(subRequirement) == "table" then
				    -- if the state is also a requirement
					TAchik_Print("Evaluating function requirement of "..v.key.." "..tostring(v.requiredFunction).." > "..tostring(requirementOne),"debug")
                    if EvaluateFunction(v.requiredFunction,requirementOne) then
						-- !!register optimization events!! --
						CA:RegisterOptimizationEvent(v,subRequirement);
						-- if this is true we need to check its subrequirements
						TAchik_Print("Evaluating Nested requirement of "..v.key.." "..tostring(subRequirement.requiredFunction).." > "..tostring(subRequirement.requiredState),"debug")
						subRequirement.of = v.key
						subRequirement.key = "NESTED->"..v.key
						if CA:EvaluateRequirement(subRequirement) then
							isValid = true
							break
						end
					end
				end
            end
        else
            isValid = EvaluateFunction(v.requiredFunction,v.requiredState)
        end
    end
	if v.of then
	    local func = v.requiredFunction
		if type(func) == "table" then func = unpack(func) end
		local state = v.requiredState
		if type(state) == "table" then
			for a,_ in pairs(state) do
		        state = a;
				break
			end
		end
        TAchik_Print("Nested requirement of "..(v.of).." "..tostring(func).." > "..tostring(state).." = "..tostring(isValid),"debug")
	end
	return isValid
end



function CA:ValidateAchievement(d,sendValid)
    local isValid = sendValid
	if d.requiredFunction then
	    isValid = CA:EvaluateRequirement(d)
	end
    TAchik_Print("Validating Achievement "..d.name.." = "..tostring(isValid),"debug")
	if d.requiredEvents then
	    for x,y in pairs(d.requiredEvents) do
		    if not CA.optimAchi[y] then
			    CA.optimAchi[y] = {};
				if not CA:IsSpecialEvent(y) then
				    CA.frame:RegisterEvent(y);
					TAchik_Print(" = > Registered AchievementOptimEvent "..y.." for "..tostring(d.name),"debug")
				end
			end
            if not tContains(CA.optimAchi[y],d) then
				tinsert(CA.optimAchi[y],d);
				TAchik_Print(" = > Inserted AchievementOptim table "..y.." for "..tostring(d.name),"debug")
			end
		end
	end
	if isValid then
		if d.events then
		    for x,y in ipairs(d.events) do
			    if not CA.eventsAchi[y] then
				    CA.eventsAchi[y] = {};
		            if not CA:IsSpecialEvent(y) then
				        CA.frame:RegisterEvent(y);
					    TAchik_Print("Registering [Achievement]Event : "..y,"debug")
					end
				end
				if not tContains(CA.eventsAchi[y],d) then
				    TAchik_Print("Registering [Achievement]Event : "..y.." for achievement "..d.name,"debug")
				    tinsert(CA.eventsAchi[y],d);
				end
           end
		end
	    d.valid = true
		------------------------------- Criteria Validation -------------------------------------
		for k,v in pairs(d.criteria) do
		    if CA.crits[v.id] and not v.complete then
			    CA:ValidateCriteria(v,true,"ACHIEVEMENT_VALID")
			end
		end
		------------------------------- Criteria Validation -------------------------------------
    elseif d.valid then
		local specialValid = true
        if d.specialCase and d.specialCaseFunction then
		    if EvaluateCriteria(d.specialCaseFunction,d.specialCase) then
		        specialValid = false
		    end
		end
		if specialValid then
			if d.events then
                for t,p in ipairs(d.events) do
                    if CA.eventsAchi[p] ~= nil then
			            for x,y in ipairs(CA.eventsAchi[p]) do
				            if y.key == d.key then
					            tremove(CA.eventsAchi[p],x);
					            if d.resetOnLeave then
								    CA:UnCompleteAchievement(d.id)
				     	        end
					            TAchik_Print("UnRegistering [Achievement]Event : "..p.." for achievement "..d.name,"debug")
				            end
			            end
			            if #CA.eventsAchi[p] == 0 then
				            if not CA:IsSpecialEvent(p) then
					            CA.frame:UnregisterEvent(p);
					            TAchik_Print("UnRegistering [Achievement]Event : "..p,"debug")
				            end
				            CA.eventsAchi[p] = nil;
			            end
		            end
		        end
			else
			    if d.resetOnLeave and CA.achis[d.id].valid then
					CA:UnCompleteAchievement(d.id)
				end
		    end
		    if d.specialEvents then
		        CA:UnRegisterEvent(d,d.specialEvents)
		    end
			------------------------------- Criteria Validation -------------------------------------
		    for k,v in pairs(d.criteria) do
			    if CA.crits[v.id] and not v.complete then
				    CA:ValidateCriteria(v,false,"ACHIEVEMENT_INVALID")
			        if v.requiredEvents then
			            for r,p in pairs(v.requiredEvents) do
			        	    if CA.optimCrit[p] then
			            	    for x,y in ipairs(CA.optimCrit[p]) do
			    	        	    if y == v then
				    	        	    tremove(CA.optimCrit[p],x);
				            	    end
			           	        end
			         	        if #CA.optimCrit[p] == 0 then
				           	        if not CA:IsSpecialEvent(p) then
					            	    CA.frame:UnregisterEvent(p);
				           	        end
				            	    CA.optimCrit[p] = nil;
			            	    end
			        	    end
			    	    end
			        end
				end
		    end
		    ------------------------------- Criteria Validation -------------------------------------
		end
    end
end

function CA:ValidateCriteria(v,sendValid,event)
	local isValid = sendValid
	if v.requiredFunction then
        isValid = CA:EvaluateRequirement(v)
	end
	v.key = v.key or "NOKEY"
	TAchik_Print("Validating Criteria ["..event.."] "..v.key.." ["..v.parent.name.."] = "..tostring(isValid),"debug")
	-- If the criteria has a v.requiredEvents table
	if v.requiredEvents then
	    -- x is counter or key of table , y is the event
		for x,y in pairs(v.requiredEvents) do
		    -- if the event is not yet registered
			if not CA.optimCrit[y] then
			    -- add empty table for event
			    CA.optimCrit[y] = {};
			    if not CA:IsSpecialEvent(y) then
				    -- register the event if its a normal event
				    CA.frame:RegisterEvent(y);
                end
			end
			-- if the criteria isnt inside the event table
			if not tContains(CA.optimCrit[y],v) then
			    -- insert the criteria into the event table
				tinsert(CA.optimCrit[y],v);
			end
	    end
    end
	-- if the v.requiredState and v.requiredFunctions return true
    if isValid then
        for x,y in ipairs(v.events) do
			if not CA.events[y] then
				CA.events[y] = {};
		        if not CA:IsSpecialEvent(y) then
				    CA.frame:RegisterEvent(y);
				    TAchik_Print("Registering Event : "..y,"debug")
				end
			end
			-- if the criteria isnt already part of the event table
			if not tContains(CA.events[y],v) then
			    TAchik_Print("Registering Event : "..y.." for achievement "..v.parent.name,"debug")
				tinsert(CA.events[y],v);
			end
	    end
    else
	    -- if the criteria requriedState and functions is no longer valid
        local specialValid = true
        if v.specialCase and v.specialCaseFunction then
            if EvaluateFunction(v.specialCaseFunction,v.specialCase) then
		        specialValid = false
		    end
		end
		if specialValid then
		    -- for every event in the criteria main event table
            for c,d in ipairs(v.events) do
			    -- c is the counter , d the event
				-- if d is registered ( just making sure )
                if CA.events[d] then
				    -- for every criteria registered inside the event table
			        for x,y in ipairs(CA.events[d]) do
					    -- x is the counter while y is the criteria
				        if y.key == v.key then
						    -- if the the criteria matches this one
							-- remove it
					        tremove(CA.events[d],x);
					        if v.resetOnLeave then
							    -- uncomplete the achievement if it has a resetOnLeave var
						        CA:UnCompleteAchievementCriteria(v)
				     	    end
					        TAchik_Print("UnRegistering Event : "..d.." for achievement "..v.parent.name,"debug")
				        end
			        end
					-- if event table is empty
			        if #CA.events[d] == 0 then
				        if not CA:IsSpecialEvent(d) then
						    -- unregister the event completely
					        CA.frame:UnregisterEvent(d);
					        TAchik_Print("UnRegistering Event : "..d,"debug")
				        end
						-- and clear the table from memory
				        CA.events[d] = nil;
			        end
		        end
		    end
			-- if the criteria has special events unregister them
		    if v.specialEvents then
		        CA:UnRegisterEvent(v,v.specialEvents)
		    end
		end
    end
end
