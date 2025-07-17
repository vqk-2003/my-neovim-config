return {
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy', -- Accept highlight flickering for faster startup
    -- dependencies = {
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    -- },
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
        ensure_installed = {
            'c',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'query',
            'vim',
            'vimdoc',
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>", -- set to `false` to disable one of the mappings
                node_incremental = "<CR>",
                scope_incremental = false,
                node_decremental = "<BS>",
            },
        },
        -- textobjects = {
        --     select = {
        --         enable = true,
        --
        --         -- Automatically jump forward to textobj, similar to targets.vim
        --         lookahead = true,
        --
        --         keymaps = {
        --             -- You can use the capture groups defined in textobjects.scm
        --             ["af"] = { query = "@function.outer", desc = "Select around function" },
        --             ["if"] = { query = "@function.inner", desc = "Select inside function" },
        --             ["ac"] = { query = "@class.outer", desc = "Select around class" },
        --             ["ic"] = { query = "@class.inner", desc = "Select inside class" },
        --             ["aa"] = { query = "@parameter.outer", desc = "Select around parameter" },
        --             ["ia"] = { query = "@parameter.inner", desc = "Select inside parameter" },
        --             -- You can also use captures from other query groups like `locals.scm`
        --             ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
        --         },
        --         -- You can choose the select mode (default is charwise 'v')
        --         --
        --         -- Can also be a function which gets passed a table with the keys
        --         -- * query_string: eg '@function.inner'
        --         -- * method: eg 'v' or 'o'
        --         -- and should return the mode ('v', 'V', or '<c-v>') or a table
        --         -- mapping query_strings to modes.
        --         selection_modes = {
        --             ['@parameter.outer'] = 'v', -- charwise
        --             ['@function.outer'] = 'V', -- linewise
        --             ['@class.outer'] = '<C-v>', -- blockwise
        --         },
        --         -- If you set this to `true` (default is `false`) then any textobject is
        --         -- extended to include preceding or succeeding whitespace. Succeeding
        --         -- whitespace has priority in order to act similarly to eg the built-in
        --         -- `ap`.
        --         --
        --         -- Can also be a function which gets passed a table with the keys
        --         -- * query_string: eg '@function.inner'
        --         -- * selection_mode: eg 'v'
        --         -- and should return true or false
        --         include_surrounding_whitespace = true,
        --     },
        --     swap = {
        --         enable = true,
        --         swap_next = {
        --             ["<leader>a"] = { query = "@parameter.inner", desc = "Swap next parameter" },
        --         },
        --         swap_previous = {
        --             ["<leader>A"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
        --         },
        --     },
        --     move = {
        --         enable = true,
        --         set_jumps = true,
        --         goto_next_start = {
        --             [']m'] = { query = '@function.outer', desc = 'Next function start' },
        --             [']]'] = { query = '@class.outer', desc = 'Next class start' },
        --             [']o'] = { query = '@loop.*', desc = 'Next loop start' },
        --             [']s'] = { query = '@local.scope', query_group = 'locals', desc = 'Next scope' },
        --         },
        --     },
        -- },
    },
}
