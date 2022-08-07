Config = {};

Config.resource = GetCurrentResourceName();

Config.DeliveryPrice = { min = 350, max = 600 };

Config.minDistanceBetweenPoints = 1500;

Config.Packages = 5;

Config.jobName = 'trucker';

Config.jobVehicles = {
    "vwe_cerberus1",
	"vwe_cerberus4",
	"vwe_roadkiller1",
};

Config.vehicleSpawnPoint = { x = 581.00720214844, y = -1898.4792480469, z = 24.895788192749 };

Config.vehicleReloadPoint = { 539.55084228516, -1983.5140380859, 23.752319335938 };

Config.vehicleDestroy = { 550.98236083984, -1926.7978515625, 23.805196762085 };

Config.dutyPoints = {
    {
        coords = { 521.41705322266, -1916.6923828125, 25.0 },
        size = 1.4, 
        color = { 255, 255, 255 },
        type = 1
    }
};

Config.vehicleSpawners = {
    {
        coords = { 540.28369140625, -1945.2471923828, 24.0 },
        size = 1.4, 
        color = { 255, 255, 255 },
        type = 1
    }
};

Config.deliveryPoints = {
    { -1011.3218994141, -2225.4665527344, 8.9913873672485 },
    { -752.64953613281, -2590.5129394531, 13.828510284424 },
    { -645.61370849609, -1731.6362304688, 24.452163696289 },
    { -459.40689086914, -1713.0240478516, 18.677494049072 },
    { 67.985015869141, -1548.4073486328, 29.460088729858 },
    { 785.02935791016, -2522.8488769531, 20.704629898071 },
    { 1368.3284912109, -2075.681640625, 51.998508453369 },
    { 1208.951171875, -1230.736328125, 35.226711273193 },
    { 727.67852783203, -557.47192382812, 26.467910766602 },
    { -1636.7348632812, -812.47778320312, 10.165797233582 },
    { -2180.3198242188, -409.73306274414, 13.111580848694 },
    { -3044.556640625, 602.75402832031, 7.3847241401672 },
    { -3169.3889160156, 1106.4891357422, 20.686201095581 },
    { -2530.3000488281, 2340.5446777344, 33.059867858887 },
    { -1142.0103759766, 2663.3403320312, 18.05287361145 },
    { 196.82814025879, 2791.6005859375, 45.655090332031 },
    { 341.20465087891, 3416.0266113281, 36.525051116943 },
    { 391.39831542969, 3589.9123535156, 33.292217254639 },
    { 1955.7760009766, 3764.8322753906, 32.202587127686 },
    { 1687.5629882812, 4773.8100585938, 41.921474456787 },
    { -753.82751464844, 5534.5537109375, 33.485675811768 },
    { -275.41528320312, 6046.9111328125, 31.601108551025 },
    { 201.5015411377, 6388.2646484375, 31.383930206299 },
    { 119.50492095947, 6612.6098632812, 31.881530761719 },
    { 1726.3383789062, 6398.4169921875, 34.504451751709 },
};

Config.Clothes = {
    -- 
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
		['torso_1'] = 57,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 6,
		['pants_1'] = 7,   ['pants_2'] = 0,
		['shoes_1'] = 24,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0, 
        ['mask_1'] = 0,     ['mask_2'] = 0
    },

    female = {
        ['tshirt_1'] = 2,  ['tshirt_2'] = 0,
		['torso_1'] = 50,   ['torso_2'] = 0,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 3,
		['pants_1'] = 30,   ['pants_2'] = 0,
		['shoes_1'] = 26,   ['shoes_2'] = 0,
		['helmet_1'] = 57,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = -1,     ['ears_2'] = 0, 
        ['mask_1'] = 0,     ['mask_2'] = 0
    },
};

