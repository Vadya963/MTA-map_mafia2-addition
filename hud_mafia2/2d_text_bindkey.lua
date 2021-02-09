local screenWidth, screenHeight = guiGetScreenSize ( )
local text_table = {}

function addText(image, key, text)
	table.insert(text_table, {image, key, text})
end

function deleteText(image, key, text)
	for k,v in pairs(text_table) do
		if v[1] == image and v[2] == key and v[3] == text then
			table.remove(text_table, k)
			break
		end
	end
end

addEventHandler( "onClientRender", root, 
function () 
--The source of this event is the client's root element.
	for k,v in ipairs(text_table) do
		local dimension = dxGetTextWidth( v[3], 1*height_hd, "default-bold" )
		local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )

		local j = k-1
		if v[1] == 1 then
			dxDrawImageSection(10, (screenHeight-20)-(20*height_hd)-(j*(20*height_hd))-(5*height_hd*j), 20*height_hd, 20*height_hd, 668, 274, 40, 40, 'hud/Default.png')
			dxdrawtext( v[3], 10+(20*height_hd)+(5*height_hd), (screenHeight-20)-dimension_h-(j*(20*height_hd))-(5*height_hd*j), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )

			local dimension = dxGetTextWidth( v[2], 1*height_hd, "default-bold" )
			local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )

			dxDrawText( v[2], 10+((20*height_hd)/2)-(dimension/2), (screenHeight-20)-((20*height_hd)/2)-(dimension_h/2)-(j*(20*height_hd))-(5*height_hd*j), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )	
		elseif v[1] == 2 then
			dxDrawImageSection(10, (screenHeight-20)-(20*height_hd)-(j*(20*height_hd))-(5*height_hd*j), 58*height_hd, 20*height_hd, 554, 220, 58, 40, 'hud/Default.png')
			dxdrawtext( v[3], 10+(58*height_hd)+(5*height_hd), (screenHeight-20)-dimension_h-(j*(20*height_hd))-(5*height_hd*j), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )

			local dimension = dxGetTextWidth( v[2], 1*height_hd, "default-bold" )
			local dimension_h = dxGetFontHeight( 1*height_hd, "default-bold" )

			dxDrawText( v[2], 10+((58*height_hd)/2)-(dimension/2), (screenHeight-20)-((20*height_hd)/2)-(dimension_h/2)-(j*(20*height_hd))-(5*height_hd*j), 0, 0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		end
	end
end)