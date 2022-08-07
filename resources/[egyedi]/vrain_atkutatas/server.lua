ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('robo:jugador')
AddEventHandler('robo:jugador', function(targetid, playerheading, playerCoords,  playerlocation)
	_source = source
	TriggerClientEvent('robo:getarrested', targetid, playerheading, playerCoords, playerlocation)
	TriggerClientEvent('robo:doarrested', _source)
end)

exports.vAdmin:addCommand(
	"atkutat", 
	{
		required = { admin = 0, off_admin = 0 },
		args = { },
	}, 
	function(player)
		TriggerClientEvent("robo::doshit", player.__netId);
	end 
);