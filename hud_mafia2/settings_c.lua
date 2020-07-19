local screenWidth, screenHeight = guiGetScreenSize ( )
width_hd, height_hd = (screenWidth/1280),(screenHeight/720)--адаптация размеров
wanted_hud = 5
area_hud = 0
name_car = 0

math.randomseed(getTickCount())
function random(min, max)
	return math.random(min, max)
end