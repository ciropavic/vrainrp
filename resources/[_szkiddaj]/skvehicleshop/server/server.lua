ESX = nil;
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);

local pendingVehiclePurchases = {};

exports.vCore:addFetch('skVehicleshop:getShopVehicles', function(player, cb, id)
    local xPlayer = ESX.GetPlayerFromId(player);

    MySQL.Async.fetchAll('SELECT * FROM carshop__shops WHERE id = @id', {
		['@id'] = id,
    }, function(result)
		if (result[1] and result[1].vehicles) then 
            cb(result[1].vehicles);
        end
	end);
end);

exports.vCore:addFetch('skVehicleshop:buyVehicle', function(player, callback, shopId, model)
    local xPlayer = ESX.GetPlayerFromId(player);
	if (xPlayer and shopId and config.shops[shopId] and model) then
		MySQL.Async.fetchAll('SELECT * FROM carshop__shops WHERE id = @id', {
			['@id'] = shopId,
		}, function(result)
			if (result and result[1]) then 
				local shopData = result[1];
				local vehicles = json.decode(shopData.vehicles);
				for i,v in ipairs(vehicles) do 
					if (v.model == model) then 
						if (xPlayer.getMoney() < v.price) then 
							callback(false, { reason = 'Nincs elég pénzed a vásárláshoz!' });
							return;
						end
						
						if (v.count <= 0) then 
							callback(false, { reason = 'Ebből az autóból már nincs több a kereskedésben!' });
							return;
						end 
						
						TriggerEvent('esx_addonaccount:getSharedAccount', config.shops[shopId].account, function(account)
							if (account) then
								v.count = v.count - 1;
								
								MySQL.Async.execute('UPDATE carshop__shops SET vehicles = @data WHERE id = @id', { ['@id'] = shopId, ['@data'] = json.encode(vehicles) }, function()
									account.addMoney(v.price);
									xPlayer.removeMoney(v.price);
									pendingVehiclePurchases[player] = v.model;
									callback(true, { model = v.model });
								end);
							else 
								callback(false, { reason = 'Sikertelen jármü vásárlás! #1 (Kérlek jelezd egy fejlesztőnek!)' })
							end
						end);
					end
				end

				shopData = nil;
				vehicles = nil;
			end
		end);
	end
end);

exports.vCore:addFetch('skVehicleshop:validateDealerVehicleBuy', function(player, callback, shopId, data)
    local xPlayer = ESX.GetPlayerFromId(player);
	local isVehicleDealer, shop = isPlayerInAnyVehicleShop(xPlayer, shopId);

	if (xPlayer and isVehicleDealer and config.shops[shop] and config.shops[shop].account) then 
		TriggerEvent('esx_addonaccount:getSharedAccount', config.shops[shop].account, function(account)
			if (account and account.money) then
				local total = countVehiclesValue(data);
				if (total and account.money >= total) then 			
					MySQL.Async.fetchAll('SELECT * FROM carshop__shops WHERE job = @job LIMIT 1', {
						['@job'] = config.shops[shop].job,
					}, function(result)
						if (result and result[1]) then 
							local shopData = result[1];
							local vehicles = json.decode(shopData.vehicles);
							
							for _, v in ipairs(data) do 
								local hasValue, index = hasValueInTable(vehicles, v.model, 'model');
								if (not hasValue) then 
									table.insert(vehicles, {
										model = v.model,
										count = v.count,
										price = getCarPrice(v.model),
									});
								else
									vehicles[index].count = vehicles[index].count + v.count; 
								end
							end

							MySQL.Async.fetchAll('UPDATE carshop__shops SET vehicles = @data WHERE job = @job', {
								['@job'] = config.shops[shop].job,
								['@data'] = json.encode(vehicles),
							}, function(result)
								account.removeMoney(total);						
							end);

							shopData = nil;
							vehicles = nil;

							callback(true);
						end
					end);
				end
			end
		end);
	end
end);

exports.vCore:addFetch('skVehicleshop:changeVehiclePrice', function(player, callback, shopId, vehicleName, newPrice)
	if (
		not shopId or not tonumber(shopId) or
		not vehicleName or 
		not newPrice or not tonumber(newPrice)
	) then 
		callback(false, 'Érvénytelen érték.');
	end 

    local xPlayer = ESX.GetPlayerFromId(player);
	if (xPlayer) then 
		local isVehicleDealer, shop = isPlayerInAnyVehicleShop(xPlayer, shopId);
		if (isVehicleDealer) then 

			local vehiclePrice = getCarPrice(vehicleName);
			if (
				vehiclePrice and 
				math.floor(vehiclePrice * 0.6) <= newPrice and 
				math.floor(vehiclePrice * 1.5) >= newPrice
			) then 
				MySQL.Async.fetchAll('SELECT * FROM carshop__shops WHERE id = @id', {
					['@id'] = shopId,
				}, function(result)
					if (result and result[1]) then 
						local vehicles = json.decode(result[1].vehicles);

						for i,v in ipairs(vehicles) do 
							if (v.model == vehicleName) then 
								v.price = newPrice;
							end 
						end 

						if (result and result[1]) then 
							MySQL.Async.fetchAll('UPDATE carshop__shops SET vehicles = @data WHERE job = @job', {
								['@job'] = config.shops[shopId].job,
								['@data'] = json.encode(vehicles),
							}, function(result)
								callback(
									true, 
									'Sikeres ármódosítás.'
								);			
							end);
						end
					else 
						callback(
							false, 
							'Sikertelen ármódosítás.'
						);	
					end 
				end);
			else 
				callback(
					false, 
					'Az új árnak $' .. math.floor(vehiclePrice * 0.6) .. ' és $' .. math.floor(vehiclePrice * 1.5) .. ' között kell lennie.'
				);
			end 

		end 
	end 
end);

Citizen.CreateThread(function()
	for index, shop in ipairs(config.shops) do 
		local shopMarker = exports.vCore:createMarker(shop.coords, "dollar", 1.0, 255, 255, 255, 150, false, true);
		shopMarker.setSharedMeta("carshopId", index);

		local bossMarker = exports.vCore:createMarker(shop.boss, "QUESTION_MARK", 1.0, 255, 255, 255, 150, false, true);
		bossMarker.setSharedMeta("carshopId", index);
		bossMarker.setSharedMeta("carshopIsBoss", true);
	end 
end);

RegisterServerEvent('skVehicleshop:setVehicleOwned')
AddEventHandler('skVehicleshop:setVehicleOwned', function(vehicleProps)
	if (pendingVehiclePurchases[source]) then 
		pendingVehiclePurchases[source] = nil;

		local _source = source;
		local xPlayer = ESX.GetPlayerFromId(_source);

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)',
		{
			['@owner']   = xPlayer.identifier,
			['@plate']   = vehicleProps.plate,
			['@vehicle'] = json.encode(vehicleProps)
		}, function(rowsChanged)
			xPlayer.showNotification('Sikeresen megvásároltad ezt a jármüvet.');
		end);
	end 
end);

exports.vCore:addFetch('skVehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil);
	end);
end);

exports.vCore:addFetch('skVehicleshop:isJobBoss', function(source, cb, shopId)
	local xPlayer = ESX.GetPlayerFromId(source);
	if (xPlayer and shopId and config.shops[shopId]) then 
		local job = xPlayer.getJob();
		if (job.name == config.shops[shopId].job and job.grade_name == 'boss') then 
			cb(true);
			return;
		end 
	end 

	cb(false);
end);

function countVehiclesValue(data)
	local total = 0;
	for _, v in pairs(data) do 
		for _, car in ipairs(config.buyableCars) do 
			if (v.model == car.model) then 
				total = total + car.price * v.count;
			end
		end
	end

	return total;
end

function getCarPrice(model)
	for i,v in ipairs(config.buyableCars) do 
		if (v.model == model) then return v.price; end 
	end

	return 0;
end

function hasValueInTable(table, value, index)
	for i,v in ipairs(table) do 
		if (v[index] and value == v[index]) then 
			return true, i;
		end 
	end

	return false;
end

function isPlayerInAnyVehicleShop(xPlayer, shopId)
	for i,v in ipairs(config.shops) do 
		if (xPlayer.getJob().name == v.job and i == shopId) then 
			return true, i;
		end 
	end

	return false;
end

function getVehicleList()
	return config.buyableCars;
end 