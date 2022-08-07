Config = {}

Config.fishwebhook = 'https://discord.com/api/webhooks/967814384577544322/i5SVcf5M3SSvNCcm0Kn3Ek4aOxwSHP38uCepapqEqa53Rc4NGv8uueLDkXW5XDiBDppu' --Caught fishes -log
Config.sellwebhook = 'https://discord.com/api/webhooks/967814423706226708/9i27V953SKHk1oSURyBEBj8WNo9X_QviRY7BjhPtxvTptBaNVOqiNEdIEkszHRtRoXlN' --Shopselling -log
Config.licenses = false --Set to false if you do not use esx_license, this is used to add fishing licenses(permits) for players.

Config.sellitemprices = { --You can add here other stuff too if you i.e add more variety of fishes
  pike = 70,
  bream = 55,
  pike_berch = 85,
  salmon = 80,
  trout = 75,
  cod = 60,
  herring = 55,
}

Config.fishes = {
 --Here are some examples, you can add unlimited brackets
  [1] = { 
    { itemName = 'pike', howmany = 1, type = 'item'},
  },
  
  [2] = { 
    { itemName = 'bream', howmany = 1, type = 'item'},
  },

  [3] = {
    { itemName = 'pike_berch', howmany = 1, type = 'item'},
  },

  [4] = {
    { itemName = 'salmon', howmany = 1, type = 'item'},
  },

  [5] = {
    { itemName = 'trout', howmany = 1, type = 'item'},
  },

  [6] = {
    { itemName = 'cod', howmany = 1, type = 'item'},
  },

  [7] = {
    { itemName = 'herring', howmany = 1, type = 'item'},
  },
}