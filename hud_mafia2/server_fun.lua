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

addEvent("e_server_car_trunk_and_hood", true)
addEventHandler ( "e_server_car_trunk_and_hood", root,
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

addEvent("e_server_car_door", true)
addEventHandler("e_server_car_door", root,
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

addEvent("e_server_car_light", true)
addEventHandler("e_server_car_light", root,
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

addEvent("e_server_car_engine", true)
addEventHandler ( "e_server_car_engine", root,
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

addEvent("e_server_anim_player", true)
addEventHandler("e_server_anim_player", root,
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