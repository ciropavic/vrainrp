Config = {}

-------------------------- COMMANDS & FUNCTIONALITY

Config.FeedbackClientCommand = 'report' -- The command that the players use to report something

Config.FeedbackAdminCommand = 'reportlist' -- The command that the admins use to check the pendent feedbacks list

Config.FeedbackCooldown = 0.5 -- Time in minutes

-------------------------- ADMIN PERMISSIONS

Config.ESX = true -- Set this to true if you use ESX 

-- If you use ESX you don't need to add any identifier to Config.AdminList because it checks if you have permission by your player group (superadmin, admin, mod)

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.AdminList = {
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 13

Config.BotName = 'VRAIN REPORT' -- Write the desired bot name

Config.ServerName = 'VRAIN ROLEPLAY' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.NewFeedbackWebhookColor = '65352'

Config.AssistFeedbackWebhookColor = '16127'

Config.ConcludeFeedbackWebhookColor = '16711680'

-- ok? okok