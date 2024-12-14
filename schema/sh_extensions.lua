/* -------------------------------------------------------------------------- */
/*                               Faction Checks                               */
/* -------------------------------------------------------------------------- */

function Schema:IsOTA(client)
	local char = client:GetCharacter()
	if not char then return false end
	return char:GetFaction() == FACTION_OTA
end

function Schema:IsCombine(client)
    if not IsValid(client) then return false end
	local combine = {[FACTION_OTA] = true, [FACTION_MPF] = true, [FACTION_AW] = true, [FACTION_ADVISOR] = true, [FACTION_ADMIN] = true}
    local char = client:GetCharacter()
    if not char then return false end
    return combine[char:GetFaction()]
end

function Schema:IsCP(client)
    if not IsValid(client) then return false end
	local char = client:GetCharacter()
	if not char then return false end
	return char:GetFaction() == FACTION_MPF
end

function Schema:IsCitizen(client)
    if not IsValid(client) then return false end
	local char = client:GetCharacter()
	if not char then return false end
	return char:GetFaction() == FACTION_CITIZEN
end

function Schema:IsVortigaunt(client)
    if not IsValid(client) then return false end
	local char = client:GetCharacter()
	if not char then return false end
	return char:GetFaction() == FACTION_VORT
end

local metaPlayer = FindMetaTable("Player")

function metaPlayer:IsCombine()
    return Schema:IsCombine(self)
end

function metaPlayer:IsCP()
    return Schema:IsCP(self)
end 

function metaPlayer:IsOTA()
    return Schema:IsOTA(self)
end

function metaPlayer:IsCitizen()
    return Schema:IsCitizen(self)
end 

function metaPlayer:IsVortigaunt()
    return Schema:IsVortigaunt(self)
end

local char = ix.meta.character

function char:IsCombine()
    return Schema:IsCombine(self:GetPLayer())
end

function char:IsCP()
    return Schema:IsCP(self:GetPLayer())
end 

function char:IsOTA()
    return Schema:IsOTA(self:GetPLayer())
end

function char:IsCitizen()
    return Schema:IsCitizen(self:GetPLayer())
end 

function char:IsVortigaunt()
    return Schema:IsVortigaunt(self:GetPLayer())
end

/* -------------------------------------------------------------------------- */
/*                                    Misc                                    */
/* -------------------------------------------------------------------------- */

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