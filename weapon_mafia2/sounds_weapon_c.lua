function playSound3D_f( ... )
	setTimer( playSound3D, 50, 1, ... )
end

addEventHandler( "onClientResourceStart", resourceRoot, 
function (startedResource) 
--The source of this event is the started resource's root element.
	setWorldSoundEnabled( 5, false )

	addEvent( "e_playSound3D", true )
	addEventHandler( "e_playSound3D", root, playSound3D_f )
end)

addEventHandler( "onClientPlayerWeaponSwitch", root, 
function (previousWeaponSlot, currentWeaponSlot) 
--The source of this event is the player who changed his weapon. (Local player only)
--If this event is canceled, then the weapon will not be switched.
	if (2 <= currentWeaponSlot and currentWeaponSlot <= 6) and getPedAmmoInClip( source ) == 1 then 
		toggleControl( "fire", false )
	else
		toggleControl( "fire", true )
	end
end)

addEventHandler( "onClientPlayerWeaponFire", root, 
function (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement, startX, startY, startZ) 
--The source of this event is the streamed in player who fired the weapon.
	if 18 < weapon and weapon < 35 then
		if ammoInClip == 1 then
			toggleControl( "fire", false )
		end

		local weapon_d = getElementData(root, "custom_weapon")
		if weapon_d and weapon_d[weapon] then
			triggerServerEvent( "e_onPlayerWeaponFire", source, "sounds_weapon/"..weapon_d[weapon][1]..".wav", getElementPosition( source ) )
		end
	end
end)