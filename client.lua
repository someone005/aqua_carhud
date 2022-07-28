ESX = nil
wlaczonyHud = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)

        local ped = GetPlayerPed(-1)

        if IsPedInAnyVehicle(ped, false) and not wlaczonyHud then
            wlaczonyHud = true
            ZmienHud()
        end

        if not IsPedInAnyVehicle(ped, false) and wlaczonyHud then
            wlaczonyHud = false
            ZmienHud()
        end

        if wlaczonyHud then
            local x, y, z = table.unpack(GetEntityCoords(ped))
            local ul, ul2 = GetStreetNameAtCoord(x, y, z)
            local ulica = GetStreetNameFromHashKey(ul)
            local szybki = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*2.2369)
            local predkosc = ESX.Math.Round(szybki)
            local obr = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1)))
            local finalneObroty = obr*100

            SendNUIMessage({
                typ = "zmien",
                predkosc = predkosc,
                ulica = ulica,
                obroty = finalneObroty
            })
        end
    end
end)

function ZmienHud()
    SendNUIMessage({
        typ = "carhud",
        status = wlaczonyHud
    })
end