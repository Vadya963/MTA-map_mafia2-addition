local function reloadWeapon()
	reloadPedWeapon(client)

	local weapon_p = getPedWeapon(client)
	local weapon_d = getElementData(root, "custom_weapon")
	if weapon_p and weapon_d and weapon_d[weapon_p] then
		if weapon_p == 25 or weapon_p == 33 or weapon_p == 34 then
			if getPedTotalAmmo(client) >= weapon_d[weapon_p][7]+1 then 
				setWeaponAmmo( client, weapon_p, getPedTotalAmmo(client), weapon_d[weapon_p][7]+1 )
			end
		end
	end
end
addEvent("relWep", true)
addEventHandler("relWep", root, reloadWeapon)