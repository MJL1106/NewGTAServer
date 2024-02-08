CreateThread(function()
	-- Melee
	SetWeaponDamageModifier(`WEAPON_UNARMED`, 0.2) 
	SetWeaponDamageModifier(`WEAPON_FLASHLIGHT`, 0.3) 
	SetWeaponDamageModifier(`WEAPON_KNIFE`, 0.6) 
	SetWeaponDamageModifier(`WEAPON_MACHETE`, 0.8) 
	SetWeaponDamageModifier(`WEAPON_DAGGER`, 0.6) 
	SetWeaponDamageModifier(`WEAPON_SWITCHBLADE`, 0.6) -- Shank
	SetWeaponDamageModifier(`WEAPON_HATCHET`, 0.7) 
	SetWeaponDamageModifier(`WEAPON_NIGHTSTICK`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_HAMMER`, 0.4) 
	SetWeaponDamageModifier(`WEAPON_BAT`, 0.4) 
	SetWeaponDamageModifier(`WEAPON_GOLFCLUB`, 0.4) 
	SetWeaponDamageModifier(`WEAPON_BOTTLE`, 0.3) 
	SetWeaponDamageModifier(`WEAPON_CROWBAR`, 0.4) 
	SetWeaponDamageModifier(`WEAPON_KNUCKLE`, 0.4) 
	SetWeaponDamageModifier(`WEAPON_POOLCUE`, 0.4) 
	-- Pistols
	SetWeaponDamageModifier(`WEAPON_TASER`, 0.0) -- new taser shit
	SetWeaponDamageModifier(`WEAPON_SNSPISTOL`, 0.6) 
	SetWeaponDamageModifier(`WEAPON_PISTOL`, 0.6) -- Colt 1911
	SetWeaponDamageModifier(`WEAPON_PISTOL_MK2`, 0.0) -- Beretta M9
	SetWeaponDamageModifier(`WEAPON_COMBATPISTOL`, 0.6) -- FN FNX-45
	SetWeaponDamageModifier(`WEAPON_APPISTOL`, 0.5) 
	--SetWeaponDamageModifier(`WEAPON_HEAVYPISTOL`, 1.19) 
	SetWeaponDamageModifier(`WEAPON_PISTOL50`, 0.0) -- Desert Eagle
	-- Submachine Guns
	SetWeaponDamageModifier(`WEAPON_MICROSMG`, 0.5)
	SetWeaponDamageModifier(`WEAPON_MACHINEPISTOL`, 0.5) -- Tec 9
	SetWeaponDamageModifier(`WEAPON_MINISMG`, 0.5) -- Skorpion
	SetWeaponDamageModifier(`WEAPON_COMBATPDW`, 0.5) 
	SetWeaponDamageModifier(`WEAPON_SMG`, 0.5) -- MP5
	-- Rifles
	SetWeaponDamageModifier(`WEAPON_COMPACTRIFLE`, 0.5) -- Draco NAK9
	SetWeaponDamageModifier(`WEAPON_ASSAULTRIFLE`, 0.5) -- AK 47
	SetWeaponDamageModifier(`WEAPON_ASSAULTRIFLE_MK2`, 0.5) -- M70
	SetWeaponDamageModifier(`WEAPON_CARBINERIFLE`, 0.5) 
	SetWeaponDamageModifier(`WEAPON_CARBINERIFLE_MK2`, 0.5) -- PD 762
	-- Sniper Rifles
	SetWeaponDamageModifier(`WEAPON_SNIPERRFILE`, 1.5) -- M24
	-- Miscellaneous
	SetWeaponDamageModifier(`WEAPON_SMOKEGRENADE`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_SNOWBALL`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_HIT_BY_WATER_CANNON`, 0.0) -- Fire Truck Cannon (only idiots try to kill with that)

	-- Custom Weapons (Add-On)
	SetWeaponDamageModifier(`WEAPON_NAILGUN`, 0.0) -- Nail gun
	SetWeaponDamageModifier(`WEAPON_GLOCK`, 0.0) -- Glock 18
	SetWeaponDamageModifier(`WEAPON_BROWNING`, 0.0) -- Browning Hi-Power
	SetWeaponDamageModifier(`WEAPON_DP9`, 0.0) -- Diamondback DB9
	SetWeaponDamageModifier(`WEAPON_MICROSMG2`, 0.0) -- Uzi
	SetWeaponDamageModifier(`WEAPON_MICROSMG3`, 0.0) -- Mac-10
	SetWeaponDamageModifier(`WEAPON_M4`, 0.0) -- M4
	SetWeaponDamageModifier(`WEAPON_KATANA`, 0.0) -- Katana
	SetWeaponDamageModifier(`WEAPON_SHIV`, 0.0) -- Prison Shiv
	SetWeaponDamageModifier(`WEAPON_BOOK`, 0.0) -- Book
	SetWeaponDamageModifier(`WEAPON_CASH`, 0.0) -- Cash
	SetWeaponDamageModifier(`WEAPON_BRICK`, 0.0) -- Brick
	SetWeaponDamageModifier(`WEAPON_SHOE`, 0.0) -- Stolen Shoes

	-- Blacklisted (tbc)
	--------------------------------------------
	-- Melee (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_WRENCH`, 0.0)
	SetWeaponDamageModifier(`WEAPON_BATTLEAXE`, 0.0)
	SetWeaponDamageModifier(`WEAPON_STONE_HATCHET`, 0.0)
	-- Pistol (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_STUNGUN`, 0.0)
	SetWeaponDamageModifier(`WEAPON_SNSPISTOL_MK2`, 0.0)
	SetWeaponDamageModifier(`WEAPON_HEAVYPISTOL`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_VINTAGEPISTOL`, 0.3)
	SetWeaponDamageModifier(`WEAPON_FLAREGUN`, 0.0)
	SetWeaponDamageModifier(`WEAPON_MARKSMANPISTOL`, 0.0)
	SetWeaponDamageModifier(`WEAPON_REVOLVER`, 0.0)
	SetWeaponDamageModifier(`WEAPON_REVOLVER_MK2`, 0.0)
	SetWeaponDamageModifier(`WEAPON_DOUBLEACTION`, 0.0)
	SetWeaponDamageModifier(`WEAPON_RAYPISTOL`, 0.0)
	SetWeaponDamageModifier(`WEAPON_CERAMICPISTOL`, 0.0)
	SetWeaponDamageModifier(`WEAPON_NAVYREVOLVER`, 0.0)
	SetWeaponDamageModifier(`WEAPON_GADGETPISTOL`, 0.0)
	-- Submachine Guns (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_SMG_MK2`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_ASSAULTSMG`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_RAYCARBINE`, 0.0) 
	-- Shotguns (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_PUMPSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_PUMPSHOTGUN_MK2`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_SAWNOFFSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_ASSAULTSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_BULLPUPSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_MUSKET`, 0.6) 
	SetWeaponDamageModifier(`WEAPON_HEAVYSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_DBSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_AUTOSHOTGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_COMBATSHOTGUN`, 0.0) 
	-- Rifles (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_ADVANCEDRIFLE`, 0.5) 
	SetWeaponDamageModifier(`WEAPON_SPECIALCARBINE`, 1.1) 
	SetWeaponDamageModifier(`WEAPON_SPECIALCARBINE_MK2`, 0.5) 
	SetWeaponDamageModifier(`WEAPON_BULLPUPRIFLE`, 1.1) 
	SetWeaponDamageModifier(`WEAPON_BULLPUPRIFLE_MK2`, 0.5) 
	SetWeaponDamageModifier(`WEAPON_MILITARYRIFLE`, 0.0) 
	-- LMG (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_MG`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_COMBATMG`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_COMBATMG_MK2`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_GUSENBERG`, 0.0) 
	-- Sniper Rifles (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_HEAVYSNIPER`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_HEAVYSNIPER_MK2`, 0.0)
	SetWeaponDamageModifier(`WEAPON_MARKSMANRIFLE`, 0.0)
	SetWeaponDamageModifier(`WEAPON_MARKSMANRIFLE_MK2`, 0.0)
	-- Heavy Weapons (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_RPG`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_GRENADELAUNCHER`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_GRENADELAUNCHER_SMOKE`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_MINIGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_FIREWORK`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_RAILGUN`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_HOMINGLAUNCHER`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_COMPACTLAUNCHER`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_RAYMINIGUN`, 0.0) 
	-- Throwables (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_GRENADE`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_BZGAS`, 0.0) 
	-- SetWeaponDamageModifier(`WEAPON_MOLOTOV`, 0.0) 
	-- SetWeaponDamageModifier(`WEAPON_STICKYBOMB`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_PROXMINE`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_SNOWBALL`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_PIPEBOMB`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_BALL`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_SMOKEGRENADE`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_FLARE`, 0.0) 
	-- Miscellaneous (Blacklisted)
	SetWeaponDamageModifier(`WEAPON_PETROLCAN`, 0.0)  
	SetWeaponDamageModifier(`GADGET_PARACHUTE`, 0.0) -- lol wtf
	SetWeaponDamageModifier(`WEAPON_FIREEXTINGUISHER`, 0.0) 
	SetWeaponDamageModifier(`WEAPON_HAZARDCAN`, 0.0) 

	while true do
		Wait(0)
		SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
		SetPedSuffersCriticalHits(PlayerPedId(), false)
	end
end)