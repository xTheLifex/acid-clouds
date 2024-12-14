FACTION.name = "Civil Protection"
FACTION.description = "The Civil Protection is the police force responsible for law enforcement of The Combine."
FACTION.color = Color(20, 120, 185)
FACTION.abbreviation = "CP"
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true
FACTION.pay = 25

FACTION.models = {
	"models/ez2npc/police.mdl"
}

FACTION.skin = 0

ix.anim.SetModelClass("models/ez2npc/police.mdl", "metrocop")

FACTION.taglines = {
	"union",
    "defender",
    "hero",
    "jury",
    "king",
    "line",
    "quick",
    "roller",
    "stick",
    "tap",
    "victor",
	"xray"
}

player_manager.AddValidModel("ixCPF", "models/ez2npc/police.mdl")
player_manager.AddValidHands("ixCPF", "models/weapons/c_metrocop_hands.mdl", 0, "00000000")

function FACTION:GetDefaultName(ply)
	return "CP:C9.RCT." .. string.upper(self.taglines[math.random(1, #self.taglines)]) .. ":" .. Schema:ZeroNumber(math.random(100, 999), 3), true
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

function FACTION:ModifyPlayerStep(ply, data)
	if not ( IsValid(ply) ) then
		return
	end

	local char = ply:GetCharacter()

	if not ( char ) then
		return
	end

	if ( data.ladder or data.submerged ) then
		return
	end

	local extraSounds = {}

	data.snd = string.Replace(data.snd, ".stepright", "")
	data.snd = string.Replace(data.snd, ".stepleft", "")

	for i = 1, 4 do
		extraSounds[#extraSounds + 1] = "player/footsteps/" .. data.snd .. i .. ".wav"
	end

	for _, v in ipairs(extraSounds) do
		EmitSound(v, ply:GetPos(), ply:EntIndex(), CHAN_AUTO, data.volume * (data.running and 0.5 or 0.4))
	end

	data.snd = "npc/metropolice/gear" .. math.random(1, 4) .. ".wav"
	data.volume = data.volume * (data.running and 0.5 or 0.4)
end

FACTION_CP = FACTION.index
