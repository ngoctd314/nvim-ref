The following Lua code with load myluamodule.lua

require('myluamodule')

Notice the absence of a `.lua` extension.

Several Lua plugins might have identical filenames in their lua folder 

Runtime files

Much like Vimscript files, Lua files can be loaded automatically from special folders in your `runtimepath`.
Currently, the following folders are supported:

- colors
- compiler
- ftplugin
- ftdetect
- indent
- plugin
- syntax

Note in a runtime directory, all `*.vim` files are sourced before `.lua` files.

## USING LUA FROM VIMSCRIPT

:lua

This command executes a chunk of Lua code

:lua require('my-lua-module')

**vim.api.nvim_command()**

This function executes an ex command. It takes in a string containing the command to execute 

vim.api.nvim_command('new')
vim.api.nvim_command('set number')

**vim.api.nvim_exec()**

Alias for vim.api.nvim_exec(). Only the command argument is needed, output is always set to `false`

**vim.api.nvim_replace_termcodes()**

This API function allows you to escape terminal codes and Vim keycodes

You may have come across mappings like this one: 

```bash
inoremap <expr> <Tab> pumvisible() ? "\<c-N>" : "\<Tab>"
```

Trying to do the same in Lua can prove to be a challenge. You might be tempted to do it like this:
```bash
function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and [[\<C-N>]] or [[\<Tab>]]
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
```
**vim.fn**
Use vim.fn to call Vimscript functions from Lua. Data types between Lua and Vimscript are automatically converted:

```vim
print(vim.fn.printf('Hello from %s', 'Lua'))

```

## What is LSP

LSP stands for language server protocol. Adding features like auto complete go to definition, or documentation on hover for programming language takes significant effort. Traditionally this work had to be repeated for each development tool, as each tool provides different APIs for implementing the same feature.

A Language Server is meant to provide the LSP is to standardlize the protocol for how such servers and development tools communicate. This way, a single LS can be re-used in multiple development tools, which in turn can support multiple languages with minimal effort. 

Nvim supports the LSP, which means it acts as a client to LSP servers and includes a Lua framework vim.lsp for building enhanced LSP tools.

LSP facilitates features like go-to definition, find-references, hover, completion, rename, format, refactor, etc, using semantic whole-project analysis (unlike ctags).

Nvim provides an LSP client, but the servers are provided by third parties. Follow these steps to get LSP features:

+ 1. Install ls using your package manager or by following the upstream installation instruction. https://microsoft.github.io/language-server-protocol/implementors/servers/.

+ 2. Configure the LSP client per language server. 

```vim
vim.lsp.start({
    name = 'my-server-name',
    cmd = {'name-of-language-server-executable'},
    root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}))
})
```

+ 3. Check that the server attached to the buffer
:lua =vim.lsp.get_clients()

+ 4. Configure keymaps and autocmds to use LSP features.


