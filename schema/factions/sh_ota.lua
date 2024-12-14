FACTION.name = "Overwatch Transhuman Arm"
FACTION.description = "The Overwatch Transhuman Arm is the primary force of The Combine on Earth."
FACTION.color = Color(150, 20, 0)
FACTION.abbreviation = "OTA"
FACTION.models = {
	"models/combine_soldier.mdl"
}
FACTION.runSounds = {[0] = "NPC_CombineS.RunFootstepLeft", [1] = "NPC_CombineS.RunFootstepRight"}

function FACTION:GetDefaultName(ply)
	local callsign = utils.Pick({"LEADER", "FLASH", "RANGER", "HUNTER", "BLADE", "SCAR", "HAMMER", "SWEEPER", "SWIFT", "FIST", "SWORD", "SAVAGE", "TRACKER", "SLASH", "RAZOR", "STAB", "SPEAR", "STRIKER", "DAGGER"})
	local shortnum = math.random(1,9)
	local identifier = Schema:ZeroNumber(math.random(1000, 9999), 4)
	return string.format("OTA:S9.TS.%s-%s:%s", callsign, shortnum, identifier), true
end

function FACTION:GetDeathSound(ply)
	return "npc/combine_soldier/die" .. math.random(1, 3) .. ".wav"
end

function FACTION:GetPainSound(ply)
	return "npc/combine_soldier/pain" .. math.random(1, 3) .. ".wav"
end

FACTION_OTA = FACTION.index
