Config = Config or { }

-- Set to true to show debug messages in the console
Config.debugMode = false

Config.Framework = {
    FrameworkName  = 'QBCore', -- Choose your framework: ESX or QBCore
    QBCoreFileName = 'qb-core', -- The name of the QBCore resource
    OldESX         = false, -- Set to true if you're using an older version of ESX which still uses the ESX event esx:getSharedObject
    ESXEvent       = 'esx:getSharedObject', -- The name of the ESX event
    ESXFileName    = 'es_extended', -- The name of the ESX resource
    SQLWrapper     = 'oxmysql' --  oxmysql (HIGHLY RECOMMANDED) / mysql-async (deprecated) / ghmattimysql (deprecated)
}

-- You need to verify that the following scripts are exactly named like this or change the names here
Config.exportsScripts = {
    -- FOR QBCore ONLY
    qbManagement = 'qb-management',
    qbTarget     = 'qb-target',

    -- For both ESX and QBCore
    oxTarget     = 'ox_target',

    -- Dependencies
    s1nLib       = "s1n_lib"
}

-- Set to false if you don't want to use ox-target
Config.UseOxTarget = true

-- Set to true if you want to use qb-target
Config.UseQBTarget = false

-- Set to true to enable the bank card item feature
Config.CreditCardCheck = false

-- <!> THIS FEATURE IS STILL IN DEVELOPMENT, NOT FONCTIONNAL YET <!>
-- CreditCardCheck needs to be set to true to use this feature
Config.CreditCardGive = {
    -- Set to true to give the player a bank card when they create a bank account if they don't have one
    OnCreate = false
}

-- If CreditCardCheck is set to true, this is the name of the item that will be used to check if the player has a bank card
Config.CreditCardItem = 'creditcard'

-- List of the ATM models that will be used to open the bank menu
Config.AtmModels = { 'prop_atm_02', 'prop_atm_03', 'prop_fleeca_atm', 'prop_atm_01' }

-- List of the bank locations that will be used to open the bank menu
Config.BankLocations = {
    -- First bank
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(-1212.685669, -330.764832, 37.772217),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color  = 2,
            -- The scale of the blip
            Scale  = 0.7,
            -- The name of the blip
            Label  = 'Bank'
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = false,
            Distance     = 5.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = 'a_m_m_indian_01',
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },
    -- Second bank (EXAMPLE)
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(-350.7, -49.98, 49.04),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color  = 2,
            -- The scale of the blip
            Scale  = 0.7,
            -- The name of the blip
            Label  = 'Bank'
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = false,
            Distance     = 5.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = 'a_m_m_indian_01',
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },

    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(238.64, 212.57, 106.28),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color  = 2,
            -- The scale of the blip
            Scale  = 0.7,
            -- The name of the blip
            Label  = 'Bank'
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = false,
            Distance     = 5.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = 'a_m_m_indian_01',
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    }
}

-- Credit feature
Config.Credit = {
    -- Set to false to disable the credit feature
    Active          = false,
    -- Default amounts that can be directly selected in the menu
    Amounts         = { 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000, 150000, 200000, 500000 },
    -- Percentage of the loan that will be required as a security deposit
    SecurityDeposit = 25,
    -- Different credit durations that can be selected in the menu
    Duration        = {
        { Label = '1 week', Time = 60 * 60 * 24 * 7 },
        { Label = '2 weeks', Time = 60 * 60 * 24 * 14 },
        { Label = '1 month', Time = 60 * 60 * 24 * 30 },
        { Label = '3 months', Time = 60 * 60 * 24 * 90 }
    },
}

-- Configuration to access a society account
Config.SocietyRanks = {
    -- Job name (Needs to be the EXACT (including uppercase, lowercase) name of the job)
    ['weedshop'] = {
        -- Job grades (Needs to be the EXACT (including uppercase, lowercase) name of the job grade)
        ['3']       = { Create = true, Login = true },
        ['2'] = { Create = false, Login = true },
        ['1']   = { Create = false, Login = true }
    }
}