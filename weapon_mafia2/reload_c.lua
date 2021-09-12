local blockedTasks = {
	["TASK_SIMPLE_JUMP"] = true,
	["TASK_SIMPLE_LAND"] = true,
	["TASK_SIMPLE_SWIM"] = true,
	["TASK_SIMPLE_FALL"] = true,
	["TASK_SIMPLE_CLIMB"] = true,
	["TASK_SIMPLE_GET_UP"] = true,
	["TASK_SIMPLE_IN_AIR"] = true,
	["TASK_SIMPLE_HIT_HEAD"] = true,
	["TASK_SIMPLE_NAMED_ANIM"] = true,
	["TASK_SIMPLE_CAR_GET_IN"] = true,
	["TASK_SIMPLE_GO_TO_POINT"] = true,
	["TASK_SIMPLE_CAR_OPEN_DOOR_FROM_OUTSIDE"] = true,
}

local function reloadTimer()
	if blockedTasks[getPedSimplestTask(localPlayer)] or getPedControlState( localPlayer, "aim_weapon" ) then
		return
	end

	local weapon_p = getPedWeapon(localPlayer)
	local weapon_d = getElementData(root, "custom_weapon")
	if 18 < weapon_p and weapon_p < 35 and weapon_d and weapon_d[weapon_p] and getPedAmmoInClip( localPlayer ) ~= weapon_d[weapon_p][7]+1 and getPedTotalAmmo( localPlayer ) > 1 then
		triggerServerEvent("relWep", localPlayer)

		toggleControl( "fire", true )

		if weapon_p == 33 or weapon_p == 34 then 
			setPedAnimation( localPlayer, "rifle", "rifle_load", -1, false, false, false, false, 250, true )
		elseif weapon_p == 25 then
			setPedAnimation( localPlayer, "buddy", "buddy_reload", -1, false, false, false, false, 250, true )
		end
	end
end

-- The jump task is not instantly detectable and bindKey works quicker than getControlState
-- If you try to reload and jump at the same time, you will be able to instant reload.
-- We work around this by adding an unnoticable delay to foil this exploit.

local function reloadWeapon()
	setTimer(reloadTimer, 50, 1)
end
bindKey("r", "down", reloadWeapon)