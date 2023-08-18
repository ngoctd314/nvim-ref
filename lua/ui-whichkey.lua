local wk = require("which-key")

wk.register({
    e = { "<cmd>NvimTreeToggle<cr>", "Toggle tree", noremap = true },
    g = {
        -- Lists all the implementations for the symbol under the cursor in the quickfix window.
        i = {
            function()
                vim.lsp.buf.implementation()
            end,
            "Lists Implementations"
        },
        -- Lists all the references to the symbol under the cursor in the quickfix window.
        r = {
            function()
                vim.lsp.buf.references()
            end,
            "List References"
        },
        -- Jumps to the definition of the symbol under
        d = {
            function()
                vim.lsp.buf.definition()
            end,
            "Jumps to the definition"
        },
        e = {
            function()
                vim.diagnostic.goto_prev()
            end,
            "Goto prev diagnostic"
        },
        -- Renames all references to the symbol under the cursor.
        n = {
            function()
                vim.lsp.buf.rename()
            end,
            "Rename"
        },
        "LSP functions"
    },
    f = {
        {
            f = { "<cmd>Telescope find_files<cr>", "Find Files" }, -- create a binding with label
            b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
            r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = true },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            -- t = { "<cmd>Telescope help_tags<cr>", "Help tags" }
        },
        "Find"
    },

    -- d = {
    --     {
    --         b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },
    --         s = {
    --             function()
    --                 local widgets = require('dap.ui.widgets')
    --                 local sidebar = widgets.sidebar(widgets.scopes);
    --                 sidebar.open();
    --             end,
    --             "Open debugging sidebar"
    --         },
    --         t = {
    --             function()
    --                 require('dap-go').debug_test()
    --             end,
    --             "Debug go test"
    --         },
    --         l = {
    --             function()
    --                 require('dap-go').debug_last()
    --             end,
    --             "Debug last go test"
    --         },
    --         n = { "<cmd>DapStepOver<cr>", "Dap step over" }
    --     }, "Debug"
    -- }
}, { prefix = "<leader>" })
