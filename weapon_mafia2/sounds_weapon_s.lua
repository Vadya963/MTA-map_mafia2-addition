local weapon = {
	[23] = {"Colt M1911A1", 347, 64,449, 59,34, 7},
	[24] = {"Model 19 Revolver", 348, 242,230, 84,42, 6},
	[31] = {"Thompson 1928", 356, 61,415, 119,33, 50},
	[30] = {"M1A1 Thompson", 355, 176,448, 112,34, 30},
	[25] = {"Remington Model 870 Field gun", 349, 105,340, 138,22, 8},
	[29] = {"M3 Grease Gun", 353, 0,0, 106,59, 30},
	[33] = {"M1 Garand", 357, 105,313, 143,26, 8},
	[22] = {"Model 12 Revolver", 346, 123,449, 53,38, 6},
	[34] = {"Kar98k", 358, 64,487, 135,25, 5},

	[16] = {"grenade", 342, 268,482, 19,30, 0},
	[5] = {"bat", 336, 124,188, 119,29, 0},
	[4] = {"knifecur", 335, 199,482, 69,30, 0},
	[1] = {"brassknuckle", 331, 0,411, 31,36, 0},
	[3] = {"nitestick", 334, 242,202, 84,28, 0},
	[18] = {"molotov", 344, 0,370, 39,41, 0},
	[6] = {"shovel", 337, 0,525, 158,27, 0},
	[15] = {"gun_cane", 326, 160,534, 106,21, 0},
}

function displayLoadedRes ( res )--старт ресурсов
	local weaponSkill = {"poor","std","pro"}

	for k,v in pairs(weapon) do
		if k > 18 then
			for _,j in pairs(weaponSkill) do
				setWeaponProperty(k, j, "maximum_clip_ammo", v[7]+1)
			end
		end
	end

	setElementData(root, "custom_weapon", weapon)
end
addEventHandler ( "onResourceStart", resourceRoot, displayLoadedRes )

addEvent("e_onPlayerWeaponFire", true)
addEventHandler( "e_onPlayerWeaponFire", root, 
function (...) 
--The source of this event is the player who fired the weapon.
--This event works only with weapons which have enabled bullet sync.
	triggerClientEvent( getElementsByType("player"), "e_playSound3D", source, ... )
end)