
local pendingVehiclePurchases = {};

ESX.RegisterServerCallback('sCarshop:buyVehicle', function(source, callback, carshopIndex, vehicleModel, vehicleColor)
    
    local xPlayer = ESX.GetPlayerFromId(source);
    if (
        xPlayer and 
        
        carshopIndex and 
        type(carshopIndex) == 'number' and 
        ServerConfig.Carshops[carshopIndex] and 
        
        vehicleModel and 
        type(vehicleModel) == 'string'
    ) then 
        getCarshopVehicles(carshopIndex, function(carshopVehicles)
            if (carshopVehicles) then 
                local vehicles = json.decode(carshopVehicles.vehicles);
                
                for i,v in ipairs(vehicles) do 
                    if (v.model == vehicleModel) then 
                        if (v.count <= 0) then
                            callback(false, 'Ebből a járműből kifogyott a kereskedés.');
                            return; 
                        end 
                            
                        if (xPlayer.getMoney() < v.price) then 
                            callback(false, 'Nincs elég pénzed a jármű megvásárlásához.');
                            return;
                        end 

                        v.count = v.count - 1;
                        callback({ model = vehicleModel, color = vehicleColor });
                        xPlayer.removeMoney(v.price);

                        pendingVehiclePurchases[source] = true;
                        
                        MySQL.Async.execute(
                            'UPDATE carshop__shops SET vehicles = @vehicles WHERE id = @id LIMIT 1',
                            { vehicles = json.encode(vehicles), id = carshopIndex }, 
                            function()
                                
                            end
                        );

                        return;
                    end 
                end 

                callback(false, 'A járműkereskedésben nincsen ilyen jármű!');
            end 
            
            callback(false);
        end);
    else 
        callback(false);
    end 
end);

ESX.RegisterServerCallback('scarshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end);
end);


RegisterServerEvent('scarshop:setVehicleOwned')
AddEventHandler('scarshop:setVehicleOwned', function(vehicleProps)
    print('asd1', source, pendingVehiclePurchases[source])
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