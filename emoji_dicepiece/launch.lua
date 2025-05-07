-- variable globale

local INTERACTION_DISTANCE = 10.0 -- distance d'interaction entre le joueur et les gens proches de lui
local displayTime = 3000 -- affiachage de l'emoji pendant si 1 seconde faire 1000
local playerPed = PlayerPedId() 

--chargement .ytd and emote
RequestAnimDict("mp_player_int_upperwank")
    while not HasAnimDictLoaded("mp_player_int_upperwank") do
        Citizen.Wait(10)
    end


--texte afficher
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local dist = #(playerCoords - vector3(x, y, z))

    local scale = math.max(0.2, 1.0 - (dist / 10))

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

--function pour afficher l'emoji
function Display_icon(value_random, playerPed,file_name,emoji_name)
    local playerCoords = GetEntityCoords(playerPed)

    for _, player in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(targetPed)
        local dist = #(playerCoords - targetCoords)

        if dist <= INTERACTION_DISTANCE then
            local onScreen, _x, _y = World3dToScreen2d(targetCoords.x, targetCoords.y, targetCoords.z + 1)
            if onScreen then
                DrawSprite(file_name, emoji_name..value_random , _x, _y, 0.05, 0.05, 0.0, 255, 255, 255, 255)
            end
        end
end
end

--function pour charger le fichier .ytd
function Load_file(file_name)
    RequestStreamedTextureDict(file_name, true)
    while not HasStreamedTextureDictLoaded(file_name) do
        Citizen.Wait(10)
    end
end

-- Commande /dice
RegisterCommand("dice", function()
    local dice_value = math.random(1, 6)
    local startTime = GetGameTimer()

    -- Lecture de l'animation
    TaskPlayAnim(playerPed, "mp_player_int_upperwank", "mp_player_int_wank_01", 8.0, -8.0, 1500, 0, 0, false, false, false)
    Load_file("emoji_de")
    Citizen.Wait(1500)

    while GetGameTimer() - startTime < displayTime do
        Citizen.Wait(0)
    Display_icon(dice_value, playerPed, "emoji_de","de")
    end

end, false)

-- Commande /piece
RegisterCommand("piece", function()
    local piece_value = math.random(1, 2)
    local startTime = GetGameTimer()

    -- Lecture de l'animation
    TaskPlayAnim(playerPed, "mp_player_int_upperwank", "mp_player_int_wank_01", 8.0, -8.0, 1500, 0, 0, false, false, false)
    Load_file("emoji_piece")
    Citizen.Wait(1500)

    while GetGameTimer() - startTime < displayTime do
        Citizen.Wait(0)
    Display_icon(piece_value, playerPed, "emoji_piece","piece")
    end

end, false)
