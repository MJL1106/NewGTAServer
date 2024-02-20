Config = {}

----- ** TIMER CONFIG ** ----
Config.BlackoutTimer = 15 -- How many minutes are the city blackedout when powerplant is hit?
Config.BankTimer = {
    fleeca = 45, -- Time in minutes for cooldown
    paleto = 60, -- Time in minutes for cooldown
    pacific = 480, -- Time in minutes for cooldown
} 

---- ** BAG IDs ** ----
Config.BagUseID = 93 -- Which ID is the bag that a player gets after doing an animation? (Should use a black one so it looks close to the animation)
Config.HideBagID = 0 -- Which Bag ID is hiding the bag? This is used to not mess up the animations

---- ** MISC ** ----
Config.Version = "new" -- If you use a newer version of the core (around 1 month old) then set to new otherwise set it to old

Config.TargetOption = "qb" -- use either "bt", "qb" or "berkie" depending on which target you use (bt-targer, qb-target or berkie-target)
Config.Wrapper = "ox" -- Use ox or ghmatti, THIS IS FOR THE BAN TRIGGER nothing else leave this as whatever if you don't use Config.BanModders
Config.lowerVaultEnabled = "false" -- Extra step of pacific hiest that uses "name here" pacific bank MLO ("link here")

Config.debugPoly =false -- Show polyzones for targets
Config.EnableTrades = true -- Accept trading for Laptops?

---- ** POLICE CONFIG ** ----



Config.MinimumFleecaPolice = 1
Config.MinimumPaletoPolice = 1
Config.MinimumPowerPolice = 1
Config.MinimumPAleto2 = 0
Config.MinimumPacificPolice = 0
Config.MinimumlowerVaultPolice = 0 -- This also includes thermite in the lower Vault
Config.MinimumThermitePolice = 0 

---- ** REMOVE ITEMS ** ----
Config.RemoveLaptop = true -- True means that it will remove laptop after they complete a hack regardless of the amount of uses left
Config.RemoveCard = true -- This means after successfully using a bank card it will be removed set to false it will not be removed

---- ** DOOR COOLDOWN ** ----
Config.DoorCD = 1 -- How many minutes before Bank Vault opens after finishing the hack?

---- ** Trolly CONFIG ** ----

Config.FleecaTrollyChance = 100 -- How many percent chance of getting a extra trolley with loot
Config.FleecaGoldTrollyChance = 0 -- How many percent chance of that Fleeca Trolly to be gold

Config.PaletoTrollyChance = 100 -- How many percent chance of getting a extra trolley with loot
Config.PaletoGoldTrollyChance = 0 -- How many percent chance of that Fleeca Trolly to be gold

Config.PacificTrollyChance = 100 -- How many percent chance of getting a extra trolley with loot
Config.PacificGoldTrollyChance = 0 -- How many percent chance of that Fleeca Trolly to be gold

Config.FleecaGoldChance = 0 -- What percent chance of getting a gold table in a fleeca?
Config.PaletoGoldChance = 0 -- What percent chance of getting a gold table in a Paleto?
Config.PacificGoldChance = 0 -- What percent chance of getting a gold table in a Pacific?
Config.lowerVaultGoldChance = 0 -- What percent chance of getting a gold table in the lowerVault?

---- ** HARD DRIVE CONFIG ** ---- 
-- only mess with this if you use lowervault
Config.HardDriveChance = 50 -- Chance of getting a hard drive from one of the servers

---- ** DOOR ID CONFIGUARTIONS ** ----

Config.Doorlocks = "qb" -- Put 'nui' if you use NUI doorlocks

-- All the doorlock IDs you need to put in if you don't know how to find them just ask for help on Discord
Config.DoorlockID1 = 5 -- whats your ID for this door? vector3(-105.87, 6475.57, 31.63) --thermite door paleto
Config.DoorlockID2 = 4 -- whats your ID for this door? vector3(-104.81, 6473.65, 31.95) --security card door paleto
Config.DoorlockID3 = 6 -- whats your ID for this door? vector3(257.22, 220.42, 106.29) --first thermite door pacific
Config.DoorlockID4 = 1 -- whats your ID for this door? vesctor3(261.97, 221.53, 106.29)
Config.DoorlockID5 = 2 -- whats your ID for this door? vector3(252.69, 220.79, 101.68)
Config.DoorlockID6 = 3 -- whats your ID for this door? vector3(261.09, 215.04, 101.68)
Config.DoorlockID7 = 212 -- Whats your ID for this door? vector3(255.37, 229.54, 101.7) -- lower vault
Config.DoorlockID8 = 213 -- Whats your ID for this door? vector3(262.98, 258.38, 101.71) -- lower

Config.BankDoors = {
    fleeca = {},
    paleto = {
        'PaletoFD',
        'PaletoOutDoor1',
        'PaletoOutDoor2',
        'PaletoAdmin',
        'PaletoVault',
    },
    pacific = {
        6,
        1,
        2,
        3
    },
}


-- THIS IS ONLY FOR THOSE WHO USE PALETO EXTENDED BY k4mb1
Config.DoorlockID9 = "Computer Room" -- Whats the doorID for this room?  vector3(-99.02, 6462.16, 31.63)
Config.DoorlockID10 = "lowervault 1" -- Whats the doorID for this room? vector3(-103.88, 6464.14, 31.63)
Config.DoorlockID11 = "lowervault main vault" -- Whats the doorID for this room? vector3(-102.02, 6459.52, 31.63)

---- ** FLEECA HACK CONFIG ** ----
Config.FleecaTime = 12 -- How much time do they have to enter the hack?
Config.FleecaBlocks = 4 -- How many different blocks can the hack have?
Config.FleecaRepeat = 2 -- How many times in a row do they need to hack the system?

---- ** PALETO HACK CONFIG ** ---- 
Config.PaletoTime = 7 -- How much time do they have to enter the hack?
Config.PaletoBlocks = 5 -- How many different blocks can the hack have?
Config.PaletoRepeat = 2 -- How many times in a row do they need to hack the system?

---- ** PACIFIC HACK CONFIG ** ----
Config.PacificTime = 6 -- How much time do they have to enter the hack?
Config.PacificBlocks = 6 -- How many different blocks can the hack have?
Config.PacificRepeat = 3 -- How many times in a row do they need to hack the system?

---- ** PACIFIC Vault HACK CONFIG ** ----
Config.PacificVaultTime = 5 -- How much time do they have to enter the hack?
Config.PacificVaultBlocks = 6 -- How many different blocks can the hack have?
Config.PacificVaultRepeat = 4 -- How many times in a row do they need to hack the system?

---- ** LOWER VAULT HACK CONFIG ** ----
Config.HDDTime = 6 -- How much time do they have to enter the hack?
Config.HDDBlocks = 6 -- How many different blocks can the hack have?
Config.HDDRepeat = 4 -- How many times in a row do they need to hack the system?

Config.LowerInnerTime = 8 -- How much time do they have to enter the hack?
Config.LowerInnerBlocks = 6 -- How many different blocks can the hack have?
Config.LowerInnerRepeat = 5 -- How many times in a row do they need to hack the system?



---- ** POWER THERMITE MINIGAME CONFIG ** ----
Config.CorrectBlocks = 12 -- correctBlocks = Number of correct blocks the player needs to click
Config.IncorrectBlocks = 3 -- incorrectBlocks = number of incorrect blocks after which the game will fail
Config.TimeToShow = 4 -- timetoShow = time in secs for which the right blocks will be shown
Config.TimeToLose = 7 -- timetoLose = maximum time after timetoshow expires for player to select the right blocks


---- ** BILLS ITEM ** ----
Config.BillsItem = "markedbills"
Config.MarkedBillsWorthMin = 23000 -- Minimum worth of a bag
Config.MarkedBillsWorthMax = 27000 -- Maximum worth of a bag
-- NOTES --
-- Everywhere you give Config.BillsItem (Default markedbills) will give the same amount that means, trays, tables and lockers will give this amount


---- ** FLEECA ** ----
Config.FleecaBagsMin = 1 -- How many bags of Marked Bills can you MINIMUM get from a FLeeca Table?
Config.FleecaBagsMax = 2 -- How many bags of Marked Bills can you MAXIMUM get from a FLeeca Table?
Config.FleecaGoldMin = 200 -- Minimum gold bars from Fleecas
Config.FleecaGoldMax = 210 -- Maximum gold bars from Fleecas

---- ** PALETO ** ----
Config.PaletoBagsMin = 1-- How many bags of Marked Bills can you MINIMUM get from a Paleto Table?
Config.PaletoBagsMax = 2 -- How many bags of Marked Bills can you MAXIMUM get from a Paleto Table?
Config.PaletoGoldMin = 390 -- Minimum gold bars from Paleto
Config.PaletoGoldMax = 410 -- Maximum gold bars from Paleto

---- ** PALETO SECOND ** ----
Config.PaletoSecondMinBags = 6 -- How many bags of Marked Bills can you MINIMUM get from a Paleto Second Table
Config.PaletoSecondMaxBags = 9 -- How many bags of Marked Bills can you MAXIMUM get from a Paleto Second Table?
Config.PaletoSecondGoldMin = 5 -- Minimum gold bars from Paleto Second
Config.PaletoSecondGoldMax = 8 -- Maximum gold bars from Paleto Second

---- ** PACIFIC LOOT TABLES ** ----
Config.PacificBagsMin = 6 -- How many bags of Marked Bills can you MINIMUM get from a pacific Table?
Config.PacificBagsMax = 8 -- How many bags of Marked Bills can you MAXIMUM get from a pacific Table?
Config.PacificGoldMin = 800 -- Minimum gold bars from pacific
Config.PacificGoldMax = 820 -- Maximum gold bars from pacific

---- ** LOWER VAULT LOOT TABLES ** ----
Config.LowerVaultBagsMin = 6 -- How many bags of Marked Bills can you MINIMUM get from a lowervault Table?
Config.LowerVaultBagsMax = 10 -- How many bags of Marked Bills can you MAXIMUM get from a lowervault Table?
Config.LowerVaultGoldMin = 6 -- Minimum gold bars from Lower Vault
Config.LowerVaultGoldMax = 12 -- Maximum gold bars from Lower Vault
Config.LowerVaultDiamondMin = 6 -- Minimum amount of Diamonds from a lowervault
Config.LowerVaultDiamondMax = 12 -- Maximum amount of Diamonds from a lowervault

-- ONLY PUT MARKEDBILLS UNDER CASH, I made it so you have 50% chance of getting a RARE ITEM or a CASH item
Config.Lockers = {
    ["Fleeca"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
        },
        ["ItemAmount"] = math.random(24,28), -- sets total amount of items you get

        ["gold"] = 'goldbar',
        ["GoldAmount"] = math.random(90,100), -- sets total gold bars you get
        ---- RARE ITEMS ----
        ["Chance"] = 30, -- CHANCE OF GETTING USB

        ["Rare"] = {
            'usb_blue',
        },
        ["RareAmount"] = 1, -- Set total number of usb
        ---- CASH ITEMS ----

        ["Card"] = 15, -- CHANCE OF GETTING CARD
        ["Cash"] = 'security_card_01',
        ["CashAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
    },
    ["Paleto"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
        },
        ["ItemAmount"] = math.random(30,34), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 25, -- CHANCE OF GETTING GETTING USB

        ["Rare"] = {
            'usb_red',
        },
        ["RareAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Card"] = 10, -- CHANCE OF GETTING CARD
        ["Cash"] = 'security_card_02',
        ["CashAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
    },
    -- ["PaletoVault"] = { -- This is Paleto SECOND vault
    --     ---- NORMAL ITEMS ----
    --     ["items"] = {
    --         'rolex',
    --     },
    --     ["ItemAmount"] = math.random(60,68), -- Put minimum and Maximum amount of items inside the randomiser
    --     ---- RARE ITEMS ----
    --     ["Chance"] = 100, -- CHANCE OF GETTING RARE OR CASH ITEM

    --     ["Rare"] = {
    --         'greenphone',
    --     },
    --     ["RareAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
    --     ---- CASH ITEMS ----

    --     ["Card"] = 100,
    --     ["Cash"] = 'redphone',
    --     ["CashAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
    -- },
    ["Pacific"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
        },
        ["ItemAmount"] = math.random(120,140), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 50, -- CHANCE OF GETTING RARE OR CASH ITEM

        ["Rare"] = {
            'greenphone',
        },
        ["RareAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Card"] = 20, -- chance of getting goldusb
        ["Cash"] = 'usb_gold',
        ["CashAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser

        ["OfficeItem"] = 'encrypted_hdd',
    },

    ["Vault"] = {
        ---- NORMAL ITEMS ----
        ["items"] = {
            'rolex',
        },
        ["ItemAmount"] = math.random(400,450), -- Put minimum and Maximum amount of items inside the randomiser
        ---- RARE ITEMS ----
        ["Chance"] = 50, -- CHANCE OF GETTING RARE OR CASH ITEM

        ["Rare"] = {
            'redphone',
        },
        ["RareAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
        ---- CASH ITEMS ----

        ["Card"] = 20, -- chance of getting redphone
        ["Cash"] = 'goldenphone',
        ["CashAmount"] = 1, -- Put minimum and Maximum amount of items inside the randomiser
    },
}

---- ITEMS NEEDED ---- (Rename these if you use different language or use different items)
Config.LockerRequired = 'drill' -- Which items do someone need to open a deposit box?
Config.PaletoPacificDoor = 'thermite' -- Which explosive is used to open paleto/pacific doors
Config.PaletoDoorCard = 'security_card_01' -- What is used to open the first paleto door
Config.PacificDoorCard = 'security_card_02' -- What is used to open the first paleto door
Config.PowerplantRequired = 'thermite' -- Which item do someone need to blow up the powerplant?
Config.LowerVaultDoors = "weapon_pipebomb" -- Which item is required before they can plant explosives on lowervault doors?

---- MODDER DETECTION ----
Config.BanModders = false
-- Wanna ban modders when they trigger bankrobbery events? make this true!

-- All the laptop configs
Config.LaptopUses = 3


---- LAPTOP LOCATIONS ----
Config.LaptopLocations = {
    ["Hunter"] = {
        ["coords"] = vector4(1444.58, 6334.66, 23.8, 134.1),
        ["TradeItem"] = "usb_green",
        ["laptop"] = "laptop_green",
        ["price"] = 5000,
    },
    ["Fernando"] = {
        ["coords"] = vector4(1444.63, 6331.95, 23.9, 48.97),
        ["TradeItem"] = "usb_blue",
        ["laptop"] = "laptop_blue",
        ["price"] = 10000,
    },
    ["Rico"] = {
        ["coords"] = vector4(-1237.86, -909.83, 2.15, 166.53),
        ["TradeItem"] = "usb_red",
        ["laptop"] = "laptop_red",
        ["price"] = 20000,
    },
    ["Gustavo"] = {
        ["coords"] = vector4(-96.8, -821.74, 44.04, 43.35),
        ["TradeItem"] = "usb_gold",
        ["laptop"] = "laptop_gold",
        ["price"] = 30000,
    },
}
---- NOTIFY SUPPORTING MULTIPLE LANGUAGES ----
Config.Notify = { -- Don't change the ["Text"] only change the text on the RIGHT SIDE
    -- POLICE NOTIS
    ["NotEnoughPD"] = "Not enough police...",

    -- Hard Drive Noti
    ["MissingHDD"] = "This dosn't seem right",
    ["BrokeHDD"] = "You broke the Hard Drive!",
    ["NoDrive"] = "No Hard Drive Found!",
    ["MissingDrive"] = "No Drive to be found",
    ["FoundHDD"] = "You found a encrypted Hard Drive!",

    ---- MISC ----
    ["FleecaHackCancel"] = "Canceled..",
    ["FleecaHackFail"] = "You failed the hack!",
    ["BankDoorOpen"] = "It seems the bank is already open..",
    ["BankCoolDown"] = "The security lock is active, opening the door is currently not possible..",
    ["HackerSuccess"] = "You cracked the security system...",
    ["DoorSeemsUnlocked"] = "The thermite has disabled a lock",
    ["DrawerSeemsUnlocked"] = "The hacks seems to have opened a desk draw...",
    ["DoorMinutes"] = "Bank Door opens in ",
    ["DoorSecondHalf"] = " Seconds",
    ["MissingDrill"] = "You don't have anything to open this with...",
    ["AlreadyDrilled"] = "Saftey Box has already been drilled...",
    ["MissingLaptop"] = "What are you gonna hack it with???",
    ["TableAlreadyLooted"] = "There's nothing there...",
    ["TrayAlreadyLooted"] = "There's nothing there...",
    ["BankOpen"] = "Bank Security is activated...",
    ["DoorIsOpen"] = "The Door is already open...",
    ["MissingExplosive"] = "Something seems wrong...",
    ["BombExplodes"] = "C4 will explode in 5 seconds!",

    -- Thermite Notis
    ["PlacingThermite"] = "Placing Thermite...",
    ["MissingThermite"] = "This dosn't seem right...",
    ["AlreadyExploded"] = "This dosn't seem right...",
    ["PowerOff"] = "The Power is off",
    ["PowerStillOn"] = "Electricity still running...",

    -- Item // server side notify
    ["Got"] = "You got ",
    ["BagsOfInked"] = " bags of marked bills...",
    ["GoldBars"] = " Gold Bars",
    ["Diamonds"] = " Diamonds",
    ["found"] = "You found ",
    ["VaultCracker"] = " Vault Gate Cracker",

    -- Drill Overheated
    ["DrillBroke"] = "The Drill overheated and broke!",
    ["LockBroke"] = "The Drill overheated!",

    -- Lower vault code
    ["FirstCode"] = "The first code is ",
    ["SecondCode"] = "The second code is ",
    ["Code1Cracked"] = "Code 1 cracked",
    ["WrongCode"] = "Wrong Code",
    ["LockDownActivated"] = "Lockdown is activated!",

    ["Code2Cracked"] = "Code 2 Cracked",
    ["LWHackFail"] = "The Hack Failed!",
    ["CrackCode1"] = "Crack the First Code!",

    -- Laptop Notis
    ["PurchasedLaptop"] = "You purchased a laptop from ",
    ["for"] = " for $",
    ["cash"] = " cash",

    -- ^^ This one might be confusing but it will look like this
    -- You purchased a laptop from Gustavo for $34591 cash

    ["NotEnoughCash"] = "You don't have enough cash",
    ["NothingToOffer"] = "You don't have anything to offer!",
    ["MissingGreen"] = "You are missing a green usb",
    ["MissingBlue"] = "You are missing a blue usb",
    ["MissingRed"] = "You are missing a red usb",
    ["MissingGold"] = "You are missing a gold usb",
}
---- BANK LOCATIONS ----

-- ** DO NOT CHANGE THIS ** --
Config.FleecaBanks = { 
    -- [1] = { -- Great Ocean Highway
    --     ["coords"] = vector4(-2956.564, 481.957, 15.297, 347.02),  -- Coordinates of the Banks
    --     ["panelCoords"] = vector3(-2956.564, 481.957, 15.297),
    --     ["tablecoords"] = {[1] = vector3(-2954.2, 484.377, 15.525)},
    --     ["object"] = GetHashKey("hei_prop_heist_sec_door"),
    --     ["camId"] = 25,
    --     ["isOpened"] = false,
    --     ["heading"] = {
    --         closed = 357.542,
    --         open = 267.542,
    --     },
    --     ["grab"] = { -- middle main grab point
    --         pos = vector3(-2954.2, 484.377, 15.525),
    --         heading = 270.0,
    --         loot = false
    --     },
    --     ["drills"] = { -- drill points
    --         {coords = vector3(-2952.2, 484.135, 15.9253), rotation = vector3(0.0, 0.0, 265.0), loot = false},
    --         {coords = vector3(-2954.0, 486.676, 15.9253), rotation = vector3(0.0, 0.0, 355.0), loot = false},
    --         {coords = vector3(-2954.2, 482.120, 15.9253), rotation = vector3(0.0, 0.0, 185.0), loot = false},
    --     },
    --     ["trollys"] = { -- trollys points
    --         {coords = vector3(-2957.3, 485.690, 14.6753), heading = 178.0, loot = false},
    --         {coords = vector3(-2958.4, 484.099, 14.6753), heading = 268.0, loot = false},
    --     },
    -- },
    [1] = { -- Sandy Shores
        ["coords"] = vector4(1176.01, 2713.09, 39.35, 356.44),  -- Coordinates of the Banks   
        ["panelCoords"] = vector3(1176.01, 2713.09, 37.94),
       -- ["tablecoords"] = {[1] = vector3(1173.45, 2715.08, 37.9162)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 22,
        ["heading"] = {
            closed = 90.00,
            open = 0.00,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(1173.45, 2715.08, 37.9162),
            heading = 360.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(1173.34, 2717.16, 38.3363), rotation = vector3(0.0, 0.0, 0.0), loot = false},
            {coords = vector3(1175.52, 2715.16, 38.3363), rotation = vector3(0.0, 0.0, 275.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(1172.02, 2712.01, 37.0662), heading = 270.0, loot = false},
            {coords = vector3(1173.69, 2710.93, 37.0662), heading = 0.0, loot = false},
        },
    },
    [2] = { -- Del Perro Blvd
        ["coords"] = vector4(-1210.67, -336.4793, 37.381, 195.27),  -- Coordinates of the Banks   
        ["panelCoords"] = vector3(-1210.67, -336.76, 37.63),
       --["tablecoords"] = {[1] = vector3(-1207.47, -336.63, 37.76)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 296.863,
            open = 206.863,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(-1207.6, -337.40, 37.6093),
            heading = 210.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(-1206.4, -339.10, 37.9593), rotation = vector3(0.0, 0.0, 200.0), loot = false},
            {coords = vector3(-1208.96, -338.41, 37.78), rotation = vector3(0.0, 0.0, 120.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(-1207.6, -333.89, 36.7592), heading = 118.0, loot = false},
            {coords = vector3(-1209.9039, -334.0858, 36.7592), heading = 208.0, loot = false},
        },
    },
    [3] = { -- Pink Cage Motel
        ["coords"] = vector4(311.25, -284.0903, 53.974, 167.26),  -- Coordinates of the Banks   
        ["panelCoords"] = vector3(311.18, -284.5503, 53.974),
       -- ["tablecoords"] = {[1] = vector3(312.756, -287.41, 54.0)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(312.756, -287.41, 54.0),
            heading = 160.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(310.867, -286.82, 54.4430), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(312.411, -289.41, 54.4430), rotation = vector3(0.0, 0.0, 160.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(315.230, -284.93, 53.1430), heading = 70.0, loot = false},
            {coords = vector3(313.4798, -283.2532, 53.1430), heading = 160.0, loot = false},
        },
    },
    [4] = { -- Legion Square
        ["coords"] = vector4(vector3(147.5, -1046.69, 30.0008), 160.76), -- Coordinates of the Banks   
        ["panelCoords"] = vector3(146.72, -1046.23, 29.22),
       -- ["tablecoords"] = {[1] = vector3(148.431, -1049.1, 29.19)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(148.431, -1049.1, 29.19),
            heading = 160.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(146.88, -1048.56, 29.37), rotation = vector3(0.0, 0.0, 70.0), loot = false},
            {coords = vector3(148.095, -1051.1, 29.6162), rotation = vector3(0.0, 0.0, 170.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(151.036, -1046.6, 28.3462), heading = 70.0, loot = false},
            {coords = vector3(149.3168, -1045.0193, 28.3463), heading = 160.0, loot = false},
        },
    },
    [5] = { -- Hawick Ave
        ["coords"] = vector4(-354.8, -55.27648, 49.8666, 160.84),  -- Coordinates of the Banks   
        ["panelCoords"] = vector3(-353.99, -55.47, 48.8666),
       -- ["tablecoords"] = {[1] = vector3(-352.23, -58.215, 48.848)},
        ["object"] = GetHashKey("v_ilev_gb_vauldr"),
        ["isOpened"] = false,
        ["camId"] = 24,
        ["heading"] = {
            closed = 250.0,
            open = 160.0,
        },
        ["grab"] = { -- middle main grab point
            pos = vector3(-352.23, -58.215, 48.848),
            heading = 160.0,
            loot = false
        },
        ["drills"] = { -- drill points
            {coords = vector3(-353.91, -57.89, 49.04), rotation = vector3(0.0, 0.0, 75.0), loot = false},
            {coords = vector3(-352.81, -60.155, 49.3147), rotation = vector3(0.0, 0.0, 160.0), loot = false},
        },
        ["trollys"] = { -- trollys points
            {coords = vector3(-349.86, -55.756, 48.0148), heading = 70.0, loot = false},
            {coords = vector3(-351.4306, -54.2340, 48.0148), heading = 162.0, loot = false},
        },
    },
}

Config.PaletoBank = {
    ["coords"] = vector4(-105.28, 6480.04, 31.15, 229.64),  -- Coordinates of the Laptop Hack
    -- ["doorLocation"] = vector4(-101.99, 6463.28, 31.63, 221.02), -- coordinates of the card hack
    ["isOpened"] = false,
    ["object"] = -2050208642,
    ["SecurityCardReader"] = true,
    ["heading"] = {
        closed = 225,
        open = 147,
    },
    ["camId"] = 26,
    ["grab"] = { -- middle main grab point
        pos = vector3(-104.7398, 6477.3164, 31.4869),
        heading = 308.2753,
        loot = false
    },
    ["drills"] = { -- drill points
        {coords = vector3(-100.60, 6460.8, 31.9267), rotation = vector3(0.0, 0.0, 141.71), loot = false},
        {coords = vector3(-100.09, 6459.7, 31.9267), rotation = vector3(0.0, 0.0, 141.71), loot = false},
        {coords = vector3(-96.5, 6463.11, 31.9267), rotation = vector3(0.0, 0.0, 322.23), loot = false},
    },
    ["trollys"] = { -- trollys points
        {coords = vector3(-95.95, 6460.78, 30.65), heading = 38.39, loot = false}, 
        {coords = vector3(-97.1, 6459.80, 30.65), heading = 42.68, loot = false},
        {coords = vector3(-98.92, 6461.79, 30.65), heading = 132.99, loot = false}
    },
    ["thermite"] = { -- trollys points
        {coords = vector4(-109.38, 6483.51, 31.47, 226.54), anim = vector3(-109.45, 6483.3, 31.47), effect = vector3(-109.5, 6484.3, 31.47), isOpen = false, doorId = 'PaletoOutDoor1'},
        {coords = vector4(-118.1, 6470.33, 31.1, 140.49), anim = vector3(-118.1, 6470.35, 31.63), effect = vector3(-118.05, 6471.35, 31.63), isOpen = false, doorId = 'PaletoFD'},
        {coords = vector4(-97.25, 6475.18, 31.44, 136.06), anim = vector3(-97.25, 6475.02, 31.44), effect = vector3(-97.25, 6476, 31.44), isOpen = false, doorId = 'PaletoOutDoor2'},
    },
    ["varhacks"] = {
        {coords = vector4(-91.75, 6464.89, 31, 230.37), completed = false},
        {coords = vector4(-92.75, 6463.7, 31, 230.37), completed = false},
    },
}


Config.PacificBank = {
    ["coords"] = vector4(242.06, 218.95, 97.12, 161.17),  -- Coordinates of the red laptop hack
    ["vaultcoords"] = vector4(237.16, 231.33, 97.12, 69.5), --cords of the vault
    ["harddrivehack"] = vector4(247.19, 233.34, 97.12, 342.18), --coords of the harddrive hack
    ["lowervaultgates"] = vector4(228.05, 228.69, 97.12, 160.89), --cords of the pannel for the vault gates
    ["isOpened"] = false,
    ["isVaultOpened"] = false,
    ["object"] = 961976194,
    ["camId"] = 25,
    ["heading"] = {
        closed = 70.00001,
        open = 5.00001
    },
    ["grab"] = { -- middle main grab point
        pos = vector3(242.91, 210.64, 96.98),
        heading = 17.41,
        loot = false

    },
    ["drills"] = { -- drill points
        {coords = vector3(244.37, 212.25, 97.12), rotation = vector3(0.0, 0.0, 252.69), loot = false, vaultdrill = false},
        {coords = vector3(241.56, 210.08, 97.12), rotation = vector3(0.0, 0.0, 163.96), loot = false, vaultdrill = false},
        {coords = vector3(240.22, 212.98, 97.12), rotation = vector3(0.0, 0.0, 77.49), loot = false, vaultdrill = false},
        {coords = vector3(253.1, 236.46, 97.12), rotation = vector3(0.0, 0.0, 248.6), loot = false, vaultdrill = false},
        {coords = vector3(248.81, 236.58, 97.12), rotation = vector3(0.0, 0.0, 75.59), loot = false, vaultdrill = false},
        {coords = vector3(225.79, 230.13, 97.12), rotation = vector3(0.0, 0.0, 73.17), loot = false, vaultdrill = true},
        {coords = vector3(226.37, 231.65, 97.12), rotation = vector3(0.0, 0.0, 70.04), loot = false, vaultdrill = true},
        
    },
    ["officedrill"] = {
        {coords = vector3(278.88, 217.42, 110.27), rotation = vector3(0.0, 0.0, 340), loot = false},
    },
    ["officehack"] = {
        {coords = vector3(278.67, 213.05, 110.05), rotation = vector3(0.0, 0.0, 100), loot = false},
    },
    ["trollys"] = { -- trollys points
        {coords = vector3(244.84, 214.13, 96.12), heading = 64.71, loot = false}, 
        {coords = vector3(241.18, 215.6, 96.12), heading = 253.16, loot = false},
        {coords = vector3(249.59, 238.71, 96.12), heading = 251.85, loot = false},
        {coords = vector3(253.85, 238.32, 96.12), heading = 70.38, loot = false},
        {coords = vector3(252.5, 240.54, 96.12), heading = 157.24, loot = false},
        {coords = vector3(227.57, 234.95, 96.12), heading = 252.52, loot = false}, 
        {coords = vector3(232.2, 233.24, 96.12), heading = 65.77, loot = false},
        {coords = vector3(225.79, 225.87, 96.12), heading = 342.46, loot = false},
        {coords = vector3(224.58, 226.35, 96.12), heading = 342.24, loot = false},
        {coords = vector3(227.66, 225.08, 96.12), heading = 340.48, loot = false},
        {coords = vector3(228.85, 224.76, 96.12), heading = 337.09, loot = false},
        {coords = vector3(226.95, 233.32, 96.12), heading = 254.54, loot = false},
        {coords = vector3(226.77, 227.1, 96.12), heading = 71.47, loot = false},
        {coords = vector3(227.86, 226.64, 96.12), heading = 248.8, loot = false},
        
    },
    ["thermite"] = { -- Thermite points
        {coords = vector4(258.07, 274.6, 104.63, 160.37), anim = vector3(258.07, 274.7, 105.66), effect = vector3(258.07, 275.7, 105.66), isOpen = false,
        memorygame = {correctBlocks = 12, incorrectBlocks = 2, timeToShow = 3, timeToLose = 5}, completed = false}, 
        {coords = vector4(285.45, 264.5, 104.63, 160.38), anim = vector3(285.45, 264.7, 105.66), effect = vector3(285.45, 265.73, 105.66), isOpen = false,
        memorygame = {correctBlocks = 12, incorrectBlocks = 2, timeToShow = 3, timeToLose = 5}, completed = false},
        {coords = vector4(293.85, 267.2, 104.63, 340), anim = vector3(293.85, 267.15, 105.66), effect = vector3(293.85, 268.15, 105.66), isOpen = false,
        memorygame = {correctBlocks = 12, incorrectBlocks = 2, timeToShow = 3, timeToLose = 5}, completed = false},
        --memory game field controls the difficulty of each door in the bank
    },
    ["hacktype"] = { --locations of the upper floor office hacks and the type of hack they show
        {coords = vector4(270.37, 231.65, 110.09, 170), completed = false, hack = 'var'},
        {coords = vector4(261.7, 234.82, 110.09, 170), completed = false, hack = 'var'},
        {coords = vector4(251.85, 208.63, 110.09, 350), completed = false, hack = 'counting'},
        {coords = vector4(260.52, 205.45, 110.09, 350), completed = false, hack = 'counting'},
    },
    ["firstfloorhacks"] = { --locations of the upper floor office hacks and the type of hack they show
        {coords = vector4(270.37, 231.65, 106.23, 170), completed = false, hack = 'var'},
        {coords = vector4(261.7, 234.82, 106.23, 170), completed = false, hack = 'untangle'},
        {coords = vector4(251.85, 208.63, 106.23, 350), completed = false, hack = 'lightsout'},
        {coords = vector4(260.52, 205.45, 106.23, 350), completed = false, hack = 'counting'},
    },

}

Config.lowerVault = {
    ["coords"] = vector4(256.67, 240.63, 101.7, 344.11),
    ["isOpened"] = false,
    ["object"] = -1520917551,
    ["heading"] = {
        closed = 160.00001,
        open = 280.00001
    },
    ["grabGold"] = {
        {coords = vector3(250.1604, 247.5476, 101.5785), heading = 68.8828, loot = false, type = 'gold'},
        {coords = vector3(252.1132, 252.9595, 101.5785), heading = 73.3432, loot = false, type = 'gold'},
        {coords = vector3(254.1243, 258.4601, 101.578), heading = 68.2021, loot = false, type = 'gold'},
        {coords = vector3(265.3879, 258.2246, 101.5332), heading = 160.0, loot = false, type = 'gold'},
        {coords = vector3(261.0530, 259.6717, 101.5332), heading = 160.0, loot = false, type = 'gold'},
    },
    ["grabCash"] = {
        {coords = vector3(268.0621, 247.4709, 101.578), heading = 251.1204, loot = false, type = 'cash'},
        {coords = vector3(265.7912, 241.2334, 101.578), heading = 248.1179, loot = false, type = 'cash'},
        {coords = vector3(262.4372, 263.2787, 101.5333), heading = 340.1399, loot = false, type = 'cash'},
        {coords = vector3(266.7359, 261.7205, 101.5333), heading = 340.1399, loot = false, type = 'cash'},
    },
    ["trays"] = {
        {coords = vector4(265.9693, 251.3843, 100.6342, 180.8530), loot = false}, 
        {coords = vector4(267.8199, 250.7046, 100.6341, 158.7229), loot = false},
        {coords = vector4(269.3021, 255.3727, 100.6337, 342.4431), loot = false},
        {coords = vector4(266.3803, 256.4872, 100.6350, 342.6058), loot = false},
    },
    ["doors"] = {
        {coords = vector4(255.3327, 245.3432, 101.6912, 72.9778), animation = vector4(255.2947, 244.9085, 101.6912, 73.8324), open = false},
        {coords = vector4(257.3676, 251.0141, 101.6912, 76.0976), animation = vector4(257.1855, 250.4203, 101.6927, 67.1193), open = false},
        {coords = vector4(259.3481, 256.4061, 101.6912, 70.7064), animation = vector4(259.2074, 255.9462, 101.7999, 72.6879), open = false},
        {coords = vector4(264.6576, 254.4495, 101.6912, 249.2227), animation = vector4(264.4032, 253.9894, 101.6912, 253.8486), open = false},
        {coords = vector4(262.6246, 249.0240, 101.6911, 255.3003), animation = vector4(262.3975, 248.5452, 101.6912, 253.5369), open = false},
        {coords = vector4(260.6041, 243.4887, 101.6912, 256.8587), animation = vector4(260.3777, 242.9825, 101.6912, 250.4351), open = false},
    },
    ["elecbox"] = {
        {coords = vector4(252.38, 215.65, 100.68, 160), anim = vector4(252.8393, 216.7958, 100.6833, 151.5041), loot = false}, 
        {coords = vector4(249.08, 216.77, 100.68, 160), anim = vector4(249.5149, 217.9007, 100.6833, 164.9327), loot = false},
    },
    ["tables"] = {
        {tableObj = vector4(262.4427, 263.2368, 100.6838, 340.1399)},
        {tableObj = vector4(266.7326, 261.7053, 100.6838, 340.1399)},
        {tableObj = vector4(265.4210, 258.2497, 100.6837, 160.0)},
        {tableObj = vector4(261.1586, 259.7454, 100.6837, 160.0)},
    },
    ["display"] = {
        ["coords"] = vector4(264.6180, 262.4878, 100.633, 340.1399), 
        ["displayItem"] = vector4(264.6180, 262.4878, 101.6721, 340.1399),
        ["loot"] = false,
        [1] = {
            object = 'h4_prop_h4_diamond_01a',
            display = 'h4_prop_h4_diamond_disp_01a'  -- need to finish
        },
    },
    ["computer"] = vector4(251.99, 235.77, 102.49, 256.54), -- Coords for the PC used to Hack Hard drives
    ["LWCode1"] = "", -- DO NOT TOUCH THIS
    ["LWCode2"] = "", -- DO NOT TOUCH THIS
}


---- ** POWER PLANT LOCATIONS AND AMOUNT ** ----

-- This can be customized to however you'd like!

Config.PowerPlantLocations = 6 -- Change this if you change the powerplant locations amount

Config.PowerPlant = {
    ["locations"] = {
        {coords = vector4(2831.17, 1489.19, 24.73, 165.19), open = false},
        {coords = vector4(2825.2422, 1490.5781, 24.7287, 164.2826), open = false},
        {coords = vector4(2817.6945, 1499.2111, 24.7288, 344.5275), open = false},
        {coords = vector4(2811.8256, 1500.7874, 24.7288, 346.8244), open = false},
        {coords = vector4(2829.3327, 1507.0774, 24.7287, 167.7297), open = false},
        {coords = vector4(2835.2323, 1505.6520, 24.7287, 165.2132), open = false},
        -- {coords = vector4(253.21, 284.47, 105.53, 256.25), open = false},
    },
}

--function to lock the doors
function Config.DoorlockAction(type, setLocked)
    if type == 'paleto' then
        TriggerServerEvent('qb-doorlock:server:updateState','PaletoFD', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PaletoOutDoor1', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PaletoOutDoor2', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PaletoAdmin', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PaletoVault', setLocked, false, false, true, false, false)

        Config.PaletoBank['varhacks'][1].completed = false
        Config.PaletoBank['varhacks'][2].completed = false
    elseif type == 'pacific' then
        TriggerServerEvent('qb-doorlock:server:updateState','PacificGate1', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PacificGate2', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PacificGate3', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PacificGate4', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PacificMainEntrance', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PacifcTopEntrance', setLocked, false, false, true, false, false)
        TriggerServerEvent('qb-doorlock:server:updateState','PacificAdminOffice', setLocked, false, false, true, false, false)

        Config.PacificBank['hacktype'][1].completed = false
        Config.PacificBank['hacktype'][2].completed = false
        Config.PacificBank['hacktype'][3].completed = false
        Config.PacificBank['hacktype'][4].completed = false

        Config.PacificBank['thermite'][1].completed = false
        Config.PacificBank['thermite'][2].completed = false
        Config.PacificBank['thermite'][3].completed = false

        Config.PacificBank['firstfloorhacks'][1].completed = false
        Config.PacificBank['firstfloorhacks'][2].completed = false
        Config.PacificBank['firstfloorhacks'][3].completed = false
        Config.PacificBank['firstfloorhacks'][4].completed = false
        
    end
end

-- --Config.BankDoors = {
--     fleeca = {},
--     paleto = {
--         'PaletoFD',
--         'PaletoOutDoor1',
--         'PaletoOutDoor2',
--         'PaletoAdmin',
--         'PaletoVault',
--     },
--     pacific = {
--         6,
--         1,
--         2,
--         3
--     },
-- }