Config = {}

-- Script locale (only .Lua)
Config.Locale = 'en'

Config.FixePhone = {
}

Config.KeyOpenClose = 288 -- F1
Config.KeyTakeCall  = 38  -- E

Config.UseMumbleVoIP = true -- Use Frazzle's Mumble-VoIP Resource (Recommended!) https://github.com/FrazzIe/mumble-voip
Config.UseTokoVoIP   = false

Config.ShowNumberNotification = false -- Show Number or Contact Name when you receive new SMS

Config.ShareRealtimeGPSDefaultTimeInMs = 1000 * 60 -- Set default realtime GPS sharing expiration time in milliseconds
Config.ShareRealtimeGPSJobTimer = 10 -- Default Job GPS Timer (Minutes)

-- Optional Features (Can all be set to true or false.)
Config.ItemRequired = true -- If true, must have the item "phone" to use it.
Config.NoPhoneWarning = false -- If true, the player is warned when trying to open the phone that they need a phone. To edit this message go to the locales for your language.

-- Optional Discord Logging
Config.UseTwitterLogging = false -- Set the Discord webhook in twitter.lua line 284