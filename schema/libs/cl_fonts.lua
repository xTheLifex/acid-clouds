function GAMEMODE:LoadFonts(font, genericFont)
	surface.CreateFont("ix3D2DFont", {
		font = font,
		size = 128,
		extended = true,
		weight = 100
	})

	surface.CreateFont("ix3D2DMediumFont", {
		font = font,
		size = 48,
		extended = true,
		weight = 100
	})

	surface.CreateFont("ix3D2DSmallFont", {
		font = font,
		size = 24,
		extended = true,
		weight = 400
	})

	surface.CreateFont("ixTitleFont", {
		font = font,
		size = ScreenScale(30),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixSubTitleFont", {
		font = font,
		size = ScreenScale(16),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixMenuMiniFont", {
		font = font,
		size = math.max(ScreenScale(4), 18),
		weight = 300,
	})

	surface.CreateFont("ixMenuButtonFont", {
		font = font,
		size = ScreenScale(16),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixMenuButtonFontSmall", {
		font = font,
		size = ScreenScale(10),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixMenuButtonFontThick", {
		font = font,
		size = ScreenScale(14),
		extended = true,
		weight = 300
	})

	surface.CreateFont("ixMenuButtonLabelFont", {
		font = font,
		size = 28,
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixMenuButtonHugeFont", {
		font = font,
		size = ScreenScale(24),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixToolTipText", {
		font = font,
		size = 20,
		extended = true,
		weight = 500
	})

	surface.CreateFont("ixMonoSmallFont", {
		font = "Consolas",
		size = 12,
		extended = true,
		weight = 800
	})

	surface.CreateFont("ixMonoMediumFont", {
		font = "Consolas",
		size = 22,
		extended = true,
		weight = 800
	})

	-- The more readable font.
	font = genericFont

	surface.CreateFont("ixBigFont", {
		font = font,
		size = 36,
		extended = true,
		weight = 1000
	})

	surface.CreateFont("ixMediumFont", {
		font = font,
		size = 25,
		extended = true,
		weight = 1000
	})

	surface.CreateFont("ixNoticeFont", {
		font = font,
		size = math.max(ScreenScale(8), 18),
		weight = 100,
		extended = true,
		antialias = true
	})

	surface.CreateFont("ixMediumLightFont", {
		font = font,
		size = 25,
		extended = true,
		weight = 200
	})

	surface.CreateFont("ixMediumLightBlurFont", {
		font = font,
		size = 25,
		extended = true,
		weight = 200,
		blursize = 4
	})

	surface.CreateFont("ixGenericFont", {
		font = font,
		size = 20,
		extended = true,
		weight = 1000
	})

	surface.CreateFont("ixChatFont", {
		font = font,
		size = math.max(ScreenScale(7), 17) * ix.option.Get("chatFontScale", 1),
		extended = true,
		weight = 600,
		antialias = true
	})

	surface.CreateFont("ixChatFontItalics", {
		font = font,
		size = math.max(ScreenScale(7), 17) * ix.option.Get("chatFontScale", 1),
		extended = true,
		weight = 600,
		antialias = true,
		italic = true
	})

	surface.CreateFont("ixSmallTitleFont", {
		font = font,
		size = math.max(ScreenScale(12), 24),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixMinimalTitleFont", {
		font = font,
		size = math.max(ScreenScale(8), 22),
		extended = true,
		weight = 800
	})

	surface.CreateFont("ixSmallFont", {
		font = font,
		size = math.max(ScreenScale(6), 17),
		extended = true,
		weight = 500
	})

	surface.CreateFont("ixItemDescFont", {
		font = font,
		size = math.max(ScreenScale(6), 17),
		extended = true,
		shadow = true,
		weight = 500
	})

	surface.CreateFont("ixSmallBoldFont", {
		font = font,
		size = math.max(ScreenScale(8), 20),
		extended = true,
		weight = 800
	})

	surface.CreateFont("ixItemBoldFont", {
		font = font,
		shadow = true,
		size = math.max(ScreenScale(8), 20),
		extended = true,
		weight = 800
	})

	-- Introduction fancy font.
	font = "Roboto Th"

	surface.CreateFont("ixIntroTitleFont", {
		font = font,
		size = math.min(ScreenScale(128), 128),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixIntroTitleBlurFont", {
		font = font,
		size = math.min(ScreenScale(128), 128),
		extended = true,
		weight = 100,
		blursize = 4
	})

	surface.CreateFont("ixIntroSubtitleFont", {
		font = font,
		size = ScreenScale(24),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixIntroSmallFont", {
		font = font,
		size = ScreenScale(14),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixIconsSmall", {
		font = "fontello",
		size = 22,
		extended = true,
		weight = 500
	})

	surface.CreateFont("ixSmallTitleIcons", {
		font = "fontello",
		size = math.max(ScreenScale(11), 23),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixIconsMedium", {
		font = "fontello",
		extended = true,
		size = 28,
		weight = 500
	})

	surface.CreateFont("ixIconsMenuButton", {
		font = "fontello",
		size = ScreenScale(14),
		extended = true,
		weight = 100
	})

	surface.CreateFont("ixIconsBig", {
		font = "fontello",
		extended = true,
		size = 48,
		weight = 500
	})
end

concommand.Add("ix_reloadfonts", function(ply)
    hook.Run("LoadFonts", ix.config.Get("font"), ix.config.Get("genericFont"))
end)