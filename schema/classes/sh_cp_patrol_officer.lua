CLASS.name = "Patrol Officer"
CLASS.faction = FACTION_CP
CLASS.isDefault = false
function CLASS:CanSwitchTo(client)
    if tonumber(client:GetCharacter():GetRank()) == 2 then
        return true
    else
        return false
    end
end

CLASS_CP_PATROL_OFFICER = CLASS.index