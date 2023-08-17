vim.g.mapleader = ' '

-- map navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', 'H', '<cmd>bprevious<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', '<cmd>bnext<cr>', { noremap = true })
