local cmp = require("cmp")
-- local luasnip = require 'luasnip'

cmp.setup({
    -- capabilities = capabilities,
    -- snippet = {
    --     expand = function(args)
    --         luasnip.lsp_expand(args.body)
    --     end,
    -- },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = "path" },
        -- { name = 'luasnip' },
    }, {
        { name = "buffer" },
    }),
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        -- ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- elseif luasnip.expand_or_jumpable() then
                --     luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                -- elseif luasnip.jumpable(-1) then
                --     luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
})

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Golang
-- lspconfig.gopls.setup {
-- capabilities = capabilities
-- }

-- map lsp
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = args.buf }
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            -- Displays hover information about the symbol under the cursor in a floating window. Calling the function twice will jump into the floating window.
            vim.keymap.set('n', 'S', vim.lsp.buf.hover, opts)
            -- vim.keymap.set('n', 'K', vim.diagnostic.open_float, { buffer = args.buf })
        end
        if client.server_capabilities.codeActionProvider then
            -- Selects a code action available at the current cursor position.
            vim.keymap.set('n', 'q', vim.lsp.buf.code_action, opts)
        end
    end,
})

-- lsp
local util = require("lspconfig/util")
local lspconfig = require("lspconfig")
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.gopls.setup {
    -- capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    -- settings = {
    --     gopls = {
    --         completeUnimported = true,
    --         usePlaceholders = true,
    --         analyses = {
    --             unusedparams = true,
    --         }
    --     }
    -- },
}
