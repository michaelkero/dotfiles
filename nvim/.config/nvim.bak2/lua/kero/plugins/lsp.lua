return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function ()
            require('mason').setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function ()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'tsserver',
                    'rust_analyzer',
                    --'omnisharp',
                    'csharp_ls',
                    'gopls',
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function ()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            --lspconfig.omnisharp.setup({
            --    cmd = { "dotnet", "/home/kero/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"},
            --    capabilities = capabilities,
            --})
            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local opts = { buffer = ev.buf }

                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, {})
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', 'sd', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)

                    vim.keymap.set("n", '<leader>ws', vim.lsp.buf.workspace_symbol, {})
                    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)

                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)


                    vim.keymap.set("n", "sdd", vim.diagnostic.open_float, {})
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
                end,
            })
        end
    },

}
