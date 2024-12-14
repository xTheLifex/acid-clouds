local RECIPE = {}

local itemData = ix.item.Get("bullet_casing")

RECIPE.uniqueID = "bulletcasing"
RECIPE.name = "Bullet Casing"
RECIPE.category = "Resources"
RECIPE.model = itemData.model
RECIPE.description = "A bullet casing, used for crafting ammunition."
RECIPE.requirements = {
    ["metal_plate"] = 2,
	["metal_pipe"] = 1
	
}
RECIPE.result = {
    ["bullet_casing"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)