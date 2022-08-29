require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use 'folke/tokyonight.nvim'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
    }
end)

require("nvim-tree").setup({
  open_on_setup = true,
  open_on_setup_file = true,
  view = {
    number = true,
    mappings = {
      list = {
        {key = "<CR>", action = "tabnew"}
      }
    }
  }
})

-- Key mappings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<F1>", "<C-W><C-W>", { silent = true })

-- Settings
vim.g.tokyonight_style = "night"
vim.cmd[[colorscheme tokyonight]]
vim.opt.termguicolors = true-- Enable gui colors
vim.opt.encoding     = 'utf-8'  -- Display this encoding
vim.opt.fileencoding = 'utf-8'  -- Use this encoding when writing to file
vim.opt.undofile = true                              -- Enable persistent undo
vim.opt.showtabline   = 2       -- Always show tabline
vim.opt.cursorline    = true    -- Enable highlighting of the current line
vim.opt.number        = true    -- Show line numbers
vim.opt.ruler         = true    -- Always show cursor position
vim.opt.incsearch     = true    -- Show search results while typing
vim.opt.linebreak     = true    -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.opt.background = 'dark' -- Use dark background
vim.opt.expandtab   = true    -- Convert tabs to spaces
vim.opt.tabstop     = 2       -- Insert 2 spaces for a tab
vim.opt.smarttab    = true    -- Make tabbing smarter (will realize you have 2 vs 4)
vim.opt.shiftwidth  = 2       -- Use this number of spaces for indentation
vim.opt.smartindent = true    -- Make indenting smart
vim.opt.autoindent  = true    -- Use auto indent
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '80'

