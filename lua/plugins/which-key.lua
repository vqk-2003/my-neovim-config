return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        preset = 'helix',
        delay = 0,
        spec = {
            { '<Leader>s', group = '[S]earch' },
            { '<Leader>t', group = '[T]oggle' },
            { '<Leaderh', group = 'Git [H]unk', mode = { 'n', 'v' } },
        },
    },
}
