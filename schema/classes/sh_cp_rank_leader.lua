CLASS.name = "Rank Leader"
CLASS.faction = FACTION_CP
CLASS.isDefault = false
function CLASS:OnSet(ply)
    local char = ply:GetCharacter()

    if not ( char ) then
        return
    end

    ply:SetModel("models/ez2npc/police.mdl")
    ply:SetSkin("1")
end
function CLASS:CanSwitchTo(client)
    if tonumber(client:GetCharacter():GetRank()) == 4 then
        return true
    else
        return false
    end
end

CLASS_CP_RANK_LEADER = CLASS.index