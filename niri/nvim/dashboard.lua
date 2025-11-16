return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.cmd("highlight DashboardHeader guifg=#ff0000")
		vim.cmd("highlight DashboardCenter guifg=#ffffff")
		require("dashboard").setup({
			theme = "hyper",
			hide = {
				statusline = false,
			},
			config = {
				week_header = { enable = true },
				--Center display shortcuts
				shortcut = {
					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Telescope app",
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
					{
						desc = "Quit ",
						group = "WarningMsg",
						action = "qall!",
						key = "q",
					},
				},
				project = { enable = false },
				mru = { enable = false },
			},
		})
	end,
}
