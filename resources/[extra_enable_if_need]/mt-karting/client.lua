local QBCore = exports['qb-core']:GetCoreObject()
local Time = 0
local TicketAtivo = false
local Veiculo = nil
local KartingPoly = PolyZone:Create({
    vector2(-169.23545837402, -2126.0227050781),
    vector2(-103.59944915771, -2103.1733398438),
    vector2(-101.42811584473, -2102.9812011719),
    vector2(-102.84362030029, -2099.4099121094),
    vector2(-118.13861083984, -2055.4501953125),
    vector2(-120.92548370361, -2048.2705078125),
    vector2(-122.6300201416, -2040.9029541016),
    vector2(-122.81782531738, -2031.3441162109),
    vector2(-116.01826477051, -1980.0040283203),
    vector2(-114.74008178711, -1979.4429931641),
    vector2(-61.650188446045, -1986.5238037109),
    vector2(-53.568267822266, -1989.6710205078),
    vector2(-49.210807800293, -1994.4814453125),
    vector2(-39.566497802734, -2020.3823242188),
    vector2(-74.735076904297, -2033.3594970703),
    vector2(-104.93293762207, -2029.0303955078),
    vector2(-105.09645843506, -2039.6833496094),
    vector2(-101.85122680664, -2048.6860351562),
    vector2(-101.7225112915, -2049.4038085938),
    vector2(-85.72745513916, -2093.2482910156),
    vector2(-84.908203125, -2097.1889648438),
    vector2(-44.1120262146, -2082.5266113281),
    vector2(-28.414522171021, -2077.0905761719),
    vector2(-19.66005897522, -2081.6242675781),
    vector2(-17.005525588989, -2089.7761230469),
    vector2(-16.292013168335, -2095.9597167969),
    vector2(-18.063987731934, -2105.0646972656),
    vector2(-24.122716903687, -2113.2478027344),
    vector2(-29.74503326416, -2117.0571289062),
    vector2(-69.816352844238, -2131.3469238281),
    vector2(-77.692192077637, -2129.7614746094),
    vector2(-88.093696594238, -2133.6105957031),
    vector2(-92.520805358887, -2139.3259277344),
    vector2(-143.04769897461, -2157.0837402344),
    vector2(-150.01580810547, -2155.7995605469),
    vector2(-159.11499023438, -2158.771484375)
}, {
    name="kartzone"
})

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ClearAreaOfVehicles(-85.162, -2067.108, 21.797, 1000, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(-85.162 - 90.0, -2067.108 - 90.0, 21 - 90.0, -85.162 + 90.0, 2067.108 + 90.0, 21 + 90.0)
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("hc_driver")
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(1)
    end
    KartingPed = CreatePed(2, hash, Config.Locations['Ped'], false, false)
    SetPedFleeAttributes(KartingPed, 0, 0)
    SetPedDiesWhenInjured(KartingPed, false)
    TaskStartScenarioInPlace(KartingPed, "missheistdockssetup1clipboard@base", 0, true)
    SetPedKeepTask(KartingPed, true)
    SetBlockingOfNonTemporaryEvents(KartingPed, true)
    SetEntityInvincible(KartingPed, true)
    FreezeEntityPosition(KartingPed, true)

    exports['qb-target']:AddBoxZone("KartingPed", Config.Locations['PedTarget'], 1, 1, {
        name="KartingPed",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
                event = "mt-karting:client:MenuAluger",
                icon = "fas fa-car",
                label = "Talk to this guy",
            }
        },
        distance = 2.5
    })

    local blip = AddBlipForCoord(Config.Locations['PedTarget'])

    SetBlipSprite(blip, 38)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 37)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Karting')
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent('mt-karting:client:MenuAluger', function()
    if TicketAtivo == true then
        exports['qb-menu']:openMenu({
            {
                header = Config.Lang.MenuHeader,
                isMenuHeader = true,
            },
            {
                header = Config.Lang.CloseMenu,
                event = "qb-menu:closeMenu",
                icon = "fas fa-times-circle",
            },
            {
                header = Config.Lang.StopTicket,
                txt = "",
                icon = "fas fa-ticket",
                event = "mt-karting:client:Ticket",
                params = {
                    event = "mt-karting:client:Ticket",
                    args = 5
                },
            },
        })
    else
        exports['qb-menu']:openMenu({
            {
                header = Config.Lang.MenuHeader,
                isMenuHeader = true,
            },
            {
                header = Config.Lang.CloseMenu,
                event = "qb-menu:closeMenu",
                icon = "fas fa-times-circle",
            },
            {
                header = Config.Lang.Ticket1,
                txt = Config.Lang.Duration .. Config.Tickets[1].time .. Config.Lang.Minutes .. "<br>" .. Config.Lang.Price .. Config.Tickets[1].price .. "$",
                icon = "fas fa-ticket",
                event = "mt-karting:client:Ticket1",
                params = {
                    event = "mt-karting:client:Ticket",
                    args = 1
                },
            },
            {
                header = Config.Lang.Ticket2,
                txt = Config.Lang.Duration .. Config.Tickets[2].time .. Config.Lang.Minutes .. "<br>" .. Config.Lang.Price .. Config.Tickets[2].price .. "$",
                icon = "fas fa-ticket",
                event = "mt-karting:client:Ticket",
                params = {
                    event = "mt-karting:client:Ticket",
                    args = 2
                },
            },
            {
                header = Config.Lang.Ticket3,
                txt = Config.Lang.Duration .. Config.Tickets[3].time .. Config.Lang.Minutes .. "<br>" .. Config.Lang.Price .. Config.Tickets[3].price .. "$",
                icon = "fas fa-ticket",
                params = {
                    event = "mt-karting:client:Ticket",
                    args = 3
                },
            },
            {
                header = Config.Lang.Ticket4,
                txt = Config.Lang.Duration .. Config.Tickets[4].time .. Config.Lang.Minutes .. "<br>" .. Config.Lang.Price .. Config.Tickets[4].price .. "$",
                icon = "fas fa-ticket",
                event = "mt-karting:client:Ticket",
                params = {
                    event = "mt-karting:client:Ticket",
                    args = 4
                },
            },
        })
    end
end)

local function drawTxt(text, font, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

local function StopRace(notify)
    DeleteEntity(Veiculo)
    TicketAtivo = false
    if not notify then return end
    QBCore.Functions.Notify(Config.Lang[(notify == 1 and "Finished" or "TicketCancelled")], 'primary', 7500)
end

local function startTimer()
    local gameTimer = GetGameTimer()
    Citizen.CreateThread(function()
        while TicketAtivo do
            Citizen.Wait(1)
            if GetGameTimer() < gameTimer + 1000 * Time then
                local secondsLeft = GetGameTimer() - gameTimer
                drawTxt(Config.Lang.TimeRemaning .. math.ceil(Time - secondsLeft / 1000) .. Config.Lang.Seconds, 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)
            else
                StopRace(1)
                break
            end
        end
    end)
end

local function SpawnKart()
    TicketAtivo = true
    local veiculo = Config.Vehicle
    local coords = Config.Locations['KartSpawn']

    QBCore.Functions.SpawnVehicle(veiculo, function(veh)
        Veiculo = veh
        SetVehicleNumberPlateText(veh, "KART"..tostring(math.random(1000, 9999)))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
        startTimer()
    end, coords, true)
end

RegisterNetEvent('mt-karting:client:Ticket', function(arg)
    if arg >= 1 and arg <= 4 and not TicketAtivo then
        QBCore.Functions.TriggerCallback("mt-karting:server:BuyTicket", function(has)
            if not has then QBCore.Functions.Notify(Config['Lang']['NoMoney'], "error"); return end
            Time = Config['Tickets'][arg].time * 60
            SpawnKart()
        end, arg)
    elseif arg == 5 and TicketAtivo then
        StopRace(2)
    else
        QBCore.Functions.Notify(Config.Lang.ActiveTicket, 'error', 7500)
    end
end)

Citizen.CreateThread(function()
    KartingPoly:onPlayerInOut(function(isPointOutside)
        if not isPointOutside and TicketAtivo then
            StopRace()
            QBCore.Functions.Notify(Config.Lang.DeletedVehicle, 'primary', 7500)
        end
    end)
end)