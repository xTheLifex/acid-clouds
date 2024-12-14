local RECIPE = {}

local itemData = ix.item.Get("ammo_357")

RECIPE.uniqueID = "ammo357"
RECIPE.name = ".357 Ammunition"
RECIPE.category = "Ammunition"
RECIPE.model = itemData.model
RECIPE.description = "A box of .357 Ammunition, used for the .357 Magnum."
RECIPE.requirements = {
    ["gunpowder"] = 6,
	["bullet_casing"] = 3
}
RECIPE.result = {
    ["ammo_357"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)