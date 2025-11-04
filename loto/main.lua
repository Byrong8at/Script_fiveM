local playerPed = PlayerPedId() 

RegisterNetEvent('loto:useCreator')

AddEventHandler('loto:useCreator', function()
    --launch message to js
    SetNuiFocus(true, true)

    SendNUIMessage({
            action = "launch_loto"
        })
    print("test object")
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hide_loto" })
    for _, valeur in ipairs(data.valeurs) do
            print(valeur)
        end
    cb('ok')
end)