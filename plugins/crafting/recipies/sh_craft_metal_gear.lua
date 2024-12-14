local RECIPE = {}

local itemData = ix.item.Get("metal_gear")

RECIPE.uniqueID = "metalgear"
RECIPE.name = "Metal Gear"
RECIPE.category = "Resources"
RECIPE.model = itemData.model
RECIPE.description = "An old and rusty metal gear."
RECIPE.requirements = {
    ["metal_plate"] = 4
}
RECIPE.result = {
    ["metal_gear"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)