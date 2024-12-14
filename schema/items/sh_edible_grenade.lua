ITEM.name = "Edible Grenade"
ITEM.model = Model("models/items/grenadeammo.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "This grenade looks strangely tasty."
ITEM.category = "Consumables"

ITEM.functions.Eat = {
	OnRun = function(itemTable)
		local client = itemTable.player

        local explosion = ents.Create( "env_explosion" ) -- The explosion entity
        explosion:SetPos( client:GetPos() ) -- Put the position of the explosion at the position of the entity
        explosion:Spawn() -- Spawn the explosion
        explosion:SetKeyValue( "iMagnitude", "1000" ) -- the magnitude of the explosion
        explosion:Fire( "Explode", 0, 0 ) -- explode

		return true
	end,
}
