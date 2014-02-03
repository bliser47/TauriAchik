local TA = LibStub:GetLibrary("TauriAchikLib")

function TA:GetNumCharactersOnRealm(realm)
    realm = realm or GetRealmName()
	local numChars = 0
    for k,v in pairs(TAchik.Realms) do
		if TA:RealmOnSameServer(realm,k) then
		    TAchik_Print("CharData for "..k,"debug")
			for c,f in pairs(TAchik.Realms[k].Characters) do
				numChars = numChars + 1
				TAchik_Print(numChars..". "..f.character.name.." ( GUID : "..c.." )","debug")
			end
		end
	end
	return numChars
end

function TA:GetCharacterDataById(id,realm)
    realm = realm or GetRealmName()
	local counter = 0
	for k,v in pairs(TAchik.Realms) do
		if TA:RealmOnSameServer(realm,k) then
			for c,f in pairs(TAchik.Realms[k].Characters) do
				counter = counter + 1
				if counter == id then
					return f
				end
			end
		end
	end
end

function TA:TransferCharacterData(transferData,toData,realm)
    realm = realm or GetRealmName()
    -- Add the criterias --
	local guid1 = transferData.character.guid
	local guid2 = toData.character.guid

    for a,b in pairs(transferData.crits) do
		-- If b ( other criteria value ) is true
	    -- and this one is not
		local crit = TA.crits[TA.critsKeys[a]]
		if crit and not crit.parent.unmergeable and b and not toData.crits[a] then
			-- and the criteria wansnt completed due to merging
			if not TAchik.Realms[realm].Characters[guid1].critsCompletedMerged or not TAchik.Realms[realm].Characters[guid1].critsCompletedMerged[a] then
				toData.crits[a] = b;
				if toData.critsCompletedMerged and toData.critsCompletedMerged[a] then
					toData.critsCompletedMerged[a] = nil
				end
				-- add timers !
			end
		end
	end

	-- Add the achievements --
	for a,b in pairs(transferData.achis) do
		-- If b ( other achievement value ) is true
		-- and this one is not
		local achi = TA.achis[TA.achisKeys[a]]
		if achi and not achi.unmergeable and b and not toData.achis[a] then
            -- and the achievement wansnt completed due to merging
			if not TAchik.Realms[realm].Characters[guid1].achisCompletedMerged or not TAchik.Realms[realm].Characters[guid1].achisCompletedMerged[a] then
				toData.achis[a] = b;
				if toData.achisCompletedMerged and toData.achisCompletedMerged[a] then
					toData.achisCompletedMerged[a] = nil
				end
			end
		end
	end

	-- Add the variables --
	for a,b in pairs(transferData.variables) do
		-- a is the criteriaKey
		-- while b is the variable data
		local crit = TA.crits[TA.critsKeys[a]]
		if crit.mergeable then
            toData.variables[a] = TA:MergeCriteriaVariableData(crit,guid1)
		else
		    if not crit.parent.unmergeablea and crit.required then
                -- if the criteria is of type n/X
			    local thisDat = toData.variables[a] or {["variable"]=crit.variable}
			    function ToNum(var)
				    if type(var) == "table" then
                        return #var
				    end
			        return var;
		        end
			    -- Only add if the value function is closer to the required value --
				local num1 = ToNum(crit.value({["variable"]=b}))
				local num2 = ToNum(crit.value({["variable"]=thisDat}))
		        if ( num1 and num2 and num1 > num2 ) or not nom2 then
			        toData.variables[a] = b;
		        end
	        end
		end
	end
	TAchik.Realms[realm].Characters[guid1] = nil
	ReloadUI()
end


function TA:SwapCharacterData(data1,data2,realm)
	realm = realm or GetRealmName()
    local data1Save = TAchik.Realms[realm].Characters[data1.character.guid]
	local guid1 = data1.character.guid
	local guid2 = data2.character.guid
	local char1 = table.copy(TAchik.Realms[realm].Characters[guid1].character)
    local char2 = table.copy(TAchik.Realms[realm].Characters[guid2].character)
	TAchik.Realms[realm].Characters[guid1] = data2
	TAchik.Realms[realm].Characters[guid2] = data1Save
	TAchik.Realms[realm].Characters[guid1].character = char1
	TAchik.Realms[realm].Characters[guid2].character = char2
	-- Remove unmergeable achievements from both datas --
	for a,b in pairs ( TAchik.Realms[realm].Characters[guid1].achis ) do
		local achi = TA.achis[TA.achisKeys[a]]
		if achi.unmergeable then
			TAchik.Realms[realm].Characters[guid1].achis[a] = nil
		end
	end
	for a,b in pairs ( TAchik.Realms[realm].Characters[guid2].achis ) do
		local achi = TA.achis[TA.achisKeys[a]]
		if achi.unmergeable then
			TAchik.Realms[realm].Characters[guid2].achis[a] = nil
		end
	end
	ReloadUI()
end
