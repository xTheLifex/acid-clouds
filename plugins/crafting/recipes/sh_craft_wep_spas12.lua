local RECIPE = {}

local itemData = ix.item.Get("wep_spas12")

RECIPE.uniqueID = "shotgun"
RECIPE.name = "SPAS-12 Shotgun"
RECIPE.category = "Weapons"
RECIPE.model = itemData.model
RECIPE.description = "The SPAS-12, a very powerful shotgun used at close range, favoured by Overwatch Shotgunners."
RECIPE.requirements = {
    ["metal_plate"] = 8,
	["metal_pipe"] = 3,
	["metal_gear"] = 3,
	["glue"] = 4
}
RECIPE.result = {
    ["wep_spas12"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)