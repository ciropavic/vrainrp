config = {};

config.resource = GetCurrentResourceName();
config.markers = { shop = 29, boss = 20 };

config.PlateLetters = 3;
config.PlateNumbers = 3;
config.PlateUseSpace = false;

config.shops = {
    {
        name = 'Autókereskedés',
        job = 'police',
        account = 'society_police',
        coords = vector3(-56.69010925293, -1096.7076416016, 26.415405273438),
        boss = vector3(-32.083961486816, -1114.3851318359, 26.422359466553),

        preview = {
            car = vector3(-43.698810577393,-1098.3192138672,26.422357559204),
            heading = 170.0,
            cameras = {
                vector3(-42.725074768066,-1101.4481201172,26.422353744507),
                vector3(-46.773441314697,-1097.791015625,26.42234992981),
                vector3(-41.247283935547,-1094.2600097656,26.42234992981),
            },
        },

        drop = { pos = vector3(-31.393375396729, -1089.9291992188, 26.422197341919), heading = 90.0 },
    },
};

-- Premium kocsik (amiknek kell az ignore, hogy ne keruljenek carshopba..)
    --{ model = 'demonboi', price = 135000, ignore = true },
    --{ model = 'chiron17', price = 450000, ignore = true },

config.allCars = {
    { model = 'vwe_admiral1', price = 55000 },
    { model = 'vwe_alamo1', price = 95000 },
    { model = 'vwe_alamo2', price = 85000 },
    { model = 'vwe_alamo3', price = 46000 },
    { model = 'vwe_ardent1', price = 870000 },
    { model = 'vwe_argento1', price = 230000},
    { model = 'vwe_ariant1', price = 45000},
    { model = 'vwe_banshee1', price = 380000},
    --{ model = 'vwe_barracks1', price = 10000 },
    --{ model = 'vwe_benson1', price = 10000 },
    --{ model = 'vwe_besra1', price = 10000 },
    --{ model = 'vwe_bfinjection1', price = 10000 },
    --{ model = 'vwe_biff2', price = 10000 },
    { model = 'vwe_bison1', price = 105000},
    { model = 'vwe_bison2', price = 110000},
    { model = 'vwe_blade1', price = 130000 },
     --{ model = 'vwe_boattrailer1', price = 10000 },trailer
    { model = 'vwe_bobcat1', price = 26000 },
    { model = 'vwe_bobcat3', price = 42000 },
    { model = 'vwe_bobcatxl2', price = 67000 },
    { model = 'vwe_brigham1', price = 56000 },
    { model = 'vwe_buffalo1', price = 155000 },
    { model = 'vwe_buffalo2', price = 160000 },
    { model = 'vwe_buffalo3', price = 193000 },
    { model = 'vwe_buffalo6', price = 180000 },
    { model = 'vwe_burrito1', price = 10000 },--no livery
    { model = 'vwe_caracara1', price = 175000 },
    { model = 'vwe_castella1', price = 33000 },
    { model = 'vwe_cavalcade1', price = 118000 },
    --{ model = 'vwe_cbus1', price = 10000 },
    --{ model = 'vwe_cerberus1', price = 10000 },kamionos meló
    --{ model = 'vwe_cerberus4', price = 10000 },kamionos meló
    { model = 'vwe_cheetah1', price = 890000 },
    { model = 'vwe_club1', price = 14000 },
    { model = 'vwe_cogcabrio1', price = 430000 },
    { model = 'vwe_cognoscenti1', price = 640000 },
    { model = 'vwe_comet1', price = 450000 },
    { model = 'vwe_comet2', price = 570000 },
    { model = 'vwe_contender2', price = 17000 },
    { model = 'vwe_contender4', price = 109000 },
    { model = 'vwe_contender5', price = 355000 },
    { model = 'vwe_coquette1', price = 10000 },--no livery
    { model = 'vwe_coquette3', price = 680000 },
    { model = 'vwe_coyote2', price = 66000 },
    { model = 'vwe_deluxo1', price = 120000 },
    { model = 'vwe_dingo1', price = 76000 },
    { model = 'vwe_dloader1', price = 10000 },
    { model = 'vwe_dominator1', price = 260000 },
    { model = 'vwe_dubsta1', price = 280000 },
    { model = 'vwe_dukes1', price = 310000 },
    { model = 'vwe_elegy1', price = 206000 },
    { model = 'vwe_elegy2', price = 390000 },
    { model = 'vwe_elena1', price = 146000 },
    { model = 'vwe_esperanto1', price = 37000 },
    { model = 'vwe_euphoria1', price = 490000 },
    { model = 'vwe_euros1', price = 143000 },
    { model = 'vwe_feroci1', price = 44000 },
    { model = 'vwe_glendale2', price = 680000 },
    { model = 'vwe_golem1', price = 61000 },
    { model = 'vwe_greenwood1', price = 41000 },
    { model = 'vwe_gresley1', price = 136000 },
    { model = 'vwe_hachura1', price = 294000 },
    { model = 'vwe_hades1', price = 31500 },
    { model = 'vwe_infernus1', price = 950000 },
    { model = 'vwe_infernus2', price = 880000 },
    { model = 'vwe_issi1', price = 48500 },
    { model = 'vwe_jester1', price = 365000 },
    --{ model = 'vwe_journey1', price = 10000 },
    { model = 'vwe_kenshin1', price = 70000 },
    { model = 'vwe_kuroi1', price = 107000 },
    { model = 'vwe_kuruma1', price = 376000 },
    { model = 'vwe_limo1', price = 1000000 },
    { model = 'vwe_majimagt1', price = 1150000 },
    --{ model = 'vwe_maverick1', price = 10000 },helikopter
    { model = 'vwe_mesa1', price = 157000 },
    { model = 'vwe_meteor1', price = 980000 },
    { model = 'vwe_mf1', price = 1200000 },
    { model = 'vwe_mf12', price = 1250000 },
    { model = 'vwe_minivan1', price = 83000 },
    { model = 'vwe_molecule1', price = 10000 },--versenyre xdd
    { model = 'vwe_monroe1', price = 755000 },
    { model = 'vwe_nebula1', price = 16500 },
    { model = 'vwe_niner1', price = 635000 },
    { model = 'vwe_panto1', price = 10000 },
    { model = 'vwe_patriot1', price = 10000 },
    { model = 'vwe_patriot2', price = 10000 },
    { model = 'vwe_phantom1', price = 10000 },
    { model = 'vwe_picador1', price = 10000 },
    { model = 'vwe_picador2', price = 10000 },
    { model = 'vwe_pony1', price = 10000 },
    { model = 'vwe_pony2', price = 10000 },
    { model = 'vwe_pounder1', price = 10000 },
    { model = 'vwe_radi1', price = 10000 },
    { model = 'vwe_raider1', price = 10000 },
    { model = 'vwe_ramptruck1', price = 10000 },
    { model = 'vwe_ramptruck2', price = 10000 },
    { model = 'vwe_rancher1', price = 10000 },
    { model = 'vwe_rancher2', price = 10000 },
    { model = 'vwe_rancher3', price = 10000 },
    { model = 'vwe_rancherxl1', price = 10000 },
    { model = 'vwe_ratloader1', price = 10000 },
    { model = 'vwe_razor1', price = 10000 },
    { model = 'vwe_rebel1', price = 10000 },
    { model = 'vwe_rebel2', price = 10000 },
    { model = 'vwe_rebel3', price = 10000 },
    { model = 'vwe_rebel4', price = 10000 },
    { model = 'vwe_recursion1', price = 10000 },
    { model = 'vwe_regina1', price = 10000 },
    { model = 'vwe_riata1', price = 10000 },
    { model = 'vwe_riata2', price = 10000 },
    { model = 'vwe_riata3', price = 10000 },
    { model = 'vwe_roadkiller1', price = 10000 },
    { model = 'vwe_rom1', price = 10000 },
    { model = 'vwe_ruiner1', price = 10000 },
    { model = 'vwe_ruiner2', price = 10000 },
    { model = 'vwe_rumpo1', price = 10000 },
    { model = 'vwe_rumpo2', price = 10000 },
    { model = 'vwe_s2301', price = 10000 },
    { model = 'vwe_sabot1', price = 10000 },
    { model = 'vwe_sadler1', price = 10000 },
    { model = 'vwe_sadler2', price = 10000 },
    { model = 'vwe_sadler3', price = 10000 },
    { model = 'vwe_sadler4', price = 10000 },
    { model = 'vwe_sadler5', price = 10000 },
    { model = 'vwe_sadler6', price = 10000 },
    { model = 'vwe_sadler7', price = 10000 },
    { model = 'vwe_sandking1', price = 10000 },
    { model = 'vwe_sandking2', price = 10000 },
    { model = 'vwe_savestra1', price = 10000 },
    { model = 'vwe_sbus1', price = 10000 },
    { model = 'vwe_sbus2', price = 10000 },
    { model = 'vwe_scamp1', price = 10000 },
    { model = 'vwe_scout1', price = 10000 },
    { model = 'vwe_schwartzer1', price = 10000 },
    { model = 'vwe_schwartzer2', price = 10000 },
    { model = 'vwe_seminole1', price = 10000 },
    { model = 'vwe_seminole2', price = 10000 },
    { model = 'vwe_sentinel1', price = 10000 },
    { model = 'vwe_seraph1', price = 10000 },
    { model = 'vwe_serena1', price = 10000 },
    { model = 'vwe_sigma2', price = 10000 },
    { model = 'vwe_sigma3', price = 10000 },
    { model = 'vwe_slamvan1', price = 10000 },
    { model = 'vwe_slasher1', price = 10000 },
    { model = 'vwe_slave1', price = 10000 },
    { model = 'vwe_sparrow1', price = 10000 },
    { model = 'vwe_speedo1', price = 10000 },
    { model = 'vwe_speedo2', price = 10000 },
    { model = 'vwe_spirit1', price = 10000 },
    { model = 'vwe_spritzer1', price = 10000 },
    { model = 'vwe_squaddie1', price = 10000 },
    { model = 'vwe_squaddie2', price = 10000 },
    { model = 'vwe_stanier1', price = 10000 },
    { model = 'vwe_stdstanier1', price = 10000 },
    { model = 'vwe_steed1', price = 10000 },
    { model = 'vwe_steed2', price = 10000 },
    { model = 'vwe_steed3', price = 10000 },
    { model = 'vwe_stockade1', price = 10000 },
    { model = 'vwe_stratum1', price = 10000 },
    { model = 'vwe_stratum2', price = 10000 },
    { model = 'vwe_streiter1', price = 10000 },
    { model = 'vwe_stretch1', price = 10000 },
    { model = 'vwe_sultan1', price = 10000 },
    { model = 'vwe_sultan2', price = 10000 },
    { model = 'vwe_sultanrs1', price = 10000 },
    { model = 'vwe_sultanrs2', price = 10000 },
    { model = 'vwe_sultanrs3', price = 10000 },
    { model = 'vwe_supergts1', price = 10000 },
    { model = 'vwe_surano1', price = 10000 },
    { model = 'vwe_surfer1', price = 10000 },
    { model = 'vwe_surge1', price = 10000 },
    { model = 'vwe_tachyon1', price = 10000 },
    { model = 'vwe_tailgater1', price = 10000 },
    { model = 'vwe_tailgater2', price = 10000 },
    { model = 'vwe_tailgater3', price = 10000 },
    { model = 'vwe_tampa1', price = 10000 },
    { model = 'vwe_tanker1', price = 10000 },
    { model = 'vwe_tanker2', price = 10000 },
    { model = 'vwe_taxi1', price = 10000 },
    { model = 'vwe_templar1', price = 10000 },
    { model = 'vwe_torrence1', price = 10000 },
    { model = 'vwe_towtruck1', price = 10000 },
    { model = 'vwe_tr1', price = 10000 },
    { model = 'vwe_tractor1', price = 10000 },
    { model = 'vwe_trailers1', price = 10000 },
    { model = 'vwe_trailers2', price = 10000 },
    { model = 'vwe_trailers3', price = 10000 },
    { model = 'vwe_trailercast1', price = 10000 },
    { model = 'vwe_trailerdump1', price = 10000 },
    { model = 'vwe_trailerdump2', price = 10000 },
    { model = 'vwe_trailerdump3', price = 10000 },
    { model = 'vwe_trailerlogs1', price = 10000 },
    { model = 'vwe_trash1', price = 10000 },
    { model = 'vwe_tulip1', price = 10000 },
    { model = 'vwe_turismo1', price = 10000 },
    { model = 'vwe_tyrus1', price = 10000 },
    { model = 'vwe_uranus1', price = 10000 },
    { model = 'vwe_urban1', price = 10000 },
    { model = 'vwe_utillitruck1', price = 10000 },
    { model = 'vwe_utillitruck2', price = 10000 },
    { model = 'vwe_utillitruck3', price = 10000 },
    { model = 'vwe_ventoso1', price = 10000 },
    { model = 'vwe_verin1', price = 10000 },
    { model = 'vwe_vertice1', price = 10000 },
    { model = 'vwe_vesper1', price = 10000 },
    { model = 'vwe_vigero1', price = 10000 },
    { model = 'vwe_vincent1', price = 10000 },
    { model = 'vwe_voodoo1', price = 10000 },
    { model = 'vwe_vorstand1', price = 10000 },
    { model = 'vwe_warrener1', price = 10000 },
    { model = 'vwe_washington1', price = 10000 },
    { model = 'vwe_watertanker1', price = 10000 },
    { model = 'vwe_wintergreen1', price = 10000 },
    { model = 'vwe_yankee1', price = 10000 },
    { model = 'vwe_yankee2', price = 10000 },
    { model = 'vwe_yankee3', price = 10000 },
    { model = 'vwe_yosemite1', price = 10000 },
    { model = 'vwe_yosemite2', price = 10000 },
    { model = 'vwe_yosemite3', price = 10000 },
    { model = 'vwe_yosemite4', price = 10000 },
    { model = 'vwe_yosemite5', price = 10000 },
    { model = 'vwe_yosemitexl1', price = 10000 },
    { model = 'vwe_yosemitexl2', price = 10000 },
    { model = 'vwe_youga1', price = 10000 },
    { model = 'vwe_zion1', price = 10000 },
    { model = 'vwe_zion2', price = 10000 },
    { model = 'vwe_zr1501', price = 10000 },
    { model = 'vwe_zr3501', price = 10000 },
    { model = 'vwe_zr3801', price = 10000 }, 
};

config.carNames = {
    ["vwe_550ss"] = 'Declasse 550ss',
    ["vwe_adder1"] = 'Truffade Adder',
    ["vwe_admiral1"] = 'Benefac Admiral',
    ["vwe_alamo1"] = 'Declasse Alamo',
    ["vwe_alamo2"] = 'Declasse Alamo',
    ["vwe_alamo3"] = 'Declasse Alamo',
    ["vwe_annihilator1"] = 'Annihilator',
    ["vwe_ardent1"] = 'Ocelot Ardent',
    ["vwe_argento1"] = 'Obey Argento',
    ["vwe_ariant1"] = 'Karin Ariant',
    ["vwe_armordillo1"] = 'Hvy Armordillo',
    ["vwe_banshee1"] = 'Bravado Banshee',
    ["vwe_barracks1"] = 'Barracks',
    ["vwe_benson1"] = 'Vapid Benson',
    ["vwe_besra1"] = 'Western Besra',
    ["vwe_bfinjection1"] = 'Bf Bfinjection',
    ["vwe_biff1"] = 'Hvy Biff',
    ["vwe_biff2"] = 'Hvy Biff',
    ["vwe_bison1"] = 'Bravado Bison',
    ["vwe_bison2"] = 'Bravado Bison',
    ["vwe_blade1"] = 'Vapid Blade',
    ["vwe_blazer1"] = 'Nagasaki Blazer',
    ["vwe_boattrailer1"] = 'Boattrailer',
    ["vwe_bobcat1"] = 'Vapid Bobcat',
    ["vwe_bobcat2"] = 'Vapid Bobcat',
    ["vwe_bobcat3"] = 'Vapid Bobcat',
    ["vwe_bobcatxl1"] = 'Vapid Bobcatxl',
    ["vwe_bobcatxl2"] = 'Vapid Bobcatxl',
    ["vwe_bobcatxl3"] = 'Vapid Bobcatxl',
    ["vwe_boxville1"] = 'Brute Boxville',
    ["vwe_boxville2"] = 'Brute Boxville',
    ["vwe_brigham1"] = 'Declasse Brigham',
    ["vwe_buffalo1"] = 'Bravado Buffalo',
    ["vwe_buffalo2"] = 'Bravado Buffalo',
    ["vwe_buffalo3"] = 'Bravado Buffalo',
    ["vwe_buffalo4"] = 'Bravado Buffalo',
    ["vwe_buffalo5"] = 'Bravado Buffalo',
    ["vwe_buffalo6"] = 'Bravado Buffalo',
    ["vwe_buffalo7"] = 'Bravado Buffalo',
    ["vwe_burrito1"] = 'Declasse Burrito',
    ["vwe_burrito2"] = 'Declasse Burrito',
    ["vwe_bus1"] = 'Bus',
    ["vwe_caddy1"] = 'Caddy',
    ["vwe_caracara1"] = 'Vapid Caracara',
    ["vwe_cartrailer1"] = 'Cartrailer',
    ["vwe_cartrailer2"] = 'Cartrailer',
    ["vwe_castella1"] = 'Shitzu Castella',
    ["vwe_cavalcade1"] = 'Albany Cavalcade',
    ["vwe_cbus1"] = 'Cbus',
    ["vwe_cerberus1"] = 'Mtl Cerberus',
    ["vwe_cerberus2"] = 'Mtl Cerberus',
    ["vwe_cerberus3"] = 'Mtl Cerberus',
    ["vwe_cerberus4"] = 'Mtl Cerberus',
    ["vwe_cerberus5"] = 'Mtl Cerberus',
    ["vwe_cheetah1"] = 'Grotti Cheetah',
    ["vwe_club1"] = 'Bf Club',
    ["vwe_cogcabrio1"] = 'Enus Cogcabrio',
    ["vwe_cognoscenti1"] = 'Enus Cognoscenti',
    ["vwe_comet1"] = 'Pfister Comet',
    ["vwe_comet2"] = 'Pfister Comet',
    ["vwe_contender1"] = 'Vapid Contender',
    ["vwe_contender2"] = 'Vapid Contender',
    ["vwe_contender3"] = 'Vapid Contender',
    ["vwe_contender4"] = 'Vapid Contender',
    ["vwe_contender5"] = 'Vapid Contender',
    ["vwe_coquette1"] = 'Inverto Coquette',
    ["vwe_coquette2"] = 'Inverto Coquette',
    ["vwe_coquette3"] = 'Inverto Coquette',
    ["vwe_coyote1"] = 'Vapid Coyote',
    ["vwe_coyote2"] = 'Vapid Coyote',
    ["vwe_deluxo1"] = 'Imponte Deluxo',
    ["vwe_dingo1"] = 'Cheval Dingo',
    ["vwe_dingo2"] = 'Cheval Dingo',
    ["vwe_dloader1"] = 'Bravado Dloader',
    ["vwe_dominator1"] = 'Vapid Dominator',
    ["vwe_dubsta1"] = 'Benefac Dubsta',
    ["vwe_dukes1"] = 'Imponte Dukes',
    ["vwe_elegy1"] = 'Annis Elegy',
    ["vwe_elegy2"] = 'Annis Elegy',
    ["vwe_elena1"] = 'Ocelot Elena',
    ["vwe_esperanto1"] = 'Albany Esperanto',
    ["vwe_euphoria1"] = 'Ocelot Euphoria',
    ["vwe_euros1"] = 'Annis Euros',
    ["vwe_executioner1"] = 'Vapid Executioner',
    ["vwe_executioner2"] = 'Vapid Executioner',
    ["vwe_executioner3"] = 'Vapid Executioner',
    ["vwe_feroci1"] = 'Bravado Feroci',
    ["vwe_flatbed1"] = 'Mtl Flatbed',
    ["vwe_fugitive1"] = 'Cheval Fugitive',
    ["vwe_glendale1"] = 'Benefac Glendale',
    ["vwe_glendale2"] = 'Kriegers Glendale',
    ["vwe_golem1"] = 'Western Golem',
    ["vwe_granger1"] = 'Declasse Granger',
    ["vwe_granger2"] = 'Declasse Granger',
    ["vwe_granger3"] = 'Declasse Granger',
    ["vwe_granger4"] = 'Declasse Granger',
    ["vwe_greenwood1"] = 'Schyster Greenwood',
    ["vwe_gresley1"] = 'Bravado Gresley',
    ["vwe_hachura1"] = 'Vulcar Hachura',
    ["vwe_hades1"] = 'Zirconiu Hades',
    ["vwe_hauler1"] = 'Jobuilt Hauler',
    ["vwe_haulmaster1"] = 'Jobuilt Haulmaster',
    ["vwe_haulmaster2"] = 'Jobuilt Haulmaster',
    ["vwe_hellion1"] = 'Annis Hellion',
    ["vwe_infernus1"] = 'Pegassi Infernus',
    ["vwe_infernus2"] = 'Pegassi Infernus',
    ["vwe_issi1"] = 'Weeny Issi',
    ["vwe_jester1"] = 'Dinka Jester',
    ["vwe_journey1"] = 'Zirconiu Journey',
    ["vwe_juggernaut1"] = 'Jobuilt Juggernaut',
    ["vwe_kenshin1"] = 'Nagasaki Kenshin',
    ["vwe_kuroi1"] = 'Dinka Kuroi',
    ["vwe_kuruma1"] = 'Karin Kuruma',
    ["vwe_landroamer1"] = 'Dundreary Landroamer',
    ["vwe_lazer1"] = 'Lazer',
    ["vwe_limo1"] = 'Benefac Limo',
    ["vwe_longpath1"] = 'Jobuilt Longpath',
    ["vwe_majimagt1"] = 'Annis Majimagt',
    ["vwe_mammatus1"] = 'Mammatus',
    ["vwe_maverick1"] = 'Maverick',
    ["vwe_merit1"] = 'Declasse Merit',
    ["vwe_mesa1"] = 'Canis Mesa',
    ["vwe_mesa2"] = 'Canis Mesa',
    ["vwe_meteor1"] = 'Pfister Meteor',
    ["vwe_mf1"] = 'Progen Mf',
    ["vwe_mf12"] = 'Progen Mf',
    ["vwe_minivan1"] = 'Vapid Minivan',
    ["vwe_mixer1"] = 'Brute Mixer',
    ["vwe_molecule1"] = 'Maxwell Molecule',
    ["vwe_monroe1"] = 'Pegassi Monroe',
    ["vwe_moonbeam1"] = 'Declasse Moonbeam',
    ["vwe_mule1"] = 'Maibatsu Mule',
    ["vwe_mule2"] = 'Maibatsu Mule',
    ["vwe_mule3"] = 'Maibatsu Mule',
    ["vwe_mule4"] = 'Maibatsu Mule',
    ["vwe_nebula1"] = 'Vulcar Nebula',
    ["vwe_nebula2"] = 'Vulcar Nebula',
    ["vwe_niner1"] = 'Obey Niner',
    ["vwe_packer1"] = 'Mtl Packer',
    ["vwe_panto1"] = 'Benefac Panto',
    ["vwe_patriot1"] = 'Mammoth Patriot',
    ["vwe_patriot2"] = 'Mammoth Patriot',
    ["vwe_phantom1"] = 'Jobuilt Phantom',
    ["vwe_picador1"] = 'Cheval Picador',
    ["vwe_picador2"] = 'Cheval Picador',
    ["vwe_pony1"] = 'Brute Pony',
    ["vwe_pony2"] = 'Brute Pony',
    ["vwe_pounder1"] = 'Mtl Pounder',
    ["vwe_radi1"] = 'Vapid Radi',
    ["vwe_raider1"] = 'Karin Raider',
    ["vwe_ramptruck1"] = 'Declasse Ramptruck',
    ["vwe_ramptruck2"] = 'Vapid Ramptruck',
    ["vwe_rancher1"] = 'Declasse Rancher',
    ["vwe_rancher2"] = 'Declasse Rancher',
    ["vwe_rancher3"] = 'Declasse Rancher',
    ["vwe_rancherxl1"] = 'Declasse Rancherxl',
    ["vwe_ratloader1"] = 'Bravado Ratloader',
    ["vwe_razor1"] = 'Vapid Razor',
    ["vwe_rebel1"] = 'Karin Rebel',
    ["vwe_rebel2"] = 'Karin Rebel',
    ["vwe_rebel3"] = 'Karin Rebel',
    ["vwe_rebel4"] = 'Karin Rebel',
    ["vwe_recursion1"] = 'Bravado Recursion',
    ["vwe_regina1"] = 'Dundrear Regina',
    ["vwe_riata1"] = 'Vapid Riata',
    ["vwe_riata2"] = 'Vapid Riata',
    ["vwe_riata3"] = 'Vapid Riata',
    ["vwe_roadkiller1"] = 'Brute Roadkiller',
    ["vwe_rom1"] = 'Rom',
    ["vwe_ruiner1"] = 'Imponte Ruiner',
    ["vwe_ruiner2"] = 'Imponte Ruiner',
    ["vwe_rumpo1"] = 'Bravado Rumpo',
    ["vwe_rumpo2"] = 'Bravado Rumpo',
    ["vwe_s2301"] = 'Annis S',
    ["vwe_sabot1"] = 'Vapid Sabot',
    ["vwe_sadler1"] = 'Vapid Sadler',
    ["vwe_sadler2"] = 'Vapid Sadler',
    ["vwe_sadler3"] = 'Vapid Sadler',
    ["vwe_sadler4"] = 'Vapid Sadler',
    ["vwe_sadler5"] = 'Vapid Sadler',
    ["vwe_sadler6"] = 'Vapid Sadler',
    ["vwe_sadler7"] = 'Vapid Sadler',
    ["vwe_sandking1"] = 'Vapid Sandking',
    ["vwe_sandking2"] = 'Vapid Sandking',
    ["vwe_savestra1"] = 'Annis Savestra',
    ["vwe_sbus1"] = 'Sbus',
    ["vwe_sbus2"] = 'Brute Sbus',
    ["vwe_scamp1"] = 'Mammoth Scamp',
    ["vwe_scout1"] = 'Vapid Scout',
    ["vwe_schwartzer1"] = 'Benefac Schwartzer',
    ["vwe_schwartzer2"] = 'Benefac Schwartzer',
    ["vwe_seminole1"] = 'Canis Seminole',
    ["vwe_seminole2"] = 'Canis Seminole',
    ["vwe_sentinel1"] = 'Ubermach Sentinel',
    ["vwe_seraph1"] = 'Ubermach Seraph',
    ["vwe_serena1"] = 'Dinka Serena',
    ["vwe_sigma2"] = 'Karin Sigma',
    ["vwe_sigma3"] = 'Karin Sigma',
    ["vwe_slamvan1"] = 'Vapid Slamvan',
    ["vwe_slasher1"] = 'Western Slasher',
    ["vwe_slave1"] = 'Western Slave',
    ["vwe_sparrow1"] = 'Sparrow',
    ["vwe_speedo1"] = 'Vapid Speedo',
    ["vwe_speedo2"] = 'Vapid Speedo',
    ["vwe_spirit1"] = 'Western Spirit',
    ["vwe_spritzer1"] = 'Benefac Spritzer',
    ["vwe_squaddie1"] = 'Mammoth Squaddie',
    ["vwe_squaddie2"] = 'Mammoth Squaddie',
    ["vwe_stanier1"] = 'Vapid Stanier',
    ["vwe_stdstanier1"] = 'Vapid Stdstanier',
    ["vwe_steed1"] = 'Vapid Steed',
    ["vwe_steed2"] = 'Vapid Steed',
    ["vwe_steed3"] = 'Vapid Steed',
    ["vwe_stockade1"] = 'Brute Stockade',
    ["vwe_stratum1"] = 'Zirconiu Stratum',
    ["vwe_stratum2"] = 'Zircoflow Stratum',
    ["vwe_streiter1"] = 'Benefactor Streiter',
    ["vwe_stretch1"] = 'Albany Stretch',
    ["vwe_sultan1"] = 'Karin Sultan',
    ["vwe_sultan2"] = 'Karin Sultan',
    ["vwe_sultanrs1"] = 'Karin SultanRS',
    ["vwe_sultanrs2"] = 'Karin SultanRS',
    ["vwe_sultanrs3"] = 'Karin SultanRS',
    ["vwe_supergts1"] = 'Dewbauch Supergts',
    ["vwe_surano1"] = 'Benefac Surano',
    ["vwe_surfer1"] = 'Bf Surfer',
    ["vwe_surge1"] = 'Cheval Surge',
    ["vwe_tachyon1"] = 'Hijak Tachyon',
    ["vwe_tailgater1"] = 'Obey Tailgater',
    ["vwe_tailgater2"] = 'Obey Tailgater',
    ["vwe_tailgater3"] = 'Obey Tailgater',
    ["vwe_tampa1"] = 'Declasse Tampa',
    ["vwe_tanker1"] = 'Tanker',
    ["vwe_tanker2"] = 'Tanker',
    ["vwe_taxi1"] = 'Taxi',
    ["vwe_templar1"] = 'Lcc Templar',
    ["vwe_torrence1"] = 'Vapid Torrence',
    ["vwe_towtruck1"] = 'Mtl Towtruck',
    ["vwe_tr1"] = 'Tr',
    ["vwe_tractor1"] = 'Stanley Tractor',
    ["vwe_trailers1"] = 'Trailers',
    ["vwe_trailers2"] = 'Trailers',
    ["vwe_trailers3"] = 'Trailers',
    ["vwe_trailercast1"] = 'Albany Trailercast',
    ["vwe_trailerdump1"] = 'Trailerdump',
    ["vwe_trailerdump2"] = 'Trailerdump',
    ["vwe_trailerdump3"] = 'Trailerdump',
    ["vwe_trailerlogs1"] = 'Trailerlogs',
    ["vwe_trash1"] = 'Brute Trash',
    ["vwe_tulip1"] = 'Declasse Tulip',
    ["vwe_turismo1"] = 'Grotti Turismo',
    ["vwe_tyrus1"] = 'Progen Tyrus',
    ["vwe_uranus1"] = 'Vapid Uranus',
    ["vwe_urban1"] = 'Dinka Urban',
    ["vwe_utillitruck1"] = 'Vapid Utillitruck',
    ["vwe_utillitruck2"] = 'Vapid Utillitruck',
    ["vwe_utillitruck3"] = 'Vapid Utillitruck',
    ["vwe_ventoso1"] = 'Dinka Ventoso',
    ["vwe_verin1"] = 'Lcc Verin',
    ["vwe_vertice1"] = 'Hijak Vertice',
    ["vwe_vesper1"] = 'Dewbauch Vesper',
    ["vwe_vigero1"] = 'Declasse Vigero',
    ["vwe_vincent1"] = 'Maibatsu Vincent',
    ["vwe_voodoo1"] = 'Declasse Voodoo',
    ["vwe_vorstand1"] = 'Ubermach Vorstand',
    ["vwe_warrener1"] = 'Vulcar Warrener',
    ["vwe_washington1"] = 'Albany Washington',
    ["vwe_watertanker1"] = 'Watertanker',
    ["vwe_wintergreen1"] = 'Western Wintergreen',
    ["vwe_yankee1"] = 'Vapid Yankee',
    ["vwe_yankee2"] = 'Vapid Yankee',
    ["vwe_yankee3"] = 'Vapid Yankee',
    ["vwe_yosemite1"] = 'Declasse Yosemite',
    ["vwe_yosemite2"] = 'Declasse Yosemite',
    ["vwe_yosemite3"] = 'Declasse Yosemite',
    ["vwe_yosemite4"] = 'Declasse Yosemite',
    ["vwe_yosemite5"] = 'Declasse Yosemite',
    ["vwe_yosemitexl1"] = 'Declasse Yosemitexl',
    ["vwe_yosemitexl2"] = 'Declasse Yosemitexl',
    ["vwe_youga1"] = 'Bravado Youga',
    ["vwe_zion1"] = 'Ubermach Zion',
    ["vwe_zion2"] = 'Kriegers Zion',
    ["vwe_zr1501"] = 'Annis Zr',
    ["vwe_zr3501"] = 'Annis Zr',
    ["vwe_zr3801"] = 'Annis Zr'
}; for k,v in pairs(config.carNames) do config.carNames[GetHashKey(k)] = v; end

config.buyableCars = {};

for i,v in ipairs(config.allCars) do 
    if (not v.ignore or v.ignore ~= true) then 
        table.insert(config.buyableCars, v);
    end 
end 

function getAllVehicles()
    return config.allCars;
end 
exports("getAllVehicles", getAllVehicles)

function getVehiclePrice(modelOrHash)
    local hash = (type(modelOrHash) == "string" and GetHashKey(modelOrHash) or modelOrHash);

    if (hash) then 
        for i,v in ipairs(config.allCars) do 
            if (GetHashKey(v.model) == hash) then 
                return v.price;
            end 
        end 
    end 

    return 25000;
end 
exports("getVehiclePrice", getVehiclePrice);

function getVehicleName(modelOrHash)
    return (modelOrHash and config.carNames[modelOrHash])
                and config.carNames[modelOrHash]
                or "NULL";
end 
exports("getVehicleName", getVehicleName);