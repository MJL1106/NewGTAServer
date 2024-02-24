local recoils = {
    -- Handguns
    [`weapon_pistol`] = 0.8,
    [`weapon_pistol_mk2`] = 0.8,
    [`weapon_combatpistol`] = 0.8,
    [`weapon_appistol`] = 1.1,
    [`weapon_stungun`] = 0.1,
    [`weapon_pistol50`] = 1.8,
    [`weapon_snspistol`] = 0.6,
    [`weapon_heavypistol`] = 0.6,
    [`weapon_vintagepistol`] = 0.6,
    [`weapon_flaregun`] = 0.9,
    [`weapon_marksmanpistol`] = 0.9,
    [`weapon_revolver`] = 0.6,
    [`weapon_revolver_mk2`] = 0.6,
    [`weapon_doubleaction`] = 0.3,
    [`weapon_snspistol_mk2`] = 0.3,
    [`weapon_raypistol`] = 0.3,
    [`weapon_ceramicpistol`] = 0.3,
    [`weapon_navyrevolver`] = 0.3,
    [`weapon_gadgetpistol`] = 0.3,
    [`weapon_pistolxm3`] = 0.4,

    -- Submachine Guns
    [`weapon_microsmg`] = 1.9,
    [`weapon_smg`] = 1.8,
    [`weapon_smg_mk2`] = 1.3,
    [`weapon_assaultsmg`] = 1.3,
    [`weapon_combatpdw`] = 1.3,
    [`weapon_machinepistol`] = 2.9,
    [`weapon_minismg`] = 2.9,
    [`weapon_raycarbine`] = 0.3,
    [`weapon_tecpistol`] = 0.3,

    -- Shotguns
    [`weapon_pumpshotgun`] = 0.4,
    [`weapon_sawnoffshotgun`] = 0.7,
    [`weapon_assaultshotgun`] = 0.5,
    [`weapon_bullpupshotgun`] = 0.6,
    [`weapon_musket`] = 0.7,
    [`weapon_heavyshotgun`] = 0.5,
    [`weapon_dbshotgun`] = 0.7,
    [`weapon_autoshotgun`] = 0.5,
    [`weapon_pumpshotgun_mk2`] = 0.5,
    [`weapon_combatshotgun`] = 0.0,

    -- Assault Rifles
    [`weapon_assaultrifle`] = 23.5,
    [`weapon_assaultrifle_mk2`] = 2.9,
    [`weapon_carbinerifle`] = 2.9,
    [`weapon_carbinerifle_mk2`] = 3.3,
    [`weapon_advancedrifle`] = 3.6,
    [`weapon_specialcarbine`] = 1.9,
    [`weapon_bullpuprifle`] = 1.9,
    [`weapon_compactrifle`] = 2.4,
    [`weapon_specialcarbine_mk2`] = 2.9,
    [`weapon_bullpuprifle_mk2`] = 3.6,
    [`weapon_militaryrifle`] = 1.9,
    [`weapon_heavyrifle`] = 1.9,
    [`weapon_tacticalrifle`] = 1.9,

    -- Light Machine Guns
    [`weapon_mg`] = 0.1,
    [`weapon_combatmg`] = 0.1,
    [`weapon_gusenberg`] = 0.1,
    [`weapon_combatmg_mk2`] = 0.1,

    -- Sniper Rifles
    [`weapon_sniperrifle`] = 0.5,
    [`weapon_heavysniper`] = 0.7,
    [`weapon_marksmanrifle`] = 0.3,
    [`weapon_remotesniper`] = 1.2,
    [`weapon_heavysniper_mk2`] = 0.6,
    [`weapon_marksmanrifle_mk2`] = 0.3,
    [`weapon_precisionrifle`] = 0.3,

    -- Heavy Weapons
    [`weapon_rpg`] = 0.0,
    [`weapon_grenadelauncher`] = 1.0,
    [`weapon_grenadelauncher_smoke`] = 1.0,
    [`weapon_minigun`] = 0.1,
    [`weapon_firework`] = 0.3,
    [`weapon_railgun`] = 2.4,
    [`weapon_hominglauncher`] = 0.0,
    [`weapon_compactlauncher`] = 0.5,
    [`weapon_rayminigun`] = 0.3,
	-- CUSTOM WEAPONS
	[GetHashKey("weapon_ak47")] = 0.5,
	[GetHashKey("weapon_de")] = 0.5,
	[GetHashKey("weapon_fnx45")] = 0.3,
	[GetHashKey("weapon_glock17")] = 0.3,
	[GetHashKey("weapon_m4")] = 0.3,
	[GetHashKey("weapon_hk416")] = 0.3,
	[GetHashKey("weapon_mk14")] = 0.4,
	[GetHashKey("weapon_m110")] = 0.4,
	[GetHashKey("weapon_huntingrifle")] = 0.4,
	[GetHashKey("weapon_ar15")] = 0.4,
	[GetHashKey("weapon_m9")] = 0.4,
	[GetHashKey("weapon_m70")] = 0.5,
	[GetHashKey("weapon_m1911")] = 0.4,
	[GetHashKey("weapon_mac10")] = 0.7,
	[GetHashKey("weapon_uzi")] = 0.7,
	[GetHashKey("weapon_mp9")] = 0.7,
	[GetHashKey("weapon_mossberg")] = 0.7,
	[GetHashKey("weapon_remington")] = 0.7,
	[GetHashKey("weapon_scarh")] = 0.5,
}


CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
            local _, weap = GetCurrentPedWeapon(ped)
            if recoils[weap] and recoils[weap] ~= 0 then
                local tv = 0
                if GetFollowPedCamViewMode() ~= 4 then
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        SetGameplayCamRelativePitch(p + 0.1, 0.2)
                        tv += 0.1
                    until tv >= recoils[weap]
                else
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        if recoils[weap] > 0.1 then
                            SetGameplayCamRelativePitch(p + 0.6, 1.2)
                            tv += 0.6
                        else
                            SetGameplayCamRelativePitch(p + 0.016, 0.333)
                            tv += 0.1
                        end
                    until tv >= recoils[weap]
                end
            end
        end
        Wait(0)
    end
end)