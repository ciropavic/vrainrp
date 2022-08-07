SharedConfig = {};

SharedConfig.resource = GetCurrentResourceName();

SharedConfig.labels = {
    ['enter_interior_marker_house'] = 'Nyomd meg a(z) ~%s~ betüt az ajtó használhatához.\nAz ajtó bezárásához nyomd meg a(z) ~%s~ betüt.',
    ['enter_interior_marker_business'] = 'Nyomd meg a(z) ~%s~ betüt az ajtó használhatához.\nAz ajtó bezárásához nyomd meg a(z) ~%s~ betüt.',
    ['enter_interior_marker_garage_in'] = 'Nyomd meg a(z) ~%s~ betüt a jármű eltárolásához.',
    ['enter_interior_marker_garage_out'] = 'Nyomd meg a(z) ~%s~ betüt az garázs megnyitásához.',

    ['door_changed'] = '%s az interior ajtaját.',
    ['door_closed'] = 'Az ajtó zárva van.',
    ['cannot_change_door_state'] = 'Nem tudod kinyitni/bezárni ezt az ingatlant.',

    ['cannot_access_to_garage'] = 'Nem férsz hozzá ehhez a garázshoz.',
    ['no_vehicle_in_this_garage'] = 'Nincs kocsid ebben a garázsban.',
    ['already_in_world'] = 'Ebből a járműből már van egy a világban.',
    ['vehicle_parked'] = 'Sikeresen leparkoltad a kocsit.',
    ['not_own_this_vehicle'] = 'Ez nem a te járműved.',
};

SharedConfig.interiors = {
    house = {
        [1] = { inside = vector3(347.2686, -999.2955, -99.19622), ipls = {}, price = 150000 },
        [2] = { inside = vector3(261.4586, -998.8196, -99.00863), ipls = {}, price = 150000 },
        [3] = { inside = vector3(-18.07856, -583.6725, 79.46569), ipls = {}, price = 150000 },
        [4] = { inside = vector3(-35.31277, -580.4199, 88.71221), ipls = {}, price = 150000 },
        [5] = { inside = vector3(-1468.14, -541.815, 73.4442), ipls = {}, price = 150000 },
        [6] = { inside = vector3(-1477.14, -538.7499, 55.5264), ipls = {}, price = 150000 },
        [7] = { inside = vector3(-915.811, -379.432, 113.6748), ipls = {}, price = 150000 },
        [8] = { inside = vector3(-614.86, 40.6783, 97.60007), ipls = {}, price = 150000 },
        [9] = { inside = vector3(-773.407, 341.766, 211.397), ipls = {}, price = 150000 },
        [10] = { inside = vector3(-169.286, 486.4938, 137.4436), ipls = {}, price = 150000 },
        [11] = { inside = vector3(340.9412, 437.1798, 149.3925), ipls = {}, price = 150000 },
        [12] = { inside = vector3(373.023, 416.105, 145.7006), ipls = {}, price = 150000 },
        [13] = { inside = vector3(-676.127, 588.612, 145.1698), ipls = {}, price = 150000 },
        [14] = { inside = vector3(-763.107, 615.906, 144.1401), ipls = {}, price = 150000 },
        [15] = { inside = vector3(-857.798, 682.563, 152.6529), ipls = {}, price = 150000 },
        [16] = { inside = vector3(120.5, 549.952, 184.097), ipls = {}, price = 150000 },
        [17] = { inside = vector3(-1288, 440.748, 97.69459), ipls = {}, price = 150000 },
    },

    garage = {
        [1] = { 
            name = "",
            ipls = { },

            playerTo = vector3(180.18461608886, -1000.694519043, -99.0146484375), 

            points = {
                {
                    vehicle = { position = vector3(171.5, -1003.68, -99.0), heading = 181.4173126220703 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(175.35, -1003.68, -99.0), heading = 181.4173126220703 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
            },
        }, -- vector3(173.2903, -1003.6, -99.65707)

        [2] = {
            name = "",
            ipls = { },

            playerTo = vector3(207.1252746582, -1007.6571655274, -99.0146484375), 

            points = {
                {
                    vehicle = { position = vector3(193.5, -997.16046142578, -99.0146484375), heading = 180.0 },
                    camera = { offset = vector3(0.0, 5.0, 2.0) },
                },
                {
                    vehicle = { position = vector3(198.0, -997.16046142578, -99.0146484375), heading = 180.0 },
                    camera = { offset = vector3(0.0, 5.0, 2.0) },
                },
                {
                    vehicle = { position = vector3(202.5, -997.16046142578, -99.0146484375), heading = 180.0 },
                    camera = { offset = vector3(0.0, 5.0, 2.0) },
                },
                {
                    vehicle = { position = vector3(193.5, -1003.35, -99.0146484375), heading = 180.0 },
                    camera = { offset = vector3(0.0, 4.25, 2.0) },
                },
                {
                    vehicle = { position = vector3(198.0, -1003.35, -99.0146484375), heading = 180.0 },
                    camera = { offset = vector3(0.0, 4.25, 2.0) },
                },
                {
                    vehicle = { position = vector3(202.5, -1003.35, -99.0146484375), heading = 180.0 },
                    camera = { offset = vector3(0.0, 4.25, 2.0) },
                },
            },
        }, -- vector3(199.51647949218, -1001.89453125, -99.0146484375)

        [3] = {
            name = "",
            ipls = { },

            playerTo = vector3(240.96263122558, -1004.676940918, -99.0146484375), 

            points = {
                -- Lift mellett
                {
                    vehicle = { position = vector3(233.0, -1000.0, -99.688598632812), heading = 127.0 },
                    camera = { offset = vector3(2.0, 5.0, 2.0) },
                },
                {
                    vehicle = { position = vector3(233.0, -994.0, -99.688598632812), heading = 127.0 },
                    camera = { offset = vector3(2.0, 5.0, 2.0) },
                },
                {
                    vehicle = { position = vector3(233.0, -988.0, -99.688598632812), heading = 127.0 },
                    camera = { offset = vector3(2.0, 5.0, 2.0) },
                },
                {
                    vehicle = { position = vector3(233.0, -982.0, -99.688598632812), heading = 127.0 },
                    camera = { offset = vector3(2.0, 5.0, 2.0) },
                },

                -- masik oldal
                {
                    vehicle = { position = vector3(223.5, -982.0, -99.688598632812), heading = 305.0 },
                    camera = { offset = vector3(2.0, 4.5, 2.0) },
                },
                {
                    vehicle = { position = vector3(223.5, -988.0, -99.688598632812), heading = 305.0 },
                    camera = { offset = vector3(2.0, 4.5, 2.0) },
                },
                {
                    vehicle = { position = vector3(223.5, -994.0, -99.688598632812), heading = 305.0 },
                    camera = { offset = vector3(2.0, 4.5, 2.0) },
                },
                {
                    vehicle = { position = vector3(223.5, -1000.0, -99.688598632812), heading = 305.0 },
                    camera = { offset = vector3(2.0, 4.5, 2.0) },
                },
            },

        }, -- vector3(229.9559, -981.7928, -99.66071)

        [4] = {
            name = "",
            ipls = { "" },

            playerTo = vector3(1380.0791015625, 182.5978088379, -49.00439453125),

            points = {
                {
                    vehicle = { position = vector3(1394.6, 200.2, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 204.4, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 208.6, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 212.8, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 217.0, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 221.2, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 225.4, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 229.6, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 233.8, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 238.0, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 242.2, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 246.4, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 250.6, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1394.6, 254.8, -49.0), heading = 90.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1379.9604492188, 246.07911682128, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.10546875, 241.78021240234, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.0395507812, 237.92967224122, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.052734375, 233.70988464356, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.2637939454, 229.52966308594, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.0659179688, 225.30989074708, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1379.89453125, 221.07691955566, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.10546875, 216.98901367188, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.0, 212.72967529296, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1380.1845703125, 208.94505310058, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.7583007812, 208.62857055664, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.5736083984, 212.76922607422, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.7449951172, 217.02856445312, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.8110351562, 221.1164855957, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.7846679688, 225.24395751954, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.8374023438, 229.50329589844, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.6263427734, 233.65713500976, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.7846679688, 237.81098937988, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.8505859375, 241.89889526368, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.599975586, 246.29011535644, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.5604248046, 250.41758728028, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
                {
                    vehicle = { position = vector3(1365.494506836, 254.70329284668, -49.00439453125), heading = 270.0 },
                    camera = { offset = vector3(0.0, 5.0, 1.5) },
                },
            },
        }, -- Vector3(1295.000, 230.000, -50.000) // Kaszino
    },
};

SharedConfig.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

string.split = function (inputstr, sep)
    local sep = (sep or ',');
    local t = {};

    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end

    return t;
end