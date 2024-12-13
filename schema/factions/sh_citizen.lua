FACTION.name = "Citizen"
FACTION.description = "The citizens are oppressed an oppressed group that have not joined the resistance nor serving the combine."
FACTION.isDefault = true
FACTION.color = Color(0, 100, 50)
FACTION.abbreviation = "Citizen"
FACTION.canSeeWaypoints = false
FACTION.canAddWaypoints = false
FACTION.canRemoveWaypoints = false
FACTION.canUpdateWaypoints = false
FACTION.pay = 10

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("suitcase", 1)
	inventory:Add("cid", 1, {
		name = character:GetName(),
		id = id
	})
end

FACTION_CITIZEN = FACTION.index