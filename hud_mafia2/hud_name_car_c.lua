local text_area = false
local ud_timer = false

local vehicles = {
	--рабочие
	[428] = "Shubert Armored Van",
	[423] = "Milk Truck",
	[437] = "Parry Bus Prison",
	[455] = "Shubert Truck Flatbed",
	[438] = "Shubert 38 Taxi",
	[420] = "Quicksilver Windsor Taxi",
	[478] = "Shubert Pickup",
	[544] = "American LaFrance 600-Series 1941",
	[416] = "Buick Special Ambulance 1947",
	[525] = "Dodge Towtruck",
	[431] = "Parry Bus",
	[433] = "GAI 353 Military Truck",
	[456] = "Smith Truck",
	[500] = "Walter Military",

	--2 дверные
	--спорт
	[541] = "Delizia GrandeAmerica",
	[411] = "Potomac Elysium",
	[434] = "Smith 34 Hot Rod",
	[545] = "Waybar Hot Rod",
	[429] = "ISW 508",
	[415] = "Smith Thunderbolt",
	[555] = "Shubert Frigate",
	[527] = "Roller GL300",
	[526] = "Samson Drifter",
	[480] = "Ascot Bailey",
	[565] = "Walter Hot Rod",

	[496] = "Walter Coupe",
	[401] = "Berkley Kingfisher",
	[534] = "Jefferson Provincial",
	[518] = "Shubert Beverly",
	[589] = "Volkswagen Beetle",
	[602] = "Chaffeque XT",

	--4 дверные
	[409] = "Lassiter Series 75 Hollywood",
	[426] = "Smith Custom 200",
	[596] = "Smith Custom 200 Police Special",
	[597] = "Culver Empire Police Special",
	[445] = "Smith Deluxe Station Wagon",
	[604] = "Shubert 38",
	[507] = "Houston Wasp",
	[492] = "Quicksilver Windsor",
	[585] = "Potomac Indian",
	[551] = "Packard Standard Eight 1948 Touring Sedan",
	[546] = "Lassiter Series 69",
}

addEventHandler( "onClientResourceStart", resourceRoot, 
function (startedResource) 
--The source of this event is the started resource's root element.
	setPlayerHudComponentVisible ("vehicle_name", false )
end)

addEventHandler( "onClientPlayerVehicleEnter", root, 
function (theVehicle, seat) 
	local model = getElementModel( theVehicle )

	if isTimer(ud_timer) then killTimer( ud_timer ) end

	if vehicles[model] then
		text_area = vehicles[model]
	else
		text_area = "none"
	end

	ud_timer = setTimer( function() 
		text_area = false
		name_car = 0
	end, 5000, 1 )
end)

addEventHandler( "onClientRender", root, 
function () 
--The source of this event is the client's root element.
	if text_area and not getElementData(localPlayer, "radar_mafia2") then 
		local dimension = dxGetTextWidth( text_area, 1*height_hd, "default-bold" )
		local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )
		name_car = (30*height_hd)+5
		dxdrawtext( text_area, screenWidth-20-dimension-(5*height_hd)-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud+(dimension_h/2), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		dxDrawImageSection(screenWidth-20-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud-area_hud, 30*height_hd, 30*height_hd, 264, 304, 31, 31, 'hud/hud2.png', 0,0,0, tocolor ( 0, 255, 0, 255 ))
		dxDrawImageSection(screenWidth-20-(28*height_hd), screenHeight-(146*height_hd)-15-(21*height_hd)-wanted_hud-area_hud, 26*height_hd, 12*height_hd, 483, 312, 27, 12, 'hud/hud2.png')
	end
end)