local PLUGIN = PLUGIN

PLUGIN.name = "Advisor Fix"
PLUGIN.author = "DoopieWop"
PLUGIN.description = "Makes advisors fly."

function PLUGIN:PlayerLoadedCharacter(client, character)
	local faction = character:GetFaction()
	if faction == FACTION_ADVISOR then
		client:SetMoveType(4)
	else
		client:SetMoveType(2)
	end
end

function PLUGIN:PlayerSpawn(client)
	local character = client:GetCharacter()
	if faction == FACTION_ADVISOR then
		client:SetMoveType(4)
	else
		client:SetMoveType(2)
	end
end