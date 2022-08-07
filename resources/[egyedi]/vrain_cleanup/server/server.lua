RegisterCommand(Config.commandName, function(source, args, rawCommand) TriggerClientEvent("delallveh", -1) end, Config.restricCommand)


function CleanUpCronTask(d, h, m)
  TriggerClientEvent("delallveh", -1)
end

TriggerEvent('cron:runAt', 0, 00, CleanUpCronTask)     ---- Edit all these lines or add more 0, 30 means the first cleanup will be done at 00:30 server time
TriggerEvent('cron:runAt', 3, 00, CleanUpCronTask)
TriggerEvent('cron:runAt', 6, 00, CleanUpCronTask)
TriggerEvent('cron:runAt', 9, 00, CleanUpCronTask)
TriggerEvent('cron:runAt', 12, 00, CleanUpCronTask)
TriggerEvent('cron:runAt', 15, 00, CleanUpCronTask)
TriggerEvent('cron:runAt', 18, 00, CleanUpCronTask)
TriggerEvent('cron:runAt', 21, 00, CleanUpCronTask)
