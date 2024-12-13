FACTION.name = "Advisoral Council"
FACTION.description = "The Advisors, are a race of alien beings responsible for overseeing the Combine occupation of Earth."
FACTION.color = Color(50, 100, 150)
FACTION.pay = 0
FACTION.models = {"models/advisor.mdl"}	
FACTION.isDefault = false
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true

function FACTION:GetDefaultName(client)
	return "CMB:S9.ADVISOR." .. Schema:ZeroNumber(math.random(1, 999), 5), true
end


FACTION_ADVISOR = FACTION.index