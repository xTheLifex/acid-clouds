CLASS.name = "Transhuman Arm Elite"
CLASS.faction = FACTION_OTA
CLASS.isDefault = false
CLASS.abbreviation = "OTAElite"
CLASS.armour = 100

function CLASS:OnSet(ply)
    local char = ply:GetCharacter()

    if not ( char ) then
        return
    end

    ply:SetModel("models/combine_super_soldier.mdl")
end

CLASS_OTA_ELITE = CLASS.index