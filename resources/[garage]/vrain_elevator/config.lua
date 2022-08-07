Config = {}

Config.Locale = 'en'

Config.AllowSounds = true

Config.MarkerSize = 0.65
Config.MarkerColor = {
    R = 0,
    B = 195,
    G = 255,
    A = 204 -- to convert from range (0,1) to (0,255), simply multiply by 255
}
Config.Lifts = {
    { vector3(605.09143066406,6.3231868743896,97.872467041016), vector3(566.56066894531,5.0387086868286,103.23321533203) } -- Police Building
    
}

--[[
    from bottom to top (floor)
    Config.Lifts = {
        {vector3 - floor1, vector3 - floor2, ... - floorN}, - lift1
        {vector3, vector3, vector3, ...}, - lift2
        ...,
    }
]]