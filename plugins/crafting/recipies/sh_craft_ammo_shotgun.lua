local RECIPE = {}

local itemData = ix.item.Get("ammo_buckshot")

RECIPE.uniqueID = "ammobuckshot"
RECIPE.name = "Buckshot Shells"
RECIPE.category = "Ammunition"
RECIPE.model = itemData.model
RECIPE.description = "A box of Buckshot Shells, used by the SPAS-12."
RECIPE.requirements = {
    ["gunpowder"] = 5,
	["bullet_casing"] = 2
}
RECIPE.result = {
    ["ammo_buckshot"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)