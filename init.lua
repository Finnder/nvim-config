vim.g.mapleader = " "

-- KEYMAP
require('core/keymaps')
require('core/plugins')
require('core/plugin_config')

vim.o.relativenumber = true
vim.o.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true

vim.g.everforest_transparent_background = 1
vim.cmd [[ colorscheme catppuccin ]]

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

vim.g.user_emmet_settings = {
  javascript = {
    extends = 'jsx',
  },
}

local keyset = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

keyset("i", "<ENTER>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
