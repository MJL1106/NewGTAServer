Config = {}

Config.ChopRadioItem = "chopradio"

Config.Inventory = 'qb' -- 'oldqb' or 'qb'
Config.InventoryName = 'qb-inventory' -- change this if you are using 'ps' or 'lj' or renamed you inventory folder

Config.ChopShopPed = false
Config.ChopShopPeds = {
    {
        model = `g_m_y_mexgoon_03`,
        coords = vector4(2342.21, 3055.63, 47.15, 162.86),
        scenario = 'WORLD_HUMAN_SMOKING'
    }
}
Config.ChopShopLocations = {
    vector3(3468.32, -1259.18, 0.24),
}

Config.RewardItems = {
    "metalscrap",
    "plastic",
    "copper",
    "iron",
    "aluminum",
    "steel",
    "glass",
    "rubber",
}

Config.Cooldowns = 20

Config.RandomVehicles = { "fugitive" }

Config.RandomLocations = {
    vector4(3468.33, -1259.12, 0.57, 58.64),
}
-- Core Config
Config.CoreName = 'qb-core'

-- Target Config
Config.TargetName = 'qb-target'
Config.TargetIcon = 'fab fa-dropbox'
Config.TargetLabel = 'Open Crate'

-- Police Config
Config.RequiredCops = 2-- How many cops are required to drop a gun?
Config.PoliceJobs = {"police"} -- All types of police job in server.

-- Other Config
Config.TimeUntilDrop = 2 -- How long does it take to drop a gun? (in minutes)
Config.Cooldown = 2 -- in mins
-- Objects and models Config
Config.LoadModels = {"w_am_flare", "p_cargo_chute_s", "ex_prop_adv_case_sm", "cuban800", "s_m_m_pilot_02"} -- Models to pre-load.
Config.FlareName = "weapon_flare" -- Name of the flare weapon.
Config.FlareModel = "w_am_flare" -- Model of the flare weapon.
Config.PlaneModel = "cuban800" -- Model of the plane.
Config.PlanePilotModel = "s_m_m_pilot_02" -- Model of the plane pilot.
Config.ParachuteModel = "p_cargo_chute_s" -- Model of the parachute.
Config.CrateModel = "ex_prop_adv_case_sm" -- Model of the crate.

-- Item Drops Config
Config.ItemDrops = {
    ["goldenphone"] = {
        [1] = {name = "WEAPON_ASSAULTRIFLE", amount = 1}, 
        [2] = {name = "WEAPON_ADVANCEDRIFLE", amount = 1}, 
        [3] = {name = "WEAPON_CARBINERIFLE_MK2", amount = 1},
        [4] = {name = "WEAPON_COMPACTRIFLE", amount = 1},
        [5] = {name = "WEAPON_SPECIALCARBINE_MK2", amount = 1},
        [6] = {name = "WEAPON_BULLPUPRIFLE_MK2", amount = 1},
    },
    ["redphone"] = {
        [1] = {name = "WEAPON_MICROSMG", amount = 1},  
        [2] = {name = "WEAPON_COMBATPDW", amount = 1},
        [3] = {name = "WEAPON_MACHINEPISTOL", amount = 1},
    },
    ["greenphone"] = {
        [1] = {name = "WEAPON_PISTOL50", amount = 1},
        [2] = {name = "WEAPON_COMBATPISTOL", amount = 1},
        [3] = {name = "WEAPON_SNSPISTOL", amount = 1},
    },
}

-- Locale Config
Config.Lang = { 
    ["contacted_mafia"] = "You Have Contacted With Russian Mafia",
    ["pilot_contact"] = "After few minutes pilot will contact you",
    ["no_cops"] = "Not Enough Cops idiot",
    ["pilot_dropping_soon"] = "Pilot: We are preparing the crate with the plane and will be dropping it soon",
    ["pilot_crashed"] = "The plane has crashed delivery failed",
    ["crate_dropping"] = "Pilot: keep the eye on sky the crate is droping",
    ["item_recieved"] = "You opened the crate and recieved",
}
