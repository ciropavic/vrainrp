Config = {}

Config.Path = "resources/[egyedi]/vrain_perms/Permissions/" -- path to the JD_perms.cfg file.

Config.AdminPerm = "vraincommand.giveperms" -- Ace permission needed to run the /addperms and /delperms command.

Config.StaffGroups = {
    'tulajdonos',
    'fejleszto',
    'superadmin',
    'foadminisztrator',
    'community',
    'szenioradminisztrator',
    'admin',
    'adminseged'
    
}

Config.DonatorGroups = {
}

-- Config for Logs
Config.JD_logs = false -- Works with JD_logs (https://github.com/JokeDevil/JD_logs)
Config.JD_logsChannel = "perms"
Config.JD_logsColor = "#FFFFFF"

Config.versionCheck = "1.1.0b"