
ITEM.name = "Callsign Coupon"
ITEM.model = Model("models/props_lab/clipboard.mdl")
ITEM.description = "A Coupon for a new tagline"

ITEM.functions.Apply = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local character = client:GetCharacter()
		local rank = character:GetRank()

		local callsign = utils.Pick({ "FLASH", "RANGER", "HUNTER", "BLADE", "SCAR", "HAMMER", "SWEEPER", "SWIFT", "FIST", "SWORD", "SAVAGE", "TRACKER", "SLASH", "RAZOR", "STAB", "SPEAR", "STRIKER", "DAGGER" })

		local pn = tostring(math.random(1,9)) .. tostring(math.random(1,9)) .. tostring(math.random(1,9)) .. tostring(math.random(1,9))
		local ptl = {callsign, pn}
		character:SetData("callsign", ptl)
		character:SetName("CP:C9.RCT." .. ix.faction.Get(client:Team()).Ranks[rank][1] .. ":" .. character:GetData("callsign")[1] .. ":" .. character:GetData("callsign")[2])
	end,
	OnCanRun = function(itemTable)
		if itemTable.player:Team() == FACTION_CP then
			return true
		else
			return false
		end
	end
}