Config = {}

Config.prop = 'gr_prop_gr_bench_04b'

Config.craftingBenches = {
    {id = "testId", coords = vector3(3612.8, 5023.32, 11.34), heading = 292.17},
}

--[[
Make sure to change the image path to your inventory image file. Default is lj-inventory, you can change it to qb-inventory by doing this example below:
    https://cfx-nui-qb-inventory/html/images/radio.png
]]


-- Recipes that come with every workbench
Config.defaultRecipes = {
    weapon_knife = {
        item = "weapon_knife",
        label = "Knife",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_knife.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 15, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
            {item = "rubber", label = "Rubber", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/rubber.png"},
            {item = "plastic", label = "Plastic", amount = 20, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        }
    },
    weapon_wrench = {
        item = "weapon_wrench",
        label = "Wrench",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_wrench.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    handcuffs = {
        item = "handcuffs",
        label = "Handcuffs",
        image = "https://cfx-nui-qb-inventory/html/images/handcuffs.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "aluminum", label = "Aluminum", amount = 30, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "steel", label = "Steel", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
            {item = "rubber", label = "Rubber", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/rubber.png"},
        }
    },
    electronickit = {
        item = "electronickit",
        label = "Electronic Kit",
        image = "https://cfx-nui-qb-inventory/html/images/electronickit.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "copper", label = "Copper", amount = 18, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "metalscrap", label = "Metal Scrap", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/metalscrap.png"},
            {item = "plastic", label = "Plastic", amount = 18, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        }
    },
    trojan_usb = {
        item = "trojan_usb",
        label = "Trojan Usb",
        image = "https://cfx-nui-qb-inventory/html/images/usb_device.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "copper", label = "Copper", amount = 23, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "glass", label = "Glass", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/glass.png"},
            {item = "plastic", label = "Plastic", amount = 14, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        }
    },
}

--Recipes that are unlocked with blueprints
Config.blueprintRecipes = {
    pistol_ammo = {
        item = "pistol_ammo",
        label = "Pistol Ammo",
        image = "https://cfx-nui-qb-inventory/html/images/pistol_ammo.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "iron", label = "Iron", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
            {item = "rubber", label = "Rubber", amount = 5, image = "https://cfx-nui-qb-inventory/html/images/rubber.png"},
            {item = "plastic", label = "Plastic", amount = 5, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        },
        blueprintImage = "https://cfx-nui-qb-inventory/html/images/blueprint_ammo.png"
    },
    armor = {
        item = "armor",
        label = "Armor",
        image = "https://cfx-nui-qb-inventory/html/images/armor.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 35, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
            {item = "metalscrap", label = "Metal Scrap", amount = 25, image = "https://cfx-nui-qb-inventory/html/images/metalscrap.png"},
            {item = "rubber", label = "Rubber", amount = 15, image = "https://cfx-nui-qb-inventory/html/images/rubber.png"},
        },
        blueprintImage = "https://cfx-nui-qb-inventory/html/images/blueprint_armor.png"
    },
    thermite = {
        item = "thermite",
        label = "Thermite",
        image = "https://cfx-nui-qb-inventory/html/images/thermite.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "iron", label = "Iron", amount = 30, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
            {item = "copper", label = "Copper", amount = 20, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "pistol_ammo", label = "Pistol Ammo", amount = 1, image = "https://cfx-nui-qb-inventory/html/images/pistol_ammo.png"},
        },
        blueprintImage = "https://cfx-nui-qb-inventory/html/images/blueprint_thermite.png"
    },
    weapon_vintagepistol = {
        item = "weapon_vintagepistol",
        label = "Vintage Pistol",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_vintagepistol.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "iron", label = "Iron", amount = 80, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
            {item = "rubber", label = "Rubber", amount = 20, image = "https://cfx-nui-qb-inventory/html/images/rubber.png"},
            {item = "plastic", label = "Plastic", amount = 80, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "copper", label = "Copper", amount = 75, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
        },
        blueprintImage = "https://cfx-nui-qb-inventory/html/images/blueprint_vintage.png"
    },
    pistol_extendedclip = {
        item = "pistol_extendedclip",
        label = "Pistol Extended clip",
        image = "https://cfx-nui-qb-inventory/html/images/pistol_extendedclip.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "iron", label = "Iron", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
            {item = "plastic", label = "Plastic", amount = 15, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
        },
        blueprintImage = "https://cfx-nui-qb-inventory/html/images/blueprint_pistolext.png"
    },
}
