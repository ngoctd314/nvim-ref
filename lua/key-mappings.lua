vim.g.mapleader = ' '

-- map navigation
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', 'H', '<cmd>bprevious<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'L', '<cmd>bnext<cr>', { noremap = true })


-- vim.g.copilot_filetypes = { 'go'}

-- let g:copilot_no_tab_map = v:true
-- vim.g.copilot_no_tab_map = true
-- vim.cmd[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]

-- vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)")
-- vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)")


