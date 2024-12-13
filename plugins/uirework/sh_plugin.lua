PLUGIN.name = "UI-Rework"
PLUGIN.author = "Khall"
ix.util.Include("cl_hooks.lua")

ix.gui.gradients = {
	["left"] = Material("vgui/gradient-l", "smooth noclamp"),
	["right"] = Material("vgui/gradient-r", "smooth noclamp"),
	["up"] = Material("vgui/gradient-u", "smooth noclamp"),
	["down"] = Material("vgui/gradient-d", "smooth noclamp")
}