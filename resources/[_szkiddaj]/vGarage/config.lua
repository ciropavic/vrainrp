Config = {};

Config.resource = GetCurrentResourceName();

Config.labels = {
    ['open_garage'] = 'Garázs megnyitása',
    ['put_vehicle'] = 'Jármű leparkolása',
    
    parked_vehicle = "Sikeresen leparkoltad a járműved.", 
    no_vehicle_parked_here = "Ebben a garázsban nincs járműved.", 
    vehicle_already_exists = "Ez az autó már ki van véve.", 
    no_free_parking_space = "Nincs üres parkolóhely ahova le lehetne tenni a járművet.", 
    vehicle_taken_out = "Sikeresen kivetted a járműved a garázsból.", 

    invalid_garage = "Érvénytelen garázs, kérlek vedd fel a kapcsolatot egy fejlesztővel.",
    not_found = "Nem találtam a járműved. (Biztos a tiéd?)",
    taken_out = "Ebből az autóból már van egy kivéve.",
    not_enough_cash_for_parking_fee = "Nincs elég készpénz nálad a parkolási díj kifizetéséhez. ($ %s)"
};

local defaultBlip = {
    icon = 357, 
    color = 2
}

Config.DefaultCostPerSecond = 0.00231481481;
Config.DefaultMaxCost = 15000;

Config.points = {
	{
        dbId = 'legion_square', -- Amivel adatbazisbol keri ki
        name = 'Legion Square',
        
        cost_per_second = 0.00260416666, 
        max_parking_cost = 30000, 

        zone_size = 150.0, 
        blip = defaultBlip,

        marker = {
            position = vector3(221.31381225586, -811.93176269531, 30.600633621216),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(225.31030273438, -800.22485351562, 30.635515213013)
            },

            vehicle = {
                position = vector3(230.49179077148, -795.33856201172, 30.595260620117),
                heading = 90.0
            }

        },

        despawn = {
            position = vector3(224.31134033203, -758.47717285156, 31.0),
            color = { 135, 34, 34, 255 },
            size = 2.0, 
            type = "car"
        },

        spawns = {
            {
                position = vector3(264.63235473633, -759.23333740234, 34.644069671631),
                heading = 70.0
            },
            {
                position = vector3(262.35791015625, -762.40478515625, 34.644931793213),
                heading = 70.0
            },
            {
                position = vector3(254.84828186035, -761.37731933594, 34.642303466797),
                heading = 340.0
            },
            {
                position = vector3(251.76045227051, -760.41882324219, 34.642532348633),
                heading = 340.0
            },
            {
                position = vector3(248.35078430176, -759.38446044922, 34.642566680908),
                heading = 340.0
            },
            {
                position = vector3(245.11831665039, -758.25469970703, 34.639514923096),
                heading = 340.0
            },
            {
                position = vector3(228.64395141602, -752.30078125, 34.638008117676),
                heading = 340.0
            },
            {
                position = vector3(225.17657470703, -751.54138183594, 34.637153625488),
                heading = 340.0
            },
            {
                position = vector3(221.82002258301, -750.43634033203, 34.641132354736),
                heading = 340.0
            },
            {
                position = vector3(233.57597351074, -740.02758789062, 34.560886383057),
                heading = 165.0
            },
            {
                position = vector3(236.94873046875, -740.86651611328, 34.590091705322),
                heading = 165.0
            },
            {
                position = vector3(240.01104736328, -741.94207763672, 34.607318878174),
                heading = 165.0
            },
            {
                position = vector3(243.3777923584, -742.98413085938, 34.620471954346),
                heading = 165.0
            },
            {
                position = vector3(246.57508850098, -744.04760742188, 34.628829956055),
                heading = 165.0
            },
            {
                position = vector3(249.89129638672, -745.21051025391, 34.637184143066),
                heading = 165.0
            },
            {
                position = vector3(253.16526794434, -746.27569580078, 34.638736724854),
                heading = 165.0
            },
        },
    },

    {
        dbId = 'garazs', -- Amivel adatbazisbol keri ki
        name = 'La Puerta',
        
        blip = defaultBlip,

        cost_per_second = 0.00173611111, 
        max_parking_cost = 30000, 

        marker = {
            position = vector3(-698.54333496094, -1402.9932861328, 5.1502599716187),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(-700.02014160156, -1414.8328857422, 9.000518321991)
            },

            vehicle = {
                position = vector3(-692.86773681641, -1413.3363037109, 5.0005192756653),
                heading = 90.0
            }

        },

        despawn = {
            position = vector3(-694.78057861328, -1405.3851318359, 5.0005226135254),
            color = { 135, 34, 34, 255 },
            size = 2.0, 
            type = "car",
        },

        spawns = {
            {
                position = vector3(-680.48480224609, -1399.9406738281, 5.0005221366882),
                heading = 87.0
            },
            {
                position = vector3(-680.84344482422, -1403.8559570312, 5.0005207061768),
                heading = 87.0
            },
            {
                position = vector3(-680.95947265625, -1408.1026611328, 5.0005240440369),
                heading = 87.0
            },
            {
                position = vector3(-681.15570068359, -1412.0843505859, 5.0005240440369),
                heading = 87.0
            },
            {
                position = vector3(-680.85534667969, -1416.2843017578, 5.0005240440369),
                heading = 87.0
            },
        },
    },

    {
        dbId = 'westvinewood', -- Amivel adatbazisbol keri ki
        name = 'West Vinewood',
        
        blip = defaultBlip,

        cost_per_second = 0.00173611111, 
        max_parking_cost = 30000, 

        marker = {
            position = vector3(-202.69369506836, 317.71569824219, 96.945671081543),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(-198.17068481445, 305.4768371582, 99.945663452148)
            },

            vehicle = {
                position = vector3(-204.85960388184, 308.1882019043, 96.946601867676),
                heading = 200.0
            }

        },

        despawn = {
            position = vector3(-200.4384765625, 315.24472045898, 96.945686340332),
            color = { 135, 34, 34, 150 },
            size = 2.0, 
            type = "car",
        },

        spawns = {
            {
                position = vector3(-198.78329467773, 301.6266784668, 96.945663452148),
                heading = 0.0
            },
            {
                position = vector3(-195.88243103027, 301.64813232422, 96.945663452148),
                heading = 0.0
            },
            {
                position = vector3(-202.04908752441, 301.26382446289, 96.945663452148),
                heading = 0.0
            },
            {
                position = vector3(-205.45364379883, 301.13848876953, 96.945663452148),
                heading = 0.0
            }
        },
    },
    
    {
        dbId = 'garazs', -- Amivel adatbazisbol keri ki
        name = 'Little Seoul',

        blip = defaultBlip,

        cost_per_second = 0.00231481481, 
        max_parking_cost = 30000, 

        marker = {
            position = vector3(-474.88473510742, -608.84954833984, 31.324247360229),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(-475.3369140625, -619.81951904297, 34.174423217773)
            },

            vehicle = {
                position = vector3(-480.30038452148, -613.63446044922, 31.174438476562),
                heading = 180.91
            }

        },

        despawn = {
            position = vector3(-457.82110595703, -619.27069091797, 31.174425125122),
            color = { 135, 34, 34, 255 },
            size = 2.0, 
            type = "car",
        },

        spawns = {
            {
                position = vector3(-471.17095947266, -624.89251708984, 31.174448013306),
                heading = 0.0
            },
                {
                position = vector3(-467.49014282227, -625.04760742188, 31.174448013306),
                heading = 0.0
            },
                {
                position = vector3(-463.97222900391, -625.24853515625, 31.174448013306),
                heading = 0.0
            },
                {
                position = vector3(-460.39190673828, -625.23583984375, 31.174448013306),
                heading = 0.0
            },
                {
                position = vector3(-456.89086914062, -625.19244384766, 31.174448013306),
                heading = 0.0
            },
        },
    },
    
    {
        dbId = 'garazs', -- Amivel adatbazisbol keri ki
        name = 'Sandy Shores',

        blip = defaultBlip,

        cost_per_second = 0.00092592592, 
        max_parking_cost = 30000, 

        marker = {
            position = vector3(1538.7525634766, 3783.1611328125, 34.206428527832),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(1559.4016113281, 3791.1833496094, 36.106269836426)
            },

            vehicle = {
                position = vector3(1566.4620361328, 3790.8557128906, 34.214977264404),
                heading = 40.2
            }

        },

        despawn = {
            position = vector3(1538.2425537109, 3770.5, 34.050132751465),
            color = { 135, 34, 34, 255 },
            size = 2.0, 
            type = "car",
        },

        spawns = {
            {
                position = vector3(1542.6939697266, 3780.7978515625, 34.050117492676),
                heading = 212.0
            },
            {
                position = vector3(1546.3330078125, 3782.5004882812, 34.06090927124),
                heading = 212.0
            },
            {
                position = vector3(1549.8415527344, 3784.3933105469, 34.072059631348),
                heading = 212.0
            },
        },
    },
    
    {
        dbId = 'garazs', -- Amivel adatbazisbol keri ki
        name = 'Grapeseed',

        blip = defaultBlip,

        cost_per_second = 0.00092592592, 
        max_parking_cost = 30000, 

        marker = {
            position = vector3(1695.2786865234, 4789.3720703125, 41.983741760254),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(1701.7305908203, 4806.0244140625, 43.828430175781)
            },

            vehicle = {
                position = vector3(1706.2176513672, 4804.193359375, 41.79564666748),
                heading = 105.2
            }

        },

        despawn = {
            position = vector3(1695.4166259766, 4799.2275390625, 41.858982086182),
            color = { 135, 34, 34, 255 },
            size = 2.0, 
            type = "car",
        },

        spawns = {
            {
                position = vector3(1691.4035644531, 4782.2094726562, 41.921520233154),
                heading = 95.0
            },
            {
                position = vector3(1691.5415039062, 4778.6723632812, 41.921520233154),
                heading = 95.0
            },
            {
                position = vector3(1691.6025390625, 4774.0473632812, 41.921527862549),
                heading = 95.0
            },
        },
    },
    
    {
        dbId = 'garazs', -- Amivel adatbazisbol keri ki
        name = 'Paleto Bay',

        blip = defaultBlip,

        cost_per_second = 0.00144675925, 
        max_parking_cost = 30000, 

        marker = {
            position = vector3(-119.93604278564, 6284.2119140625, 31.450923919678),
            color = { 255, 255, 255, 255 },
            size = 1.3, 
            type = "car",
        },

        vehicle = {
            type = 'car',
        },

        preview = {

            camera = {
                position = vector3(-132.56581115723, 6277.5556640625, 31.36088180542)
            },

            vehicle = {
                position = vector3(-134.29525756836, 6272.1108398438, 31.337959289551),
                heading = 105.2
            }

        },

        despawn = {
            position = vector3(-126.48804473877, 6290.8315429688, 31.35),
            color = { 135, 34, 34, 255 },
            size = 2.0, 
            type = "car",
        },

        spawns = {
            {
                position = vector3(-129.04348754883, 6285.6357421875, 31.355590820312),
                heading = 225.0
            },
            {
                position = vector3(-131.34530639648, 6283.5717773438, 31.351947784424),
                heading = 225.0
            },
            {
                position = vector3(-138.39126586914, 6276.8452148438, 31.341436386108),
                heading = 225.0
            },
        },
    },
};

Config.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end