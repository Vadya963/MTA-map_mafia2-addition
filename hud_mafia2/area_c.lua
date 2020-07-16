local screenWidth, screenHeight = guiGetScreenSize ( )
local text_area = false

local hillwood = createColPolygon( 0.1240234375,0.5068359375, 614.328125,1082.7919921875, 525.6923828125,1152.306640625, -34.779296875,1162.7958984375, -41.5517578125,1448.0283203125, 200.439453125,1683.51953125, 828.79296875,1683.6669921875, 825.9580078125,1295.1865234375 )
addEventHandler( "onClientColShapeHit", resourceRoot,
function (theElement, matchingDimension) 
--The source of this event is the colshape that was hit.
	if not text_area then setTimer( function() text_area=false end, 5000, 1 ) end

	if hillwood == source then
		text_area="Хилвуд"
	end
end)

addEventHandler( "onClientRender", getRootElement(), 
function () 
--The source of this event is the client's root element.
	if text_area then 
		local dimension = dxGetTextWidth( text_area, 1*width_hd, "default-bold" )
		dxDrawText( text_area, screenWidth-dimension-(((146*width_hd)-(30*width_hd)-dimension-5)/2), screenHeight-(146*width_hd)-15-(dimension/2)-wanted_hud, 0, 0, tocolor ( 255, 255, 255, 255 ), 1*width_hd, "default-bold" )
		dxDrawImageSection(screenWidth-(30*width_hd)-dimension-5-(((146*width_hd)-(30*width_hd)-dimension-5)/2), screenHeight-(146*width_hd)-15-(30*width_hd)-wanted_hud, 30*width_hd, 30*width_hd, 264, 273, 31, 31, 'hud/hud2.png')
	end
end)