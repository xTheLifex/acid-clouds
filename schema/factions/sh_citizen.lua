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

FACTION_CITIZEN = FACTION.index