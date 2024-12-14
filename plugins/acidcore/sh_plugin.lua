PLUGIN.name = "Acid - Core Module"
PLUGIN.description = "Hl2RP Core module."
PLUGIN.author = "TheLife"
PLUGIN.maxLength = 512

-- Submodules
--ix.util.Include("sub/sh_damage.lua")
--ix.util.Include("sub/sh_commands.lua")
ix.util.Include("sub/sh_voicecommands.lua")
--ix.util.Include("sub/sh_skins.lua")
ix.util.Include("sub/sh_relationships.lua")
--ix.util.Include("sub/sh_voices.lua")
--ix.util.Include("sub/clothing/sh_clothing.lua")
--ix.util.Include("sub/food/sh_food.lua")

ix.util.Include("voices/sh_biotic.lua")
ix.util.Include("voices/sh_citizen_male.lua")
ix.util.Include("voices/sh_citizen_female.lua")

/* -------------------------------------------------------------------------- */
/*                       Stuff from the original schema                       */
/* -------------------------------------------------------------------------- */

function PLUGIN:SaveData()
	local data = {}

	for _, v in ipairs(ents.FindByClass("ix_cmb_terminal")) do
		data[#data + 1] = {v:GetPos(), v:GetAngles()}
	end

	ix.data.Set("cmbTerminals", data)

	data = {}

	for _, v in ipairs(ents.FindByClass("ix_citizen_terminal")) do
		data[#data + 1] = {v:GetPos(), v:GetAngles()}
	end

	ix.data.Set("citizenTerminals", data)

	data = {}

	for _, v in ipairs(ents.FindByClass("ix_rationdistribution")) do
		data[#data + 1] = {v:GetPos(), v:GetAngles()}
	end

	ix.data.Set("rationDistributions", data)

	data = {}

	for _, v in ipairs(ents.FindByClass("ix_confiscationlocker")) do
		data[#data + 1] = {v:GetPos(), v:GetAngles(), v.items}
	end

	ix.data.Set("confiscationLockers", data)
end

function PLUGIN:LoadData()
	local data = ix.data.Get("cmbTerminals", {})

	for _, v in ipairs(data) do
		local terminal = ents.Create("ix_cmb_terminal")
		terminal:SetPos(v[1])
		terminal:SetAngles(v[2])
		terminal:Spawn()
		terminal:Activate()
	end

	data = ix.data.Get("citizenTerminals", {})
	for _, v in ipairs(data) do
		local CitTerminal = ents.Create("ix_citizen_terminal")
		CitTerminal:SetPos(v[1])
		CitTerminal:SetAngles(v[2])
		CitTerminal:Spawn()
		CitTerminal:Activate()
	end

	data = ix.data.Get("rationDistributions", {})
	for _, v in ipairs(data) do
		local ration = ents.Create("ix_rationdistribution")
		ration:SetPos(v[1])
		ration:SetAngles(v[2])
		ration:Spawn()
		ration:Activate()
	end

	data = ix.data.Get("confiscationLockers", {})
	for _, v in ipairs(data) do
		local locker = ents.Create("ix_confiscationlocker")
		locker:SetPos(v[1])
		locker:SetAngles(v[2])
		locker.items = v[3]
		locker:Spawn()
		locker:Activate()
	end
end