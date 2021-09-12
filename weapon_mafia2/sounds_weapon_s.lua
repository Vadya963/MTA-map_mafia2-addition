addEvent("e_onPlayerWeaponFire", true)
addEventHandler( "e_onPlayerWeaponFire", root, 
function (...) 
--The source of this event is the player who fired the weapon.
--This event works only with weapons which have enabled bullet sync.
	triggerClientEvent( getElementsByType("player"), "e_playSound3D", source, ... )
end)