FACTION.name = "City Administration"
FACTION.description = "Human Administrators advised by the Combine."
FACTION.isDefault = false
FACTION.color = Color(255, 200, 70, 255)
FACTION.abbreviation = "CA"
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = false
FACTION.canUpdateWaypoints = false
FACTION.pay = 75
FACTION.models = {
	"models/taggart/gallahan.mdl",
	"models/humans/suitfem/female_02.mdl",
	"models/player/female_02_suit.mdl"
}

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("cid", 1, {
		name = character:GetName(),
		id = id
	})
end

function FACTION:ModifyPlayerStep(ply, data)
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

	data.snd = "npc/footsteps/hardboot_generic" .. math.random(1, 6) .. ".wav"
	data.volume = data.volume * (data.running and 0.5 or 0.4)
end

FACTION_ADMIN = FACTION.index
