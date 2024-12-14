CLASS.name = "Rank Captain"
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
    if tonumber(client:GetCharacter():GetRank()) == 5 then
        return true
    else
        return false
    end
end

CLASS_CP_RANK_CAPTAIN = CLASS.index