local NumberCharset = {}
local Charset = {}
for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		if config.PlateUseSpace then
			generatedPlate = string.upper(GetRandomLetter(config.PlateLetters) .. ' ' .. GetRandomNumber(config.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(config.PlateLetters) .. '-' .. GetRandomNumber(config.PlateNumbers))
		end

		ESX.TriggerServerCallback('eotix-vehicleshop:isPlateTaken', function (isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('eotix-vehicleshop:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

function formatNumber(number, sep)
	local money = number
	for i = 1, tostring(money):len()/3 do
		money = string.gsub(money, "^(-?%d+)(%d%d%d)", "%1"..sep.."%2")
	end
	return money
end

function getVehicleList() 
	return config.allCars;
end 

function getVehicleName(name)
	if (name) then 
		if (type(name) == 'string') then 
			return (config.carNames[name]) and config.carNames[name] or 'NULL';
		elseif (type(name) == 'number') then 
			for model, vehName in pairs(config.carNames) do 
				if (GetHashKey(model) == name) then 
					return vehName;
				end 
			end 

			return 'NULL';
		end 
	else 
		return 'NULL';
	end 
end 

function getVehiclePrice(vehicleHash)
	if (not vehicleHash) then return; end 
	
	for i,v in ipairs(config.allCars) do 
		if (v.model and GetHashKey(v.model) == vehicleHash) then 
			return v.price;
		end 
	end 

	return 25000;
end 

exports('getVehicleName', getVehicleName);
exports('getVehicleList', getVehicleList);
exports('getVehiclePrice', getVehiclePrice);