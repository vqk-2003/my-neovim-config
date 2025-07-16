return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            disabled_filetypes = {
                statusline = {
                    'snacks_dashboard',
                },
            },
            globalstatus = true,
        },
    },
}
