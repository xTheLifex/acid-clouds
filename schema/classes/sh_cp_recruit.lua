CLASS.name = "Recruit"
CLASS.faction = FACTION_CP
CLASS.isDefault = false
function CLASS:CanSwitchTo(client)
    if tonumber(client:GetCharacter():GetRank()) == 1 then
        return true
    else
        return false
    end
end

CLASS_CP_RECRUIT = CLASS.index