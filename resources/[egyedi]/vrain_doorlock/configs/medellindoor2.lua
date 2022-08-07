

-- medellindoor2
table.insert(Config.DoorList, {
	slides = false,
	authorizedJobs = { ['medellin']=0 },
	locked = true,
	maxDistance = 2.5,
	audioRemote = false,
	lockpick = false,
	doors = {
		{objHash = 1705178895, objHeading = 32.504173278808, objCoords = vector3(-3221.664, 837.36, 8.71796)},
		{objHash = 1705178895, objHeading = 212.414352417, objCoords = vector3(-3219.798, 838.5516, 8.71796)}
 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})