FACTION.name = "Civil Protection"
FACTION.description = "The Civil Protection is the police force responsible for law enforcement of The Combine."
FACTION.color = Color(20, 120, 185)
FACTION.abbreviation = "CP"
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true
FACTION.pay = 25
FACTION.isDefault = false
FACTION.models = {
	"models/ez2npc/police.mdl"
}

FACTION.skin = 0
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}
FACTION.walkSounds = {[0] = "NPC_MetroPolice.FootstepLeft", [1] = "NPC_MetroPolice.FootstepRight"}

ix.anim.SetModelClass("models/ez2npc/police.mdl", "metrocop")

player_manager.AddValidModel("ixCPF", "models/ez2npc/police.mdl")
player_manager.AddValidHands("ixCPF", "models/weapons/c_metrocop_hands.mdl", 0, "00000000")

function FACTION:GetDefaultName(ply)
	local callsign = utils.Pick({ "FLASH", "RANGER", "HUNTER", "BLADE", "SCAR", "HAMMER", "SWEEPER", "SWIFT", "FIST", "SWORD", "SAVAGE", "TRACKER", "SLASH", "RAZOR", "STAB", "SPEAR", "STRIKER", "DAGGER" })
	local shortnum = math.random(1,9)
	local identifier = Schema:ZeroNumber(math.random(100, 999), 3)

	return string.format("CP:C9.RCT.%s-%s:%s", callsign, shortnum, identifier), true
end

function FACTION:GetDeathSound(ply)
	if not ( IsValid(ply) ) then
		return
	end

	return "npc/metropolice/die" .. math.random(1, 4) .. ".wav"
end

function FACTION:GetPainSound(ply)
	if not ( IsValid(ply) ) then
		return
	end

	return "npc/metropolice/pain" .. math.random(1, 4) .. ".wav"
end

function FACTION:OnCharacterCreated(ply, char)
	if not ( IsValid(ply) ) then
		return
	end

	if not ( char ) then
		return
	end

	char:SetClass(CLASS_CP_RECRUIT)
	char:SetRank(RANK_CP_RECRUIT)

	char:SetData("permaClass", char:GetClass())
	char:SetData("permaRank", char:GetRank())
end


FACTION_MPF = FACTION.index
