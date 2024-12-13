local PLUGIN = PLUGIN

PLUGIN.name = "Warning System"
PLUGIN.author = "RetroMato"
PLUGIN.description = "System of warnings issued by administrators."
    


ix.command.Add("CharWarn", {
    description = "Give a warning to a player.",
    adminOnly = true,
    arguments = {
        ix.type.character, ix.type.text
    },
    OnRun = function(self, client, character, reason)
        local oldvalue = character:GetData("warn", 0)
        character:SetData("warn", oldvalue+1)
        local newvalue = character:GetData("warn", 1)
        local ply = character:GetPlayer()

        if string.len(reason) <1 then
            reason = "Not specified."
        end
        
        if newvalue >=3 then
            character:Ban(60)
            character:SetData("warn", oldvalue)
            client:Notify("Character " .. client:GetName() .. " was blocked for exceeding the allowed number of warnings")
        end
    
        ply:ChatNotify("You have been given a warning by " .. client:GetName() .. "  Comment: " .. reason .. ". be careful! If you receive too many warnings, your character will be temporarily or permanently blocked.")
        --  MsgC( Color( 255, 0, 0 ), "You have been given a warning by " .. client:GetName() .. "  Comment: " .. reason .. ". Be careful! If you receive too many warnings, your character will be temporarily or permanently blocked.")
        ply:ChatNotify("Total warnings: " .. newValue)
        ply:Notify("You were frozen for 10 seconds. Read the warning!")
        client:Notify("Successfully!")

        ply:GodEnable()
        ply:Freeze(true)
        IsValid(ply)
        timer.Simple( 10, function()
            if IsValid(ply) then
                ply:GodDisable()
                ply:Freeze(false)
            end    
        end)

    end
})
