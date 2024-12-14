local RECIPE = {}

local itemData = ix.item.Get("wep_usp")

RECIPE.uniqueID = "pistol"
RECIPE.name = "9mm Pistol"
RECIPE.category = "Weapons"
RECIPE.model = itemData.model
RECIPE.description = "An USP Match using 9mm ammunition, great for assasinations and combat, especially if you hit the head."
RECIPE.requirements = {
    ["metal_plate"] = 4,
	["metal_pipe"] = 2,
	["metal_gear"] = 1,
	["glue"] = 2
}
RECIPE.result = {
    ["wep_usp"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)