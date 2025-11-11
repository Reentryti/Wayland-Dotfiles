return {
	{
		"metalelf0/black-metal-theme-neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("black-metal").setup({
				transparent = false, --true to enable
				theme = "marduk",
				variant = "light", --can be dark
			})
			require("black-metal").load()
		end,
	},
}
