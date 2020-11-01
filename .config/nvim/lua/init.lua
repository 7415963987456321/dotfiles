-- Treesitter settings
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",          "java",  "python", "lua",        "go",      "nix",
        "yaml",       "json",  "jsdoc",  "markdown",   "julia",   "html",
        "typescript", "query", "cpp",    "ruby",       "rust",    "bash",
        "c_sharp",    "css",   "php",    "javascript", "haskell", "toml",
        "regex"       },

        highlight = {
            enable = true,
            disable = { "ocaml" },  -- Some bug with this
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
        },
    }

--LSP settings
local map = function(type, key, value)
    vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
    print("LSP started.");
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)

    map('n','gD','<cmd>lua         vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua         vim.lsp.buf.definition()<CR>')
    map('n','K',' <cmd>lua         vim.lsp.buf.hover()<CR>')
    map('n','gr','<cmd>lua         vim.lsp.buf.references()<CR>')
    map('n','gs','<cmd>lua         vim.lsp.buf.signature_help()<CR>')
    map('n','gi','<cmd>lua         vim.lsp.buf.implementation()<CR>')
    map('n','gt','<cmd>lua         vim.lsp.buf.type_definition()<CR>')
    map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
    map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
    map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

-- Uncomment to execute the extension test mentioned above.
local function custom_codeAction_callback(_, _, action)
    print(vim.inspect(action))
end

vim.lsp.callbacks['textDocument/codeAction'] = custom_codeAction_callback


require'nvim_lsp'.julials.setup{on_attach=custom_attach}
require'nvim_lsp'.vimls.setup{on_attach=custom_attach}
require'nvim_lsp'.jdtls.setup{on_attach=custom_attach}
require'nvim_lsp'.rls.setup{on_attach=custom_attach}
require'nvim_lsp'.clangd.setup{on_attach=custom_attach}

require'nvim_lsp'.tsserver.setup{on_attach=custom_attach}
require'nvim_lsp'.clangd.setup{on_attach=custom_attach}
require'nvim_lsp'.sumneko_lua.setup{
    on_attach=custom_attach,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
            completion = { keywordSnippet = "Disable", },
            diagnostics = { enable = true, globals = {
                "vim", "describe", "it", "before_each", "after_each" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                }
            }
        }
    }
}
require'nvim_lsp'.sumneko_lua.setup{on_attach=custom_attach}

