return {

    -- Override AstroNvim configuration

    { "lukas-reineke/indent-blankline.nvim", enabled = false },

    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = { -- extend the plugin options
            options = {
                opt = { -- vim.opt.<key>
                    -- set to true or false etc.
                    -- relativenumber = false, -- sets vim.opt.relativenumber
                    -- number = true,       -- sets vim.opt.number
                    -- spell = true,        -- sets vim.opt.spell
                    -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                    -- wrap = false,        -- sets vim.opt.wrap
                    tabstop = 4,
                    shiftwidth = 4,
                    softtabstop = -1,
                    expandtab = true,
                    -- cmdheight = 1,
                    -- vim.opt.softtabstop = -1; -- If negative, shiftwidth value is used
                    -- vim.opt.showtabline = 2
                    list = true,
                    listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
                },
            },
        },
    },

    {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = { -- extend the plugin options
            formatting = {
                -- control auto formatting on save
                format_on_save = {
                    enabled = false, -- enable or disable format on save globally
                },
                disabled = { -- disable formatting capabilities for the listed language servers
                    -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
                    -- "lua_ls",
                },
            },
        },
    },

    -- Add plugins

    {
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            local status = require "astroui.status"

            opts.statusline[1] = status.component.mode { mode_text = { padding = { left = 1, right = 1 } } } -- add the mode text
        end,
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,      -- Recommended
        -- ft = "markdown" -- If you decide to lazy-load anyway

        dependencies = {
            -- You will not need this if you installed the
            -- parsers manually
            -- Or if the parsers are in your $RUNTIMEPATH
            "nvim-treesitter/nvim-treesitter",

            "nvim-tree/nvim-web-devicons"
        }
    },

    {
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup({
                -- if you want to ignore markdown file.
                -- you can specify filetypes.
                ft_blocklist = {"markdown"},

                -- if you want to remove multiple blank lines
                patterns = {
                    [[%s/\(\n\n\)\n\+/\1/]],   -- replace multiple blank lines with a single line
                },

                -- if you want to disable trim on write by default
                trim_on_write = false,

                -- highlight trailing spaces
                highlight = false
            })
        end
    },

    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        opts = function()
            require("transparent").setup({ -- Optional, you don't have to run setup.
                groups = { -- table: default groups
                    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
                    'EndOfBuffer',
                },
                extra_groups = {}, -- table: additional groups that should be cleared
                exclude_groups = {}, -- table: groups you don't want to clear
            })
        end,
    },

}

