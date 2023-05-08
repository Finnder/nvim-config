vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- TAB Functionality
keymap('n', '<Tab>', '>>_', {noremap = true})
keymap('n', '<S-Tab>', '<<_', {noremap = true})
keymap('i', '<S-Tab>', '<C-D>', {noremap = true})
keymap('v', '<Tab>', '>gv', {noremap = true})
keymap('v', '<S-Tab>', '<gv', {noremap = true})

keymap('n', 'k', 'gk', {silent = true, noremap = true})
keymap('n', 'j', 'gj', {silent = true, noremap = true})
keymap('n', '0', 'g0', {silent = true, noremap = true})
keymap('n', '$', 'g$', {silent = true, noremap = true})

keymap('n', '<C-p>', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<C-o>', '<cmd>Telescope live_grep<cr>', opts)

keymap('n', '<C-b>', '<cmd>GitBlameToggle<cr>', opts)
