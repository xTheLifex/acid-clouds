CLASS.name = "Rogue"
CLASS.faction = FACTION_CP
CLASS.isDefault = false

function CLASS:OnSet(ply)
    local char = ply:GetCharacter()

    if not ( char ) then
        return
    end

    ply:SetModel("models/uprising_npcs/traitorcop_npc.mdl")
end


CLASS_CP_ROGUE = CLASS.index