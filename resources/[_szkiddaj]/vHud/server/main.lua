local ESX = nil;
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

local NotFactions = { unemployed = true, trucker = true, garbage = true };

local cachedCharacterNames = {};
local PlayersDatas = {};

ESX.RegisterServerCallback('vHud:getPlayerStatus', function(source, callback)
    callback(PlayersDatas[source] or false);
end);

function updatePlayersDatas()
    local jobsPlayers = countJobPlayers();

    local players = ESX.GetPlayers();
    for i = 1, #players do 
        local player = players[i];
        local xPlayer = ESX.GetPlayerFromId(player);

        if (xPlayer) then 
            local data = {};

            data.id = player;
            data.name = exports.vName:getPlayerCharacterName(player);
            data.money = xPlayer.getMoney();

            local job = xPlayer.getJob();
            if (job) then 
                data.job = {};

                data.job.name = job.label;
                data.job.grade = job.grade_label;
                
                if (not NotFactions[job.name]) then 
                    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. job.name, function(account)
                        local societyMoney = 0;
                        if (account) then 
                            societyMoney = account.money;
                        end
            
                        data.job.players = jobsPlayers[job.name] or 0;
                        data.job.isBoss = job.grade_name == 'boss';
                        data.job.money = societyMoney
                    end);
                end 
            end 

            PlayersDatas[player] = data;
        end 
    end 
end 

function deleteCache()
    for i = 0, 4096 do 
        if (PlayersDatas[i] and not GetPlayerName(i)) then 
            PlayersDatas[i] = nil;
        end 
    end 
end 

function countJobPlayers()
    local jobs = {};

    local players = ESX.GetPlayers();
    for i = 1, #players do 
        local player = players[i];
        local xPlayer = ESX.GetPlayerFromId(player);

        if (xPlayer) then 
            local job = xPlayer.getJob();

            if (job and not NotFactions[job.name]) then 
                if (not jobs[job.name]) then 
                    jobs[job.name] = 0;
                end 
    
                jobs[job.name] = jobs[job.name] + 1;
            end 
        end 
    end 

    return jobs;
end

-- Update player datas
Citizen.CreateThread(function()
    while (true) do 
        updatePlayersDatas();
        Wait(3000);
    end 
end);

-- Clear unused datas
Citizen.CreateThread(function()
    while (true) do 
        deleteCache();
        Wait(1000);
    end 
end);