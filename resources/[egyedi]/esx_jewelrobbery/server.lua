ESX = nil 
local joblist = {}
local resettime = nil
local policeclosed = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_JewelRobbery:closestore')
AddEventHandler('esx_JewelRobbery:closestore', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ispolice = false
	for i, v in pairs(Config.PoliceJobs) do
		if xPlayer.job.name == v then
			ispolice = true
			break
		end
	end
    if ispolice and resettime ~= nil then
        TriggerClientEvent('esx_JewelRobbery:policeclosure', -1)
        policeclosed = true
    elseif ispolice and resettime == nil then
        TriggerClientEvent('vrain_notify:showNotification', _source, 'Az ékszerbolt biztonságban van.', 'error', 8000)          
    else
        TriggerClientEvent('vrain_notify:showNotification', _source, 'Nem tudod bezárni a boltot.', 'error', 8000)                
    end
end)

RegisterServerEvent('esx_JewelRobbery:playsound')
AddEventHandler('esx_JewelRobbery:playsound', function(x,y,z, soundtype)
    TriggerClientEvent('esx_JewelRobbery:playsound', -1, x, y, z, soundtype)
end)

RegisterServerEvent('esx_JewelRobbery:setcase')
AddEventHandler('esx_JewelRobbery:setcase', function(casenumber, switch)
    _source = source
    print('owo?', _source, casenumber, switch);
    if not Config.CaseLocations[casenumber].Broken then
        print('nembroken')
        Config.CaseLocations[casenumber].Broken  = true
        TriggerEvent('esx_JewelRobbery:RestTimer')
        TriggerClientEvent('esx_JewelRobbery:setcase', -1, casenumber, true)
        TriggerEvent('esx_JewelRobbery:AwardItems', _source)
    end
end)

RegisterServerEvent('esx_JewelRobbery:policenotify')
AddEventHandler('esx_JewelRobbery:policenotify', function()
    local data = {displayCode = '211', description = 'Ékszerbolt rablás', isImportant = 0, recipientList = {'police'}, length = '10000', infoM = 'fa-info-circle', info = 'Vangelico Ékszerbolt'}
    local dispatchData = {dispatchData = data, caller = 'Riasztó', coords = vector3(-633.9, -241.7, 38.1)}
    TriggerEvent('wf-alerts:svNotify', dispatchData)
    TriggerClientEvent('esx_JewelRobbery:policenotify', -1)
end)

RegisterServerEvent('esx_JewelRobbery:loadconfig')
AddEventHandler('esx_JewelRobbery:loadconfig', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local buildlist = {id = _source,job = xPlayer.job.name,}
    table.insert(joblist, buildlist)
    TriggerClientEvent('esx_JewelRobbery:loadconfig', _source, Config.CaseLocations)
    if policeclosed then
        TriggerClientEvent('esx_JewelRobbery:policeclosure', _source)
    end

end)

AddEventHandler('esx_JewelRobbery:RestTimer', function()
    if resettime == nil then
        totaltime = Config.ResetTime * 60
        resettime = os.time() + totaltime

        while os.time() < resettime do
            Citizen.Wait(2350)
        end

        for i, v in pairs(Config.CaseLocations) do
            v.Broken = false
        end
        TriggerClientEvent('esx_JewelRobbery:resetcases', -1, Config.CaseLocations)
        resettime = nil
        policeclosed = false
    end
end)

AddEventHandler('esx_JewelRobbery:AwardItems', function(serverid)
    local xPlayer = ESX.GetPlayerFromId(serverid)
    local randomitem = math.random(1,100)
    for i, v in pairs(Config.ItemDrops) do 
        if randomitem <= v.chance then
            randomamount = v.max
            sourceItem = xPlayer.getInventoryItem(v.name)
            if sourceItem.limit ~= nil then
                if sourceItem.limit ~= -1 and (sourceItem.count + randomamount) > sourceItem.limit then
                    if sourceItem.count < sourceItem.limit then
                        randomamount = sourceItem.limit - sourceItem.count
                        xPlayer.addInventoryItem(v.name, randomamount)
                    else
                        TriggerClientEvent('vrain_notify:showNotification', source, 'Nincsen elegendő helyed ehhez:' .. sourceItem.label, 'error', 9000)
                    end
                else
                    xPlayer.addInventoryItem(v.name, randomamount)
                end
                break
            else
                xPlayer.addInventoryItem(v.name, randomamount)
                break
            end
        end
    end
end)
