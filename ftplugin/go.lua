-- tabs
local settings = {
	shiftwidth = 3,
	tabstop = 3,
	softtabstop = 3,
}

for k, v in pairs(settings) do
	vim.opt[k] = v
end

-- formating
-- local null_ls = require("null-ls")
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- null_ls.setup({
-- 	sources = {
-- 		null_ls.builtins.formatting.gofmt,
-- 		null_ls.builtins.formatting.goimports,
-- 		-- null_ls.builtins.diagnostics.glint,
-- 		-- null_ls.builtins.completion.spell,
-- 	},
-- 	on_attach = function(client, bufnr)
-- 		if client.supports_method("textDocument/formatting") then
-- 			vim.api.nvim_clear_autocmds({
-- 				group = augroup,
-- 				buffer = bufnr,
-- 			})
-- 			vim.api.nvim_create_autocmd("BufWritePre", {
-- 				group = augroup,
-- 				buffer = bufnr,
-- 				callback = function()
-- 					vim.lsp.buf.format({ bufnr = bufnr })
-- 				end
-- 			})
-- 		end
-- 	end
-- })
