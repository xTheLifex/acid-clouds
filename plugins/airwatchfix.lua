local PLUGIN = PLUGIN

PLUGIN.name = "Airwatch Fix"
PLUGIN.author = "RetroMato"
PLUGIN.description = "Makes scanners fly."

function PLUGIN:PlayerLoadedCharacter(client, character)
	local faction = character:GetFaction()
	if faction == FACTION_AIRWATCH then
		client:SetMoveType(4)
	else
		client:SetMoveType(2)
	end
end

function PLUGIN:PlayerSpawn(client)
	local character = client:GetCharacter()
	if faction == FACTION_AIRWATCH then
		client:SetMoveType(4)
	else
		client:SetMoveType(2)
	end
end