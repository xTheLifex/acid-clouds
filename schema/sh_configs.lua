ix.currency.symbol = "C"
ix.currency.singular = "credit"
ix.currency.plural = "credits"

ix.config.SetDefault("scoreboardRecognition", true)
ix.config.SetDefault("music", "music/hl2_song19.mp3")
ix.config.SetDefault("maxAttributes", 60)

ix.config.Add("rationTokens", 20, "The amount of tokens that a person will get from a ration", nil, {
	data = {min = 0, max = 1000},
	category = "economy"
})

ix.config.Add("maxItemDrops", 3, "The maximum amount of items that can be dropped by a player on death.", nil, {
    data = {min = 1, max = 10},
    category = "misc"
})

ix.config.Add("maxItemCrateDrops", 4, "The maximum amount of items an item cache can drop", nil, {
    data = {min = 1, max = 15},
    category = "misc"
})

ix.config.Add("confiscationLockerWipe", (60 * 30), "The maximum amount of items an item cache can drop", nil, {
    data = {min = 1, max = 3600},
    category = "misc"
})

ix.config.Add("rationInterval", (60 * 30), "How often a player can receive a ration.", nil, {
    data = {min = 1, max = 3600},
    category = "rations"
})