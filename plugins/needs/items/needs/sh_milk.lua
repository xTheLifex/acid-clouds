ITEM.name = "Milk"
ITEM.desc = "A bottle filled with milk."
ITEM.price = 5
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
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
