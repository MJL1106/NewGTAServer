Config = {
    ["Main"] = {
        ["lockpick"] = { -- item name
            itemName = "lockpick", -- item name
            label = "Lockpick", -- item label
            level = 0, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 22,
                },
                [2] = {
                    item = "plastic",
                    amount = 32,
                },
            }
        },
        ["screwdriverset"] = { -- item name
            itemName = "screwdriverset", -- item name
            label = "Toolkit", -- item label
            level = 0, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 30,
                },
                [2] = {
                    item = "plastic",
                    amount = 42,
                },
            }
        },
        ["electronickit"] = { -- item name
            itemName = "electronickit", -- item name
            label = "ElectronicKit", -- item label
            level = 0, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 30,
                },
                [2] = {
                    item = "plastic",
                    amount = 45,
                },
                [3] = {
                    item = "aluminum",
                    amount = 28,
                },
            }
        },
        ["radioscanner"] = { -- item name
            itemName = "radioscanner", -- item name
            label = "RadioScanner", -- item label
            level = 0, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "electronickit",
                    amount = 2,
                },
                [2] = {
                    item = "plastic",
                    amount = 52,
                },
                [3] = {
                    item = "steel",
                    amount = 40,
                },
            }
        },
        ["gatecrack"] = { -- item name
            itemName = "gatecrack", -- item name
            label = "GateCracker", -- item label
            level = 1, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "electronickit",
                    amount = 2,
                },
                [2] = {
                    item = "plastic",
                    amount = 50,
                },
                [3] = {
                    item = "aluminum",
                    amount = 30,
                },
                [4] = {
                    item = "metalscrap",
                    amount = 10,
                },
            }
        },
        ["handcuffs"] = { -- item name
            itemName = "handcuffs", -- item name
            label = "HandCuff", -- item label
            level = 1, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 36,
                },
                [2] = {
                    item = "steel",
                    amount = 24,
                },
                [3] = {
                    item = "aluminum",
                    amount = 28,
                },
                [4] = {
                    item = "metalscrap",
                    amount = 10,
                },
            }
        },
        ["repairkit"] = { -- item name
            itemName = "repairkit", -- item name
            label = "Repairkit", -- item label
            level = 2, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 32,
                },
                [2] = {
                    item = "steel",
                    amount = 43,
                },
                [3] = {
                    item = "plastic",
                    amount = 60,
                },
            }
        },
        ["smg_ammo"] = { -- item name
            itemName = "smg_ammo", -- item name
            label = "SmgAmmo", -- item label
            level = 2, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 50,
                },
                [2] = {
                    item = "steel",
                    amount = 37,
                },
                [3] = {
                    item = "copper",
                    amount = 26,
                },
            }
        },
        ["shotgun_ammo"] = { -- item name
            itemName = "shotgun_ammo", -- item name
            label = "ShotgunAmmo", -- item label
            level = 3, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 50,
                },
                [2] = {
                    item = "steel",
                    amount = 37,
                },
                [3] = {
                    item = "copper",
                    amount = 26,
                },
            }
        },
        ["rifle_ammo"] = { -- item name
            itemName = "rifle_ammo", -- item name
            label = "RifleAmmo", -- item label
            level = 4, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "metalscrap",
                    amount = 50,
                },
                [2] = {
                    item = "steel",
                    amount = 37,
                },
                [3] = {
                    item = "copper",
                    amount = 26,
                },
            }
        },
        ["armor"] = { -- item name
            itemName = "armor", -- item name
            label = "Armor", -- item label
            level = 5, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "iron",
                    amount = 33,
                },
                [2] = {
                    item = "steel",
                    amount = 44,
                },
                [3] = {
                    item = "plastic",
                    amount = 55,
                },
                [4] = {
                    item = "aluminum",
                    amount = 22,
                },
            }
        },
        ["drill"] = { -- item name
            itemName = "drill", -- item name
            label = "Drill", -- item label
            level = 5, -- amount of level requeried
            points = 1, -- how many points you win in 1 craft
            lostpoints = 1, -- how many points you lost if fail the craft
            chance = 100, -- chance to to success craft
            type = 'item',
            items = { -- requeried items
                [1] = {
                    item = "iron",
                    amount = 50,
                },
                [2] = {
                    item = "steel",
                    amount = 50,
                },
                [3] = {
                    item = "screwdriverset",
                    amount = 2,
                },
                [4] = {
                    item = "advancedlockpick",
                    amount = 1,
                },
            }
        },
    },
    ['MainLocation'] = {
        ['UseLocation'] = true,
        ['Location'] = vector3(1189.55, 2641.58, 38.4),
    },
    ['Logs'] = {
        ['UseLogs'] = true,
    },
    ['GenerateSerialNumberAtWeapons'] = true,
}

Lang = {
    ['craftSuccess'] = 'Crafted ',
    ['craftFailed1'] = 'You failed the craft and lost ',
    ['craftFailed2'] = 'You failed the craft...',
    ['points'] = ' points...',
    ['crafting'] = 'CRAFTING ',
    ['menuHeader'] = 'Crafting Menu',
    ['errorRightItems'] = 'You do not have the right items...',
    ['targetLabel'] = 'Craft',
    ['pointsCommand1'] = 'You have ',
    ['pointsCommand2'] = ' points!',
    ['targetPoints'] = 'Check Points',
}