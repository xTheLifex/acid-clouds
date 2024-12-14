local RECIPE = {}

local itemData = ix.item.Get("ammo_smg1")

RECIPE.uniqueID = "ammosmg1"
RECIPE.name = ".45 Ammunition"
RECIPE.category = "Ammunition"
RECIPE.model = itemData.model
RECIPE.description = "A box of .45 Ammunition, used for the MP7."
RECIPE.requirements = {
    ["gunpowder"] = 4,
	["bullet_casing"] = 2
}
RECIPE.result = {
    ["ammo_smg1"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)