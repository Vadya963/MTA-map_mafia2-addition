screenWidth, screenHeight = guiGetScreenSize ( )
width_hd, height_hd = (screenWidth/1280),(screenHeight/720)--адаптация размеров
wanted_hud = 5
area_hud = 0
name_car = 0

math.randomseed(getTickCount())
function random(min, max)
	return math.random(min, max)
end

function dxdrawtext(text, x, y, width, height, color, scale, font)
	dxDrawText ( text, x+1, y+1, width, height, tocolor ( 0, 0, 0, 255 ), scale, font )

	dxDrawText ( text, x, y, width, height, color, scale, font )
end