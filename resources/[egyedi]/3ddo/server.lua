-- ## 3ddo : server side

-- Command
RegisterCommand('do', function(source, args)
    local text = "* " .. Languages[Config.language].prefix .. table.concat(args, " ") .. " *"
    TriggerClientEvent('3ddo:shareDisplay', -1, text, source)
end)
