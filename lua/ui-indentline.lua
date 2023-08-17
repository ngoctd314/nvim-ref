require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = false,
    show_current_context_start = true,
    show_end_of_line = true,
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent",
    }
}

vim.cmd [[highlight IndentBlanklineIndent guifg=#383838 gui=nocombine]]
