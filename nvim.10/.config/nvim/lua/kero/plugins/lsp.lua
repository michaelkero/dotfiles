return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({})
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'omnisharp',
                    'omnisharp_extended',
                    -- 'csharp_ls',
                    'lua_ls',
                    -- 'tsserver',
                    'rust_analyzer',
                    -- 'gopls',
                },
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
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
    {
        "ray-x/lsp_signature.nvim",
        opts = {},
        config = function(_, opts) require 'lsp_signature'.setup(opts) end
    },
    {
        'Hoffs/omnisharp-extended-lsp.nvim',
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = vim.lsp.config
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.omnisharp.setup({
                cmd = { "dotnet", "${CONFIG_HOME}/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                settings = {
                    FormattingOptions = {
                        -- Enables support for reading code style, naming convention and analyzer
                        -- settings from .editorconfig.
                        EnableEditorConfigSupport = true,
                        -- Specifies whether 'using' directives should be grouped and sorted during
                        -- document formatting.
                        OrganizeImports = true,
                    },
                    MsBuild = {
                        -- If true, MSBuild project system will only load projects for files that
                        -- were opened in the editor. This setting is useful for big C# codebases
                        -- and allows for faster initialization of code navigation features only
                        -- for projects that are relevant to code that is being edited. With this
                        -- setting enabled OmniSharp may load fewer projects and may thus display
                        -- incomplete reference lists for symbols.
                        LoadProjectsOnDemand = false,
                    },
                    RoslynExtensionsOptions = {
                        -- Enables support for roslyn analyzers, code fixes and rulesets.
                        EnableAnalyzersSupport = true,
                        -- Enables support for showing unimported types and unimported extension
                        -- methods in completion lists. When committed, the appropriate using
                        -- directive will be added at the top of the current file. This option can
                        -- have a negative impact on initial completion responsiveness,
                        -- particularly for the first few completion sessions after opening a
                        -- solution.
                        EnableImportCompletion = true,
                        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                        -- true
                        AnalyzeOpenDocumentsOnly = false,
                    },
                    Sdk = {
                        -- Specifies whether to include preview versions of the .NET SDK when
                        -- determining which version to use for project loading.
                        IncludePrereleases = true,
                    },
                },
                capabilities = capabilities,
                enable_roslyn_analysers = true,
                enable_import_completion = true,
                enable_decompilation_support = true,
                filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' },
                handlers = {
                    ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                    ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                    ["textDocument/references"] = require('omnisharp_extended').references_handler,
                    ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
                }
            })
            --lspconfig.csharp_ls.setup({
            --    capabilities = capabilities,
            --    enable_roslyn_analysers = true,
            --	enable_import_completion = true,
            --    organize_imports_on_format = true,
            --	enable_decompilation_support = true,
            --	filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' }
            --})
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
        end
    },
}
