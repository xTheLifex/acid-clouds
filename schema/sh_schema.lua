Schema.name = "AcidClouds Half-Life 2 Roleplay"
Schema.author = "RetroMato"
Schema.description = "Immerse yourself in the world of The Half-Life 2 Universe."

ix.util.Include("cl_schema.lua")
ix.util.Include("sv_schema.lua")

ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_hooks.lua")

ix.util.IncludeDir("voicelines")

ix.currency.symbol = "C"
ix.currency.singular = "credit"
ix.currency.plural = "credits"

function Schema:IsCombineRank(text, rank)
	return string.find(text, "[%D+]"..rank.."[%D+]")
end

for k, v in pairs(ix.faction.indices) do
    Schema["Is" .. (v.abbreviation or string.Replace(v.name, " ", ""))] = function(self, ply)
        if not ( IsValid(ply) ) then
            return false
        end

        local character = ply:GetCharacter()

        if not ( character ) then
            return false
        end

        return character:GetFaction() == k
    end
end

for k, v in pairs(ix.class.list) do
    Schema["Is" .. (ix.faction.Get(v.faction).abbreviation or string.Replace(ix.faction.Get(v.faction).name, " ", "")) .. (v.abbreviation or string.Replace(v.name, " ", ""))] = function(self, ply)
        if not ( IsValid(ply) ) then
            return false
        end

        local character = ply:GetCharacter()

        if not ( character ) then
            return false
        end

        if not ( v.faction ) then
            return false
        end

        if not ( v.faction == character:GetFaction() ) then
            return false
        end

        return character:GetClass() == k
    end
end

ix.rank.LoadFromDir(Schema.folder .. "/schema/ranks")

for k, v in pairs(ix.rank.list) do
    Schema["Is" .. (ix.faction.Get(v.faction).abbreviation or string.Replace(ix.faction.Get(v.faction).name, " ", "")) .. (v.abbreviation or string.Replace(v.name, " ", ""))] = function(self, ply)
        if not ( IsValid(ply) ) then
            return false
        end

        local character = ply:GetCharacter()

        if not ( character ) then
            return false
        end

        if not ( v.faction ) then
            return false
        end

        if not ( v.faction == character:GetFaction() ) then
            return false
        end

        return character:GetRank() == k
    end
end

function Schema:IsCombine(ply)
    if not ( IsValid(ply) ) then
        return false
    end

    local character = ply:GetCharacter()

    if not ( character ) then
        return false
    end

    return self:IsOTA(ply) or self:IsCP(ply)
end

// Credits: https://github.com/NebulousCloud/helix-hl2rp/blob/master/schema/sh_schema.lua#L32-L35
function Schema:ZeroNumber(number, length)
	local amount = math.max(0, length - string.len(number))

	return string.rep("0", amount) .. tostring(number)
end

function Schema:IsOutside(ply)
    local trace = util.TraceLine({
        start = ply:GetPos(),
        endpos = ply:GetPos() + ply:GetUp() * 9999999999,
        filter = ply
    })

    return trace.HitSky
end

function Schema:PlayGesture(ply, gesture)
    if ( SERVER ) then
        net.Start("ix.PlayGesture")
            net.WriteEntity(ply)
            net.WriteString(gesture)
        net.Broadcast()
    end

	local index, length = ply:LookupSequence(gesture)

	if not ( ply:LookupSequence(gesture) ) then
		return
	end

	ply:DoAnimationEvent(index)
end

function Schema:CanSeeEntity(entA, entB) // Entity A must be an NPC or Player
    if not ( IsValid(entA) and IsValid(entB) ) then
        return false
    end

    if not ( entA:IsPlayer() or entA:IsNPC() ) then
        return false
    end

    if not ( entA:IsLineOfSightClear(entB) ) then
        return false
    end

    local diff = entB:GetPos() - entA:GetShootPos()

    if ( entA:GetAimVector():Dot(diff) / diff:Length() < 0.455 ) then
        return false
    end

    return true
end

function Schema:LerpColor(time, from, to)
    if not ( IsColor(from) ) then
        ErrorNoHalt("Schema:LerpColor: 'from' is not a color!\n")
        return
    end

    if not ( IsColor(to) ) then
        ErrorNoHalt("Schema:LerpColor: 'to' is not a color!\n")
        return
    end

    if not ( time ) then
        time = FrameTime() * 2
    end

    from = Color(from.r, from.g, from.b, from.a)
    
    to.r = Lerp(time, from.r, to.r)
    to.g = Lerp(time, from.g, to.g)
    to.b = Lerp(time, from.b, to.b)
    to.a = Lerp(time, from.a, to.a)

    to = Color(to.r, to.g, to.b, to.a)

    return to
end

function Schema:GetGameDescription()
	return "IX: "..(Schema.name or "Unknown")
end

ix.config.Add("maxItemDrops", 3, "The maximum amount of items that can be dropped by a player on death.", nil, {
    data = {min = 1, max = 10},
    category = "misc"
})

ix.config.Add("maxItemCrateDrops", 4, "The maximum amount of items an item cache can drop", nil, {
    data = {min = 1, max = 15},
    category = "misc"
})

ix.config.Add("confiscationLockerWipe", (60 * 30), "The maximum amount of items an item cache can drop", nil, {
    data = {min = 1, max = 3600},
    category = "misc"
})

ix.config.Add("rationInterval", (60 * 30), "How often a player can receive a ration.", nil, {
    data = {min = 1, max = 3600},
    category = "rations"
})

ix.command.Add("CharSetRank", {
	description = "Sets the rank of a character.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.text
	},
	OnRun = function(self, client, target, rank)
		local rankTable

		for _, v in ipairs(ix.rank.list) do
			if ( ix.util.StringMatches(v.uniqueID, rank) or ix.util.StringMatches(v.name, rank) ) then
				rankTable = v
			end
		end

		if ( rankTable ) then
			local oldRank = target:GetRank()
			local targetPlayer = target:GetPlayer()

			if ( targetPlayer:Team() == rankTable.faction ) then
				target:SetRank(rankTable.index)
				hook.Run("PlayerJoinedRank", targetPlayer, rankTable.index, oldRank)

				targetPlayer:Notify("Your rank has been set to " .. rankTable.name .. ".")
			else
				return "Invalid Rank Faction"
			end
		else
			return "Invalid Rank"
		end
	end
})