-- Treesitter settings
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",          "java",  "python", "lua",        "go",      "nix",
        "yaml",       "json",  "jsdoc",  "markdown",   "julia",   "html",
        "typescript", "query", "cpp",    "ruby",       "rust",    "bash",
        "c_sharp",    "css",   "php",    "javascript", "haskell", "toml",
        "regex"
    },

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
    -- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
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

-- require'lspconfig'.jdtls.setup{on_attach = custom_attach}
require'lspconfig'.julials.setup{on_attach     = custom_attach}
require'lspconfig'.texlab.setup{on_attach     = custom_attach}
require'lspconfig'.vimls.setup{on_attach       = custom_attach}
require'lspconfig'.bashls.setup{on_attach      = custom_attach}
require'lspconfig'.rls.setup{on_attach         = custom_attach}
require'lspconfig'.clangd.setup{on_attach      = custom_attach}
require'lspconfig'.html.setup{on_attach      = custom_attach}
-- require'lspconfig'.sumneko_lua.setup{on_attach = custom_attach} "Eats memory, do not use
require'lspconfig'.tsserver.setup{on_attach    = custom_attach}

-- require'lspconfig'.sumneko_lua.setup{
--     on_attach=custom_attach,
--     settings = {
--         Lua = {
--             runtime = { version = "LuaJIT", path = vim.split(package.path, ';'), },
--             completion = { keywordSnippet = "Disable", },
--             diagnostics = { enable = true, globals = {
--                 "vim", "describe", "it", "before_each", "after_each" },
--             },
--             workspace = {
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--                 }
--             }
--         }
--     }
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = true,

    underline = true,

    -- Enable virtual text, override spacing to 4
    virtual_text = {
        spacing = 4,
        prefix = '~',
    },
}
)
