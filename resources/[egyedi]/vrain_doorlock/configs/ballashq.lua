-- hatso
table.insert(Config.DoorList, {
	maxDistance = 2.5,
	locked = true,
	lockpick = false,
	audioRemote = false,
	slides = false,
	doors = {
		{objHash = 989957872, objHeading = 200.80838012696, objCoords = vector3(117.0994, -1974.348, 21.41926)},
		{objHash = -204046185, objHeading = 20.801488876342, objCoords = vector3(119.1674, -1973.638, 21.41926)}
 },
	authorizedJobs = { ['ballas']=0 },			
		-- oldMethod = true,
		-- audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6},
		-- audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7},
		-- autoLock = 1000
})
