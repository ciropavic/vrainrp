ClientConfig = {};

ClientConfig.resource = GetCurrentResourceName();

ClientConfig.keys = {
    ['enter_interior'] = { name = 'INPUT_CONTEXT', key = { 0, 38 } },
    ['close_door'] = { name = 'INPUT_REPLAY_SHOWHOTKEY', key = { 0, 311 } },
};

ClientConfig.hasNoInside = {
    garage = true,
};

ClientConfig.garage = {
    vehicle = {
        position = vector3(173.28477478027, -1003.6071166992, -99.006126403809),
        heading = 240.0
    },

    camera = {
        position = vector3(175.98477172852, -1007.3696899414, -96.999992370605)
    },
};

ClientConfig.interiorTypes = {
    house = {
        type = 0, 
        size = 1.25, 
        color = { 255, 255, 255, 80 }
    },

    garage = {
        type = 36, 
        size = 1.25, 
        color = { 255, 255, 255, 80 }
    },
};