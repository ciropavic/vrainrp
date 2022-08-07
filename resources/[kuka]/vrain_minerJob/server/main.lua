ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("buyPickAxe:minerJob")
AddEventHandler("buyPickAxe:minerJob", function(shopCostMenu)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= shopCostMenu then
        xPlayer.removeMoney(shopCostMenu)
        xPlayer.addInventoryItem("pickaxe", 1)
    else
        TriggerClientEvent('vrain_notify:showNotification', source, 'Nincsen elegendő pénzed!', 'error', 3000)
    end
end)


RegisterNetEvent("buyBread:minerJob")
AddEventHandler("buyBread:minerJob", function(shopCostMenu)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(shopCostMenu)
    xPlayer.addInventoryItem("bread", 1)
end)


RegisterNetEvent("buyWater:minerJob")
AddEventHandler("buyWater:minerJob", function(shopCostMenu)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeMoney(shopCostMenu)
    xPlayer.addInventoryItem("water", 1)
end)


RegisterServerEvent("refreshItems:minerJob") 
AddEventHandler("refreshItems:minerJob", function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
		
	    local goldCount = xPlayer.getInventoryItem('gold').count
	    local ironCount = xPlayer.getInventoryItem('iron').count
	    local pickaxeCount = xPlayer.getInventoryItem('pickaxe').count
    

        TriggerClientEvent("refreshGold:minerJob", source, goldCount)
        TriggerClientEvent("refreshIron:minerJob", source, ironCount)
        TriggerClientEvent("refreshPickaxe:minerJob", source, pickaxeCount)
    end
end)


RegisterNetEvent("sellResource:minerJob")
AddEventHandler("sellResource:minerJob", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    local goldCount = xPlayer.getInventoryItem('gold').count
    local ironCount = xPlayer.getInventoryItem('iron').count

    local randomGoldCash = 40
    local randomIronCash = 10


    local goldReward = goldCount * randomGoldCash
    local ironReward = ironCount * randomIronCash
    local completReward = goldReward + ironReward

    if goldCount > 0 then
        xPlayer.removeInventoryItem("gold", goldCount)
        xPlayer.addMoney(goldReward)

    end
    if ironCount > 0 then
        xPlayer.removeInventoryItem("iron", ironCount)
        xPlayer.addMoney(ironReward)
    end

    if completReward == 0 then

    else
        TriggerClientEvent("showReward:minerJob", source, completReward)
    end
    

end)


RegisterNetEvent("addItems:minerJob")
AddEventHandler("addItems:minerJob", function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local randomItem = math.random(1,100)

    local randomeIronCounter = math.random(1,3)

    if randomItem < 65 then
        xPlayer.addInventoryItem("iron", randomeIronCounter)
    else
        xPlayer.addInventoryItem("gold", 1)
    end

end)


RegisterNetEvent("removePickaxe:minerJob")
AddEventHandler("removePickaxe:minerJob", function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local randomDestroy = math.random(1,100)
   
    print(randomDestroy)
    if randomDestroy < 80 then
        
    else
        TriggerClientEvent("pickaxeBroken:minerJob", source)
        xPlayer.removeInventoryItem("pickaxe", 1)
    end

end)