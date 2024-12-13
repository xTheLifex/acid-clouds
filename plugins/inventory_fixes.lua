local PLUGIN = PLUGIN

PLUGIN.name = "Clear Inventory On Death"
PLUGIN.description = "System which deleted the players inventory on death"
PLUGIN.author = "Cha0s_B0y"

function PLUGIN:PostPlayerLoadout(client)
    local character = client:GetCharacter()
    if character:GetData("Dead", false) != true then return end
    
    client:StripWeapons()

    for item in character:GetInventory():Iter() do
        character:GetInventory():Remove(item:GetID())
    end
    character:SetData("Dead", false)
end

function PLUGIN:DoPlayerDeath(client)
    client:GetCharacter():SetData("Dead", true)
end
