local telescopeBuiltin = require('telescope.builtin')
local wk = require("which-key")

wk.setup({
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "none",          -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.
    }
})


wk.register({
    e = { "<cmd>NvimTreeToggle<cr>", "Toggle tree", noremap = true },
    f = {
        {
            f = {
                function()
                    telescopeBuiltin.find_files({
                        cwd = vim.fn.getcwd()
                    })
                end,
                "Find Files",
            }, -- create a binding with label
            b = {
                function()
                    telescopeBuiltin.buffers()
                end,
                "Find Buffers",
            },
            r = {
                function()
                    telescopeBuiltin.oldfiles()
                end,
                "Open Recent File",
                noremap = true
            },
            g = {
                function()
                    telescopeBuiltin.live_grep()
                end,
                "Live grep"
            },
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

wk.register({
    -- Jumps to the definition of the symbol under
    d = {
        function()
            telescopeBuiltin.lsp_definitions()
            -- vim.lsp.buf.definition()
        end,
        "Jumps to the definition"
    },
    -- Lists all the references to the symbol under the cursor in the quickfix window.
    r = {
        function()
            telescopeBuiltin.lsp_references()
            -- vim.lsp.buf.references()
        end,
        "List References"
    },
    e = {
        function()
            -- builtin.diagnostics({ bufnr = 0 })
            telescopeBuiltin.diagnostics()
        end,
        "Lists Diagnostics",
    },
    k = {
        function()
            telescopeBuiltin.treesitter()
        end,
        "Lists Function names, variables"
    },
    -- Lists vim marks and their value
    m = {
        function()
            telescopeBuiltin.marks()
        end,
        "Lists all marks"
    }
}, { prefix = "g" })

-- Renames all references to the symbol under the cursor.
-- r = {
--     function()
--         vim.lsp.buf.rename()
--     end,
--     "Rename"
-- }
-- "LSP functions"
