local screenWidth, screenHeight = guiGetScreenSize ( )
local text_area = false
local ud_timer = false

local hillwood = createColPolygon( 0,0, 614.328125,1082.7919921875, 525.6923828125,1152.306640625, -34.779296875,1162.7958984375, -41.5517578125,1448.0283203125, 200.439453125,1683.51953125, 825.9580078125,1683.6669921875, 825.9580078125,1295.1865234375 )
local riverside = createColPolygon( 0,0, -41.5517578125,1448.0283203125, -384.2705078125,1450.4951171875, -388.3857421875,2047.1533203125, 199.3310546875,2047.1533203125, 200.439453125,1683.51953125 )
local dipton = createColPolygon( 0,0, -384.2705078125,1450.4951171875, -861.8134765625,1321.9931640625, -860.4423828125,1586.552734375, -971.58984375,1743.1201171875, -971.58984375,2047.1533203125, -388.3857421875,2047.1533203125 )
local kingstone = createColPolygon( 0,0, -861.8134765625,1321.9931640625, -1076.68359375,1063.9453125, -1171.005859375,1073.392578125, -1428.58203125,1198.6689453125, -1424.3671875,1369.486328125, -1517.1923828125,1535.826171875, -1607.916015625,1535.8798828125, -2140.7763671875,2047.1533203125, -971.58984375,2047.1533203125, -971.58984375,1743.1201171875, -860.4423828125,1586.552734375 )
local greenfield = createColPolygon( 0,0, -1076.68359375,1063.9453125, -1171.005859375,1073.392578125, -1428.58203125,1198.6689453125, -1424.3671875,1369.486328125, -1517.1923828125,1535.826171875, -1607.916015625,1535.8798828125, -2140.7763671875,2047.1533203125, -2140.7763671875,846.7646484375, -1696.48046875,847.09765625, -1691.7490234375,785.412109375, -1589.3857421875,802.85546875, -1589.7646484375,846.255859375, -1281.0869140625,845.3974609375, -1278.1787109375,682.791015625, -1076.68359375,684.9287109375 )
local hunters = createColPolygon( 0,0, -2140.7763671875,846.7646484375, -1696.48046875,847.09765625, -1691.7490234375,785.412109375, -1589.3857421875,802.85546875, -1589.7646484375,846.255859375, -1281.0869140625,845.3974609375, -1278.1787109375,682.791015625, -1076.68359375,684.9287109375, -1076.68359375,87.8291015625, -1408.5732421875,88.6572265625, -1410.7861328125,184.853515625, -2140.7763671875,169.0947265625 )
local sandisland = createColPolygon( 0,0, -1076.68359375,87.8291015625, -1408.5732421875,88.6572265625, -1410.7861328125,184.853515625, -2140.7763671875,169.0947265625, -2140.7763671875,-579.6142578125, -1728.78515625,-577.7021484375, -1732.6376953125,-467.4052734375, -1076.68359375,-467.861328125 )
local highbrook = createColPolygon( 0,0, -34.779296875,1162.7958984375, -41.5517578125,1448.0283203125, -384.2705078125,1450.4951171875, -861.8134765625,1321.9931640625, -1076.68359375,1063.9453125, -224.9716796875,1074.1064453125 )
local uppertown = createColPolygon( 0,0, -224.9716796875,1074.1064453125, -1076.68359375,1063.9453125, -1076.68359375,537.0439453125, -676.42578125,536.7998046875, -440.373046875,406.87109375, -224.9716796875,407.4375 )
local westside = createColPolygon( 0,0, -1076.68359375,537.0439453125, -676.42578125,536.7998046875, -440.373046875,406.87109375, -441.64453125,-12.5146484375, -658.2041015625,-120.6884765625, -658.2041015625,-295.4912109375, -1076.68359375,-294.8359375 )
local southport = createColPolygon( 0,0, -1076.68359375,-294.8359375, -658.2041015625,-295.4912109375, -658.2041015625,-345.6298828125, 130.6875,-349.9326171875, 89.8408203125,-410.658203125, 89.8408203125,-674.28125, -696.8798828125,-675.9697265625, -1076.68359375,-467.861328125 )
local port = createColPolygon( 0,0, -693.4296875,-1042.3173828125, -696.8798828125,-675.9697265625, 187.5703125,-674.28125, 452.8447265625,-1042.3173828125 )
local midtown = createColPolygon( 0,0, 148.8525390625,-322.5927734375, 148.8525390625,-12.5146484375, -441.64453125,-12.5146484375, -658.2041015625,-120.6884765625, -658.2041015625,-345.6298828125, 130.6875,-349.9326171875 )
local eastside = createColPolygon( 0,0, -224.9716796875,480.5302734375, 13.66796875,480.5302734375, 148.8525390625,413.0703125, 148.8525390625,-12.5146484375, -441.64453125,-12.5146484375, -440.373046875,406.87109375, -224.9716796875,407.4375 )
local italy = createColPolygon( 0,0, -224.9716796875,480.5302734375, 13.66796875,480.5302734375, 148.8525390625,413.0703125, 185.7802734375,571.1572265625, 472.001953125,569.423828125, 472.001953125,685.3466796875, 614.328125,685.3466796875, 614.328125,1082.7919921875, 525.6923828125,1152.306640625, -34.779296875,1162.7958984375, -224.9716796875,1074.1064453125 )
local chinatown = createColPolygon( 0,0, 148.8525390625,71.7333984375, 413.9814453125,71.7333984375, 472.001953125,127.5068359375, 472.001953125,569.423828125, 185.7802734375,571.1572265625, 148.8525390625,413.0703125 )
local oysterbay = createColPolygon( 0,0, 148.8525390625,71.7333984375, 413.9814453125,71.7333984375, 472.001953125,127.5068359375, 549.1904296875,127.5068359375, 549.1904296875,-574.337890625, 187.5703125,-574.337890625, 187.5703125,-674.28125, 89.8408203125,-674.28125, 89.8408203125,-410.658203125, 130.6875,-349.9326171875, 148.8525390625,-322.5927734375 )
local millville_s = createColPolygon( 0,0, 549.1904296875,-574.337890625, 1200.0458984375,-574.337890625, 1415.9013671875,-373.5185546875, 1415.9013671875,127.5068359375, 549.1904296875,127.5068359375 )
local millville_n = createColPolygon( 0,0, 1415.9013671875,127.5068359375, 472.001953125,127.5068359375, 472.001953125,685.3466796875, 614.328125,685.3466796875, 614.328125,1082.7919921875, 825.9580078125,1295.1865234375, 825.9580078125,1683.6669921875, 1415.9013671875,1683.6669921875 )

addEventHandler( "onClientColShapeHit", resourceRoot,
function (theElement, matchingDimension) 
--The source of this event is the colshape that was hit.
	if getElementType( theElement ) == "player" and theElement == localPlayer then
	
		if isTimer(ud_timer) then killTimer( ud_timer ) end

		if hillwood == source then
			text_area="Хилвуд"
		elseif riverside == source then
			text_area="Риверсайд"
		elseif dipton == source then
			text_area="Диптон"
		elseif kingstone == source then
			text_area="Кингстон"
		elseif greenfield == source then
			text_area="Гринфилд"
		elseif hunters == source then
			text_area="Хантерс-Пойнт"
		elseif sandisland == source then
			text_area="Сэнд-Айленд"
		elseif highbrook == source then
			text_area="Хайбрук"
		elseif uppertown == source then
			text_area="Аптаун"
		elseif westside == source then
			text_area="Вест-Сайд"
		elseif southport == source then
			text_area="Сауспорт"
		elseif port == source then
			text_area="Порт"
		elseif midtown == source then
			text_area="Мидтаун"
		elseif eastside == source then
			text_area="Ист-Сайд"
		elseif italy == source then
			text_area="Маленькая Италия"
		elseif chinatown == source then
			text_area="Китайский Квартал"
		elseif oysterbay == source then
			text_area="Ойстер-Бэй"
		elseif millville_s == source then
			text_area="Южный Милвилл"
		elseif millville_n == source then
			text_area="Северный Милвилл"
		end

		ud_timer = setTimer( function() 
			text_area = false
			area_hud = 0
		end, 5000, 1 )
	end
end)

addEventHandler( "onClientRender", root, 
function () 
--The source of this event is the client's root element.
	if text_area and not getElementData(localPlayer, "radar_mafia2") and getElementInterior(localPlayer) == 0 and getElementDimension(localPlayer) == 0 then 
		local dimension = dxGetTextWidth( text_area, 1*height_hd, "default-bold" )
		local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )
		area_hud = (30*height_hd)+5
		dxdrawtext( text_area, screenWidth-20-dimension-(5*height_hd)-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud+(dimension_h/2), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		dxDrawImageSection(screenWidth-20-(30*height_hd), screenHeight-(146*height_hd)-15-(30*height_hd)-wanted_hud, 30*height_hd, 30*height_hd, 264, 273, 31, 31, 'hud/hud2.png')
	end
end)