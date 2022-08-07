return {
	VendingMachineDrinks = {
		name = 'Vending Machine',
		inventory = {
			{ name = 'water', price = 10 },
			{ name = 'cola', price = 10 },
		},
		model = {
			`prop_vend_soda_02`, `prop_vend_fridge01`, `prop_vend_water_01`, `prop_vend_soda_01`
		}
	},

	BlackMarketArms = {
		name = 'Fekete piac',
		inventory = {
			{ name = 'ammo-9', price = 30, currency = 'money' },
			{ name = 'ammo-rifle2', price = 50, currency = 'money' }
		}, locations = {
			vec3(257.97314453125,-3060.6499023438,5.8629913330078)
		}, targets = {

		}
	}
}
