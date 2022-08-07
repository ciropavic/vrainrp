local ESX;
local PlayerData;

local remainPackages = 0;
local playerJobVehicle;
local playerJobVehicleTrailer;

local lastDeliverPoint;

local blips = {};

local alreadyDeliveredPoints = {};

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end);
		Citizen.Wait(0);
	end

	if (ESX) then 
		PlayerData = ESX.GetPlayerData();
		initJob();
	end 
end);

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer;
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
	PlayerData = ESX.GetPlayerData();
	initJob();
end)

function openDutyPoint()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'dutypoint',
		{
			title    = 'Öltöző',
			elements = {
				{label = 'Munkaruha', value = 'job_wear'},
				{label = 'Civil ruha', value = 'citizen_wear'}
			}
		},
		function(data, menu)
			if data.current.value == 'citizen_wear' then
				
				if (blips.destination) then 
					RemoveBlip(blips.destination);
					blips.destination = nil;
				end 

				if (playerJobVehicle and DoesEntityExist(playerJobVehicle)) then 
					DeleteVehicle(playerJobVehicle);
					playerJobVehicle = nil;
				end 

				if (DoesEntityExist(playerJobVehicleTrailer)) then 
					DeleteVehicle(playerJobVehicleTrailer);
					playerJobVehicleTrailer = nil;
				end 

				destroyVehicleSpawners();
				destroyVehicleReloader();
				destroyVehicleDestroyer();

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	    			TriggerEvent('skinchanger:loadSkin', skin);
				end);
			elseif data.current.value == 'job_wear' then
				loadVehicleSpawners();

				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					TriggerEvent('skinchanger:loadClothes', skin, (skin.sex == 0) and Config.Clothes.male or Config.Clothes.female);
				end);
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end 

function openVehicleSpawner()
	ESX.UI.Menu.CloseAll();

	local elements = {};

	for i=1, #Config.jobVehicles, 1 do
		local vehicleName = GetLabelText( GetDisplayNameFromVehicleModel( Config.jobVehicles[i] ) );
		
		if (not vehicleName or vehicleName == 'NULL') then 
			vehicleName = exports.skvehicleshop:getVehicleName(Config.jobVehicles[i]);
		end 

		if (not vehicleName or vehicleName == "") then 
			vehicleName = Config.jobVehicles[i];
		end 

		table.insert(elements, {
			label = vehicleName, 
			value = Config.jobVehicles[i]
		});
	end

	ESX.UI.Menu.CloseAll();

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehiclespawner',
		{
			title    = 'Munkajárművek',
			elements = elements
		},
		function(data, menu)
			ESX.TriggerServerCallback(Config.resource .. ':startJob', function()
				ESX.Game.SpawnVehicle(data.current.value, Config.vehicleSpawnPoint, 125.0, function(vehicle)

					playerJobVehicle = vehicle;
	
					local vehiclePlate = math.random(100, 999);
					SetVehicleNumberPlateText(vehicle, "TRANS-"..vehiclePlate);
	
					ESX.Game.SpawnVehicle("trailers2", Config.vehicleSpawnPoint, 125.0, function(trailer)
						playerJobVehicleTrailer = trailer;
						AttachVehicleToTrailer(vehicle, trailer, 1.1);
					end);
	
					TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1);
	
					remainPackages = Config.Packages;
					 
					generateNewDestination();
					loadVehicleReloader();
					loadVehicleDestroyer();
				end)
			end);

			menu.close();
		end,
		function(data, menu)
			menu.close();
		end
	)
end

function generateNewDestination()
	Citizen.CreateThread(function()

		local pointIndex = math.random(1, #Config.deliveryPoints);
		local targetCoords = vector3(
			Config.deliveryPoints[pointIndex][1], Config.deliveryPoints[pointIndex][2], Config.deliveryPoints[pointIndex][3]
		);

		while (
			pointIndex == lastDeliverPoint and 
			#(playerCoords - targetCoords) > Config.minDistanceBetweenPoints and 
			not alreadyDeliveredPoints[pointIndex]
		) do 
			pointIndex = math.random(1, #Config.deliveryPoints);
			Wait(100);
		end
	
		lastDeliverPoint = pointIndex;

		alreadyDeliveredPoints[pointIndex] = true;

		local point = Config.deliveryPoints[pointIndex];
		local x, y, z = table.unpack(point);
	
		TriggerEvent(Config.resource..':CreateMarker', 'current_shipping_point', x, y, z - 1.0, 1, 
				5.0, 208, 214, 38, 200, 0.0, 0.0, 0.0, { type = 'deliverypoint' });
	
		blips.destination = AddBlipForCoord(x, y, z);
		SetBlipRoute(blips.destination, true);
		BeginTextCommandSetBlipName("STRING");
		AddTextComponentString('Szallitasi cim');
		EndTextCommandSetBlipName(blips.destination);
	end);
end

AddEventHandler(Config.resource .. ':onMarkerHit', function(id, ped, localPlayer, data)
	if (localPlayer) then 
		if (data.type == 'dutypoint') then 
			openDutyPoint();
		elseif (data.type == 'vehiclespawner') then 
			openVehicleSpawner();
		elseif (data.type == 'deliverypoint') then 
			if (
				playerJobVehicle and 
				DoesEntityExist(playerJobVehicle) and 
				GetVehiclePedIsUsing(GetPlayerPed(-1)) == playerJobVehicle
			) then 
				ESX.TriggerServerCallback(Config.resource .. ':deliver', function()
					TriggerEvent(Config.resource..':DestroyMarker', 'current_shipping_point');
					remainPackages = remainPackages - 1;

					if (blips.destination) then 
						RemoveBlip(blips.destination);
						blips.destination = nil;
					end 

					if (remainPackages <= 0) then 
						return;
					end 

					generateNewDestination();
				end);
			end 
		elseif (data.type == 'vehiclereloader') then 
			if (
				playerJobVehicle and 
				DoesEntityExist(playerJobVehicle) and 
				GetVehiclePedIsUsing(GetPlayerPed(-1)) == playerJobVehicle
			) then 
				remainPackages = Config.Packages;
				alreadyDeliveredPoints = {};

				if (not blips.destination) then 
					generateNewDestination();
				end
			end 
		elseif (data.type == 'vehicledestroyer') then 
			if (
				playerJobVehicle and 
				DoesEntityExist(playerJobVehicle) and 
				GetVehiclePedIsUsing(GetPlayerPed(-1)) == playerJobVehicle
			) then 
				ESX.TriggerServerCallback(Config.resource .. ':endJob', function()
					destroyVehicleReloader();
					destroyVehicleDestroyer();
					alreadyDeliveredPoints = {};
					DeleteVehicle(playerJobVehicle);
					playerJobVehicle = nil;
				end);
			end 
		end 
	end 
end);

AddEventHandler(Config.resource .. ':onMarkerLeave', function(id, ped, localPlayer, data)
	if (localPlayer) then 
		ESX.UI.Menu.CloseAll(); 
	end 
end);

-- Duty / Oltozo

function loadDutyPoints()
	blips.duty = {};

	for i, v in ipairs(Config.dutyPoints) do 
		local x, y, z = table.unpack(v.coords);
		local r, g, b = table.unpack(v.color);

		TriggerEvent(Config.resource..':CreateMarker', 'duty_points_'..i, x, y, z, v.type, 
                    v.size, r, g, b, 200, 0.0, 0.0, 0.0, { type = 'dutypoint' });

		local blip = AddBlipForCoord(x, y, z);

		SetBlipSprite(blip, 73);
		SetBlipScale(blip, 1.0);
		SetBlipColour(blip, 2);
		SetBlipAsShortRange(blip, true);
		
		BeginTextCommandSetBlipName('STRING');
		AddTextComponentString('Öltöző');
		EndTextCommandSetBlipName(blip);

		table.insert(blips.duty, blip);
	end 
end 

function destroyDutyPoints()
	for i, v in ipairs(Config.dutyPoints) do 
		TriggerEvent(Config.resource..':DestroyMarker', 'duty_points_'..i);
	end 

	if (blips.duty) then 
		for _, blip in ipairs(blips.duty) do 
			if (blip) then 
				RemoveBlip(blip);
			end
		end 
	end 

	blips.duty = {};
end 

-- Vehicle spawner 

function loadVehicleSpawners()
	blips.spawners = {};

	for i, v in ipairs(Config.vehicleSpawners) do 
		local x, y, z = table.unpack(v.coords);
		local r, g, b = table.unpack(v.color);

		TriggerEvent(Config.resource..':CreateMarker', 'vehiclespawner_point'..i, x, y, z, v.type, 
                    v.size, r, g, b, 200, 0.0, 0.0, 0.0, { type = 'vehiclespawner' });

		local blip = AddBlipForCoord(x, y, z);

		SetBlipSprite(blip, 477);
		SetBlipScale(blip, 1.0);
		SetBlipColour(blip, 2);
		SetBlipAsShortRange(blip, true);
					
		BeginTextCommandSetBlipName('STRING');
		AddTextComponentString('Járműigénylés');
		EndTextCommandSetBlipName(blip);
			
		table.insert(blips.spawners, blip);
	end 
end 

function destroyVehicleSpawners()
	for i, v in ipairs(Config.vehicleSpawners) do 
		TriggerEvent(Config.resource..':DestroyMarker', 'vehiclespawner_point'..i);
	end 

	if (blips.spawners) then 
		for _, blip in ipairs(blips.spawners) do 
			if (blip) then 
				RemoveBlip(blip);
			end
		end 
	end 

	blips.spawners = {};
end 

-- Cargo reload

function loadVehicleReloader()
	local x, y, z = table.unpack(Config.vehicleReloadPoint);

	TriggerEvent(Config.resource..':CreateMarker', 'vehicleloader_point', x, y, z, 1, 
                    2.0, 58, 188, 91, 200, 0.0, 0.0, 0.0, { type = 'vehiclereloader' });

	local blip = AddBlipForCoord(x, y, z);

	SetBlipSprite(blip, 477);
	SetBlipScale(blip, 1.0);
	SetBlipColour(blip, 2);
	SetBlipAsShortRange(blip, true);
					
	BeginTextCommandSetBlipName('STRING');
	AddTextComponentString('Csomagfeltöltés');
	EndTextCommandSetBlipName(blip);

	blips.reloader = blip;
end 

function destroyVehicleReloader()
	TriggerEvent(Config.resource..':DestroyMarker', 'vehicleloader_point');

	if (blips.destination) then 
		RemoveBlip(blips.destination);
		blips.destination = nil;
	end 

	if (blips.reloader) then 
		RemoveBlip(blips.reloader);
		blips.reloader = nil;
	end 
end 

-- Destoyer

function loadVehicleDestroyer()
	local x, y, z = table.unpack(Config.vehicleDestroy);

	TriggerEvent(Config.resource..':CreateMarker', 'vehicledestroy_point', x, y, z, 1, 
                    2.0, 188, 58, 71, 200, 0.0, 0.0, 0.0, { type = 'vehicledestroyer' });

	local blip = AddBlipForCoord(x, y, z);

	SetBlipSprite(blip, 477);
	SetBlipScale(blip, 1.0);
	SetBlipColour(blip, 2);
	SetBlipAsShortRange(blip, true);
						
	BeginTextCommandSetBlipName('STRING');
	AddTextComponentString('Munkajármű leadás');
	EndTextCommandSetBlipName(blip);
	
	blips.destroyer = blip;
end 

function destroyVehicleDestroyer()
	TriggerEvent(Config.resource..':DestroyMarker', 'vehicledestroy_point');

	if (blips.destroyer) then 
		RemoveBlip(blips.destroyer);
		blips.destroyer = nil;
	end 
end 

function initJob()
	if (
		PlayerData and 
		PlayerData.job.name == Config.jobName
	) then
		loadDutyPoints();
	else 
		destroyDutyPoints();
	end 
end 

Citizen.CreateThread(function()
	while (true) do 
		if (playerJobVehicle) then 
			drawText(
				0.225,
				0.955, 
				0.1, 
				0.03,
				0.35, 
				(remainPackages >= 1 and '~g~' or '~r~') .. remainPackages .. '~w~ csomag maradt.',
				255, 
				255,
				255, 
				255,
				true
			);
		end 

		Wait(0);
	end 
end);

function IsATruck()
	local playerPed = GetPlayerPed(-1);

	if (IsPedInAnyVehicle(playerPed, false)) then 
		for i=1, #Config.Trucks, 1 do
			if (IsVehicleModel(GetVehiclePedIsUsing(playerPed), Config.Trucks[i])) then
				return true;
			end
		end
	end 

	return false;
end
