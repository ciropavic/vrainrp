local GetCurrentResourceName = GetCurrentResourceName()
local ox_inventory = exports.ox_inventory

-- These stashes are all created on resource start
local stashes = {
	{
		-- Police stash
		id = 'lefoglaltak',
		label = 'Lefoglaltak',
		slots = 500,
		weight = 9000000,
		owner = false,
		jobs = 'police'
	},
	{
		-- Police stash
		id = 'lefoglaltak_sheriff',
		label = 'Lefoglaltak',
		slots = 500,
		weight = 9000000,
		owner = false,
		jobs = 'sheriff'
	},
}

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
		for i=1, #stashes do
			local stash = stashes[i]
			ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight, stash.owner, stash.jobs)
		end
	end
end)

-- Register this stash only when this event is called
RegisterNetEvent('ox:lazyStash', function()
	ox_inventory:RegisterStash('lazyStash', 'Stash', 20, 20000, true)
end)