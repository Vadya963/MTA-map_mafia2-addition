local weapon = {
	[23] = {"silenced", 347, 64,449, 59,34, 7, "C1911"},
	[24] = {"desert_eagle", 348, 242,230, 84,42, 6, "Magnum"},
	[31] = {"m4", 356, 61,415, 119,33, 50, "Thompson"},
	[30] = {"ak47", 355, 176,448, 112,34, 30, "Thompson_n"},
	[25] = {"chromegun", 349, 105,340, 138,22, 8, "Remington"},
	[29] = {"mp5", 353, 0,0, 106,59, 30, "M3"},
	[33] = {"rifle", 357, 105,313, 143,26, 8, "M1G"},
	[22] = {"colt45", 346, 123,449, 53,38, 6, "R38"},
	[34] = {"sniper", 358, 64,487, 135,25, 5, "Mauser98k"},

	[16] = {"grenade", 342, 268,482, 19,30, 0},
	[5] = {"bat", 336, 124,188, 119,29, 0},
	[4] = {"knifecur", 335, 199,482, 69,30, 0},
	[1] = {"brassknuckle", 331, 0,411, 31,36, 0},
	[3] = {"nitestick", 334, 242,202, 84,28, 0},
	[18] = {"molotov", 344, 0,370, 39,41, 0},
	[6] = {"shovel", 337, 0,525, 158,27, 0},
	[15] = {"gun_cane", 326, 160,534, 106,21, 0},
}

function displayLoadedRes ( res )--старт ресурсов
	for k,v in pairs(weapon) do
		if k > 18 then
			setWeaponProperty(k, "poor", "maximum_clip_ammo", v[7])
			setWeaponProperty(k, "std", "maximum_clip_ammo", v[7])
			setWeaponProperty(k, "pro", "maximum_clip_ammo", v[7])
		end
	end

	setElementData(root, "custom_weapon", weapon)
end
addEventHandler ( "onResourceStart", resourceRoot, displayLoadedRes )

function getPlayerVehicle( localPlayer, seat )
	local vehicle = getPedOccupiedVehicle ( localPlayer )
	if seat and vehicle then
		local player = getVehicleOccupant ( vehicle, seat )
		if localPlayer == player then
			return vehicle
		else
			return false
		end
	else
		return vehicle
	end
end

addEvent("event_server_car_trunk_and_hood", true)
addEventHandler ( "event_server_car_trunk_and_hood", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )
	local vehicleid = getPlayerVehicle( playerid )
	local spl = split(state, ",")

	for k,vehicle in pairs(getElementsByType("vehicle")) do
		local x1,y1,z1 = getElementPosition(vehicle)
		local plate = getVehiclePlateText ( vehicle )

		if isPointInCircle3D(x,y,z, x1,y1,z1, 5) and not vehicleid then
			if spl[2] == "trunk" then
				if spl[1] == "true" then
					setVehicleDoorOpenRatio ( vehicle, 1, 1, 500 )
				elseif spl[1] == "false" then
					setVehicleDoorOpenRatio ( vehicle, 1, 0, 500 )
				end
			end
			return
		end
	end
end)

addEvent("event_server_car_door", true)
addEventHandler("event_server_car_door", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )

	for k,vehicle in pairs(getElementsByType("vehicle")) do
		local x1,y1,z1 = getElementPosition(vehicle)
		local plate = getVehiclePlateText ( vehicle )

		if isPointInCircle3D(x,y,z, x1,y1,z1, 5) then
			if state == "true" then
				setVehicleLocked ( vehicle, true )
			else
				setVehicleLocked ( vehicle, false )
			end
			return
		end
	end
end)

addEvent("event_server_car_light", true)
addEventHandler("event_server_car_light", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )
	local vehicleid = getPlayerVehicle( playerid, 0 )

	if vehicleid then
		if state == "true" then
			setVehicleOverrideLights ( vehicleid, 2 )
		else
			setVehicleOverrideLights ( vehicleid, 1 )
		end
	end
end)

addEvent("event_server_car_engine", true)
addEventHandler ( "event_server_car_engine", root,
function ( playerid, state )
	local playername = getPlayerName ( playerid )
	local x,y,z = getElementPosition(playerid)
	local vehicleid = getPlayerVehicle( playerid, 0 )
	
	if vehicleid then
		if state == "true" then
			setVehicleEngineState(vehicleid, true)
		else
			setVehicleEngineState(vehicleid, false)
		end
	end
end)

addEvent("event_server_anim_player", true)
addEventHandler("event_server_anim_player", root,
function ( playerid, state )
	local x,y,z = getElementPosition(playerid)
	local playername = getPlayerName ( playerid )
	local spl = split(state, ",")

	if spl[1] ~= "nil" then
		if spl[3] == "true" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, true, false, false, false)
		elseif spl[3] == "one" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, false, false, false, false)
		elseif spl[3] == "walk" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, true, true, false, false)
		elseif spl[3] == "false" then
			setPedAnimation(playerid, tostring(spl[1]), tostring(spl[2]), -1, false, false, false, true)
		end
	else
		setPedAnimation(playerid, nil, nil)
	end
end)