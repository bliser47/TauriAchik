local TA = LibStub:GetLibrary("TauriAchikLib")
function TA:AddAchievement_SzaguldasPorcheSzerelem()

    local function PORCHE(tbl,event, ...)
        local playerInside = false
        local inCorrectVehicle = false
        if UnitAura("player",GetSpellInfo(55531)) or UnitAura("player",GetSpellInfo(60424)) then
            inCorrectVehicle = true
            for i=1,UnitVehicleSeatCount("player"),1 do
                if CanEjectPassengerFromSeat(i) then
                    local controlType, occupantName, occupantRealm, canEject, canSwitchSeats = UnitVehicleSeatInfo("player",i)
                    if UnitIsPlayer(occupantName) then
                        playerInside = true
                    end
                end
            end
        else
		    inCorrectVehicle = TAchik_UnitInRaidOrPartyHasAura(55531) or TAchik_UnitInRaidOrPartyHasAura(60424)
        end
        return GetSubZoneText() == tbl.name and (playerInside or CanExitVehicle()) and inCorrectVehicle
    end

    TA:AddAchievement(
    {
		category = TA_FUN_GENERAL,
		name = "Száguldás, Porche Szerelem",
		description = "Száguldj Dalaran körül valkivel vagy valaki motorjában",
		texture = "Interface\\Icons\\Ability_vehicle_rocketboost",
		points = 10,
		key = "SZPSZ",
		save = TAchik,
		accountWide = true,
		requiredState =
		{
		    [4] =
			{
			    requiredState = "Dalaran",
				requiredFunction = "GetZoneText",
				requiredEvents = { "ZONE_CHANGED_NEW_AREA" }
			}
		},
		requiredFunction = "TAchik_GetInstanceFromCurrentZone",
		requiredEvents = "INSTANCE_CHANGED",
	    criteria =
	    {
		    {
			    name = "The Eventide",
				events = "ZONE_CHANGED",
				objective = PORCHE,
				key = "SZPSZ1",
			},
			{
				name = "Runeweaver Square",
				events = "ZONE_CHANGED",
			    objective = PORCHE,
			    key = "SZPSZ2",
			},
			{
				name = "Antonidas Memorial",
				events = "ZONE_CHANGED",
				objective = PORCHE,
				key = "SZPSZ3",
			},
			{
				name = "Magus Commerce Exchange",
				events = "ZONE_CHANGED",
				objective = PORCHE,
				key = "SZPSZ4",
			},
			{
				name = "The Violet Hold",
				events = "ZONE_CHANGED",
				objective = PORCHE,
				key = "SZPSZ5",
			},
			{
				name = "Krasus' Landing",
				events = "ZONE_CHANGED",
				objective = PORCHE,
				key = "SZPSZ6",
			},
			{
				name = "The Violet Citadel",
				events = "ZONE_CHANGED",
				objective = PORCHE,
				key = "SZPSZ7",
			},
		},
	});

end
