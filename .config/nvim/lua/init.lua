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
        disable = { "ocaml", "swift" },  -- Some bug with this
    },
    indent = {
        --Broken for now ( needs investigation )
        enable = true
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
    vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local custom_attach = function(client)
    print("LSP started.");
    -- require'completion'.on_attach(client)
    map('n','gD','<cmd>lua         vim.lsp.buf.declaration()<CR>')
    map('n','gd','<cmd>lua         vim.lsp.buf.definition()<CR>')
    map('n','K',' <cmd>lua         vim.lsp.buf.hover()<CR>')
    map('n','gr','<cmd>lua         vim.lsp.buf.references()<CR>')
    map('n','gs','<cmd>lua         vim.lsp.buf.signature_help()<CR>')
    map('n','gi','<cmd>lua         vim.lsp.buf.implementation()<CR>')
    -- map('n','gt','<cmd>lua         vim.lsp.buf.type_definition()<CR>')
    map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
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






-- debug
-- vim.lsp.callbacks['textDocument/codeAction'] = custom_codeAction_callback
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    update_in_insert = false,

    underline = true,

    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    virtual_text = {
        spacing = 8,
        prefix = '~',
    },
})

-- Completion settings Testing

--  Testing completion plugin CMP, old shit was deprecated
local cmp = require'cmp'
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    -- FUCKING BROKEN
    mapping = cmp.mapping.preset.insert({ --á þetta að vera insert??
        -- ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>']     = cmp.mapping.scroll_docs(4),
        -- ['<C-Space>'] = cmp.mapping.complete(),
        -- ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        ["<Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), 'm', true)
                else
                    fallback()
                end
            end
        }),
        ["<S-Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                    return vim.api.nvim_feedkeys( t("<Plug>(ultisnips_jump_backward)"), 'm', true)
                else
                    fallback()
                end
            end
        }),
        ['<C-n>']  = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Down>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<C-p>'] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    vim.api.nvim_feedkeys(t('<Up>'), 'n', true)
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                else
                    fallback()
                end
            end
        }),
        ['<Down>']    = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<Up>']      = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
        ['<C-b>']     = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>']     = cmp.mapping(cmp.mapping.scroll_docs(4),  {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(),      {'i', 'c'}),
        ['<C-e>']     = cmp.mapping(cmp.mapping.close(),         {'i', 'c'}),
        --- WHAT THA FUCK
        ['<CR>']      = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ['<CR>'] = cmp.mapping.complete({
        --     -- i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), --Maybe change to false?
        --     i = function(fallback)
        --         if cmp.visible() then
        --             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        --             cmp.close()
        --         else
        --             vim.api.nvim_feedkeys(t('<CR>'), 'n', true)
        --             fallback()
        --         end
        --     end,
        --     c = function(fallback)
        --         if cmp.visible() then
        --             cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        --             cmp.close()
        --         else
        --             fallback()
        --         end
        --     end,
        --     s = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false })
        -- }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' }, -- For ultisnips users.
    }, {
            { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
            { name = 'buffer' },
        })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

-- Set up lspconfig. -- test if this is working properly and find way to minimize (use array?)
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['bashls'].setup{   capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['clangd'].setup{   capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['html'].setup{     capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['julials'].setup{  capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['pylsp'].setup{     capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['rls'].setup{      capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['texlab'].setup{   capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['tsserver'].setup{ capabilities = capabilities, on_attach = custom_attach}
require('lspconfig')['vimls'].setup{    capabilities = capabilities, on_attach = custom_attach}
-- require('lspconfig')['jdtls'].setup{on_attach = custom_attach}
require('lspconfig')['lua_ls'].setup{capabilities = capabilities, on_attach = custom_attach} -- Need to setup luals
require('lspconfig')['intelephense'].setup{capabilities = capabilities, on_attach = custom_attach}


-- Test nnn.nvim
require("nnn").setup({
    explorer = {
        cmd = "nnn -o",       -- command overrride (-F1 flag is implied, -a flag is invalid!)
        width = 24,        -- width of the vertical split
        side = "topleft",  -- or "botright", location of the explorer window
        session = "",      -- or "global" / "local" / "shared"
        tabs = true,       -- seperate nnn instance per tab
    },
    picker = {
        cmd = "nnn",       -- command override (-p flag is implied)
        style = {
            width = 0.9,     -- percentage relative to terminal size when < 1, absolute otherwise
            height = 0.8,    -- ^
            xoffset = 0.5,   -- ^
            yoffset = 0.5,   -- ^
            border = "single"-- border decoration for example "rounded"(:h nvim_open_win)
        },
        session = "",      -- or "global" / "local" / "shared"
    },
    auto_open = {
        setup = nil,       -- or "explorer" / "picker", auto open on setup function
        tabpage = nil,     -- or "explorer" / "picker", auto open when opening new tabpage
        empty = false,     -- only auto open on empty buffer
        ft_ignore = {      -- dont auto open for these filetypes
            "gitcommit",
        }
    },
    auto_close = false,  -- close tabpage/nvim when nnn is last window
    replace_netrw = nil, -- or "explorer" / "picker"
    mappings = {},       -- table containing mappings, see below
    windownav = {        -- window movement mappings to navigate out of nnn
        left = "<leader>h",
        right = "<leader>l",
    },
    buflisted = false,   -- whether or not nnn buffers show up in the bufferlist
    quitcd = nil,        -- or "cd" / tcd" / "lcd", command to run on quitcd file if found
    offset = false,      -- whether or not to write position offset to tmpfile(for use in preview-tui)
})

