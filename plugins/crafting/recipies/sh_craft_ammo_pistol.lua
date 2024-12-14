local RECIPE = {}

local itemData = ix.item.Get("ammo_pistol")

RECIPE.uniqueID = "ammopistol"
RECIPE.name = "9mm Ammunition"
RECIPE.category = "Ammunition"
RECIPE.model = itemData.model
RECIPE.description = "A box of 9mm ammunition, used for the 9mm Pistol."
RECIPE.requirements = {
    ["gunpowder"] = 3,
	["bullet_casing"] = 1
}
RECIPE.result = {
    ["ammo_pistol"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)