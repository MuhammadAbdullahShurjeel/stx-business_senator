local QBCore = exports["qb-core"]:GetCoreObject()

local allowed = Config.HEX

local disco = Config.Discord

function sendLogs (message,webhook)
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('toDiscord')
AddEventHandler('toDiscord', function(message, webhook)
    sendLogs(message , webhook)
end)

RegisterNetEvent("Give:Business:Job")
AddEventHandler("Give:Business:Job", function(source, job, grade)
    local identifier = GetPlayerIdentifiers(source)[1]
    if checkAllowed(identifier) then
        local Hanno = QBCore.Functions.GetPlayer(source)
        local Player = QBCore.Functions.GetPlayer(tonumber(source))
        if Player ~= nil then
            if job == 'burgershot' or job == 'catcafe' or job == 'pizza' or job == 'beanmachine' or job == 'vu' or job == 'henhouse' or job == 'uwu' or job == 'uwucafe' or job == 'pizzathis' or job == 'pizzeria' or job == 'maldini' or job == 'tow' or job == 'bennys' then
                local Joba = tostring(job)
                local Gradea = tonumber(grade)
                Player.Functions.SetJob(Joba, Gradea)
                local a = 	GetPlayerName(source)
                local b = 	GetPlayerName(tonumber(source))
                sendLogs('@everyone ```\n Player : ' ..a.. ' \n Gave This Job '..Joba..'\n Grade : ' ..Gradea..'\n To This Player : ' ..b.. ' ```', disco)
            else
                TriggerClientEvent('QBCore:Notify', source, 'Cannot Give These Jobs', 'error')
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "You are not whitelisted for this", 'error')
    end
end)

function checkAllowed(id)
    for k, v in pairs(allowed) do
        if id == v then
	    return true
        end
    end
    return false
end

AddEventHandler('onResourceStart', function()
    for k, v in pairs(allowed) do
        print('Loaded ' ..v.. ' in server')
    end
end)
