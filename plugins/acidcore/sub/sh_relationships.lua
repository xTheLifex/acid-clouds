
/* -------------------------------------------------------------------------- */
/*                              AI Relationships                              */
/* -------------------------------------------------------------------------- */

if (SERVER) then

    local SIDE_COMBINE = 1
    local SIDE_ANTLIONS = 2
    local SIDE_ZOMBIES = 3
    local SIDE_BIRDS = 4
    local SIDE_RESISTANCE = 5
    local SIDE_CIVILIAN = 6

    local PRIORITY = 10

    local sides = {}
    sides[SIDE_COMBINE] = {
        "npc_combine_s",
        "npc_metropolice",
        "npc_rollermine",
        "npc_stalker",
        "npc_strider",
        "npc_cscanner",
        "npc_turret_floor",
        "npc_turret_ground",
        "npc_clawscanner",
        "npc_helicopter",
        "npc_turret_ceiling",
        "npc_combine_camera",
        "npc_combinedropship",
        "npc_hunter",
        "npc_combinegunship",
        "npc_manhack",
        "npc_sniper",
        "npc_rp_combine_s",
        "zb_metropolice",
        "zb_metropolice_elite",
        "zb_crab_synth",
        "zb_hunter",
        "zb_mortar_synth",
        "zb_combine_nova_prospekt",
        "zb_combine_elite",
        "zb_combine_soldier",
        "zb_stalker",
        "npc_apcdriver"
    }
    sides[SIDE_ANTLIONS] = {
        "npc_antlion",
        "npc_antlion_grub",
        "npc_antlionguard",
        "npc_antlionguardian",
        "npc_antlion_worker",
    }
    sides[SIDE_ZOMBIES] = {
        "npc_fastzombie",
        "npc_zombine",
        "npc_poisonzombie",
        "npc_zombie",
        "npc_barnacle",
        "npc_headcrab_fast",
        "npc_fastzombie_torso",
        "npc_headcrab",
        "npc_headcrab_black"
    }
    sides[SIDE_BIRDS] = {
        "npc_crow",
        "npc_pigeon"
    }
    sides[SIDE_RESISTANCE] = {
        "npc_monk",
        "npc_citizen",
        "npc_vortigaunt",
        "npc_eli",
        "npc_odessa",
        "npc_kleiner",
        "npc_magnusson",
        "npc_dog",
        "npc_barney",
        "npc_alyx",
        "zb_kleiner",
        "zb_human_medic_f",
        "zb_human_rebel_f",
        "zb_human_refugee_f",
        "zb_human_medic",
        "zb_human_rebel",
        "zb_human_refugee",
        "zb_odessa",
        "zb_friendly_hunter",
        "zb_vortigaunt",
    }
    sides[SIDE_CIVILIAN] = {
        "npc_mossman",
        "zb_human_civilian_f",
        "zb_human_civilian",
    }

    local relations = {}
    relations[SIDE_COMBINE] = {}
    relations[SIDE_COMBINE][SIDE_ANTLIONS] = D_HT
    relations[SIDE_COMBINE][SIDE_ZOMBIES] = D_HT
    relations[SIDE_COMBINE][SIDE_RESISTANCE] = D_HT
    relations[SIDE_COMBINE][SIDE_CIVILIAN] = D_NU

    relations[SIDE_RESISTANCE] = {}
    relations[SIDE_RESISTANCE][SIDE_COMBINE] = D_HT
    relations[SIDE_RESISTANCE][SIDE_ZOMBIES] = D_HT
    relations[SIDE_RESISTANCE][SIDE_ANTLIONS] = D_HT
    relations[SIDE_RESISTANCE][SIDE_CIVILIAN] = D_NU
    
    relations[SIDE_ZOMBIES] = {}
    relations[SIDE_ZOMBIES][SIDE_ANTLIONS] = D_HT
    relations[SIDE_ZOMBIES][SIDE_COMBINE] = D_HT
    relations[SIDE_ZOMBIES][SIDE_RESISTANCE] = D_HT
    relations[SIDE_ZOMBIES][SIDE_CIVILIAN] = D_HT
    
    relations[SIDE_ANTLIONS] = {}
    relations[SIDE_ANTLIONS][SIDE_ZOMBIES] = D_HT
    relations[SIDE_ANTLIONS][SIDE_COMBINE] = D_HT
    relations[SIDE_ANTLIONS][SIDE_RESISTANCE] = D_HT
    relations[SIDE_ANTLIONS][SIDE_CIVILIAN] = D_HT
    
    relations[SIDE_BIRDS] = {}
    relations[SIDE_BIRDS][SIDE_ZOMBIES] = D_FR
    relations[SIDE_BIRDS][SIDE_ANTLIONS] = D_FR
    relations[SIDE_BIRDS][SIDE_COMBINE] = D_FR
    relations[SIDE_BIRDS][SIDE_RESISTANCE] = D_FR
    relations[SIDE_BIRDS][SIDE_CIVILIAN] = D_FR
    
    function PLUGIN:GetSides()
        return sides 
    end

    function PLUGIN:GetRelations()
        return relations
    end


    local combines = {
        [FACTION_MPF] = true,
        [FACTION_ADMIN] = true,
        [FACTION_OTA] = true,
    }
    local citizens = {
        [FACTION_CITIZEN] = true,
    }

    function PLUGIN:GetNPCSide(npc)
        if (!npc:IsNPC()) then
            self:Log("Tried to get side of a non-NPC entity!")
            return nil
        end
        local myclass = npc:GetClass()

        if (myclass == "npc_citizen") then
            if (npc:GetActiveWeapon() ~= nil) then
                return SIDE_RESISTANCE
            else
                return SIDE_CIVILIAN
            end
        end

        for side, tab in pairs(sides) do
            for _, class in ipairs(tab) do
                if (myclass == class) then
                    return side
                end
            end
        end
        return nil
    end

    function PLUGIN:GetPlayerSide(ply)
        if (!ply) then return nil end
        local char = ply:GetCharacter()
        if (!char) then return nil end

        local faction = char:GetFaction()

        if (combines[faction]) then
            self.relResistanceTimeouts[ply] = 0
            return SIDE_COMBINE 
        end

        if (citizens[faction]) then
            -- Player is in a citizen faction.

            -- Check if player has a weapon equipped.
            -- TODO: Whitelist?

            -- TODO: Move outside the function?
            local guns = {
                ["weapon_pistol"] = true,
                ["weapon_smg1"] = true,
                ["weapon_ar2"] = true,
                ["weapon_grenade"] = true,
                ["weapon_shotgun"] = true,
                ["weapon_rpg"] = true,
                ["weapon_vj_9mmpistol"] = true,
                ["weapon_vj_357"] = true,
                ["weapon_vj_ar2"] = true,
                ["weapon_vj_glock17"] = true,
                ["weapon_vj_m16a1"] = true,
                ["weapon_vj_mp40"] = true,
                ["weapon_vj_smg1"] = true,
                ["weapon_vj_spas12"] = true,
                ["weapon_hl2axe"] = true,
                ["weapon_hl2bottle"] = true,
                ["weapon_hl2hook"] = true,
                ["weapon_hl2pan"] = true,
                ["weapon_hl2pickaxe"] = true,
                ["weapon_hl2pipe"] = true,
                ["weapon_hl2pot"] = true,
                ["weapon_hl2shovel"] = true,
                ["ez2cwep_magnum"] = true,
                ["ez2cwep_ar2"] = true,
                ["ez2cwep_ar2_proto"] = true,
                ["ez2cwep_crossbow"] = true,
                ["ez2cwep_mp5"] = true,
                ["ez2cwep_pistol"] = true,
                ["ez2cwep_grenade"] = true,
                ["ez2cwep_pulse_pistol"] = true,
                ["ez2cwep_rpg"] = true,
                ["ez2cwep_slam"] = true,
                ["ez2cwep_shotgun"] = true,
                ["ez2cwep_smg"] = true,
                ["plutonic_acidcloudcombinesniper"] = true,
                ["plutonic_acidcloudmp5k"] = true,
                ["plutonic_acidcloudmp7"] = true,
                ["plutonic_acidcloudaxe"] = true,
                ["plutonic_acidcloudar2prototype"] = true,
                ["plutonic_acidcloudsspas12"] = true,
                ["plutonic_acidcloudar2"] = true,
                ["plutonic_acidcloudusp"] = true
            }

            local hasGuns = guns[ply:GetActiveWeapon()] or false

            local inv = char:GetInventory()
            if (inv) then
                if (inv:HasItemOfBase('base_weapons', {["equip"] = true}) or hasGuns) then
                    self:FlagAsResistance(ply, 600)
                    return SIDE_RESISTANCE
                end
            end

            -- Check if player is in resistance timeout
            local timeout = self.relResistanceTimeouts[ply]
            if (timeout) then
                if (timeout > 0 or timeout == -1) then
                    return SIDE_RESISTANCE
                end
            end
            
            -- Check if player is in a restricted area.
            local id = ply:GetArea()
            if (id) then
                local area = ix.area.stored[id]
                if (area) then
                    local restricted = area.properties["restricted"] or false
                    if (restricted) then
                        self:FlagAsResistance(ply, 5)
                        return SIDE_RESISTANCE
                    end
                end
            end

            return SIDE_CIVILIAN
        end

        if (faction == FACTION_BIRD) then return SIDE_BIRDS end

        return nil
    end
    
    function PLUGIN:GetSideRelationship(side, other)
        if (side == other) then return D_LI end
        local relation = relations[side]
        if (!relation) then return nil end
        return relation[other] or nil
    end

    function PLUGIN:PlayerDeath(victim, inflictor, attacker)
        timer.Simple(2, function() 
            self.relResistanceTimeouts[victim] = 0
            self:UpdateRelationships()
        end)
    end

    function PLUGIN:FlagAsResistance(ply, time)
        self.relResistanceTimeouts[ply] = time
    end


    function PLUGIN:UpdateRelationships()
        for _,a in ipairs(ents.GetAll()) do
            if (a:IsNPC()) then
                local npc = a

                for __,b in ipairs(ents.GetAll()) do
                    if (a==b) then continue end
                    if (b:IsNPC()) then
                        local target = b
                        local myside = self:GetNPCSide(npc)
                        local theirside = self:GetNPCSide(target)
                        --self:Log("I am " .. npc:GetClass() .. " and my side is " .. myside .. " and my target side is " .. theirside)
                        if (myside and theirside) then
                            if (myside == theirside) then npc:AddEntityRelationship(target, D_LI, PRIORITY) end
                            local relation = self:GetSideRelationship(myside, theirside)
                            if (relation) then
                                npc:AddEntityRelationship(target, relation, PRIORITY)
                            end
                        end
                    elseif(b:IsPlayer()) then
                        local target = b
                        local myside = self:GetNPCSide(npc)
                        local theirside = self:GetPlayerSide(target)

                        if (self.observers[target]) then
                            npc:AddEntityRelationship(target, D_LI, PRIORITY)
                        end

                        --self:Log("I am " .. npc:GetClass() .. " and my side is " .. myside .. " and my target player side is " .. theirside)
                        if (myside and theirside) then
                            if (myside == theirside) then npc:AddEntityRelationship(target, D_LI, PRIORITY) end
                            local relation = self:GetSideRelationship(myside, theirside)
                            if (relation) then
                                npc:AddEntityRelationship(target, relation, PRIORITY)
                            end 
                        end
                    end
                end
            end
        end
    end

    
    function PLUGIN:CharacterLoaded(char)
        self:UpdateRelationships()
    end

    function PLUGIN:OnEntityCreated(ent)
        if (ent:IsNPC()) then
            for _,ply in ipairs(player.GetAll()) do
                -- Null relationship by default, will be updated soon after.
                -- This tries to prevents npc from commiting friendly fire for a few seconds.
                ent:AddEntityRelationship(ply, D_LI) 
            end
            self:UpdateRelationships()
        end
    end

    function PLUGIN:OnPlayerObserve(client, state)
        if not self.observers then return end
        self.observers[client] = not state
    end

    function PLUGIN:Think()
        local t = self.relThink or 0.0
        if (t < CurTime()) then
            self.relThink = CurTime() + 1
            self:UpdateRelationships()
        end

        self.relResistanceTimeouts = self.relResistanceTimeouts or {}
        self.observers = self.observers or {}
        
        for ply,time in pairs(self.relResistanceTimeouts) do
            local time = self.relResistanceTimeouts[ply] or 0
            if (IsValid(ply) and time > 0) then
                local char = ply:GetCharacter() 
                if (char) then
                    local faction = char:GetFaction()
                    if (citizens[faction]) then
                        self.relResistanceTimeouts[ply] = time - FrameTime()
                    end
                end
            end
        end

    end
end