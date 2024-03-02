Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.TruckerJobTruckDeposit = 125
Config.TruckerJobFixedLocation = false
Config.TruckerJobMaxDrops = 10 -- amount of locations before being forced to return to station to reload
Config.TruckerJobDropPrice = 250
Config.TruckerJobBonus = 10 -- this is a percentage to calculate bonus over 5 deliveries.
Config.TruckerJobPaymentTax = 15

Config.TruckerJobLocations = {
    ["main"] = {
        label = "Truck Shed",
        coords = vector4(153.68, -3211.88, 5.91, 274.5),
    },
    ["vehicle"] = {
        label = "Truck Storage",
        coords = vector4(141.12, -3204.31, 5.85, 267.5),
    },
}

Config.TruckerJobVehicles = {
    ["pounder"] = {
        ["label"] = "Pounder Box Truck",
        ["jobrep"] = 0,
        ["cargodoors"] = {
            [0] = 2,
            [1] = 3
        },
        ["trunkpos"] = 7
    },
}