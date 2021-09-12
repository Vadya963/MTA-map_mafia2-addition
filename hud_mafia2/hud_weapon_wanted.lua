local wanted_img = {
	[1] = {479,131, 33,44},
	[2] = {54,212, 45,36},
	[3] = {351,425, 54,38},
	[4] = {0,265, 79,38},
	[5] = {0,265, 79,38},
	[6] = {0,265, 79,38},
}

addEventHandler( "onClientResourceStart", resourceRoot,
function ( startedRes )
	setPlayerHudComponentVisible("ammo", false)
	setPlayerHudComponentVisible("weapon", false)
	setPlayerHudComponentVisible("wanted", false)
end)

function createText ()
	if getElementData(localPlayer, "radar_mafia2") then return end

	local weapon_p = getPedWeapon(localPlayer)
	local weapon_d = getElementData(root, "custom_weapon")
	if weapon_p and weapon_d and weapon_d[weapon_p] then
		local v = getElementData(root, "custom_weapon")[weapon_p]
		dxDrawImageSection(50, screenHeight-50-(v[6]*height_hd), v[5]*height_hd, v[6]*height_hd, v[3], v[4], v[5], v[6], 'hud/hud2.png')
		if getSlotFromWeapon( weapon_p ) == 8 then
			dxdrawtext ( getPedAmmoInClip(localPlayer).." | "..(getPedTotalAmmo(localPlayer)-getPedAmmoInClip(localPlayer)), 55+(v[5]*height_hd), screenHeight-50-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		elseif getSlotFromWeapon( weapon_p ) ~= 0 and getSlotFromWeapon( weapon_p ) ~= 1 and getSlotFromWeapon( weapon_p ) ~= 10 then
			dxdrawtext ( (getPedAmmoInClip(localPlayer)-1).." | "..(getPedTotalAmmo(localPlayer)-getPedAmmoInClip(localPlayer)), 55+(v[5]*height_hd), screenHeight-50-15, 0.0, 0.0, tocolor ( 255, 255, 255, 255 ), 1*height_hd, "default-bold" )
		end
	end

	local wanted = getPlayerWantedLevel ( )
	if wanted ~= 0 then
		local v = wanted_img[wanted]
		wanted_hud = (v[4]*height_hd)+10
		dxDrawImageSection(screenWidth-20-(v[3]*height_hd), screenHeight-(146*height_hd)-15-5-(v[4]*height_hd), v[3]*height_hd, v[4]*height_hd, v[1], v[2], v[3], v[4], 'hud/hud2.png')
	else
		wanted_hud = 5
	end
end
addEventHandler ( "onClientRender", root, createText )