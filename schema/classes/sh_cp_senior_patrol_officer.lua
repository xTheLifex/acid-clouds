CLASS.name = "Senior Patrol Officer"
CLASS.faction = FACTION_CP
CLASS.isDefault = false
function CLASS:CanSwitchTo(client)
    if tonumber(client:GetCharacter():GetRank()) == 3 then
        return true
    else
        return false
    end
end 

CLASS_CP_SENIOR_PATROL_OFFICER = CLASS.index