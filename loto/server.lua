ESX.RegisterUsableItem('ticket_creator', function(source)

    local xPlayer = ESX.GetPlayerFromId(source)
        
    TriggerClientEvent('loto:useCreator', source)
end)
