return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                'ts_ls',
                -- 'tsserver',
                -- 'gopls',
                -- 'roslyn-language-server'
                -- 'omnisharp',
                'csharp_ls',
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        'Decodetalkers/csharpls-extended-lsp.nvim',
        config = function()
            require("csharpls_extended").buf_read_cmd_bind()
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lsps = {
                { "lua_ls" , { capabilities = capabilities } },
                { "rust_analyzer", { capabilities = capabilities } },
                { "ts_ls", { 
                    capabilities = capabilities,
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                    settings = {
                      typescript = {
                        inlayHints = {
                          includeInlayParameterNameHints = "all",
                          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                          includeInlayFunctionParameterTypeHints = true,
                          includeInlayVariableTypeHints = true,
                          includeInlayPropertyDeclarationTypeHints = true,
                          includeInlayFunctionLikeReturnTypeHints = true,
                        },
                      },
                    },
                }},
                { "csharp_ls", {
                    capabilities = capabilities,
                    -- the following command is to enable csharpls_extended: 
                    -- https://github.com/Decodetalkers/csharpls-extended-lsp.nvim/blob/master/README.md#note
                    cmd = function(dispatchers, config)
                        --- NOTE: csharp-ls is using rpc to communicate with editor, not stdout, so you need to write it in this way
                        return vim.lsp.rpc.start({ 'csharp-ls', '--features', 'metadata-uris' }, dispatchers, {
                            -- csharp-ls attempt to locate sln, slnx or csproj files from cwd, so set cwd to root directory.
                            -- If cmd_cwd is provided, use it instead.
                            cwd = config.cmd_cwd or config.root_dir,
                            env = config.cmd_env,
                            detached = config.detached,
                        })
                    end,
                }},
            }
            -- vim.lsp.config('roslyn', {
            --     settings = {
            --         ["csharp|inlay_hints"] = {
            --             csharp_enable_inlay_hints_for_implicit_object_creation = true,
            --             csharp_enable_inlay_hints_for_implicit_variable_types = true,
            --         },
            --         ["csharp|code_lens"] = {
            --             dotnet_enable_references_code_lens = true,
            --         },
            --     },
            -- })
            -- vim.lsp.enable('roslyn')
            -- vim.lsp.config('omnisharp', {
            --     -- cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
            --     -- cmd = { "dotnet", "${CONFIG_HOME}/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
            --     settings = {
            --         FormattingOptions = {
            --             -- Enables support for reading code style, naming convention and analyzer
            --             -- settings from .editorconfig.
            --             EnableEditorConfigSupport = true,
            --             -- Specifies whether 'using' directives should be grouped and sorted during
            --             -- document formatting.
            --             OrganizeImports = true,
            --         },
            --         MsBuild = {
            --             -- If true, MSBuild project system will only load projects for files that
            --             -- were opened in the editor. This setting is useful for big C# codebases
            --             -- and allows for faster initialization of code navigation features only
            --             -- for projects that are relevant to code that is being edited. With this
            --             -- setting enabled OmniSharp may load fewer projects and may thus display
            --             -- incomplete reference lists for symbols.
            --             LoadProjectsOnDemand = false,
            --         },
            --         RoslynExtensionsOptions = {
            --             -- Enables support for roslyn analyzers, code fixes and rulesets.
            --             EnableAnalyzersSupport = true,
            --             -- Enables support for showing unimported types and unimported extension
            --             -- methods in completion lists. When committed, the appropriate using
            --             -- directive will be added at the top of the current file. This option can
            --             -- have a negative impact on initial completion responsiveness,
            --             -- particularly for the first few completion sessions after opening a
            --             -- solution.
            --             EnableImportCompletion = true,
            --             -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            --             -- true
            --             AnalyzeOpenDocumentsOnly = false,
            --         },
            --         Sdk = {
            --             -- Specifies whether to include preview versions of the .NET SDK when
            --             -- determining which version to use for project loading.
            --             IncludePrereleases = true,
            --         },
            --     },
            --     capabilities = capabilities,
            --     enable_roslyn_analysers = true,
            --     enable_import_completion = true,
            --     enable_decompilation_support = true,
            --     filetypes = { 'cs', 'vb' }, -- , 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' },
            --     handlers = {
            --         ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
            --         ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
            --         ["textDocument/references"] = require('omnisharp_extended').references_handler,
            --         ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
            --     }
            -- })
            -- vim.lsp.enable('omnisharp')

            for _, lsp in pairs(lsps) do
                local name, config = lsp[1], lsp[2]
                vim.lsp.enable(name)
                if config then
                    vim.lsp.config(name, config)
                end
            end

            require("csharpls_extended").buf_read_cmd_bind()

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
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     opts = {
    --         auto_trigger = false,
    --     },
    --     config = function(_, opts)
    --         require 'lsp_signature'.setup(opts)
    --     end
    -- },
    -- {
    --     'Hoffs/omnisharp-extended-lsp.nvim',
    -- },
}
