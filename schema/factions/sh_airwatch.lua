FACTION.name = "Airwatch"
FACTION.description = "The Airwatch is tasked with commanding all overwatch forces on the earth, as well as giving orders to Citizens. It's role also offers significant insight into the inner workings of the Combine."
FACTION.color = Color(237, 109, 55)
FACTION.abbreviation = "AW"
FACTION.pay = 0
FACTION.models = {"models/combine_scanner.mdl"}	
FACTION.isDefault = false
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true

function FACTION:GetDefaultName(client)
	return "AW:S9.SCANNER." .. Schema:ZeroNumber(math.random(1, 999), 5), true
end


FACTION_AW = FACTION.index