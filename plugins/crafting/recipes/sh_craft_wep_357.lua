local RECIPE = {}

local itemData = ix.item.Get("wep_357")

RECIPE.uniqueID = "357"
RECIPE.name = ".357 Magnum"
RECIPE.category = "Weapons"
RECIPE.model = itemData.model
RECIPE.description = "A popular revolver that is used for Civil Protection Amputations and Deservicements."
RECIPE.requirements = {
    ["metal_plate"] = 6,
	["metal_pipe"] = 2,
	["metal_gear"] = 4,
	["glue"] = 4
}
RECIPE.result = {
    ["wep_357"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)