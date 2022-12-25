wlaczonyHud = false

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) and not wlaczonyHud then
            wlaczonyHud = true
            ZmienHud()
        end

        if not IsPedInAnyVehicle(ped, false) and wlaczonyHud then
            wlaczonyHud = false
            Wait(525)
            ZmienHud()
        end

        if wlaczonyHud then
            local x, y, z = table.unpack(GetEntityCoords(ped))
            local ul, ul2 = GetStreetNameAtCoord(x, y, z)
            local ulica = GetStreetNameFromHashKey(ul)
            local predkosc = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6)
            local predkosc2 = tonumber(string.format("%." .. 0 .. "f", predkosc))
            local obr = GetVehicleCurrentRpm(GetVehiclePedIsIn(GetPlayerPed(-1)))
            local finalneObroty = obr*100

            SendNUIMessage({
                typ = "zmien",
                predkosc = predkosc2,
                ulica = ulica,
                obroty = finalneObroty
            })
        end

        Citizen.Wait(50)
    end
end)

function ZmienHud()
    SendNUIMessage({
        typ = "carhud",
        status = wlaczonyHud
    })
end
