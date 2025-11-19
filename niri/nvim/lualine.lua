return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },

                disabled_filetypes = {
                    statusline = { "dashboard", "alpha" },
                },

                ignore_focus = nil,
                always_divide_middle = true,
                always_show_tabline = false,
                globalstatus = true,

                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },

            sections = {
                lualine_a = {
                    { "mode", icon = " " },
                },
                lualine_b = {
                    { "branch", icon = "" },
                    { "diff" },
                },
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = " ",
                            readonly = " ",
                            unnamed = "No Name",
                        },
                    },
                },
                lualine_x = {
                    { "diagnostics", sources = { "nvim_diagnostic" } },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = {
                    { "progress" },
                },
                lualine_z = {
                    { "location", icon = "" },
                },
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
