-- Plugin
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'maxmellon/vim-jsx-pretty'
    use 'tpope/vim-fugitive'
    use 'folke/tokyonight.nvim'
    use 'neoclide/coc.nvim'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
     'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {"akinsho/toggleterm.nvim"}
end)


-- Key mappings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<F1>", "<C-W><C-W>", { silent = true })
map("n", "<F2>", ":ToggleTerm<CR>", { silent = true })
map("n", "<M-1>", ":tabn 1<CR>", { silent = true })
map("n", "<M-2>", ":tabn 2<CR>", { silent = true })
map("n", "<M-3>", ":tabn 3<CR>", { silent = true })
map("n", "<M-4>", ":tabn 4<CR>", { silent = true })
map("n", "<M-5>", ":tabn 5<CR>", { silent = true })
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })
map("t", "<F2>", "<C-\\><C-n>:ToggleTerm<CR>", { silent = true })
require('nvim-treesitter.configs').setup {
  highlight = {
    enabled = true
  }
}
require('toggleterm').setup()
require('lualine').setup()
require("nvim-tree").setup({
  open_on_setup = true,
  open_on_setup_file = true,
  open_on_tab = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  view = {
    number = true,
    mappings = {
      list = {
      }
    }
  },
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    indent_markers = {
      enable = true
    }
  }
})
-- Settings
vim.opt.termguicolors = true-- Enable gui colors
vim.opt.encoding     = 'utf-8'  -- Display this encoding
vim.opt.fileencoding = 'utf-8'  -- Use this encoding when writing to file
vim.opt.undofile = true                              -- Enable persistent undo
vim.opt.showtabline   = 2       -- Always show tabline
vim.opt.cursorline    = true    -- Enable highlighting of the current line
vim.opt.number        = true    -- Show line numbers
vim.opt.ruler         = true    -- Always show cursor position
vim.opt.incsearch     = true    -- Show search results while typing
vim.opt.background = 'dark' -- Use dark background
vim.opt.expandtab   = true    -- Convert tabs to spaces
vim.opt.tabstop     = 2       -- Insert 2 spaces for a tab
vim.opt.smarttab    = true    -- Make tabbing smarter (will realize you have 2 vs 4)
vim.opt.shiftwidth  = 2       -- Use this number of spaces for indentation
vim.opt.smartindent = true    -- Make indenting smart
vim.opt.autoindent  = true    -- Use auto indent
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '80'
vim.cmd[[colorscheme tokyonight-night]]
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})
