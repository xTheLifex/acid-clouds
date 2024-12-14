ITEM.name = "Can of Water"
ITEM.desc = "A blue can filled with some carbonated flavoured water. Delicious."
ITEM.price = 5
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.category = "Consumables"
ITEM.thirstAmount = 20
ITEM.hungerAmount = 5

function ITEM:OnConsumed(ply)
    ply:RestoreStamina(5)
end

function ITEM:GetConsumeTime(ply)
    if ( Schema:IsCP(ply) ) or ( Schema:IsCitizen(ply) ) or ( Schema:IsOTA(ply) ) or ( Schema:IsVORT(ply) ) or ( Schema:IsBT(ply) ) then
        return 10
    else
        return 5
    end
end
