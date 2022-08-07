Config = {}

Config.PlateLetters  = 4
Config.PlateNumbers  = 4
Config.PlateUseSpace = false

Config.SpawnVehicle = true  -- TRUE if you want spawn vehicle when buy

Config.TestDrive = true     -- TRUE if you want enable test drive
Config.TestDriveTime = 30   -- TIME in SEC

Config.Blip = {
    vector3(-56.49, -1096.58, 26.42) -- Main Car Dealer Blip
}

Config.Shops = {
    [1] = {
        category = 'pdm', -- Change ["shop"] in qb-core/shared.lua to match this for the vehicles you want
        coords = vector3(-56.49, -1096.58, 26.42),
        coordsspawn = vector3(-67.316947937012,-1092.0759277344,26.599813461304)
    }
}