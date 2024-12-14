local RECIPE = {}

local itemData = ix.item.Get("wep_mp7")

RECIPE.uniqueID = "mp7"
RECIPE.name = "MP7 Submachine Gun"
RECIPE.category = "Weapons"
RECIPE.model = itemData.model
RECIPE.description = "Commonly used by Civil Protection Rank Leaders and Overwatch Soldiers, the MP7 is a high-rate firing weapon great for combat."
RECIPE.requirements = {
    ["metal_plate"] = 6,
	["metal_pipe"] = 2,
	["metal_gear"] = 4,
	["glue"] = 2
}
RECIPE.result = {
    ["wep_mp7"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)