local settings = {
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    mouse = "a",               -- allow the mouse to be used in neovim
    cmdheight = 1,             -- more space in the neovim command line for displaying messages
    cursorline = true,         -- highlight the current line
    hlsearch = true,           -- highlight all matches on previous search pattern
    number = true,             -- set numbered lines
    relativenumber = true,     -- set relative numbered lines

    timeout = true,            -- waiting time for key mapping (use in whichkey)
    timeoutlen = 0,
    ignorecase = true,
    -- smartcase = true,

    signcolumn = "number", -- always show the sign column, otherwise it would shift the text each time
}


for k, v in pairs(settings) do
    vim.opt[k] = v
end

vim.wo.wrap = true
vim.wo.linebreak = true
