return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        vim.cmd 'highlight DashboardHeader guifg=#943c12'
        vim.cmd 'highlight DashboardCenter guifg=#ffffff'
        vim.cmd 'highlight DashboardDesc guifg=#ffffff'
        vim.cmd 'highlight DashboardKey guifg=#683731'
        vim.cmd 'highlight DashboardFooter guifg=#ffffff'

        require('dashboard').setup {
            theme = 'doom',

            hide = {
                statusline = true,
                tabline = true,
                winbar = true
            },
            config = {
                --Uncomment to display day on dashboard
                --week_header = { enable = true },
                header = {
                    '@@@@@@@   @@@@@@@@  @@@@@@@@  @@@  @@@  ',
                    '@@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@ @@@  ',
                    '@@!  @@@  @@!       @@!       @@!@!@@@  ',
                    '!@!  @!@  !@!       !@!       !@!!@!@!  ',
                    '@!@!!@!   @!!!:!    @!!!:!    @!@ !!@!  ',
                    '!!@!@!    !!!!!:    !!!!!:    !@!  !!!  ',
                    '!!: :!!   !!:       !!:       !!:  !!!  ',
                    ':!:  !:!  :!:       :!:       :!:  !:!  ',
                    '::   :::   :: ::::   :: ::::   ::   ::  ',
                    ' :   : :  : :: ::   : :: ::   ::    :   ',
                    '',
                },
                --Center display shortcuts
                center = {
                    {
                        desc = '󰊳 Lazy synchronisation',
                        group = 'DashboardShortCut',
                        action = 'Lazy sync',
                        key = 's',
                        key_format = ' %s',
                        key_hl = 'DashboardKey',
                    },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Navigate on files system',
                        group = 'DashboardShortCut',
                        action = 'Telescope find_files cwd=.',
                        key = 'f',
                        key_format = ' %s',
                    },
                    {
                        desc = ' Recently opened files',
                        group = 'DashboardShortCut',
                        action = 'Telescope live_grep',
                        key = 'g',
                        key_format = ' %s',
                    },
                    {
                        desc = ' Open Configuration Directory',
                        group = 'DashboardShortCut',
                        action = 'e ~/.config/',
                        key = 'c',
                        key_format = ' %s',
                    },
                    {
                        desc = 'Quit ',
                        group = 'DashboardShortCut',
                        action = 'qall!',
                        key = 'q',
                        key_format = ' %s',
                    },
                },
                footer = {},
                vertical_center = true,
                project = { enable = false },
                mru = { enable = false },
            },
        }
    end,
}
