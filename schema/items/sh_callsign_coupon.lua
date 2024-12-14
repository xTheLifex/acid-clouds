
ITEM.name = "Callsign Coupon"
ITEM.model = Model("models/props_lab/clipboard.mdl")
ITEM.description = "A Coupon for a new tagline"

ITEM.functions.Apply = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local character = client:GetCharacter()
		local rank = character:GetRank()
		local callsigns = {"VICE", "VICTOR", "XRAY", "UNION", "DEFENDER", "JURY", "LINE", "PATROL", "ROLLER", "TAP", "QUICK", "KING", "HERO", "YELLOW"}
		local pn = tostring(math.random(1,9)) .. tostring(math.random(1,9)) .. tostring(math.random(1,9)) .. tostring(math.random(1,9))
		local ptl = {callsigns[math.random(1,14)], pn}
		character:SetData("callsign", ptl)
		character:SetName("CP:C17." .. ix.faction.Get(client:Team()).Ranks[rank][1] .. ":" .. character:GetData("callsign")[1] .. ":" .. character:GetData("callsign")[2])
	end,
	OnCanRun = function(itemTable)
		if itemTable.player:Team() == FACTION_CP then
			print("FACTION IS CIVIL PROTECTION")
			return true
		else
			print("FACTION IS NOT CIVIL PROTECTION")
			return false
		end
	end
}