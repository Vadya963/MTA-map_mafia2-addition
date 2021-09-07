local radio_name = {
	[-3] = {"Радио Дельта","delta"},
	[-2] = {"Радио Классика Эмпайр","classic"},
	[-1] = {"Центральное радио Эмпайр","empire"},
	[0] = {"Радио Выкл","none"},
	[1] = {"Радио Дельта","delta"},
	[2] = {"Радио Классика Эмпайр","classic"},
	[3] = {"Центральное радио Эмпайр","empire"},
}
local radio_station = 0
local sound = {
	["delta"] = false,
	["classic"] = false,
	["empire"] = false,
}

local screenWidth, screenHeight = guiGetScreenSize ( )
local text_radio = false
local ud_timer = false

function setRadio(wave_radio)
	for k,v in pairs(sound) do
		if isElement(v) then
			setSoundVolume( v, 0.0 )
		end
	end

	if wave_radio == 0 then
		return
	end

	wave_radio = radio_name[wave_radio][2]
	if isElement(sound[wave_radio]) then
		setSoundVolume( sound[wave_radio], 1.0 )
	end
end
addEvent( "event_setRadio", true )
addEventHandler( "event_setRadio", resourceRoot, setRadio )

function setRadioSound(wave_radio,table)
	if isElement(sound[wave_radio]) then destroyElement( sound[wave_radio] ) end
	sound[wave_radio] = playSound( ":radio_mafia2/"..table[1].."/"..table[2].."/"..table[4]..".mp3" )
	setSoundPosition( sound[wave_radio], table[6] )

	if radio_name[radio_station][2] == wave_radio then
		setSoundVolume( sound[wave_radio], 1.0 )
	else
		setSoundVolume( sound[wave_radio], 0.0 )
	end
end
addEvent( "event_setRadioSound", true )
addEventHandler( "event_setRadioSound", resourceRoot, setRadioSound )

addEventHandler( "onClientResourceStart", resourceRoot, 
function (startedResource) 
--The source of this event is the started resource's root element.
	triggerServerEvent( "event_onPlayerJoin", localPlayer )

	bindKey ( ",", "down", function ( ... )
		local vehicle = getPedOccupiedVehicle ( localPlayer )
		if vehicle then
			if localPlayer ~= getVehicleOccupant(vehicle, 0) then return end
		else
			return
		end

		if isTimer(ud_timer) then killTimer( ud_timer ) end

		radio_station = radio_station-1

		if radio_station == -4 then 
			radio_station = 0
		end

		setRadio(radio_station)
		setElementData( vehicle, "radio", radio_station )

		text_radio = radio_name[radio_station][1]

		ud_timer = setTimer( function() 
			text_radio = false
		end, 5000, 1 )
	end )

	bindKey ( ".", "down", function ( ... )
		local vehicle = getPedOccupiedVehicle ( localPlayer )
		if vehicle then
			if localPlayer ~= getVehicleOccupant(vehicle, 0) then return end
		else
			return
		end
		
		if isTimer(ud_timer) then killTimer( ud_timer ) end

		radio_station = radio_station+1

		if radio_station == 4 then 
			radio_station = 0
		end

		setRadio(radio_station)
		setElementData( vehicle, "radio", radio_station )

		text_radio = radio_name[radio_station][1]

		ud_timer = setTimer( function() 
			text_radio = false
		end, 5000, 1 )
	end )
end)

addEventHandler( "onClientVehicleEnter", root, 
function (thePlayer, seat) 
--The source of the event is the vehicle that the player entered.
	if getElementType( thePlayer ) == "player" and thePlayer == localPlayer then
		setRadioChannel( 0 )
		radio_station = getElementData( source, "radio" ) or 0
		setRadio(radio_station)
	end
end)
addEventHandler( "onClientVehicleExit", root, 
function (thePlayer, seat) 
--The source of the event is the vehicle that the player exited.
	if getElementType( thePlayer ) == "player" and thePlayer == localPlayer then
		radio_station = 0
		setRadio(radio_station)

		text_radio = false
	end
end)

addEventHandler( "onClientRender", root, 
function () 
--The source of this event is the client's root element.
	if text_radio and not getElementData(localPlayer, "radar_mafia2") then 
		local dimension = dxGetTextWidth( text_radio, 1*height_hd, "default-bold" )
		local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )
		dxdrawtext( text_radio, screenWidth-20-dimension-(5*height_hd)-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud-name_car+(dimension_h/2), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		
		if radio_station ~= 0 then
			dxDrawImageSection(screenWidth-20-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud-name_car, 30*height_hd, 30*height_hd, 357, 334, 31, 31, 'hud/hud2.png')
		else
			dxDrawImageSection(screenWidth-20-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud-name_car, 30*height_hd, 30*height_hd, 314, 365, 31, 31, 'hud/hud2.png')
		end
	end
end)