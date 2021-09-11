addEventHandler( "onClientResourceStart", root, 
function (startedResource) 
--The source of this event is the started resource's root element.
	setWorldSoundEnabled( 5, false )
end)

addEventHandler( "onClientPlayerWeaponFire", root, 
function (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement, startX, startY, startZ) 
--The source of this event is the streamed in player who fired the weapon.
iprint(weapon)
local weaponpl = getElementData(root, "custom_weapon")
playSound3D( "sounds_weapon/"..weaponpl[weapon][8]..".wav", getElementPosition( source ) )
end)