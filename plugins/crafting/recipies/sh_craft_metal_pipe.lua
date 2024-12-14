local RECIPE = {}

local itemData = ix.item.Get("metal_pipe")

RECIPE.uniqueID = "metalpipe"
RECIPE.name = "Metal Pipe"
RECIPE.category = "Resources"
RECIPE.model = itemData.model
RECIPE.description = "A metal pipe used for crafting numerous weapons."
RECIPE.requirements = {
    ["metal_plate"] = 3
}
RECIPE.result = {
    ["metal_pipe"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)