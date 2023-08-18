local cmp = require("cmp")

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
        { name = "buffer" },
        { name = "path" },

        -- { name = 'luasnip' },

    }),
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

local lspconfig = require('lspconfig')

-- Golang
lspconfig.gopls.setup {
}

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
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            -- vim.keymap.set('n', 'K', vim.diagnostic.open_float, { buffer = args.buf })
        end
        if client.server_capabilities.codeActionProvider then
            -- Selects a code action available at the current cursor position.
            vim.keymap.set('n', 'q', vim.lsp.buf.code_action, opts)
        end
        -- vim.lsp.buf.rename

        -- keymap('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- keymap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- keymap('n', '<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- keymap('n', '<space>D', vim.lsp.buf.type_definition, opts)
        -- keymap('n', '<space>rn', vim.lsp.buf.rename, opts)
        -- keymap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        -- keymap('n', '<space>f', function()
        --     vim.lsp.buf.format { async = true }
        -- end, opts)
    end,
})
