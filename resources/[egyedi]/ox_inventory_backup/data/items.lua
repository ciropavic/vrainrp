return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			}
		}
	},

	['bandage'] = {
		label = 'Kötszer',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},

	['parachute'] = {
		label = 'Ejtőernyő',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['cigarette'] = {
		label = 'Cigaretta',
		weight = 0,
		stack = true,
	},

	['gym_membership'] = {
		label = 'Gym tagság',
		weight = 0,
		stack = true,
	},

	['garbage'] = {
		label = 'Kuka',
	},

	['paperbag'] = {
		label = 'Papírzacskó',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
		consume = 0,
		client = {
			anim = { dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer' },
			disable = { move = true, car = true, combat = true },
			usetime = 5000,
			cancel = true
		}
	},

	['phone'] = {
		label = 'Telefon',
		weight = 190,
		stack = false,
		consume = 0,
		client = {
			add = function(total)
				if total > 0 and GetResourceState('npwd') == 'started' then
					exports.npwd:setPhoneDisabled(false)
				end
			end,

			remove = function(total)
				if total < 1 and GetResourceState('npwd') == 'started' then
					exports.npwd:setPhoneDisabled(true)
				end
			end
		}
	},

	['money'] = {
		label = 'Készpénz',
	},

	['mustard'] = {
		label = 'Mustár',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Víz',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	['radio'] = {
		label = 'Rádió',
		weight = 1000,
		stack = false,
		consume = 0,
		allowArmed = true
	},

	['armour'] = {
		label = 'Golyóálló mellény',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
		}
	},

	['ajandekbat'] = {
		label = 'becsomagolt ütő',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['alive_chicken'] = {
		label = 'Élő csirke',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['bat'] = {
		label = 'baseball ütő',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['blowpipe'] = {
		label = 'forrasztólámpa',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['bread'] = {
		label = 'kenyér',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cannabis'] = {
		label = 'kannabisz',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['carokit'] = {
		label = 'body kit',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['carotool'] = {
		label = 'szerszámok',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['clothe'] = {
		label = 'szövet',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cocacola'] = {
		label = 'kóla',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['mountaindew'] = {
		label = 'Mountain Dew',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['contract'] = {
		label = 'adásvételi szerződés',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['copper'] = {
		label = 'réz',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cutted_wood'] = {
		label = 'vágott fa',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['diamond'] = {
		label = 'gyémánt',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['essence'] = {
		label = 'gáz',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fabric'] = {
		label = 'szövet',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fanta'] = {
		label = 'fanta',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fish'] = {
		label = 'hal',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['fixkit'] = {
		label = 'javítókészlet',
		weight = 3,
		stack = true,
		close = true,
		description = nil
	},

	['fixtool'] = {
		label = 'javító eszköz',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['gazbottle'] = {
		label = 'gázpalack',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['gold'] = {
		label = 'arany',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hamburger'] = {
		label = 'hamburger',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hotdog'] = {
		label = 'hotdog',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['iron'] = {
		label = 'vas',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['joint'] = {
		label = 'joint',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['medikit'] = {
		label = 'medikit',
		weight = 2,
		stack = true,
		close = true,
		description = nil
	},

	['muffin'] = {
		label = 'muffin',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['packaged_chicken'] = {
		label = 'csirkefilé',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['packaged_plank'] = {
		label = 'csomagolt fa',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['petrol'] = {
		label = 'olaj',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['petrol_raffin'] = {
		label = 'feldolgozott olaj',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['pickaxe'] = {
		label = 'csákány',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['pizza'] = {
		label = 'pizza',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rose'] = {
		label = 'rózsa',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['nyaloka'] = {
		label = 'nyaloka',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['slaughtered_chicken'] = {
		label = 'levágott csirke',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['sprite'] = {
		label = 'sprite',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['stone'] = {
		label = 'kő',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['vattacukor'] = {
		label = 'vattacukor',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['washed_stone'] = {
		label = 'mosott kő',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wood'] = {
		label = 'fa',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['wool'] = {
		label = 'gyapjú',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cso'] = {
		label = 'Cső',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['tar'] = {
		label = 'Tár',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['rugo'] = {
		label = 'Rugó',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['tus'] = {
		label = 'Tus',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['csavar'] = {
		label = 'Csavar',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['feherpor'] = {
		label = 'Fehér por',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['kalcium'] = {
		label = 'Kálcium',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['desztillaltviz'] = {
		label = 'Desztillált víz',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['sosav'] = {
		label = 'Sósav',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['ammonia'] = {
		label = 'Ammónia',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['belyeg'] = {
		label = 'Bélyeg',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['aceton'] = {
		label = 'Aceton',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['ragaszto'] = {
		label = 'Ragasztó',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['parkingcard'] = {
		label = 'parkoló kártya',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['weapon_appistol'] = {
		label = 'ap pisztoly',
		weight = 1,
		stack = nil,
		close = nil,
		description = nil
	},

	['weapon_assaultrifle'] = {
		label = 'ak-47',
		weight = 1,
		stack = nil,
		close = nil,
		description = nil
	},

	['weapon_pistol'] = {
		label = 'pisztoly',
		weight = 1,
		stack = nil,
		close = nil,
		description = nil
	},

	['accesscard'] = {
		label = 'access card',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['drill'] = {
		label = 'Fúró',
		weight = 15,
		stack = true,
		close = true,
		description = nil
	},

	['goldbar'] = {
		label = 'gold bar',
		weight = 100,
		stack = true,
		close = true,
		description = nil
	},

	['goldnecklace'] = {
		label = 'gold necklace',
		weight = 150,
		stack = true,
		close = true,
		description = nil
	},

	['goldwatch'] = {
		label = 'gold watch',
		weight = 200,
		stack = true,
		close = true,
		description = nil
	},

	['hackerdevice'] = {
		label = 'Laptop',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['hammerwirecutter'] = {
		label = 'hammer and wire cutter',
		weight = 10,
		stack = true,
		close = true,
		description = nil
	},

	['lsd'] = {
		label = 'LSD',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['metamfetamin'] = {
		label = 'Metamfetamin',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['powerade'] = {
		label = 'powerade',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['protein_shake'] = {
		label = 'protein shake',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['sportlunch'] = {
		label = 'sportlunch',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['akkumlator'] = {
		label = 'Akkumlátor',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['furofej'] = {
		label = 'Fúrófej',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['furomotor'] = {
		label = 'Fúrómotor',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['boombox'] = {
		label = 'Boombox',
		weight = 2000,
		stack = true,
		close = true,
		description = nil
	},

	['teafilter'] = {
		label = 'Teafilter',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['aroma'] = {
		label = 'Aroma',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['alkohol'] = {
		label = 'Alkohol',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cetli'] = {
		label = 'Cetli',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['paszta'] = {
		label = 'Paszta',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['hal'] = {
		label = 'Hal',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rizs'] = {
		label = 'Rizs',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['liszt'] = {
		label = 'Liszt',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cukor'] = {
		label = 'Cukor',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['tea'] = {
		label = 'tea',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['sushi'] = {
		label = 'sushi',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['szerencsesuti'] = {
		label = 'szerencsesüti',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['tavaszitekercs'] = {
		label = 'tavaszi tekercs',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['whiskey'] = {
		label = 'whiskey',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['levestea'] = {
		label = 'levestea',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['bream'] = {
		label = 'keszeg',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['cod'] = {
		label = 'tőkehal',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['herring'] = {
		label = 'hering',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['pike'] = {
		label = 'csuka',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['pike_berch'] = {
		label = 'fogassülő',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['rod'] = {
		label = 'horgászbot',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['salmon'] = {
		label = 'lazac',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},

	['trout'] = {
		label = 'pisztráng',
		weight = 1,
		stack = true,
		close = true,
		description = nil
	},
}