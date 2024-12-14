local RECIPE = {}

local itemData = ix.item.Get("resistance_uniform")

RECIPE.uniqueID = "resistance"
RECIPE.name = "Resistance Suit"
RECIPE.category = "Armour"
RECIPE.model = itemData.model
RECIPE.description = "A durable resistance suit that reduces the damage of bullets, and sometimes protects you from them."
RECIPE.requirements = {
    ["cloth"] = 8,
    ["metal_plate"] = 3
}
RECIPE.result = {
    ["resistance_uniform"] = 1
}

ix.crafting:RegisterRecipe(RECIPE)