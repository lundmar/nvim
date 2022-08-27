--
-- A simple Neovim lua configuration
-- ~/.config/nvim/init.lua
--
-- Note:
--  Required steps to make this configuration work on a new system:
--   1. git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--   2. Run :PackerInstall
--
-- Note:
--  Remember to sometimes run :checkhealth to optimize your nvim configuration
--



-- GENERAL NVIM SETTINGS --

-- Set colors etc.
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd 'colorscheme base16-da-one-black'

-- Better editing experience
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.autoindent = true
vim.o.wrap = true
vim.o.textwidth = 80
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- If negative, shiftwidth value is used
vim.o.showtabline = 2
vim.o.laststatus = 3 -- global statusline
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.cursorline = true
vim.o.number = true
vim.o.numberwidth = 2

-- Make neovim and host OS clipboard play nicely with each other
vim.o.clipboard = 'unnamedplus'

-- Undo and backup options
vim.o.backup = false
vim.o.writebackup = false
vim.o.undofile = true
vim.o.swapfile = false

-- Remember items in commandline history
vim.o.history = 1000

-- Better buffer splitting
vim.o.splitright = true
vim.o.splitbelow = true

-- Enable mouse in all five modes
vim.opt.mouse = "a"

-- Make search non-case sensitive
vim.o.ignorecase = true
vim.o.smartcase = true



-- PLUGIN CONFIGURATION --

-- Key to enable Tagbar
vim.api.nvim_set_keymap('n', '<F8>', ':TagbarToggle<CR>', { noremap = false, silent = true })

-- Put tagbar on the left side
vim.g.tagbar_position = 'left'

-- Keep generated gutentags in one place
vim.g.gutentags_cache_dir = '~/.gutentags'

-- Enable treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {
      -- "javascript"
  }, -- List of parsers to ignore installing
  highlight = {
    enable = true,                  -- false will disable the whole extension
    -- disable = { "go", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = false,
      -- disable = {"yaml"}
  },
}

-- Setup nvim-cmp
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- Enable colorscheme preview in telescope
require('telescope').setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}

-- Enable packer package manager
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Language server stuff
    use
    {
        'neovim/nvim-lspconfig',
        config = function() require('lspconfig').clangd.setup{} end
    }

    -- Completion stuff
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Status line stuff
    use
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('lualine').setup() end
    }

    -- Syntax highlighting stuff
    use
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Function list stuff
    use 'preservim/tagbar'

    -- Remember last location
    use 'farmergreg/vim-lastplace'

    -- Generate tags
    use 'ludovicchabant/vim-gutentags'

    -- git stuff
    use
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end
    }

    -- Improved diff tool
    use
    {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }

    -- Colorschemes
    use 'RRethy/nvim-base16'

    -- Telescope fuzzy finder
    use 
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Manage comments Better
    use
    {
        'terrortylor/nvim-comment',
        config = function() require('nvim_comment').setup() end
    }

end)
