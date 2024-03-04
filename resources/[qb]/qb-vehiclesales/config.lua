Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.Zones = {
    ["SandyOccasions"] = {
        BusinessName = "Vehicle Sales Contract - Larry's Vehicle Sales",
        SellVehicle = vector4(801.14, -820.49, 26.18, 266.49),
        BuyVehicle = vector4(801.14, -820.49, 26.18, 266.49),

        PolyZone = {
            vector2(794.2, -769.3),
            vector2(787.2, -833.21),
            vector2(845.39, -833.42),
            vector2(844.57, -768.23)
        },
        MinZ = 23.0,
        MaxZ = 30.0,

        VehicleSpots = {
            vector4(797.48, -815.14, 26.18, 267.98),
            vector4(797.65, -811.82, 26.18, 265.61),
            vector4(797.6, -808.96, 26.25, 273.3),
            vector4(797.2, -805.66, 26.27, 270.73),
            vector4(808.57, -805.41, 26.23, 83.71),
            vector4(808.49, -808.75, 26.22, 92.27),
            vector4(808.67, -811.87, 26.18, 94.72),
            vector4(808.7, -815.06, 26.19, 85.25),
        }
    }
}
