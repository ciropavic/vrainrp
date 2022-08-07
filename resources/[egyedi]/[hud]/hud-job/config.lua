Config = {}

Config.Locale = 'en'

Config.serverLogo = 'https://i.imgur.com/AcgDL9f.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}


Config.voice = {

	levels = {
		default = 10.0,
		shout = 20.0,
		whisper = 3.0,
		current = 0
	},
	
	keys = {
		distance 	= 'Y',
	}
}


Config.vehicle = {
	speedUnit = 'MPH',
	maxSpeed = 225,

	keys = {
		seatbelt 	= 'F5',
		cruiser		= '',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.ui = {
	showServerLogo		= false,

	showJob		 		= false,

	showWalletMoney 	= false,
	showBankMoney 		= false,
	showBlackMoney 		= false,
	showSocietyMoney	= false,

	showDate			= true,
	showLocation 		= true,
	showVoice	 		= true,

	showHealth			= false,
	showArmor	 		= false,
	showStamina	 		= false,
	showHunger 			= false,
	showThirst	 		= false,

	showMinimap			= true,

	showWeapons			= true,	
}