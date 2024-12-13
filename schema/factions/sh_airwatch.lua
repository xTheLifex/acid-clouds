FACTION.name = "Airwatch"
FACTION.description = "The Airwatch is responsible for aerial support and surveillance operations for Overwatch forces. It coordinates units such as City Scanners, Gunships, Dropships, and Hunter-Choppers to provide reconnaissance, reinforcements, and tactical advantages during operations. While it does not directly command all Overwatch forces or Citizens, Airwatch plays a critical role in supporting Combine dominance and maintaining control over Earth."
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