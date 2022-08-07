ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('vrain_jobduty:changeDutyStatus') 
AddEventHandler('vrain_jobduty:changeDutyStatus', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name then

        local jobName = xPlayer.job.name 

        if string.match(jobName, "off") then 
            jobName = jobName:gsub("%off", "") xPlayer.setJob(jobName, xPlayer.job.grade)

            TriggerClientEvent('vrain_notify:showNotification', source, _U('onduty'), 'info', 3000)
            return
        else
            xPlayer.setJob('off' .. jobName, xPlayer.job.grade)

            TriggerClientEvent('vrain_notify:showNotification', source, _U('offduty'), 'info', 3000)
        end
    else
        print("[Error] Nincsen munkád.")
    end
end)
